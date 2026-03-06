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


from . import list_of_valid

logger = logging.getLogger(__name__)


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
    # for result in tx.run(
    #     "CALL apoc.export.csv.all('" + output_filename + "',{useTypes:true})"
    # ):
    #     pass
    # logger.info("[TRACE] end " + trace_id)
    # return result
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
    """
    for result in tx.run(
        "CALL apoc.export.graphml.all('" + output_filename + "',{useTypes:true})"
    ):
        pass
    return result


@trace_execution
def apoc_export_json(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.json.all/

    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    Default export data structure is 'JSON_LINES' (not JSON)

    """

    for result in tx.run(
        "CALL apoc.export.json.all('" + output_filename + "',{useTypes:true})"
    ):
        pass

    return result


@trace_execution
def apoc_export_cypher(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/export/cypher/


    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    >>> apoc_export_cypher(tx: Transaction)
    """

    # "cypher.all" produces 1 file with constraints
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.all/
    # TODO: possibly switch to
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.query/
    # which produces separate files for relationships and nodes

    # for result in tx.run(
    #     "CALL apoc.export.cypher.all('" + output_filename + "', {"
    #     # "format: 'cypher-shell'," # the output produced when using 'cypher-shell' is readable by `bin/cypher-shell --file dumping_grounds/pdg.cypher` but not the Python driver
    #     "format: 'plain',"
    #     "useOptimizations: {type: 'UNWIND_BATCH', unwindBatchSize: 20}"
    #     "}) "
    #     "YIELD file, batches, source, format, nodes, relationships, properties, time, rows, batchSize "
    #     "RETURN file, batches, source, format, nodes, relationships, properties, time, rows, batchSize;"
    # ):
    #     pass

    # return result

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
    """

    for node_type in list_of_valid.node_types:
        # try:
        tx.run(
            "CREATE CONSTRAINT constrain_"
            + node_type
            + "_id FOR (n:"
            + node_type
            + ") REQUIRE n.id IS UNIQUE"
        )
        # except Exception as err:
        #     print("neo4j/constrain_unique_id: WARNING:", err)

    return


@trace_execution
def get_user_stats(tx: Transaction, author: str):
    """ """

    logger.info("author=" + author)

    # result = tx.run(
    #     "MATCH (d:derivation) WHERE d.author_name_latex = $author_name RETURN d",
    #     author_name=author,
    # )
    # # list_of_derivations = result.data()
    # list_of_derivations = result.value("d")

    # result = tx.run(
    #     "MATCH (e:expression) WHERE e.author_name_latex = $author_name RETURN e",
    #     author_name=author,
    # )
    # # list_of_expressions = result.data()
    # list_of_expressions = result.value("e")

    # result = tx.run(
    #     "MATCH (s:symbol) WHERE s.author_name_latex = $author_name RETURN s",
    #     author_name=author,
    # )
    # list_of_symbols = result.value("s")

    # result = tx.run(
    #     """
    # MATCH (n)
    # WHERE n.author_name_latex = $author_name
    #   AND n.created_datetime IS NOT NULL
    # RETURN collect(n.created_datetime) AS created_dates_list
    # """,
    #     author_name=author,
    # )
    # res = result.data()

    # logger.info("res= " + str(res))

    # list_of_dates = res[0]["created_dates_list"]

    # result = tx.run(
    #     """
    # MATCH (n)
    # WHERE n.author_name_latex = $author_name
    # RETURN count(n) AS author_count
    # """,
    #     author_name=author,
    # )
    # # Fetch the first record and the specific key
    # record = result.single()
    # number_of_contributions = record["author_count"] if record else 0

    # return (
    #     list_of_dates,
    #     number_of_contributions,
    #     list_of_derivations,
    #     list_of_expressions,
    #     list_of_symbols,
    # )

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

    # record["d"] accesses the node, .data() converts that specific node to a dict

    # if the expression is not used in any derivations then `record` is None and the list comprehension fails
    # try:
    #     list_of_dicts = [record["d"].data() for record in result]
    # except Exception as err:
    #     logger.error(str(err))
    #     list_of_dicts = []

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
def get_scalar_id_that_has_value_and_units_id(tx: Transaction, value_and_units_id: str):
    """ """
    result = tx.run(
        "MATCH (s:scalar)-[]->(v:value_with_units) WHERE v.id='"
        + value_and_units_id
        + "' RETURN s.id"
    )

    scalar_id = result.data()
    logger.info(" scalar_id" + scalar_id)

    return scalar_id


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

    assert node_type in list_of_valid.node_types

    # node_list = []  # type: List[dict]
    # for result in tx.run("MATCH (n:" + node_type + ") RETURN n"):
    #     # print(result.data()["n"])
    #     node_list.append(result.data()["n"])

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

    >>> count_nodes_of_type(tx: Transaction)
    """

    # must be one of these node types. See also 'schema.log' file
    logger.info("neo4j_query/get_count_nodes_of_type:  node type:" + node_type)
    assert node_type in list_of_valid.node_types

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

    # # TODO: this should be derivation->step->feed
    # list_of_derivation_dicts = []  # type: List[dict]
    # for result in tx.run(
    #     'MATCH (d:derivation)-[]->(s:step)-[]->(f:feed) WHERE f.id = "'
    #     + str(feed_id)
    #     + '" RETURN d'
    # ):
    #     list_of_derivation_dicts.append(result.data()["d"])

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
) -> list:
    """
    which derivations contain this inference rule?

    >>> derivations_that_use_inference_rule()
    """

    logger.info("inference_rule_id=" + inference_rule_id)

    list_of_derivation_dicts = []  # type: List[dict]
    for result in tx.run(
        'MATCH (d:derivation)-[]->(s:step)-[]->(i:inference_rule) WHERE i.id = "'
        + str(inference_rule_id)
        + '" RETURN d'
    ):
        list_of_derivation_dicts.append(result.data()["d"])
        # print("list_of_derivations=", list_of_derivations)

    # print(
    #     "inference_rule_id=",
    #     inference_rule_id,
    #     "list_of_derivations=",
    #     list_of_derivation_dicts,
    # )

    return list_of_derivation_dicts


@trace_execution
def get_expressions_that_use_symbol(tx, symbol_id: str) -> List[Dict[str, Any]]:
    """
    which expressions contain this symbol?

    Returns a list of expression nodes that are connected to a symbol
    of a specific category and ID.

    >>> expressions_that_use_symbol()
    """

    logger.info("symbol_id = " + symbol_id)

    # assert symbol_category in list_of_valid.symbol_categories

    list_of_expression_dicts = []  # type: List[dict]

    # for result in tx.run(
    #     "MATCH (e:expression)-[:IS_COMPRISED_OF]->(s:"
    #     + symbol_category
    #     + ") WHERE s.id = '"
    #     + str(symbol_id)
    #     + "' RETURN e"
    # ):
    #     list_of_expression_dicts.append(result.data()["e"])

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

    >>> get_list_of_steps_in_this_derivation(tx: Transaction)
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
    for result in tx.run(
        'MATCH (:step {id:"' + step_id + '"})-[:HAS_FEED]->(f:feed) RETURN f'
    ):
        list_of_feeds.append(result.data()["f"])

    return list_of_feeds


@trace_execution
def get_sequence_index_for_step(tx: Transaction, step_id: str) -> int:
    """ """
    sequence_index = 0
    result = tx.run(
        'MATCH ()-[r:HAS_STEP]->(n:step {id:"' + step_id + '"}) RETURN r.sequence_index'
    )
    # print(type(result)) # don't access the `result` variable more than once, as mentioned on https://neo4j.com/docs/python-manual/current/transformers/
    sequence_index = result.data()[0]["r.sequence_index"]
    logger.info("sequence_index=" + str(sequence_index))

    return sequence_index


@trace_execution
def get_inference_rule_connected_to_step_ID(tx: Transaction, step_id: str):
    """
    use case: when displaying a derivation, user wants to see inference rule per step

    >>> step_has_inference_rule()
    """

    result = tx.run(
        'MATCH (n:step {id:"'
        + step_id
        + '"})-[r:HAS_INFERENCE_RULE]->(m:inference_rule) RETURN m'
    )
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
def get_derivation_id_from_step_id(tx: Transaction, step_id: str) -> str:
    """ """

    logger.info("neo4j_query/get_derivation_id_from_step_id: step_id=" + str(step_id))

    result = tx.run(
        'MATCH (d:derivation)-[r:"HAS_STEP"]->(:step {"id":"'
        + step_id
        + "}) RETURN d.id"
    )

    derivation_id = result.data()

    logger.info(
        "neo4j_query/get_derivation_id_from_step_id: derivation_id="
        + str(derivation_id)
    )

    return derivation_id


@trace_execution
def get_expressions_from_step_id_and_expr_type(
    tx, step_id: str, expression_type: str
) -> list:
    """
    use case: when displaying a derivation,
    for each step the user wants to know the inputs, feeds, and outputs.

    """

    logger.info("step_id=" + step_id + "; expression_type=" + expression_type)
    assert (
        expression_type == "HAS_INPUT"
        or expression_type == "HAS_FEED"
        or expression_type == "HAS_OUTPUT"
    )

    # print("TODO: figure out how to get the sequence_index for this expression")
    # print(
    #     'MATCH (n:step {id:"'
    #     + step_id
    #     + '"})-[r:'
    #     + expression_type
    #     + "]->(m:expression) RETURN m"
    # )

    if expression_type == "HAS_FEED":
        destination_node_type = "feed"
    else:
        destination_node_type = "expression"

    # print(
    #     'MATCH (:step {id:"'
    #     + step_id
    #     + '"})-[r:'
    #     + expression_type
    #     + "]->(m:"
    #     + destination_node_type
    #     + ") RETURN m"
    # )

    list_of_expression_dicts = []  # type: List[dict]
    for result in tx.run(
        'MATCH (:step {id:"'
        + step_id
        + '"})-[r:'
        + expression_type
        + "]->(m:"
        + destination_node_type
        + ") RETURN m"
    ):
        # print(result.data())
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
    for result in tx.run(
        'MATCH (:step {id:"' + step_id + '"})-[]->(e:expression) RETURN e'
    ):
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
    assert node_type in list_of_valid.node_types
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
def add_derivation(
    tx,
    derivation_id: str,
    now_str: str,
    derivation_name_latex: str,
    derivation_abstract_latex: str,
    derivation_reference_latex: str,
    author_name_latex: str,
) -> None:
    """
    Create a new derivation node
    """

    # print(
    #     derivation_id,
    #     now_str,
    #     derivation_name_latex,
    #     derivation_abstract_latex,
    #     author_name_latex,
    # )

    result = tx.run(
        "merge (:derivation "
        '{name_latex:"' + derivation_name_latex + '",'
        ' abstract_latex:"' + derivation_abstract_latex + '",'
        ' created_datetime:"' + now_str + '",'
        ' reference_latex:"' + derivation_reference_latex + '",'
        ' author_name_latex:"' + author_name_latex + '",'
        ' id:"' + derivation_id + '"})'
    )

    return


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
):
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

    result = tx.run(
        "merge (:inference_rule "
        '{name_latex:"' + inference_rule_name + '", '
        ' latex:"' + inference_rule_latex + '", '
        ' created_datetime:"' + now_str + '",'
        ' author_name_latex:"' + author_name_latex + '", '
        ' id:"' + inference_rule_id + '", '
        " number_of_inputs:" + str(number_of_inputs) + ", "
        " number_of_feeds:" + str(number_of_feeds) + ", "
        " number_of_outputs:" + str(number_of_outputs) + "})"
    )

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
    CREATE (s)-[new_rel:HAS_INPUT]->(new_e)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_e.id AS input_id, new_rel.sequence_index AS sequence_index
    """

    result = tx.run(query, params)

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
    CREATE (s)-[new_rel:HAS_FEED]->(new_f)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_f.id AS feed_id, new_rel.sequence_index AS sequence_index
    """

    result = tx.run(query, params)

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
    CREATE (s)-[new_rel:HAS_OUTPUT]->(new_e)
    SET new_rel.sequence_index = saved_index
    RETURN s.id AS step_id, new_e.id AS output_id, new_rel.sequence_index AS sequence_index
    """

    result = tx.run(query, params)

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

    result = tx.run(query, params)

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
) -> None:
    """
    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify
    """

    result = tx.run(
        'MERGE (e:expression {id:"' + str(expression_id) + '"})'
        'SET e = {id: "' + str(expression_id) + '",'
        'name_latex: "' + str(expression_name_latex) + '",'
        'description_latex: "' + str(expression_description_latex) + '",'
        'reference_latex: "' + str(expression_reference_latex) + '",'
        'author_name_latex:"' + author_name_latex + '",'
        'latex_lhs: "' + str(expression_latex_lhs) + '",'
        'latex_relation: "' + str(expression_latex_relation) + '",'
        'latex_rhs: "' + str(expression_latex_rhs) + '",'
        'latex_condition: "' + str(expression_latex_condition) + '"}'
    )

    return


