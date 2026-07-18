#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

"""
queries for Neo4j, written in Cypher


TODO: view current schema
https://neo4j.com/docs/getting-started/current/cypher-intro/schema/
https://neo4j.com/developer/kb/viewing-schema-data-with-apoc/



# CYPHER help
* <https://neo4j.com/docs/cypher-manual/current>
* <https://neo4j.com/docs/cypher-refcard/current/>
* https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887

In Cypher queries
- parenthesis indicate a node
- in `p:Person` the `p` is a variable and node label is `Person`
- {} brackets to add properties (key-value pairs) to the node

"""

# needed for exception handling
import neo4j  # type: ignore

from neo4j import Record, Transaction
import random  # for trace IDs
from typing import Dict, List, Any, Optional

import time
import uuid
import logging

# for the trace decorator
import functools
import re
from . import list_of_valid

logger = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# Allowlists used to validate identifiers (labels, relationship types,
# property names) that Neo4j does not allow to be passed as bind
# parameters. Anything not covered by one of these MUST be rejected with a
# ValueError before being interpolated into a Cypher string.
# ---------------------------------------------------------------------------

# Maps the property-key names that `add_constant_value_with_units` is
# allowed to set on a value_with_units node to the list of values that are
# valid for that property. Keys deliberately mirror the list names in
# list_of_valid.py (dimension_mass_units -> list_of_valid.dimension_mass_units,
# etc). This is a judgment call made in the absence of an explicit
# "these are the property names" list in list_of_valid.py -- if the real
# on-node property names differ, update the keys here (the value-list
# references will still be correct).
DIMENSION_UNIT_PROPERTY_VALID_VALUES = {
    "dimension_mass_units": list_of_valid.dimension_mass_units,
    "dimension_time_units": list_of_valid.dimension_time_units,
    "dimension_length_units": list_of_valid.dimension_length_units,
    "dimension_temperature_units": list_of_valid.dimension_temperature_units,
    "dimension_electric_charge_units": list_of_valid.dimension_electric_charge_units,
    "dimension_amount_of_substance_units": list_of_valid.dimension_amount_of_substance_units,
    "dimension_luminous_intensity_units": list_of_valid.dimension_luminous_intensity_units,
}

# edit_node_property() has no existing allowlist of editable property
# names in list_of_valid.py to check against. In the absence of one, a
# property key is only accepted if it looks like a real Cypher identifier
# (this is what actually prevents Cypher injection via the key), and a
# small denylist blocks structural properties that should never be
# overwritten through this generic setter. Swap this out for a hard
# allowlist of editable property names if/when one becomes available.
_SAFE_PROPERTY_KEY_PATTERN = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")
_PROTECTED_PROPERTY_KEYS = {"id", "created_datetime"}

# user_query() keyword blocklist: rejects any query containing a write
# keyword as a whole word (so it doesn't false-positive on things like
# "created_datetime"). This is defense-in-depth ONLY -- see the docstring
# on user_query() for the required caller-side protection.
_WRITE_KEYWORD_PATTERN = re.compile(
    r"\b(CALL|CREATE|MERGE|DELETE|SET|REMOVE)\b", re.IGNORECASE
)


def trace_execution(func):
    """
    rather than each function having boilerplate, use decorator to add to every function
    """

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        trace_id = str(uuid.uuid4())

        # the function name needs to be logged explicitly since `logger.info` just reports "wrapper"
        logger.info(f"[TRACE] start {trace_id} - {func.__name__}")
        try:
            return func(*args, **kwargs)
        finally:
            logger.info(f"[TRACE] end {trace_id} - {func.__name__}")

    return wrapper


@trace_execution
def get_list_IDs(tx: Transaction) -> List[str]:
    """
    return a list of all PDG IDs for the nodes
    """
    list_of_IDs = []  # type: List[str]
    for result in tx.run("MATCH (n) RETURN n.id"):
        list_of_IDs.append(result.data()["n.id"])

    return list_of_IDs


@trace_execution
def apoc_metdata_schema(tx: Transaction):
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.meta/apoc.meta.stats/
    """
    result = tx.run("CALL apoc.meta.stats()")
    return result.single()


@trace_execution
def apoc_export_csv(tx: Transaction, output_filename: str) -> dict:
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.export/
    https://neo4j.com/docs/apoc/current/export/csv/
    https://neo4j.com/docs/apoc/current/overview/apoc.export/apoc.export.csv.all/
    """

    query = "CALL apoc.export.csv.all($file_name, {useTypes: true})"

    result = tx.run(query, file_name=output_filename)

    # APOC export procedures return exactly one record with statistics
    record = result.single()

    # Return as a standard Python dictionary (or an empty dict if no record)
    return record.data() if record else {}