@trace_execution
def edit_node_property(
    tx, node_type: str, node_id: str, property_key: str, property_value
) -> None:
    """
    property_value can be either str or int

    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify
    """

    # print(
    #     "node_type=",
    #     node_type,
    #     ", node_id=",
    #     node_id,
    #     ",property_key=",
    #     property_key,
    #     ", property_value=",
    #     property_value,
    # )
    assert node_type in list_of_valid.node_types

    # https://neo4j.com/docs/getting-started/cypher-intro/updating/

    # https://stackoverflow.com/a/15019884/1164295 says "bool is a subclass of int."
    if isinstance(property_value, int):
        result = tx.run(
            "MERGE (n:" + str(node_type) + ' {id:"' + str(node_id) + '"})'
            "SET n." + str(property_key) + " = " + str(property_value)
        )
    elif isinstance(property_value, str):  # string needs quotes
        result = tx.run(
            "MERGE (n:" + str(node_type) + ' {id:"' + str(node_id) + '"})'
            "SET n." + str(property_key) + ' = "' + str(property_value) + '"'
        )

    return


@trace_execution
def edit_derivation_metadata(
    tx,
    derivation_id: str,
    derivation_name_latex: str,
    derivation_reference_latex: str,
    abstract_latex: str,
    author_name_latex: str,
) -> None:
    """
    TODO: deprecate this in favor of modify node properties

    >>> edit_derivation_metadata()
    """

    result = tx.run(
        'MERGE (d:derivation {id:"' + str(derivation_id) + '"})'
        'SET d = {id: "' + str(derivation_id) + '",'
        'name_latex: "' + str(derivation_name_latex) + '",'
        'reference_latex: "' + str(derivation_reference_latex) + '",'
        'author_name_latex:"' + author_name_latex + '",'
        'abstract_latex: "' + str(abstract_latex) + '"}'
    )
    #'SET d.derivation_name_latex = "'+ str(derivation_name_latex) +'", '
    #'SET d.abstract_latex = "'+ str(abstract_latex) +'"})'

    return


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
    assert node_type in list_of_valid.node_types

    result = tx.run(
        "MATCH (d:" + node_type + ' {id:"' + node_id + '"}) DETACH DELETE d'
    )
    logger.info("result.data=" + str(result.data()))

    return


@trace_execution
def disconnect_symbol_from_feed(tx, symbol_id: str, feed_id: str) -> None:
    """
    called by "edit feed"

    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    """

    result = tx.run(
        "MATCH (e:feed)-[r:IS_COMPRISED_OF]->(s)"
        + 'WHERE e.id="'
        + str(feed_id)
        + '" AND s.id="'
        + str(symbol_id)
        + '"  DELETE r'
    )
    logger.info("result.data=" + str(result.data()))

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

    # UNSAFE:
    # result = tx.run(
    # "MATCH (n)"
    # "WHERE n."+property_key+" = '"+property_value+"'"
    # "RETURN DISTINCT labels(n) AS NodeLabel, n"
    # )

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

    # the following Cypher structure produces this warning:
    #    If a part of a query contains multiple disconnected patterns, this will build a cartesian product between all those parts. This may produce a large amount of data and slow down query processing. While occasionally intended, it may often be possible to reformulate the query that avoids the use of this cross product, perhaps by adding a relationship between the different parts or by using OPTIONAL MATCH (identifier is: (s))'
    # Gemini 3 Pro's explanation of the warning:
    #    In Cypher, when you separate nodes with a comma in a single MATCH statement like this:
    #    `MATCH (e:expression), (s:scalar)`
    #    you are telling the database to find every possible combination of expressions and scalars. This is called a Cartesian Product
    #
    # result = tx.run(
    #     "MATCH (e:"
    #     + expression_or_feed
    #     + "),(s:"
    #     + symbol_category
    #     + ") "
    #     + 'WHERE e.id="'
    #     + str(expression_or_feed_id)
    #     + '" AND s.id="'
    #     + str(symbol_id)
    #     + '" '
    #     + "MERGE (e)-[r:IS_COMPRISED_OF]->(s)"
    # )

    # To avoid triggering a Cartesian product, use
    result = tx.run(
        "MATCH (f:feed {id: '" + feed_id + "'})"
        "MATCH (s {id: '" + symbol_id + "'})"
        "MERGE (f)-[:IS_COMPRISED_OF]->(s)"
    )

    logger.info("result=" + str(result))

    return