@trace_execution
def apoc_export_graphml(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.export/

    Why use .consume()?
    - Efficiency: It discards the records immediately and retrieves the
        `ResultSummary` (which contains metadata like execution time and counters).
    - Completeness: In Neo4j, queries are lazily evaluated. If you don't
         iterate through the results or call consume(), the procedure might
         not fully execute or finalize before the transaction closes.
    - Readability: It clearly signals that you are executing the procedure
         for its side effects (exporting a file) rather than for the data it returns.

    """

    query = "CALL apoc.export.graphml.all($file, {useTypes: true})"
    result = tx.run(query, file=output_filename)

    # consume() exhausts the result stream and returns the ResultSummary
    return result.consume()


@trace_execution
def apoc_export_json(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.json.all/

    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    Default export data structure is 'JSON_LINES' (not JSON)

    """

    query = "CALL apoc.export.json.all($file, {useTypes: true})"
    result = tx.run(query, file=output_filename)

    # consume() exhausts the result stream and returns the ResultSummary
    return result.consume()


@trace_execution
def apoc_export_cypher(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/export/cypher/


    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    """

    # "cypher.all" produces 1 file with constraints
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.all/
    # TODO: possibly switch to
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.query/
    # which produces separate files for relationships and nodes

    query = """
    CALL apoc.export.cypher.all($file, $config)
    YIELD file, batches, source, format, nodes, relationships, properties, time, rows, batchSize
    RETURN file, batches, source, format, nodes, relationships, properties, time, rows, batchSize
    """

    # config = {
    #     "format": "plain",
    #     "useOptimizations": {
    #         "type": "UNWIND_BATCH",
    #         "unwindBatchSize": 20
    #     }
    # }

    config = {
        "format": "cypher-shell",  # Better for line-by-line reading
        "useOptimizations": {"type": "NONE"},  # Disables the huge UNWIND blocks
        "separateFiles": False,
        "cypherFormat": "merge",
    }
    # for `cypherFormat`, `create` is faster but could create duplicates
    # If that's a hallucination, see <https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.all/>
    # and use `updateAll`

    # Use .single() to get the result row directly
    result = tx.run(query, file=output_filename, config=config)

    return result.single()


@trace_execution
def constrain_unique_id(tx: Transaction) -> None:
    """
    https://neo4j.com/docs/getting-started/current/cypher-intro/schema/#cypher-intro-constraints

    unique constraints are limited to labels. You cannot create a "global" constraint
    that applies to every node in the database regardless of its label with a single command.
    """

    tx.run("CREATE CONSTRAINT constrain_node_id FOR (n:a_node) REQUIRE n.id IS UNIQUE")

    return


@trace_execution
def get_user_stats(tx: Transaction, author: str):
    """ """

    logger.info("author=" + author)

    query = """
    MATCH (n)
    WHERE n.author_name_latex = $author_name
    RETURN 
        collect(CASE WHEN "derivation" IN labels(n) THEN n END) AS derivations,
        collect(CASE WHEN "expression" IN labels(n) THEN n END) AS expressions,
        collect(CASE WHEN "inference_rule" IN labels(n) THEN n END) AS infrules,
        collect(CASE WHEN "symbol" IN labels(n) THEN n END) AS symbols,
        collect(CASE WHEN "operation" IN labels(n) THEN n END) AS operations,
        collect(CASE WHEN "relation" IN labels(n) THEN n END) AS relations,
        collect(n.created_datetime) AS created_dates,
        count(n) AS total_contributions
    """

    result = tx.run(query, author_name=author)
    record = result.single()

    if not record:
        return [], 0, [], [], [], [], [], []

    return (
        record["created_dates"],
        record["total_contributions"],
        record["derivations"],
        record["expressions"],
        record["infrules"],
        record["symbols"],
        record["operations"],
        record["relations"],
    )


@trace_execution
def get_inference_rules_with_derivations(tx: Transaction) -> List[Dict[str, Any]]:
    """
    Returns every inference_rule node together with the (deduplicated) list of
    derivations that use it, in a single round trip.

    Replaces the old pattern of: fetch all inference rules, then loop and run
    get_derivations_that_use_inference_rule once per rule (N+1 queries).

    Uses OPTIONAL MATCH so inference rules with zero derivations are still
    included, with an empty derivations list - matching prior behavior where
    every inference rule got an entry in the result dict.
    """
    query = """
    MATCH (i:inference_rule)
    OPTIONAL MATCH (d:derivation)-[:HAS_STEP]->(:step)-[:HAS_INFERENCE_RULE]->(i)
    WITH i, collect(DISTINCT d) AS derivation_nodes
    RETURN i AS inference_rule,
           [d IN derivation_nodes WHERE d IS NOT NULL] AS derivations
    ORDER BY i.id
    """
    result = tx.run(query)
    rows = []
    for record in result:
        rows.append(
            {
                "inference_rule": dict(record["inference_rule"]),
                "derivations": [dict(d) for d in record["derivations"]],
            }
        )
    return rows


@trace_execution
def get_list_of_input_expressions_used_in_step(
    tx: Transaction, step_id: str
) -> List[dict]:
    """ """

    logger.info("step_id= " + step_id)

    result = tx.run(
        """
    MATCH (s:step)-[:HAS_INPUT]->(e:expression)
    WHERE s.id = $step_id
    RETURN DISTINCT e
    """,
        step_id=step_id,
    )
    list_of_dicts_extra_key = result.data()

    list_of_dicts = []
    if len(list_of_dicts_extra_key) > 0:
        for this_res in list_of_dicts_extra_key:
            list_of_dicts.append(this_res["e"])
    return list_of_dicts


@trace_execution
def get_list_of_expressions_with_symbols_used_in_derivation(
    tx: Transaction, derivation_id: str
) -> List[dict]:
    """ """

    logger.info("derivation_id= " + derivation_id)

    result = tx.run(
        """
MATCH (d:derivation {id: $derivation_id})
  -[:HAS_STEP]->(:step)
  -[:HAS_FEED|HAS_INPUT|HAS_OUTPUT]->()
  -[:IS_COMPRISED_OF]->(s:symbol)
WITH DISTINCT s
MATCH (e:expression)-[:IS_COMPRISED_OF]->(s)
RETURN DISTINCT e 
ORDER BY e.id
    """,
        derivation_id=derivation_id,
    )
    list_of_dicts_extra_key = result.data()

    list_of_dicts = []
    if len(list_of_dicts_extra_key) > 0:
        for this_res in list_of_dicts_extra_key:
            list_of_dicts.append(this_res["e"])
    return list_of_dicts


@trace_execution
def get_list_of_output_expressions_used_in_step(tx: Transaction, step_id) -> List[dict]:
    """ """

    logger.info("step_id= " + step_id)

    result = tx.run(
        """
    MATCH (s:step)-[:HAS_OUTPUT]->(e:expression)
    WHERE s.id = $step_id
    RETURN DISTINCT e
    """,
        step_id=step_id,
    )
    list_of_dicts_extra_key = result.data()

    list_of_dicts = []
    if len(list_of_dicts_extra_key) > 0:
        for this_res in list_of_dicts_extra_key:
            list_of_dicts.append(this_res["e"])
    return list_of_dicts


@trace_execution
def get_derivations_that_use_expression(tx: Transaction, expression_id: str):
    """ """

    logger.info("expression_id= " + expression_id)

    result = tx.run(
        """
    MATCH (d:derivation)-[:HAS_STEP]->(s:step)-[]->(e:expression)
    WHERE e.id = $expressionID
    RETURN DISTINCT d
    """,
        expressionID=expression_id,
    )

    list_of_dicts_extra_key = result.data()

    list_of_dicts = []
    if len(list_of_dicts_extra_key) > 0:
        for this_res in list_of_dicts_extra_key:
            list_of_dicts.append(this_res["d"])

    logger.info("list_of_dicts=" + str(list_of_dicts))

    return list_of_dicts


@trace_execution
def get_relation_latex(tx: Transaction, relation_id: str):
    """ """

    # string concatenation is a security risk (Cypher injection)
    # result = tx.run(
    #     "MATCH (r:relation) WHERE r.id='" + relation_id + "' RETURN r.latex"
    # )

    result = tx.run(
        "MATCH (r:relation) WHERE r.id = $rid RETURN r.latex", rid=relation_id
    )

    # The method result.data() returns a list of dictionaries.
    list_of_dicts = result.data()

    if list_of_dicts:
        relation_latex = list_of_dicts[0]["r.latex"]
    else:
        raise Exception("relation_id not found")
    return relation_latex


@trace_execution
def get_scalar_id_that_has_value_and_units_id(
    tx: Transaction, value_and_units_id: str
) -> str | None:
    """Retrieves the scalar ID associated with a specific value_with_units ID."""
    query = """
    MATCH (s:scalar)-[:HAS_VALUE]->(v:value_with_units) 
    WHERE v.id = $value_id 
    RETURN s.id AS scalar_id
    """

    result = tx.run(query, value_id=value_and_units_id)
    record = result.single()

    if record:
        scalar_id = record["scalar_id"]
        logger.info(f"Found scalar_id: {scalar_id}")
        return scalar_id

    logger.warning(f"No scalar found for value_and_units_id: {value_and_units_id}")
    return None


@trace_execution
def get_symbols_for_every_feed(tx, list_of_feed_ids: List[str]):
    """ """

    query = """
    MATCH (e:feed)
    WHERE e.id IN $eids
    OPTIONAL MATCH (e)-[:IS_COMPRISED_OF]->(s:symbol)
    RETURN e.id AS eid, collect(properties(s)) AS symbols
    """

    result = tx.run(query, eids=list_of_feed_ids)

    symbol_map = {record["eid"]: record["symbols"] for record in result}

    return symbol_map


@trace_execution
def get_symbols_for_every_expression(tx, list_of_expression_ids: List[str]):
    """
    `get_symbols_for_expression` wasn't fast enough (25 seconds for 620 expressions)
    so Gemini 3 Pro suggested this batching approach

    Explanation:
    - pass the list of IDs to Neo4j and use the aggregation function `collect()` to
      group the symbols by expression.
    - `collect()` aggregates the results (the `s` nodes) into a list for each
      distinct `e` node, doing the grouping work on the database side rather than in Python.
    - the dictionary should include keys for expressions that have empty lists of symbols,
      hence the use of `OPTIONAL MATCH`

    """

    query = """
    MATCH (e:expression)
    WHERE e.id IN $eids
    OPTIONAL MATCH (e)-[:IS_COMPRISED_OF]->(s:symbol)
    RETURN e.id AS eid, collect(properties(s)) AS symbols
    """

    result = tx.run(query, eids=list_of_expression_ids)

    symbol_map = {record["eid"]: record["symbols"] for record in result}

    return symbol_map


@trace_execution
def get_symbols_for_expression(tx: Transaction, expression_id: str) -> List[dict]:
    """ """
    logger.info("expression_id =" + expression_id)
    symbol_list = []  # type: List[dict]

    query = """
    MATCH (e:expression {id: $eid})-[:IS_COMPRISED_OF]->(s:symbol) 
    RETURN properties(s) AS props
    """
    result = tx.run(query, eid=expression_id)

    symbol_list = [res["props"] for res in result.data()]

    return symbol_list


@trace_execution
def get_symbols_for_feed(tx: Transaction, feed_id: str) -> List[dict]:
    """ """
    logger.info("feed_id =" + feed_id)
    symbol_list = []  # type: List[dict]

    query = """
    MATCH (e:feed {id: $eid})-[:IS_COMPRISED_OF]->(s:symbol) 
    RETURN properties(s) AS props
    """
    result = tx.run(query, eid=feed_id)

    symbol_list = [res["props"] for res in result.data()]

    return symbol_list


@trace_execution
def get_operations_for_expression(tx: Transaction, expression_id: str) -> List[dict]:
    """ """
    logger.info("expression_id =" + expression_id)
    symbol_list = []  # type: List[dict]

    query = """
    MATCH (e:expression {id: $eid})-[:IS_COMPRISED_OF]->(s:operation) 
    RETURN properties(s) AS props
    """
    result = tx.run(query, eid=expression_id)

    symbol_list = [res["props"] for res in result.data()]

    return symbol_list


@trace_execution
def get_nodes_of_type(tx: Transaction, node_type: str) -> list:
    """
    for a specific node type (e.g., derivation XOR step XOR symbol, etc)
    return a list of all nodes
    """

    # must be one of these node types. See also 'schema.log' file
    logger.info("node type:" + node_type)

    if node_type not in list_of_valid.node_types:
        raise ValueError(f"Invalid node type: {node_type}")

    query = f"MATCH (n:{node_type}) RETURN n ORDER BY n.id"

    node_list = []  # type: List[dict]
    for result in tx.run(query):
        node_list.append(result.data()["n"])

    return node_list


@trace_execution
def get_inference_rules(tx: Transaction) -> list:
    """
    return a list of all nodes
    """

    query = f"MATCH (n:inference_rule) RETURN n ORDER BY toLower(n.name_latex)"

    node_list = []  # type: List[dict]
    for result in tx.run(query):
        node_list.append(result.data()["n"])

    return node_list


@trace_execution
def get_derivations(tx: Transaction) -> list:
    """
    return a list of all nodes
    """

    query = f"MATCH (n:derivation) RETURN n ORDER BY toLower(n.name_latex)"

    node_list = []  # type: List[dict]
    for result in tx.run(query):
        node_list.append(result.data()["n"])

    return node_list


@trace_execution
def get_count_nodes_of_type(tx: Transaction, node_type: str) -> int:
    """
    for a specific node type (e.g., derivation XOR step XOR symbol, etc)
    return a count of all nodes

    """

    # must be one of these node types. See also 'schema.log' file
    logger.info("neo4j_query/get_count_nodes_of_type:  node type:" + node_type)
    if node_type not in list_of_valid.node_types:
        raise ValueError(f"Invalid node type: {node_type}")

    node_count = -1
    for result in tx.run("MATCH (n:" + node_type + ") RETURN count(n) as count"):
        logger.info(result.data()["count"])
        node_count = result.data()["count"]

    return node_count


@trace_execution
def get_expressions_for_every_operation(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """

    query = """
    MATCH (e:expression)-[:IS_COMPRISED_OF]->(s:operation)
    RETURN s.id AS operation_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["operation_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_expressions_for_every_relation(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """

    query = """
    MATCH (e:expression)-[:IS_COMPRISED_OF]->(r:relation)
    RETURN r.id AS relation_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["relation_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_expressions_for_every_symbol(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """

    query = """
    MATCH (e:expression)-[:IS_COMPRISED_OF]->(s:symbol)
    RETURN s.id AS symbol_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["symbol_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_derivations_for_every_relation(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.
    """

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:IS_COMPRISED_OF]->(r:relation)
    RETURN r.id AS relation_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["relation_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_derivations_for_every_operation(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.
    """

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:IS_COMPRISED_OF]->(s:operation)
    RETURN s.id AS operation_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["operation_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_derivations_for_every_symbol(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.
    """

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:IS_COMPRISED_OF]->(s:symbol)
    RETURN s.id AS symbol_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["symbol_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_derivations_for_every_feed(tx: Transaction) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 'f'
    """

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[:HAS_FEED]->(f:feed)
    RETURN f.id AS feed_id, collect(d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["feed_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }

    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_derivations_for_every_expression(
    tx: Transaction,
) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 'e'

    if one derivation has three different steps that all link to the same expression,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.

    """

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)
    RETURN e.id AS expression_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["expression_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    return res_dict


@trace_execution
def get_symbols_for_derivation(tx: Transaction, derivation_id: str) -> List[dict]:
    """ """
    logger.info("derivaion_id=" + derivation_id)

    query = """
    MATCH (d:derivation {id: $derivation_id})
      -[:HAS_STEP]->(:step)
      -[:HAS_FEED|HAS_INPUT|HAS_OUTPUT]->()
      -[:IS_COMPRISED_OF]->(s:symbol)
    RETURN DISTINCT s ORDER BY toLower(s.latex)
    """

    result = tx.run(query, derivation_id=derivation_id)

    # list comprehension convert Node objects to dicts directly
    return [dict(record["s"]) for record in result]


@trace_execution
def get_derivations_that_use_feed(
    tx: Transaction, feed_id: str
) -> List[Dict[str, Any]]:
    """ """
    logger.info("feed_id=" + feed_id)

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[:HAS_FEED]->(f:feed)
    WHERE f.id = $feed_id
    RETURN d
    """

    # Use parameters, specify specific relationships if possible
    result = tx.run(query, feed_id=feed_id)

    # list comprehension convert Node objects to dicts directly
    return [dict(record["d"]) for record in result]


@trace_execution
def get_derivations_that_use_inference_rule(
    tx: Transaction, inference_rule_id: str
) -> List[Dict]:
    """
    which derivations contain this inference rule?
    """

    logger.info("inference_rule_id=" + inference_rule_id)

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[:HAS_INFERENCE_RULE]->(i:inference_rule)
    WHERE i.id = $rule_id
    RETURN d
    """

    result = tx.run(query, rule_id=inference_rule_id)

    # Use a list comprehension for a more Pythonic return
    list_of_derivation_dicts = [dict(record["d"]) for record in result]

    return list_of_derivation_dicts


@trace_execution
def get_expressions_that_use_symbol(tx, symbol_id: str) -> List[Dict[str, Any]]:
    """
    which expressions contain this symbol?

    Returns a list of expression nodes that are connected to a symbol
    of a specific category and ID.

    """

    logger.info("symbol_id = " + symbol_id)

    # assert symbol_category in list_of_valid.symbol_categories

    list_of_expression_dicts = []  # type: List[dict]

    query = """
        MATCH (e:expression)-[]->(s:symbol) 
        WHERE s.id = $sid 
        RETURN e
    """

    # Use parameters ($sid) for values to prevent Cypher Injection
    result = tx.run(query, sid=symbol_id)

    list_of_expression_dicts = [record.data()["e"] for record in result]

    return list_of_expression_dicts


@trace_execution
def get_derivations_that_use_symbol(
    tx,
    symbol_id: str,
) -> list:
    """
    which derivations contain this symbol?

    Returns a list of derivation dictionaries that contain a specific symbol.
    """

    query = """
        MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(:expression)-[:IS_COMPRISED_OF]->(s:symbol) 
        WHERE s.id = $symbol_id 
        RETURN d
    """

    result = tx.run(query, symbol_id=symbol_id)

    list_of_derivation_dicts = [record["d"] for record in result]

    logger.info("list_of_derivation_dicts=" + str(list_of_derivation_dicts))

    return list_of_derivation_dicts


@trace_execution
def get_values_for_constant(tx: Transaction, scalar_id: str) -> list:
    """ """
    logger.info("scalar_id=" + scalar_id)

    list_of_value_dicts = []  # type: List[dict]
    for result in tx.run(
        'MATCH (s:scalar {id:"' + scalar_id + '"})-[]->(v:value_with_units) RETURN v',
    ):
        list_of_value_dicts.append(result.data()["v"])
    return list_of_value_dicts


@trace_execution
def get_number_of_steps_per_derivation(tx: Transaction) -> dict:
    """
    step count per derivation is used by
    - <https://localhost/new_derivation>
    - <https://localhost/list_derivations>
    """
    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(s:step)
    RETURN d.id AS derivation_id, count(s) AS step_count
    """
    result = tx.run(query)

    # Dictionary comprehension to build {id: count}
    return {record["derivation_id"]: record["step_count"] for record in result}


@trace_execution
def get_list_of_steps_in_this_derivation(tx: Transaction, derivation_id: str) -> list:
    """
    For a given derivation, what are all the associated step IDs?

    """

    query = """
    MATCH (d:derivation {id: $did})-[r:HAS_STEP]->(s:step)
    RETURN s {.*, sequence_index: r.sequence_index} AS step_data
    ORDER BY r.sequence_index
    """
    result = tx.run(query, did=derivation_id)

    list_of_step_dicts = [record["step_data"] for record in result]

    return list_of_step_dicts


@trace_execution
def get_feeds_used_in_step(tx: Transaction, step_id: str) -> List[dict]:
    """ """
    logger.info("step_id=" + str(step_id))

    list_of_feeds = []  # type: List[dict]

    query = "MATCH (:step {id: $step_id})-[:HAS_FEED]->(f:feed) RETURN f"
    for result in tx.run(query, step_id=step_id):
        list_of_feeds.append(result.data()["f"])

    return list_of_feeds


@trace_execution
def get_sequence_index_for_step(tx: Transaction, step_id: str) -> int | None:
    """ """
    sequence_index = 0
    query = "MATCH ()-[r:HAS_STEP]->(n:step {id: $step_id}) RETURN r.sequence_index"
    result = tx.run(query, step_id=step_id)
    data = result.data()
    sequence_index = data[0]["r.sequence_index"] if data else None

    logger.info("sequence_index=" + str(sequence_index))

    return sequence_index


@trace_execution
def get_inference_rule_connected_to_step_ID(tx: Transaction, step_id: str):
    """
    use case: when displaying a derivation, user wants to see inference rule per step

    """

    query = "MATCH (n:step {id: $step_id})-[r:HAS_INFERENCE_RULE]->(m:inference_rule) RETURN m"
    result = tx.run(query, step_id=step_id)
    # print(type(result)) # don't access the `result` variable more than once, as mentioned on https://neo4j.com/docs/python-manual/current/transformers/
    inf_rule_list_of_dicts = result.data()
    # print(type(inf_rule_result))  # <class 'list'>
    # print(len(inf_rule_result))  # 0
    # print(inf_rule_result)
    # [{'m': {'name_latex': 'add x to both sides', 'number_of_outputs': 1, 'number_of_inputs': 1, 'author_name_latex': 'ben', 'number_of_feeds': 1, 'id': '8818915', 'latex': 'add $1 to both sides of Eq $2 to get Eq $3'}}]

    if len(inf_rule_list_of_dicts) == 0:
        logger.critical("A step without an inference_rule is a misconfiguration")
        return []

    return inf_rule_list_of_dicts[0]["m"]


@trace_execution
def get_derivation_id_from_step_id(tx: Transaction, step_id: str) -> Optional[str]:
    """ """

    logger.info("neo4j_query/get_derivation_id_from_step_id: step_id=" + str(step_id))

    query = "MATCH (d:derivation)-[:HAS_STEP]->(:step {id: $step_id}) RETURN d.id AS derivation_id"
    result = tx.run(query, step_id=step_id)
    record = result.single()

    if record:
        derivation_id = record["derivation_id"]
        logger.info(
            "neo4j_query/get_derivation_id_from_step_id: derivation_id="
            + str(derivation_id)
        )
        return derivation_id
    return None


@trace_execution
def get_expressions_from_step_id_and_expr_type(
    tx, step_id: str, expression_type: str
) -> list:
    """
    use case: when displaying a derivation,
    for each step the user wants to know the inputs, feeds, and outputs.

    """

    logger.info("step_id=" + step_id + "; expression_type=" + expression_type)
    if expression_type not in {"HAS_INPUT", "HAS_FEED", "HAS_OUTPUT"}:
        raise ValueError(f"Invalid expression_type: {expression_type}")
    destination_node_type = "feed" if expression_type == "HAS_FEED" else "expression"
    query = f"MATCH (:step {{id: $step_id}})-[r:{expression_type}]->(m:{destination_node_type}) RETURN m"
    list_of_expression_dicts = []
    for result in tx.run(query, step_id=step_id):
        list_of_expression_dicts.append(result.data()["m"])

    # print("list_of_expression_dicts=", list_of_expression_dicts)

    return list_of_expression_dicts


@trace_execution
def get_feeds_not_connected_to_any_step(tx: Transaction) -> List[dict]:

    list_of_feeds = []  # type: List[dict]
    for result in tx.run("MATCH (f:feed) WHERE NOT (f)<-[:HAS_FEED]-(:step) RETURN f"):
        list_of_feeds.append(result.data()["f"])
    return list_of_feeds


@trace_execution
def get_expressions_from_step_id(tx: Transaction, step_id: str) -> List[dict]:
    """ """

    logger.info("step_id=" + step_id)

    list_of_expression_dicts = []  # type: List[dict]

    query = "MATCH (:step {id: $step_id})-[]->(e:expression) RETURN e"
    for result in tx.run(query, step_id=step_id):
        list_of_expression_dicts.append(result.data()["e"])

    return list_of_expression_dicts


@trace_execution
def get_node_properties_from_id(
    tx: Transaction, node_type: str, node_id: str
) -> Optional[Dict[str, Any]]:
    """
    metadata associated with the node_id

    Although
    ```
    MATCH n WHERE n.id = "42" RETURN n
    ```
    would be easier to use than
    ```
    MATCH (n:person) WHERE n.id = "42" RETURN n
    ```
    the latency and memory usage of the first is higher.


    """

    logger.info("node_type=" + node_type)
    if node_type not in list_of_valid.node_types:
        raise ValueError(f"Invalid node type: {node_type}")

    logger.info("node_id:" + node_id)

    query = f"MATCH (n:{node_type}) WHERE n.id = $node_id RETURN n"

    result = tx.run(query, node_id=node_id)

    record = result.single()

    if not record:
        logger.info("Node with id %s and type %s not found", node_id, node_type)
        return None

    # logger.info("result.data()[0] =" + str(res_data[0]))

    node = dict(record["n"])

    return node


@trace_execution
def symbol_exists(tx: Transaction, symbol_id: str) -> bool:
    query = 'MATCH (s) WHERE s.id = $sid AND "symbol" IN labels(s) RETURN s'
    result = tx.run(query, sid=symbol_id)
    return result.single() is not None


@trace_execution
def feed_exists(tx: Transaction, feed_id: str) -> bool:
    query = "MATCH (f:feed {id: $fid}) RETURN f"
    result = tx.run(query, fid=feed_id)
    return result.single() is not None


@trace_execution
def add_derivation(
    tx,
    derivation_id: str,
    now_str: str,
    derivation_name_latex: str,
    derivation_abstract_latex: str,
    derivation_reference_latex: str,
    author_name_latex: str,
) -> bool:
    """
    Create a new derivation node

    In the Neo4j Python driver, `tx.run()` is lazy. While the query is sent to the server,
    the results aren't fully processed until you iterate over them. `.consume()` explicitly
    tells the driver to discard the result records but wait for the query to finish and
    return the metadata (summary). This is the standard way to ensure a "write" operation
    completes when you don't need to return any data.

    """

    dup_check = tx.run(
        "MATCH (d:derivation {name_latex: $name}) RETURN d", name=derivation_name_latex
    )
    if dup_check.peek() is not None:
        return False

    tx.run(
        "CREATE (:derivation:a_node { id: $id, name_latex: $name, abstract_latex: $abstract, created_datetime: $now, reference_latex: $ref, author_name_latex: $author})",
        id=derivation_id,
        name=derivation_name_latex,
        abstract=derivation_abstract_latex,
        now=now_str,
        ref=derivation_reference_latex,
        author=author_name_latex,
    ).consume()
    return True


@trace_execution
def add_inference_rule(
    tx,
    inference_rule_id: str,
    inference_rule_name: str,
    inference_rule_latex: str,
    number_of_inputs: int,
    number_of_feeds: int,
    number_of_outputs: int,
    now_str: str,
    author_name_latex: str,
) -> bool:
    """
    the "number_of_" are passed in as integers,
    but when writing the query string they are
    cast to integers to enable concatenation, but
    Neo4j sees the query as containing integers.
    """

    assert (
        (int(number_of_inputs) > 0)
        or (int(number_of_feeds) > 0)
        or (int(number_of_outputs) > 0)
    )
    assert int(number_of_inputs) >= 0
    assert int(number_of_feeds) >= 0
    assert int(number_of_outputs) >= 0

    dup_check = tx.run(
        "MATCH (i:inference_rule {name_latex: $name}) RETURN i",
        name=inference_rule_name,
    )
    if dup_check.peek() is not None:
        return False

    query = "CREATE (:inference_rule:a_node { id: $id, name_latex: $name, latex: $latex, created_datetime: $now, author_name_latex: $author, number_of_inputs: $inputs, number_of_feeds: $feeds, number_of_outputs: $outputs})"
    tx.run(
        query,
        id=inference_rule_id,
        name=inference_rule_name,
        latex=inference_rule_latex,
        now=now_str,
        author=author_name_latex,
        inputs=number_of_inputs,
        feeds=number_of_feeds,
        outputs=number_of_outputs,
    ).consume()
    return True


@trace_execution
def edit_step_sequence_index(
    tx: Transaction, derivation_id: str, step_id: str, new_index: int
) -> None:
    # Same lock as connect_step_to_derivation, on the same node -- this is
    # what makes the two functions serialize against each other instead of
    # racing to write conflicting sequence_index values.
    lock = tx.run(
        "MATCH (d:derivation {id: $did}) CALL apoc.lock.nodes([d]) RETURN d",
        did=derivation_id,
    ).single()
    if not lock:
        raise ValueError(f"no derivation with id {derivation_id}")

    conflict = tx.run(
        """
        MATCH (d:derivation {id: $did})-[r:HAS_STEP]->(s:step)
        WHERE r.sequence_index = $new_index AND s.id <> $sid
        RETURN count(r) AS c
        """,
        did=derivation_id,
        sid=step_id,
        new_index=new_index,
    ).single()
    if conflict["c"] > 0:
        raise ValueError(
            f"sequence_index {new_index} is already used by another step "
            f"in derivation {derivation_id}"
        )

    query = """
    MATCH (d:derivation {id: $did})-[r:HAS_STEP]->(s:step {id: $sid})
    SET r.sequence_index = $new_index
    """
    tx.run(query, did=derivation_id, sid=step_id, new_index=new_index).consume()
    return


@trace_execution
def edit_step_input(
    tx: Transaction, step_id: str, old_input_id: str, new_input_id: str
) -> None:
    """
    `MATCH (s:step ...)-[old_rel:HAS_INPUT]->(old_e:expression ...)` finds the specific step and the specific old input, along with the existing relationship (old_rel) connecting them.
    `MATCH (new_e:expression ...)` locates the node for the new input.
    `WITH ..., old_rel.sequence_index AS saved_index` is the crucial step. It captures the value of the sequence_index from the edge we are about to delete and carries it forward in memory.
    `DELETE old_rel` removes the edge between the step and the old input.
    `CREATE (s)-[new_rel:HAS_INPUT]->(new_e)` creates the new relationship. (Note: Use MERGE instead of CREATE if you want to prevent duplicate edges if the relationship already exists).
    `SET new_rel.sequence_index = saved_index` applies the captured string value to the newly created edge.
    """

    params = {
        "step_id": str(step_id),
        "old_input_id": str(old_input_id),
        "new_input_id": str(new_input_id),
    }

    query = """
    MATCH (s:step {id: $step_id})-[old_rel:HAS_INPUT]->(old_e:expression {id: $old_input_id})
    MATCH (new_e:expression {id: $new_input_id})
    WITH s, old_rel, old_rel.sequence_index AS saved_index, new_e
    DELETE old_rel
    MERGE (s)-[new_rel:HAS_INPUT]->(new_e)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_e.id AS input_id, new_rel.sequence_index AS sequence_index
    """

    tx.run(query, params).consume()

    return


@trace_execution
def edit_step_feed(
    tx: Transaction, step_id: str, old_feed_id: str, new_feed_id: str
) -> None:
    """
    `MATCH (s:step ...)-[old_rel:HAS_FEED]->(old_f:feed ...)` finds the specific step and the specific old feed, along with the existing relationship (old_rel) connecting them.
    `MATCH (new_f:feed ...)` locates the node for the new feed.
    `WITH ..., old_rel.sequence_index AS saved_index` is the crucial step. It captures the value of the sequence_index from the edge we are about to delete and carries it forward in memory.
    `DELETE old_rel` removes the edge between the step and the old feed.
    `CREATE (s)-[new_rel:HAS_FEED]->(new_f)` creates the new relationship. (Note: Use MERGE instead of CREATE if you want to prevent duplicate edges if the relationship already exists).
    `SET new_rel.sequence_index = saved_index` applies the captured string value to the newly created edge.
    """

    params = {
        "step_id": str(step_id),
        "old_feed_id": str(old_feed_id),
        "new_feed_id": str(new_feed_id),
    }

    query = """
    MATCH (s:step {id: $step_id})-[old_rel:HAS_FEED]->(old_f:feed {id: $old_feed_id})
    MATCH (new_f:feed {id: $new_feed_id})
    WITH s, old_rel, old_rel.sequence_index AS saved_index, new_f
    DELETE old_rel
    MERGE (s)-[new_rel:HAS_FEED]->(new_f)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_f.id AS feed_id, new_rel.sequence_index AS sequence_index
    """

    tx.run(query, params).consume()


@trace_execution
def disconnect_feed_from_step(tx: Transaction, step_id: str, feed_id: str) -> None:
    query = "MATCH (s:step {id: $sid})-[r:HAS_FEED]->(f:feed {id: $fid}) DELETE r"
    tx.run(query, sid=step_id, fid=feed_id).consume()
    return


@trace_execution
def edit_step_output(
    tx: Transaction, step_id: str, old_output_id: str, new_output_id: str
) -> None:
    """
    `MATCH (s:step ...)-[old_rel:HAS_OUTPUT]->(old_e:expression ...)` finds the specific step and the specific old output, along with the existing relationship (old_rel) connecting them.
    `MATCH (new_e:expression ...)` locates the node for the new output.
    `WITH ..., old_rel.sequence_index AS saved_index` is the crucial step. It captures the value of the sequence_index from the edge we are about to delete and carries it forward in memory.
    `DELETE old_rel` removes the edge between the step and the old output.
    `CREATE (s)-[new_rel:HAS_OUTPUT]->(new_e)` creates the new relationship. (Note: Use MERGE instead of CREATE if you want to prevent duplicate edges if the relationship already exists).
    `SET new_rel.sequence_index = saved_index` applies the captured string value to the newly created edge.
    """

    params = {
        "step_id": str(step_id),
        "old_output_id": str(old_output_id),
        "new_output_id": str(new_output_id),
    }

    query = """
    MATCH (s:step {id: $step_id})-[old_rel:HAS_OUTPUT]->(old_e:expression {id: $old_output_id})
    MATCH (new_e:expression {id: $new_output_id})
    WITH s, old_rel, old_rel.sequence_index AS saved_index, new_e
    DELETE old_rel
    MERGE (s)-[new_rel:HAS_OUTPUT]->(new_e)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_e.id AS output_id, new_rel.sequence_index AS sequence_index
    """

    tx.run(query, params).consume()

    return


@trace_execution
def edit_step_notes(
    tx: Transaction,
    step_id: str,
    note_before_step_latex: str,
    note_after_step_latex: str,
) -> None:
    """
    TODO: deprecate this in favor of edit_node_properties
    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify
    """

    params = {
        "step_id": str(step_id),
        "before": str(note_before_step_latex),
        "after": str(note_after_step_latex),
    }

    # Use $ variable names in the query string
    query = """
    MERGE (s:step {id: $step_id})
    SET s.note_before_step_latex = $before,
        s.note_after_step_latex = $after
    """

    tx.run(query, params).consume()

    return


@trace_execution
def edit_expression(
    tx,
    expression_id: str,
    expression_latex_lhs: str,
    expression_latex_relation: str,
    expression_latex_rhs: str,
    expression_latex_condition: str,
    expression_name_latex: str,
    expression_description_latex: str,
    expression_reference_latex: str,
    author_name_latex: str,
) -> bool:
    """
    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify
    """

    # Duplicate check (excluding the node currently being edited)
    dup_check = tx.run(
        "MATCH (e:expression) "
        "WHERE e.latex_lhs = $lhs AND e.latex_relation = $relation AND e.latex_rhs = $rhs AND e.id <> $id "
        "RETURN e",
        lhs=expression_latex_lhs,
        relation=expression_latex_relation,
        rhs=expression_latex_rhs,
        id=expression_id,
    )
    if dup_check.peek() is not None:
        return False

    # Perform safe update
    properties = {
        "id": expression_id,
        "name_latex": expression_name_latex,
        "description_latex": expression_description_latex,
        "reference_latex": expression_reference_latex,
        "author_name_latex": author_name_latex,
        "latex_lhs": expression_latex_lhs,
        "latex_relation": expression_latex_relation,
        "latex_rhs": expression_latex_rhs,
        "latex_condition": expression_latex_condition,
    }
    query = """
    MATCH (e:expression {id: $id})
    SET e += $props
    RETURN e
    """
    result = tx.run(query, id=expression_id, props=properties)
    return result.single() is not None


@trace_execution
def edit_node_property(
    tx, node_type: str, node_id: str, property_key: str, property_value
) -> bool:
    """
    property_value can be either str or int

    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify

    Gemini 3.1 Pro warns that "MERGE" is bad since
       If an ID doesn't exist, MERGE will create a new, empty node with that ID and apply the property.
    However, I'm intentionally using `edit_node_property` to add properties if they are missing.
    (Gemini 3.1 Pro says to use `MATCH` instead.)
    """

    if node_type not in list_of_valid.node_types:
        raise ValueError(f"Invalid node type: {node_type}")
    # property_key can't be a bind parameter either. See
    # _SAFE_PROPERTY_KEY_PATTERN / _PROTECTED_PROPERTY_KEYS above for why
    # this is a pattern + denylist rather than a hard allowlist.
    if not _SAFE_PROPERTY_KEY_PATTERN.match(property_key):
        raise ValueError(f"Invalid property key: {property_key}")
    if property_key in _PROTECTED_PROPERTY_KEYS:
        raise ValueError(f"Property key is not editable: {property_key}")
    query = (
        f"MATCH (n:{node_type} {{id: $node_id}}) SET n.{property_key} = $value RETURN n"
    )
    result = tx.run(query, node_id=node_id, value=property_value)
    return result.single() is not None


# @trace_execution
# def edit_derivation_metadata(
#     tx,
#     derivation_id: str,
#     derivation_name_latex: str,
#     derivation_reference_latex: str,
#     abstract_latex: str,
#     author_name_latex: str,
# ) -> None:
#     """
#     TODO: deprecate this in favor of modify node properties

#     `SET d += {map}` updates the properties listed in the map without deleting
#     other existing properties on the node. If you want to delete all other
#     properties and only keep these five, use `SET d = {map}`.

#     """

#     query = """
#     MERGE (d:derivation {id: $id})
#     SET d = {
#         name_latex: $name,
#         reference_latex: $ref,
#         author_name_latex: $author,
#         abstract_latex: $abstract
#     }
#     """

#     tx.run(
#         query,
#         id=derivation_id,
#         name=derivation_name_latex,
#         ref=derivation_reference_latex,
#         author=author_name_latex,
#         abstract=abstract_latex,
#     ).consume()

#     return


@trace_execution
def disconnect_step_from_inference_rule(tx: Transaction, step_id: str) -> None:
    """
    called by "delete derivation"

    https://stackoverflow.com/questions/57553886/neo4j-what-happens-to-a-directional-relationship-when-one-node-is-deleted

    as part of this sequence:
     1) for each step,
           * disconnect step from inference rule (remove edge)
           * disconnect step from expressions (remove edge)
           * disconnect step from derivation (remove edge)
           * delete step node
     2) delete derivation node
    """
    # TODO
    logger.info("not doing anything yet")
    return


@trace_execution
def delete_node(tx: Transaction, node_id: str, node_type: str) -> None:
    """
    called by "delete derivation"

    https://stackoverflow.com/questions/57553886/neo4j-what-happens-to-a-directional-relationship-when-one-node-is-deleted

    as part of this sequence:
     1) for each step, delete step node. All associated edges disappear automatically
     2) delete derivation node

    """

    # must be one of these node types. See also 'schema.log' file
    logger.info("node_type= " + node_type)
    if node_type not in list_of_valid.node_types:
        raise ValueError(f"Invalid node type: {node_type}")
    query = f"MATCH (d:{node_type} {{id: $node_id}}) DETACH DELETE d"
    tx.run(query, node_id=node_id).consume()
    return


@trace_execution
def disconnect_symbol_from_feed(tx, symbol_id: str, feed_id: str) -> None:
    """
    called by "edit feed"

    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    """

    query = "MATCH (e:feed)-[r:IS_COMPRISED_OF]->(s) WHERE e.id = $feed_id AND s.id = $symbol_id DELETE r"
    tx.run(query, feed_id=feed_id, symbol_id=symbol_id).consume()

    return


@trace_execution
def disconnect_symbol_from_expression(tx, symbol_id: str, expression_id: str) -> None:
    """
    called by "edit expression"

    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    """

    query = "MATCH (e:expression)-[r:IS_COMPRISED_OF]->(s) WHERE e.id = $expression_id AND s.id = $symbol_id DELETE r"
    tx.run(query, expression_id=expression_id, symbol_id=symbol_id).consume()

    return


@trace_execution
def get_symbols(tx: Transaction):
    """ """

    query = """
    MATCH (s:symbol)
    RETURN s
    """
    result = tx.run(query)
    return result.value()


@trace_execution
def get_operations(tx: Transaction):
    """ """

    query = """
    MATCH (s:operation)
    RETURN s
    """
    result = tx.run(query)
    return result.value()


@trace_execution
def get_relations(tx: Transaction):
    """ """

    query = """
    MATCH (s:relation)
    RETURN s
    """
    result = tx.run(query)
    return result.value()


@trace_execution
def get_node_labels_from_property(
    tx: Transaction, property_key: str, property_value: str
):
    """ """

    # https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%22116092343D0xessOtQA9vha4u7SzIrLno%22%5D,%22action%22:%22open%22,%22userId%22:%22101193243042884231058%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing
    # use n[$key] to access the property dynamically
    # use $value to pass the value safely
    query = """
    MATCH (n)
    WHERE n[$key] = $value
    RETURN DISTINCT labels(n) AS NodeLabel, n
    """

    # Pass both variables as parameters in the dictionary
    result = tx.run(query, key=property_key, value=property_value)

    return result.data()


@trace_execution
def connect_symbol_to_feed(tx, symbol_id: str, feed_id: str) -> None:
    """ """
    logger.info("symbol_id=" + symbol_id + "; feed_id=" + feed_id)

    query = "MATCH (f:feed {id: $feed_id}) MATCH (s {id: $symbol_id}) MERGE (f)-[:IS_COMPRISED_OF]->(s)"
    tx.run(query, feed_id=feed_id, symbol_id=symbol_id).consume()

    return


@trace_execution
def connect_symbol_to_expression(tx, symbol_id: str, expression_id: str) -> None:
    """ """
    logger.info("symbol_id=" + symbol_id + "; expression_id=" + expression_id)

    query = "MATCH (e:expression {id: $expression_id}) MATCH (n {id: $symbol_id}) MERGE (e)-[r:IS_COMPRISED_OF]->(n)"
    tx.run(query, expression_id=expression_id, symbol_id=symbol_id).consume()

    return


@trace_execution
def get_list_of_sequence_values_for_derivation_id(
    tx: Transaction, derivation_id: str
) -> list:
    """
    sequence value is a positive integer for ordering the steps of a derivation
    """

    logger.info("derivation_id=" + derivation_id)
    # logger.info(
    #     'MATCH (d:derivation {id:"'
    #     + derivation_id
    #     + '"})-[r]->(s:step) RETURN r.sequence_index'
    # )

    list_of_sequence_values = []  # type: List[int]
    query = "MATCH (d:derivation {id: $derivation_id})-[r]->(s:step) RETURN r.sequence_index"
    for result in tx.run(query, derivation_id=derivation_id):

        record = result.data()
        # record= {'r.sequence_index': '1'}
        logger.info("record=" + str(record))

        list_of_sequence_values.append(int(record["r.sequence_index"]))

    list_of_sequence_values.sort()
    logger.info("list_of_sequence_values=" + str(list_of_sequence_values))

    return list_of_sequence_values


@trace_execution
def connect_step_to_derivation(
    tx,
    step_id: str,
    derivation_id: str,
    inference_rule_id: str,
    requested_sequence_value: int | None,
    now_str: str,
    note_before_step_latex: str,
    note_after_step_latex: str,
    author_name_latex: str,
) -> dict | None:
    # Acquire an exclusive write lock on the derivation node before reading
    # or writing any HAS_STEP.sequence_index for it. This forces any other
    # transaction that also locks this same derivation node (see
    # edit_step_sequence_index) to wait until this transaction commits, so
    # the "next index" computed below can't race with a concurrent caller.
    # apoc.lock.nodes() is a void procedure -- it returns nothing itself,
    # so `d` from the preceding MATCH is what gets returned/checked here.
    deriv_check = tx.run(
        "MATCH (d:derivation {id: $did}) CALL apoc.lock.nodes([d]) RETURN d",
        did=derivation_id,
    ).single()
    inf_check = tx.run(
        "MATCH (i:inference_rule {id: $iid}) RETURN i", iid=inference_rule_id
    ).single()
    if not deriv_check or not inf_check:
        return None

    if requested_sequence_value is None:
        seq_query = "MATCH (d:derivation {id: $did}) OPTIONAL MATCH (d)-[r:HAS_STEP]->(:step) RETURN coalesce(max(r.sequence_index), -1) + 1 AS next_seq"
        seq_res = tx.run(seq_query, did=derivation_id).single()
        seq_val = seq_res["next_seq"] if seq_res else 0
    else:
        # Caller supplied an explicit index -- it must not already be in
        # use anywhere in this derivation, or ordering becomes ambiguous.
        conflict = tx.run(
            """
            MATCH (d:derivation {id: $did})-[r:HAS_STEP]->(:step)
            WHERE r.sequence_index = $seq
            RETURN count(r) AS c
            """,
            did=derivation_id,
            seq=requested_sequence_value,
        ).single()
        if conflict["c"] > 0:
            raise ValueError(
                f"sequence_index {requested_sequence_value} is already used "
                f"in derivation {derivation_id}"
            )
        seq_val = requested_sequence_value

    tx.run(
        "CREATE (:step:a_node {id: $step_id, author_name_latex: $author, note_before_step_latex: $before, created_datetime: $now, note_after_step_latex: $after})",
        step_id=step_id,
        author=author_name_latex,
        before=note_before_step_latex,
        now=now_str,
        after=note_after_step_latex,
    ).consume()

    tx.run(
        "MATCH (a:derivation {id: $did}), (b:step {id: $sid}) MERGE (a)-[r:HAS_STEP {sequence_index: $seq}]->(b)",
        did=derivation_id,
        sid=step_id,
        seq=seq_val,
    ).consume()

    tx.run(
        "MATCH (a:step {id: $sid}), (b:inference_rule {id: $iid}) MERGE (a)-[:HAS_INFERENCE_RULE]->(b)",
        sid=step_id,
        iid=inference_rule_id,
    ).consume()
    return {"sequence_index": seq_val}


@trace_execution
def search_symbols_by_latex(tx: Transaction, search_string: str) -> list:
    """
    Search the `latex` property of `:symbol` nodes server-side, replacing
    the previous pattern of fetching all symbols via get_nodes_of_type()
    and filtering in Python.

    Match is a case-sensitive substring match (Cypher CONTAINS), since
    LaTeX commands are case-sensitive (e.g. \\Gamma vs \\gamma are
    different symbols).

    Returns all matching nodes (no limit), ordered by id.

    Written by Claude Sonnet 5 on 2026-07-16
    https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/146
    """

    if not search_string or not search_string.strip():
        raise ValueError("search_string must be a non-empty string")

    query = """
        MATCH (s:symbol)
        WHERE s.latex CONTAINS $search_string
        RETURN s
        ORDER BY s.id
    """

    node_list = []  # type: List[dict]
    for result in tx.run(query, search_string=search_string):
        node_list.append(result.data()["s"])

    return node_list


@trace_execution
def connect_expressions_to_step(
    tx,
    step_id: str,
    now_str: str,
    list_of_input_expression_IDs: list,
    list_of_feed_IDs: list,
    list_of_output_expression_IDs: list,
    author_name_latex: str,
) -> None:
    """
    adding expressions to step can only be done once step exists
    """

    assert (
        (len(list_of_input_expression_IDs) > 0)
        or (len(list_of_feed_IDs) > 0)
        or (len(list_of_output_expression_IDs) > 0)
    )

    logger.info("list_of_input_expression_IDs" + str(list_of_input_expression_IDs))
    logger.info("list_of_feed_IDs" + str(list_of_feed_IDs))
    logger.info("list_of_output_expression_IDs" + str(list_of_output_expression_IDs))

    # Lock the step node so a second call for this step (e.g. adding more
    # inputs later) can't compute a starting index that races with this
    # call. Held until this transaction commits.
    lock = tx.run(
        "MATCH (s:step {id: $step_id}) CALL apoc.lock.nodes([s]) RETURN s",
        step_id=step_id,
    ).single()
    if not lock:
        raise ValueError(f"no step with id {step_id}")

    def _next_index(rel_type: str) -> int:
        # rel_type is always one of the hardcoded literals passed below,
        # never caller input, so interpolating it is safe here -- Cypher
        # has no way to bind a relationship type as a parameter.
        rec = tx.run(
            f"MATCH (:step {{id: $step_id}})-[r:{rel_type}]->() "
            f"RETURN coalesce(max(r.sequence_index), -1) + 1 AS next_seq",
            step_id=step_id,
        ).single()
        return rec["next_seq"]

    # # input expressions
    # for input_index, input_id in enumerate(list_of_input_expression_IDs):
    #     logger.info("input_id=" + input_id + "; input_index=" + str(input_index))
    #     logger.info("step_id=" + step_id)
    #     tx.run(
    #         "MATCH (a:step),(b:expression) "
    #         'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(input_id) + '" '
    #         'MERGE (a)-[:HAS_INPUT {sequence_index: "' + str(input_index) + '"}]->(b)'
    #     ).consume()
    #     # print(result.data()) # this just shows "[]"

    if list_of_input_expression_IDs:
        start = _next_index("HAS_INPUT")
        inputs_data = [
            {"id": exp_id, "idx": start + i}
            for i, exp_id in enumerate(list_of_input_expression_IDs)
        ]

        query = """
        MATCH (a:step {id: $step_id})
        UNWIND $inputs AS input_data
        MATCH (b:expression {id: input_data.id})
        MERGE (a)-[:HAS_INPUT {sequence_index: input_data.idx}]->(b)
        """
        tx.run(query, step_id=step_id, inputs=inputs_data)

    # # feed expressions
    # for feed_index, feed_id in enumerate(list_of_feed_IDs):
    #     logger.info("feed_id=" + feed_id + "; feed_index=" + str(feed_index))
    #     tx.run(
    #         "MATCH (a:step),(b:feed) "
    #         'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(feed_id) + '" '
    #         'MERGE (a)-[:HAS_FEED {sequence_index: "' + str(feed_index) + '"}]->(b)'
    #     ).consume()
    #     # print(result.data()) # this just shows "[]"

    if list_of_feed_IDs:
        start = _next_index("HAS_FEED")
        feeds_data = [
            {"id": exp_id, "idx": start + i}
            for i, exp_id in enumerate(list_of_feed_IDs)
        ]

        query = """
        MATCH (a:step {id: $step_id})
        UNWIND $feeds AS feed_data
        MATCH (b:feed {id: feed_data.id})
        MERGE (a)-[:HAS_FEED {sequence_index: feed_data.idx}]->(b)
        """
        tx.run(query, step_id=step_id, feeds=feeds_data)

    # # output expressions
    # for output_index, output_id in enumerate(list_of_output_expression_IDs):
    #     logger.info("output_id=" + output_id + "; output_index=" + str(output_index))
    #     tx.run(
    #         "MATCH (a:step),(b:expression) "
    #         'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(output_id) + '" '
    #         'MERGE (a)-[:HAS_OUTPUT {sequence_index: "' + str(output_index) + '"}]->(b)'
    #     ).consume()
    #     # print(result.data()) # this just shows "[]"

    if list_of_output_expression_IDs:
        start = _next_index("HAS_OUTPUT")
        outputs_data = [
            {"id": exp_id, "idx": start + i}
            for i, exp_id in enumerate(list_of_output_expression_IDs)
        ]

        query = """
        MATCH (a:step {id: $step_id})
        UNWIND $outputs AS output_data
        MATCH (b:expression {id: output_data.id})
        MERGE (a)-[:HAS_OUTPUT {sequence_index: output_data.idx}]->(b)
        """
        tx.run(query, step_id=step_id, outputs=outputs_data)

    return


@trace_execution
def add_expression(
    tx: Transaction,
    expression_id: str,
    expression_name_latex: str,
    expression_latex_lhs: str,
    expression_latex_relation: str,
    expression_latex_rhs: str,
    expression_latex_condition: str,
    expression_description_latex: str,
    expression_reference_latex: str,
    now_str: str,
    author_name_latex: str,
) -> bool:
    """
    nothing returned by function because action is to write change to Neo4j database

    `add_expression` doesn't have `sympy_lhs`, `sympy_rhs`, `lean` because those are added in a separate action

    """
    dup_check = tx.run(
        "MATCH (e:expression) WHERE e.latex_lhs = $lhs AND e.latex_relation = $relation AND e.latex_rhs = $rhs RETURN e",
        lhs=expression_latex_lhs,
        relation=expression_latex_relation,
        rhs=expression_latex_rhs,
    )
    if dup_check.peek() is not None:
        return False

    params = {
        "id": str(expression_id),
        "name": str(expression_name_latex),
        "lhs": str(expression_latex_lhs),
        "relation": str(expression_latex_relation),
        "rhs": str(expression_latex_rhs),
        "condition": str(expression_latex_condition),
        "created": now_str,
        "desc": str(expression_description_latex),
        "ref": str(expression_reference_latex),
        "author": str(author_name_latex),
    }
    query = """
        CREATE (e:expression:a_node {id: $id})
        SET 
            e.created_datetime = $created,
            e.name_latex = $name,
            e.latex_lhs = $lhs,
            e.latex_relation = $relation,
            e.latex_rhs = $rhs,
            e.latex_condition = $condition,
            e.description_latex = $desc,
            e.reference_latex = $ref,
            e.author_name_latex = $author
    """
    tx.run(query, params).consume()
    return True


@trace_execution
def add_feed(
    tx: Transaction,
    feed_id: str,
    feed_latex: str,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database

    the `sympy` and `lean` property keys do not get populated because that is a separate action
    """

    params = {
        "id": str(feed_id),
        "latex": str(feed_latex),
        "author": str(author_name_latex),
        "created": now_str,
    }
    query = """
        CREATE (f:feed:a_node {id: $id})
        SET 
            f.created_datetime = $created,
            f.latex = $latex,
            f.author_name_latex = $author
    """
    tx.run(query, params).consume()

    return


# @trace_execution
# def add_quantum_operator_symbol(
#     tx: Transaction,
#     symbol_id: str,
#     symbol_name: str,
#     symbol_latex: str,
#     symbol_description: str,
#     symbol_requires_arguments: bool,
#     symbol_reference: str,
#     now_str: str,
#     author_name_latex: str,
# ) -> None:
#     """
#     nothing returned by function because action is to write change to Neo4j database

#     Note: 2026-07-12: Claude Sonnet 5 detected that this is an orphan function --
#     not currently used by any web or API calls.
#     """

#     params = {
#         "id": str(symbol_id),
#         "name": str(symbol_name),
#         "latex": str(symbol_latex),
#         "desc": str(symbol_description),
#         "created": now_str,
#         "author": str(author_name_latex),
#         "req_args": symbol_requires_arguments,
#         "ref": str(symbol_reference),
#     }

#     query = """
#         MERGE (qo:quantum_operator:a_node {id: $id})
#         ON CREATE SET
#             qo.created_datetime = $created,
#             qo.name_latex = $name,
#             qo.latex = $latex,
#             qo.description_latex = $desc,
#             qo.author_name_latex = $author,
#             qo.requires_arguments = $req_args,
#             qo.reference_latex = $ref
#         ON MATCH SET
#             qo.name_latex = $name,
#             qo.latex = $latex,
#             qo.description_latex = $desc,
#             qo.author_name_latex = $author,
#             qo.requires_arguments = $req_args,
#             qo.reference_latex = $ref
#             // Note: created_datetime is NOT updated here
#     """
#     tx.run(query, params).consume()

#     return


@trace_execution
def add_constant_value_with_units(
    tx: Transaction,
    scalar_id: str,
    value_with_units_id: str,
    number_decimal: float,
    number_power: float,
    dict_of_units: dict,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    This function may suffice for creating new constants
    but is not expected to work for editing constants. See Gemini 3 Pro's observation inline below.
    """

    # dict_of_units keys become property names on the value_with_units node,
    # and property names can't be bind parameters, so every key must be
    # checked against a fixed allowlist (DIMENSION_UNIT_PROPERTY_VALID_VALUES)
    # before use, and every value must belong to that key's list of valid
    # units. Everything else is passed as a single params dict.
    unit_props = {}
    for property_key, property_value in dict_of_units.items():
        if property_key not in DIMENSION_UNIT_PROPERTY_VALID_VALUES:
            raise ValueError(f"Invalid unit property key: {property_key}")
        valid_values = DIMENSION_UNIT_PROPERTY_VALID_VALUES[property_key]
        if property_value not in valid_values:
            raise ValueError(
                f"Invalid unit value {property_value!r} for property {property_key!r}"
            )
        unit_props[property_key] = property_value
    logger.info(
        "neo4j_query/add_constant_value_with_units: unit_props=" + str(unit_props)
    )
    params = {
        "value_id": str(value_with_units_id),
        "scalar_id": str(scalar_id),
        "number_decimal": number_decimal,
        "number_power": number_power,
        "created": str(now_str),
        "author": str(author_name_latex),
        "unit_props": unit_props,
    }
    query = """
    MERGE (v:value_with_units:a_node {id: $value_id})
    ON CREATE SET
        v.created_datetime = $created,
        v.number_decimal = $number_decimal,
        v.number_power = $number_power,
        v.author_name_latex = $author
    ON MATCH SET
        v.number_decimal = $number_decimal,
        v.number_power = $number_power,
        v.author_name_latex = $author
    SET v += $unit_props
    WITH v
    MATCH (s:scalar {id: $scalar_id})
    MERGE (s)-[:HAS_VALUE]->(v)
    """
    tx.run(query, params).consume()
    return


@trace_execution
def add_scalar_symbol(
    tx: Transaction,
    symbol_id: str,
    symbol_name: str,
    symbol_latex: str,
    symbol_description: str,
    symbol_reference: str,
    symbol_scope: str,
    symbol_variable_or_constant: str,
    symbol_domain: str,
    dimension_length: int,
    dimension_time: int,
    dimension_mass: int,
    dimension_temperature: int,
    dimension_electric_charge: int,
    dimension_amount_of_substance: int,
    dimension_luminous_intensity: int,
    now_str: str,
    author_name_latex: str,
):
    """ """

    # corresponds to SpecifyNewSymbolDIRECTScalarForm
    assert len(symbol_latex) > 0
    assert len(symbol_scope) > 0
    assert len(symbol_variable_or_constant) > 0

    params = {
        "id": str(symbol_id),
        "name": str(symbol_name),
        "latex": str(symbol_latex),
        "desc": str(symbol_description),
        "ref": str(symbol_reference),
        "scope": str(symbol_scope),
        "var_const": str(symbol_variable_or_constant),
        "domain": str(symbol_domain),
        "dim_len": dimension_length,
        "dim_time": dimension_time,
        "dim_mass": dimension_mass,
        "dim_temp": dimension_temperature,
        "dim_charge": dimension_electric_charge,
        "dim_amt": dimension_amount_of_substance,
        "dim_lum": dimension_luminous_intensity,
        "created": now_str,
        "author": str(author_name_latex),
    }

    query = """
        MERGE (s:symbol:scalar:a_node {id: $id})
        ON CREATE SET 
            s.created_datetime = $created,
            s.name_latex = $name,
            s.latex = $latex,
            s.description_latex = $desc,
            s.reference_latex = $ref,
            s.scope = $scope,
            s.variable_or_constant = $var_const,
            s.domain = $domain,
            s.dimension_length = $dim_len,
            s.dimension_time = $dim_time,
            s.dimension_mass = $dim_mass,
            s.dimension_temperature = $dim_temp,
            s.dimension_electric_charge = $dim_charge,
            s.dimension_amount_of_substance = $dim_amt,
            s.dimension_luminous_intensity = $dim_lum,
            s.author_name_latex = $author
        ON MATCH SET 
            s.name_latex = $name,
            s.latex = $latex,
            s.description_latex = $desc,
            s.reference_latex = $ref,
            s.scope = $scope,
            s.variable_or_constant = $var_const,
            s.domain = $domain,
            s.dimension_length = $dim_len,
            s.dimension_time = $dim_time,
            s.dimension_mass = $dim_mass,
            s.dimension_temperature = $dim_temp,
            s.dimension_electric_charge = $dim_charge,
            s.dimension_amount_of_substance = $dim_amt,
            s.dimension_luminous_intensity = $dim_lum,
            s.author_name_latex = $author
    """

    tx.run(query, params)

    return


@trace_execution
def add_vector_symbol(
    tx: Transaction,
    symbol_id: str,
    symbol_name: str,
    symbol_latex: str,
    symbol_description: str,
    symbol_reference: str,
    symbol_is_composite: bool,
    symbol_size: str,
    symbol_orientation: str,
    symbol_number_of_entries: str,
    now_str: str,
    author_name_latex: str,
):
    """ """

    # corresponds to SpecifyNewSymbolDIRECTVectorForm
    assert len(symbol_latex) > 0

    if symbol_size == "arbitrary":
        params = {
            "id": str(symbol_id),
            "name": str(symbol_name),
            "latex": str(symbol_latex),
            "desc": str(symbol_description),
            "ref": str(symbol_reference),
            "orientation": str(symbol_orientation),
            "size": str(symbol_size),
            "is_composite": symbol_is_composite,
            "created": now_str,
            "author": str(author_name_latex),
        }

        query = """
            MERGE (s:symbol:vector:a_node {id: $id})
            ON CREATE SET 
                s.created_datetime = $created,
                s.name_latex = $name,
                s.latex = $latex,
                s.description_latex = $desc,
                s.reference_latex = $ref,
                s.orientation = $orientation,
                s.size = $size,
                s.is_composite = $is_composite,
                s.author_name_latex = $author
            ON MATCH SET 
                s.name_latex = $name,
                s.latex = $latex,
                s.description_latex = $desc,
                s.reference_latex = $ref,
                s.orientation = $orientation,
                s.size = $size,
                s.is_composite = $is_composite,
                s.author_name_latex = $author
        """
        result = tx.run(query, params)

    else:  # fixed size
        params = {
            "id": str(symbol_id),
            "name": str(symbol_name),
            "latex": str(symbol_latex),
            "desc": str(symbol_description),
            "ref": str(symbol_reference),
            "orientation": str(symbol_orientation),
            "size": str(symbol_size),
            "num_entries": str(symbol_number_of_entries),
            "is_composite": symbol_is_composite,
            "created": now_str,
            "author": str(author_name_latex),
        }

        query = """
            MERGE (s:symbol:vector:a_node {id: $id})
            ON CREATE SET 
                s.created_datetime = $created,
                s.name_latex = $name,
                s.latex = $latex,
                s.description_latex = $desc,
                s.reference_latex = $ref,
                s.orientation = $orientation,
                s.size = $size,
                s.number_of_entries = $num_entries,
                s.is_composite = $is_composite,
                s.author_name_latex = $author
            ON MATCH SET 
                s.name_latex = $name,
                s.latex = $latex,
                s.description_latex = $desc,
                s.reference_latex = $ref,
                s.orientation = $orientation,
                s.size = $size,
                s.number_of_entries = $num_entries,
                s.is_composite = $is_composite,
                s.author_name_latex = $author
        """
        result = tx.run(query, params)

    return


@trace_execution
def add_matrix_symbol(
    tx: Transaction,
    symbol_id: str,
    symbol_name: str,
    symbol_latex: str,
    symbol_description: str,
    symbol_reference: str,
    symbol_is_composite: bool,
    symbol_size: str,
    symbol_number_of_rows: str,
    symbol_number_of_columns: str,
    now_str: str,
    author_name_latex: str,
):
    """ """

    # corresponds to SpecifyNewSymbolDIRECTMatrixForm
    assert len(symbol_latex) > 0

    if symbol_size == "arbitrary":
        query = """
            MERGE (m:symbol:matrix:a_node {id: $id})
            ON CREATE SET
                m.created_datetime = $created_datetime,
                m.name_latex = $name_latex,
                m.latex = $latex,
                m.description_latex = $description_latex,
                m.reference_latex = $reference_latex,
                m.size = $size,
                m.is_composite = $is_composite,
                m.author_name_latex = $author_name_latex
            ON MATCH SET
                m.name_latex = $name_latex,
                m.latex = $latex,
                m.description_latex = $description_latex,
                m.reference_latex = $reference_latex,
                m.size = $size,
                m.is_composite = $is_composite,
                m.author_name_latex = $author_name_latex
        """
        parameters = {
            "id": str(symbol_id),
            "name_latex": str(symbol_name),
            "latex": str(symbol_latex),
            "description_latex": str(symbol_description),
            "reference_latex": str(symbol_reference),
            "size": str(symbol_size),
            "is_composite": symbol_is_composite,  # Assuming this is a boolean/int, usually better not to str() it
            "created_datetime": now_str,
            "author_name_latex": str(author_name_latex),
        }

        result = tx.run(query, parameters)

    else:  # fixed size
        query = """
            MERGE (m:matrix:symbol:a_node {id: $id})
            ON CREATE SET
                m.created_datetime = $created_datetime,
                m.name_latex = $name_latex,
                m.latex = $latex,
                m.description_latex = $description_latex,
                m.reference_latex = $reference_latex,
                m.size = $size,
                m.number_of_rows = $number_of_rows,
                m.number_of_columns = $number_of_columns,
                m.is_composite = $is_composite,
                m.author_name_latex = $author_name_latex
            ON MATCH SET
                m.name_latex = $name_latex,
                m.latex = $latex,
                m.description_latex = $description_latex,
                m.reference_latex = $reference_latex,
                m.size = $size,
                m.number_of_rows = $number_of_rows,
                m.number_of_columns = $number_of_columns,
                m.is_composite = $is_composite,
                m.author_name_latex = $author_name_latex
        """
        parameters = {
            "id": str(symbol_id),
            "name_latex": str(symbol_name),
            "latex": str(symbol_latex),
            "description_latex": str(symbol_description),
            "reference_latex": str(symbol_reference),
            "size": str(symbol_size),
            "number_of_rows": str(symbol_number_of_rows),
            "number_of_columns": str(symbol_number_of_columns),
            "is_composite": symbol_is_composite,  # Assuming this is a boolean/int, usually better not to str() it
            "created_datetime": now_str,
            "author_name_latex": str(author_name_latex),
        }

        result = tx.run(query, parameters)

    return


@trace_execution
def add_operation_symbol(
    tx: Transaction,
    operation_id: str,
    operation_name: str,
    operation_latex: str,
    operation_description_latex: str,
    operation_reference_latex: str,
    operation_argument_count: int,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database

    """

    # corresponds to SpecifyNewSymbolDIRECTOperationForm
    assert len(operation_name) > 0
    assert len(operation_latex) > 0
    assert int(operation_argument_count) > 0

    query = """
        MERGE (o:operation:a_node {id: $id})
        ON CREATE SET 
            o.created_datetime = $created,
            o.name_latex = $name,
            o.latex = $latex,
            o.description_latex = $desc,
            o.reference_latex = $ref,
            o.argument_count = $arg_count,
            o.author_name_latex = $author
        ON MATCH SET 
            o.name_latex = $name,
            o.latex = $latex,
            o.description_latex = $desc,
            o.reference_latex = $ref,
            o.argument_count = $arg_count,
            o.author_name_latex = $author
            // Note: created_datetime is NOT updated here
    """

    params = {
        "id": str(operation_id),
        "name": str(operation_name),
        "latex": str(operation_latex),
        "desc": str(operation_description_latex),
        "ref": str(operation_reference_latex),
        "arg_count": operation_argument_count,  # Integers don't need str()
        "created": str(now_str),
        "author": str(author_name_latex),
    }

    result = tx.run(query, params)

    return


@trace_execution
def add_relation_symbol(
    tx: Transaction,
    relation_id: str,
    relation_name_latex: str,
    relation_latex: str,
    relation_description_latex: str,
    relation_reference_latex: str,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database
    """

    # corresponds to SpecifyNewSymbolDIRECTOperationForm
    assert len(relation_name_latex) > 0
    assert len(relation_latex) > 0

    query = """
        MERGE (o:relation:a_node {id: $id})
        ON CREATE SET 
            o.created_datetime = $created,
            o.name_latex = $name,
            o.latex = $latex,
            o.description_latex = $desc,
            o.reference_latex = $ref,
            o.author_name_latex = $author
        ON MATCH SET 
            o.name_latex = $name,
            o.latex = $latex,
            o.description_latex = $desc,
            o.reference_latex = $ref,
            o.author_name_latex = $author
            // Note: created_datetime is NOT updated here
    """

    params = {
        "id": str(relation_id),
        "name": str(relation_name_latex),
        "latex": str(relation_latex),
        "desc": str(relation_description_latex),
        "ref": str(relation_reference_latex),
        "created": str(now_str),
        "author": str(author_name_latex),
    }

    result = tx.run(query, params)

    return


@trace_execution
def get_list_of_all_node_IDs_and_labels(tx: Transaction) -> list:
    """ """
    result = tx.run("MATCH (n) RETURN n.id, labels(n)")
    record = result.data()
    # print("neo4j_query/list_of_all_nodes: record=", record)
    return record


@trace_execution
def delete_all_nodes_and_relationships(tx: Transaction) -> None:
    """
    Delete all nodes and relationships from Neo4j database

    This requires write access to Neo4j database

    nothing returned by function because action is to write change to Neo4j database

    """

    tx.run("MATCH (n) DETACH DELETE n")

    return


@trace_execution
def user_query(tx: Transaction, query: str) -> list:
    """
    Execute an arbitrary, user-supplied Cypher query. READ-ONLY.
    User-submitted Cypher query for Neo4j database

    Read-only for Neo4j database


    IMPORTANT - caller responsibility: `tx` must be a transaction opened
    in read mode, e.g. via `session.execute_read(...)`. This function
    intentionally keeps the same `tx: Transaction` signature as every
    other function in this module and does NOT open its own
    session/transaction, so it cannot itself guarantee read-only access.
    The keyword blocklist below is defense-in-depth, not a full Cypher
    parser, so the real enforcement backstop is Neo4j's server-side
    rejection of writes inside a read transaction. If this is ever called
    with a write-mode transaction, that backstop is gone.


    Allowing arbitrary users to pass raw Cypher queries is exceptionally dangerous.
    While you catch `neo4j.exceptions.ClientError` to mimic read-only behavior, a clever user can still:
    - Cause Denial of Service (DoS) by writing infinitely recursive paths (`MATCH p=()-[:REL*]-() RETURN p`).
    - Bypass application-level security to read hidden nodes/passwords.
    - Utilize `CALL apoc.*` procedures if they are enabled to interact with the host OS.

    --> Do not rely on Python `try/except`. You must configure a **Read-Only Neo4j Database User** role
        natively inside Neo4j, and the application must connect using that specific low-privilege credential
        when executing `user_query`.

    """
    if _WRITE_KEYWORD_PATTERN.search(query):
        return ["WRITE OPERATIONS NOT ALLOWED (blocked keyword)"]
    list_of_results = []
    try:
        for result in tx.run(query):
            list_of_results.append(str(result))
    except neo4j.exceptions.ClientError:
        list_of_results = ["WRITE OPERATIONS NOT ALLOWED (1)"]
    except neo4j.exceptions.TransactionError:
        list_of_results = ["WRITE OPERATIONS NOT ALLOWED (2)"]

    return list_of_results


# EOF