@trace_execution
def connect_symbol_to_expression(tx, symbol_id: str, expression_id: str) -> None:
    """ """
    logger.info("symbol_id=" + symbol_id + "; expression_id=" + expression_id)

    # the following Cypher structure produces this warning:
    #    If a part of a query contains multiple disconnected patterns, this will build a cartesian product between all those parts. This may produce a large amount of data and slow down query processing. While occasionally intended, it may often be possible to reformulate the query that avoids the use of this cross product, perhaps by adding a relationship between the different parts or by using OPTIONAL MATCH (identifier is: (s))'
    # Gemini 3 Pro's explanation of the warning:
    #    In Cypher, when you separate nodes with a comma in a single MATCH statement like this:
    #    `MATCH (e:expression), (s:scalar)`
    #    you are telling the database to find every possible combination of expressions and scalars. This is called a Cartesian Product
    #
    # result = tx.run(
    #     "MATCH (e:"
    #     + expression_or_feed
    #     + "),(s:"
    #     + symbol_category
    #     + ") "
    #     + 'WHERE e.id="'
    #     + str(expression_or_feed_id)
    #     + '" AND s.id="'
    #     + str(symbol_id)
    #     + '" '
    #     + "MERGE (e)-[r:IS_COMPRISED_OF]->(s)"
    # )

    # To avoid triggering a Cartesian product, use
    result = tx.run(
        "MATCH (e:expression {id: '" + expression_id + "'})"
        "MATCH (n {id: '" + symbol_id + "'})"
        "MERGE (e)-[r:IS_COMPRISED_OF]->(n)"
    )

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
    for result in tx.run(
        'MATCH (d:derivation {id:"'
        + derivation_id
        + '"})-[r]->(s:step) RETURN r.sequence_index'
    ):
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
    new_sequence_value: int,
    now_str: str,
    note_before_step_latex: str,
    note_after_step_latex: str,
    author_name_latex: str,
) -> None:
    """
    can't add inference rules in same query because step needs to exist first
    """

    # # https://neo4j.com/docs/api/python-driver/current/api.html#neo4j.Result
    # print("result=",result.single())

    # logger.info("insert step with id; this works")
    result = tx.run(
        'MERGE (:step {id:"' + step_id + '", '
        'author_name_latex:"' + author_name_latex + '", '
        'note_before_step_latex:"' + note_before_step_latex + '", '
        'created_datetime:"' + now_str + '", '
        'note_after_step_latex:"' + note_after_step_latex + '"})'
    )
    # print(result.data()) # this just shows "[]"

    logger.info("step with edge " + derivation_id)
    result = tx.run(
        "MATCH (a:derivation),(b:step) "
        'WHERE a.id="' + str(derivation_id) + '" AND b.id="' + str(step_id) + '" '
        "MERGE (a)-[r:HAS_STEP {sequence_index: "
        + str(new_sequence_value)
        + "}]->(b) RETURN r"
    )

    logger.info("inference_rule_id " + inference_rule_id)
    result = tx.run(
        "MATCH (a:step),(b:inference_rule) "
        'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(inference_rule_id) + '"'
        "MERGE (a)-[:HAS_INFERENCE_RULE]->(b)"
    )
    # print(result.data()) # this just shows "[]"

    return


@trace_execution
def connect_expressions_to_step(
    tx,
    step_id: str,
    now_str: str,
    list_of_input_expression_IDs: list,
    list_of_feed_expression_IDs: list,
    list_of_output_expression_IDs: list,
    author_name_latex: str,
) -> None:
    """
    adding expressions to step can only be done once step exists
    """

    assert (
        (len(list_of_input_expression_IDs) > 0)
        or (len(list_of_feed_expression_IDs) > 0)
        or (len(list_of_output_expression_IDs) > 0)
    )

    logger.info("list_of_input_expression_IDs" + str(list_of_input_expression_IDs))
    logger.info("list_of_feed_expression_IDs" + str(list_of_feed_expression_IDs))
    logger.info("list_of_output_expression_IDs" + str(list_of_output_expression_IDs))

    # input expressions
    for input_index, input_id in enumerate(list_of_input_expression_IDs):
        logger.info("input_id=" + input_id + "; input_index=" + str(input_index))
        logger.info("step_id=" + step_id)
        result = tx.run(
            "MATCH (a:step),(b:expression) "
            'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(input_id) + '" '
            'MERGE (a)-[:HAS_INPUT {sequence_index: "' + str(input_index) + '"}]->(b)'
        )
        # print(result.data()) # this just shows "[]"

    # feed expressions
    for feed_index, feed_id in enumerate(list_of_feed_expression_IDs):
        logger.info("feed_id=" + feed_id + "; feed_index=" + str(feed_index))
        result = tx.run(
            "MATCH (a:step),(b:feed) "
            'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(feed_id) + '" '
            'MERGE (a)-[:HAS_FEED {sequence_index: "' + str(feed_index) + '"}]->(b)'
        )
        # print(result.data()) # this just shows "[]"

    # output expressions
    for output_index, output_id in enumerate(list_of_output_expression_IDs):
        logger.info("output_id=" + output_id + "; output_index=" + str(output_index))
        result = tx.run(
            "MATCH (a:step),(b:expression) "
            'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(output_id) + '" '
            'MERGE (a)-[:HAS_OUTPUT {sequence_index: "' + str(output_index) + '"}]->(b)'
        )
        # print(result.data()) # this just shows "[]"

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
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database

    `add_expression` doesn't have `sympy_lhs`, `sympy_rhs`, `lean` because those are added in a separate action

    """

    # result = tx.run(
    #     "MERGE (:expression "
    #     '{name_latex:"' + str(expression_name_latex) + '", '
    #     ' latex_lhs:"' + str(expression_latex_lhs) + '", '
    #     ' latex_relation:"' + str(expression_latex_relation) + '", '
    #     ' latex_rhs:"' + str(expression_latex_rhs) + '", '
    #     ' latex_condition: "' + str(expression_latex_condition) + '", '
    #     ' created_datetime:"' + now_str + '",'
    #     ' description_latex:"' + str(expression_description_latex) + '", '
    #     ' reference_latex:"' + str(expression_reference_latex) + '", '
    #     ' author_name_latex:"' + str(author_name_latex) + '", '
    #     ' id:"' + str(expression_id) + '"})'
    # )

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
        MERGE (e:expression {id: $id})
        ON CREATE SET 
            e.created_datetime = $created,
            e.name_latex = $name,
            e.latex_lhs = $lhs,
            e.latex_relation = $relation,
            e.latex_rhs = $rhs,
            e.latex_condition = $condition,
            e.description_latex = $desc,
            e.reference_latex = $ref,
            e.author_name_latex = $author
        ON MATCH SET 
            e.name_latex = $name,
            e.latex_lhs = $lhs,
            e.latex_relation = $relation,
            e.latex_rhs = $rhs,
            e.latex_condition = $condition,
            e.description_latex = $desc,
            e.reference_latex = $ref,
            e.author_name_latex = $author
    """
    tx.run(query, params)

    return


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

    # result = tx.run(
    #     "merge (:feed "
    #     '{latex:"' + str(feed_latex) + '", '
    #     ' author_name_latex:"' + str(author_name_latex) + '", '
    #     ' created_datetime:"' + now_str + '",'
    #     ' sympy:"' + str(feed_sympy) + '", '
    #     ' lean:"' + str(feed_lean) + '", '
    #     ' id:"' + str(feed_id) + '"})'
    # )

    params = {
        "id": str(feed_id),
        "latex": str(feed_latex),
        "author": str(author_name_latex),
        "created": now_str,
    }

    query = """
        MERGE (f:feed {id: $id})
        ON CREATE SET 
            f.created_datetime = $created,
            f.latex = $latex,
            f.author_name_latex = $author
        ON MATCH SET 
            f.latex = $latex,
            f.author_name_latex = $author
    """

    result = tx.run(query, params)

    return


@trace_execution
def add_quantum_operator_symbol(
    tx: Transaction,
    symbol_id: str,
    symbol_name: str,
    symbol_latex: str,
    symbol_description: str,
    symbol_requires_arguments: bool,
    symbol_reference: str,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database

    """

    # result = tx.run(
    #     "merge (:quantum_operator "
    #     '{name_latex:"' + str(symbol_name) + '", '
    #     ' latex:"' + str(symbol_latex) + '", '
    #     ' description_latex:"' + str(symbol_description) + '", '
    #     ' created_datetime:"' + now_str + '",'
    #     ' author_name_latex:"' + str(author_name_latex) + '", '
    #     " requires_arguments:" + str(symbol_requires_arguments) + ", "
    #     ' reference_latex:"' + str(symbol_reference) + '", '
    #     ' id:"' + str(symbol_id) + '"})'
    # )

    params = {
        "id": str(symbol_id),
        "name": str(symbol_name),
        "latex": str(symbol_latex),
        "desc": str(symbol_description),
        "created": now_str,
        "author": str(author_name_latex),
        "req_args": symbol_requires_arguments,
        "ref": str(symbol_reference),
    }

    query = """
        MERGE (qo:quantum_operator {id: $id})
        ON CREATE SET 
            qo.created_datetime = $created,
            qo.name_latex = $name,
            qo.latex = $latex,
            qo.description_latex = $desc,
            qo.author_name_latex = $author,
            qo.requires_arguments = $req_args,
            qo.reference_latex = $ref
        ON MATCH SET 
            qo.name_latex = $name,
            qo.latex = $latex,
            qo.description_latex = $desc,
            qo.author_name_latex = $author,
            qo.requires_arguments = $req_args,
            qo.reference_latex = $ref
            // Note: created_datetime is NOT updated here
    """
    tx.run(query, params)

    return


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

    str_to_add = ""
    for property_key, property_value in dict_of_units.items():
        str_to_add += property_key + ':"' + str(property_value) + '", '

    logger.info("neo4j_query/add_constant_value_with_units: str_to_add=" + str_to_add)

    # create new node for value
    result = tx.run(
        "merge (:value_with_units "
        "{number_decimal:" + str(number_decimal) + ", "
        " number_power: " + str(number_power) + ", "
        ' created_datetime:"' + now_str + '",'
        ' id:"'
        + str(value_with_units_id)
        + '", '
        + str_to_add
        + ' author_name_latex:"'
        + str(author_name_latex)
        + '"})'
    )

    # TODO, pointed out by Gemini 3 Pro on 2026-02-03:
    # In a parameterized query, you cannot inject raw string fragments for property names.
    # You must add the specific values (e.g., unit information) directly into the params dictionary and the SET clauses.

    # params = {
    #     "id": str(value_with_units_id),
    #     "num_dec": number_decimal,
    #     "num_pow": number_power,
    #     "created": now_str,
    #     "author": str(author_name_latex)
    #     # You must extract the values from 'str_to_add' and put them here.
    #     # Example: "unit": str(unit_variable)
    # }
    # query = """
    #     MERGE (v:value_with_units {id: $id})
    #     ON CREATE SET
    #         v.created_datetime = $created,
    #         v.number_decimal = $num_dec,
    #         v.number_power = $num_pow,
    #         v.author_name_latex = $author
    #         // Add specific properties from str_to_add here
    #         // Example: v.unit_latex = $unit
    #     ON MATCH SET
    #         v.number_decimal = $num_dec,
    #         v.number_power = $num_pow,
    #         v.author_name_latex = $author
    #         // Add specific properties from str_to_add here
    #         // Example: v.unit_latex = $unit
    #         // Note: created_datetime is NOT updated here
    # """
    # tx.run(query, params)

    # create edge between scalar and value
    result = tx.run(
        "MATCH (s:scalar),(v:value_with_units) "
        'WHERE s.id="'
        + str(scalar_id)
        + '" AND v.id="'
        + str(value_with_units_id)
        + '" '
        "MERGE (s)-[:HAS_VALUE]->(v)"
    )

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

    # result = tx.run(
    #     "merge (:symbol:scalar "
    #     '{name_latex:"' + str(symbol_name) + '", '
    #     ' latex:"' + str(symbol_latex) + '", '
    #     ' description_latex:"' + str(symbol_description) + '", '
    #     ' reference_latex:"' + str(symbol_reference) + '",'
    #     ' scope:"' + str(symbol_scope) + '",'
    #     ' variable_or_constant:"' + str(symbol_variable_or_constant) + '",'
    #     ' domain:"' + str(symbol_domain) + '",'
    #     " dimension_length: " + str(dimension_length) + ", "
    #     " dimension_time: " + str(dimension_time) + ", "
    #     " dimension_mass: " + str(dimension_mass) + ", "
    #     " dimension_temperature: " + str(dimension_temperature) + ", "
    #     " dimension_electric_charge: " + str(dimension_electric_charge) + ", "
    #     " dimension_amount_of_substance: " + str(dimension_amount_of_substance) + ", "
    #     " dimension_luminous_intensity: " + str(dimension_luminous_intensity) + ", "
    #     ' created_datetime:"' + now_str + '",'
    #     ' author_name_latex:"' + str(author_name_latex) + '", '
    #     ' id:"' + str(symbol_id) + '"})'
    # )

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
        MERGE (s:symbol:scalar {id: $id})
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
        # result = tx.run(
        #     "merge (:symbol:vector "
        #     '{name_latex:"' + str(symbol_name) + '", '
        #     ' latex:"' + str(symbol_latex) + '", '
        #     ' description_latex:"' + str(symbol_description) + '", '
        #     ' reference_latex:"' + str(symbol_reference) + '", '
        #     'orientation:"' + str(symbol_orientation) + '", '
        #     " size: '" + str(symbol_size) + "',"
        #     "is_composite:" + str(symbol_is_composite) + ","
        #     ' created_datetime:"' + now_str + '",'
        #     ' author_name_latex:"' + str(author_name_latex) + '", '
        #     ' id:"' + str(symbol_id) + '"})'
        # )
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
            MERGE (s:symbol:vector {id: $id})
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
        # result = tx.run(
        #     "merge (:symbol:vector "
        #     '{name_latex:"' + str(symbol_name) + '", '
        #     ' latex:"' + str(symbol_latex) + '", '
        #     ' description_latex:"' + str(symbol_description) + '", '
        #     ' reference_latex:"' + str(symbol_reference) + '", '
        #     'orientation:"' + str(symbol_orientation) + '", '
        #     " size: '" + str(symbol_size) + "',"
        #     'number_of_entries:"' + str(symbol_number_of_entries) + '", '
        #     "is_composite:" + str(symbol_is_composite) + ","
        #     ' created_datetime:"' + now_str + '",'
        #     ' author_name_latex:"' + str(author_name_latex) + '", '
        #     ' id:"' + str(symbol_id) + '"})'
        # )
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
            MERGE (s:symbol:vector {id: $id})
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
        # result = tx.run(
        #     "merge (:symbol:matrix "
        #     '{name_latex:"' + str(symbol_name) + '", '
        #     ' latex:"' + str(symbol_latex) + '", '
        #     ' description_latex:"' + str(symbol_description) + '", '
        #     ' reference_latex:"' + str(symbol_reference) + '", '
        #     " size: '" + str(symbol_size) + "',"
        #     " is_composite:" + str(symbol_is_composite) + ","
        #     ' created_datetime:"' + now_str + '",'
        #     ' author_name_latex:"' + str(author_name_latex) + '", '
        #     ' id:"' + str(symbol_id) + '"})'
        # )
        query = """
            MERGE (m:symbol:matrix {id: $id})
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
        # result = tx.run(
        #     "merge (:matrix "
        #     '{name_latex:"' + str(symbol_name) + '", '
        #     ' latex:"' + str(symbol_latex) + '", '
        #     ' description_latex:"' + str(symbol_description) + '", '
        #     ' reference_latex:"' + str(symbol_reference) + '", '
        #     " size: '" + str(symbol_size) + "',"
        #     'number_of_rows:"' + str(symbol_number_of_rows) + '", '
        #     'number_of_columns:"' + str(symbol_number_of_columns) + '", '
        #     "is_composite:" + str(symbol_is_composite) + ","
        #     ' created_datetime:"' + now_str + '",'
        #     ' author_name_latex:"' + str(author_name_latex) + '", '
        #     ' id:"' + str(symbol_id) + '"})'
        # )
        query = """
            MERGE (m:matrix:symbol {id: $id})
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

    # BHP's (inadequate) attempt:
    # result = tx.run(
    #     "merge (:operation "
    #     '{name_latex:"' + str(operation_name) + '", '
    #     ' latex:"' + str(operation_latex) + '", '
    #     ' description_latex:"' + str(operation_description_latex) + '", '
    #     ' reference_latex:"' + str(operation_reference_latex) + '", '
    #     " argument_count:" + str(operation_argument_count) + ", "
    #     ' created_datetime:"' + now_str + '",'
    #     ' author_name_latex:"' + str(author_name_latex) + '", '
    #     ' id:"' + str(operation_id) + '"})'
    # )
    # Gemini 3 Pro's explanation of the inadequacy:
    # The error happens because your current MERGE statement is trying to
    # match a node that has all those specific properties at once.
    #
    # If any property (like the description or latex) is different from what
    # is currently in the database, MERGE tries to create a new node. However,
    # since you have a database constraint that says id must be unique,
    # the database blocks this creation.
    #
    # To fix this, you need to:
    # - MERGE only on the unique ID.
    # - SET the other properties afterwards.
    #
    # You should also stop using string concatenation (+ str(x) +) to build queries.
    # It causes syntax errors if your strings contain quotes and leaves you
    # open to code injection attacks. Use parameters instead.

    query = """
        MERGE (o:operation {id: $id})
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
        MERGE (o:relation {id: $id})
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
    User-submitted Cypher query for Neo4j database

    Read-only for Neo4j database
    """

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
