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

import neo4j  # needed for exception handling

from neo4j import Record, Transaction
import random  # for trace IDs
from typing import Dict, List, Any, Optional

import time

import list_of_valid

import logging

logger = logging.getLogger(__name__)


def get_list_IDs(tx: Transaction, node_type: str) -> List[str]:
    """
    for a specific node type (e.g., derivation XOR step XOR symbol, etc)
    return a list of all PDG IDs for the nodes

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info("node_type=" + str(node_type))
    assert node_type in list_of_valid.node_types

    list_of_IDs = []  # type: List[str]
    for result in tx.run("MATCH (n:" + node_type + ") RETURN n.id"):
        # print(result.data())
        list_of_IDs.append(result.data()["n.id"])

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_IDs


def apoc_metdata_schema(tx: Transaction):
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.meta/apoc.meta.stats/
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    result = tx.run("CALL apoc.meta.stats()")

    logger.info("[TRACE] end " + str(trace_id))
    return result.single()


def apoc_export_csv(tx: Transaction, output_filename: str) -> dict:
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.export/
    https://neo4j.com/docs/apoc/current/export/csv/
    https://neo4j.com/docs/apoc/current/overview/apoc.export/apoc.export.csv.all/
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    # for result in tx.run(
    #     "CALL apoc.export.csv.all('" + output_filename + "',{useTypes:true})"
    # ):
    #     pass
    # logger.info("[TRACE] end " + str(trace_id))
    # return result
    query = "CALL apoc.export.csv.all($file_name, {useTypes: true})"

    result = tx.run(query, file_name=output_filename)

    # APOC export procedures return exactly one record with statistics
    record = result.single()

    logger.info("[TRACE] end " + str(trace_id))
    # Return as a standard Python dictionary (or an empty dict if no record)
    return record.data() if record else {}


def apoc_export_graphml(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/docs/apoc/current/overview/apoc.export/
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    for result in tx.run(
        "CALL apoc.export.graphml.all('" + output_filename + "',{useTypes:true})"
    ):
        pass
    logger.info("[TRACE] end " + str(trace_id))
    return result


def apoc_export_json(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.json.all/

    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    Default export data structure is 'JSON_LINES' (not JSON)

    >>> apoc_export_json(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    for result in tx.run(
        "CALL apoc.export.json.all('" + output_filename + "',{useTypes:true})"
    ):
        pass

    logger.info("[TRACE] end " + str(trace_id))
    return result


def apoc_export_cypher(tx: Transaction, output_filename: str):
    """
    https://neo4j.com/labs/apoc/4.4/export/cypher/


    The output file is written to disk within the neo4j container.
    For the PDG, docker-compose has a shared folder on the host accessible both Neo4j and Flask.
    The file from neo4j can then be accessed by Flask for providing to the user via the web interface.

    >>> apoc_export_cypher(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    # "cypher.all" produces 1 file with constraints
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.all/
    # TODO: possibly switch to
    # https://neo4j.com/labs/apoc/4.4/overview/apoc.export/apoc.export.cypher.query/
    # which produces separate files for relationships and nodes

    for result in tx.run(
        "CALL apoc.export.cypher.all('" + output_filename + "', {"
        # "format: 'cypher-shell'," # the output produced when using 'cypher-shell' is readable by `bin/cypher-shell --file dumping_grounds/pdg.cypher` but not the Python driver
        "format: 'plain',"
        "useOptimizations: {type: 'UNWIND_BATCH', unwindBatchSize: 20}"
        "}) "
        "YIELD file, batches, source, format, nodes, relationships, properties, time, rows, batchSize "
        "RETURN file, batches, source, format, nodes, relationships, properties, time, rows, batchSize;"
    ):
        pass

    logger.info("[TRACE] end " + str(trace_id))
    return result


def constrain_unique_id(tx) -> None:
    """
    https://neo4j.com/docs/getting-started/current/cypher-intro/schema/#cypher-intro-constraints

    >>> constrain_unique_id()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def get_derivations_that_use_expression(tx: Transaction, expression_id: str):
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info("expression_id=" + expression_id)

    result = tx.run(
        """
    MATCH (d:derivation)-[:HAS_STEP]->(s:step)-[:HAS_EXPRESSION]->(e:expression)
    WHERE e.id = $expressionID
    RETURN d
    """,
        expressionID=expression_id,
    )

    list_of_dicts = result.data()

    logger.info("list_of_dicts=" + str(list_of_dicts))

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_dicts


def get_relation_latex(tx: Transaction, relation_id: str):
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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
    logger.info("[TRACE] end " + str(trace_id))
    return relation_latex


def get_scalar_id_that_has_value_and_units_id(tx: Transaction, value_and_units_id: str):
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    result = tx.run(
        "MATCH (s:scalar)-[]->(v:value_with_units) WHERE v.id='"
        + value_and_units_id
        + "' RETURN s.id"
    )

    scalar_id = result.data()
    logger.info(" scalar_id" + scalar_id)

    logger.info("[TRACE] end " + str(trace_id))
    return scalar_id


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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (e:expression)
    WHERE e.id IN $eids
    OPTIONAL MATCH (e)-[:HAS_SYMBOL]->(s:symbol)
    RETURN e.id AS eid, collect(properties(s)) AS symbols
    """

    result = tx.run(query, eids=list_of_expression_ids)

    symbol_map = {record["eid"]: record["symbols"] for record in result}

    logger.info("[TRACE] end " + str(trace_id))
    return symbol_map


def get_symbols_for_expression(tx: Transaction, expression_id: str) -> List[dict]:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    logger.info("expression_id =" + expression_id)
    symbol_list = []  # type: List[dict]

    query = """
    MATCH (e:expression {id: $eid})-[:HAS_SYMBOL]->(s:symbol) 
    RETURN properties(s) AS props
    """
    result = tx.run(query, eid=expression_id)

    for res in result:
        logger.info("res=" + str(res))
        symbol_list.append(res)
    logger.info("[TRACE] end " + str(trace_id))
    return symbol_list


def get_symbol_IDs_in_expression(tx: Transaction, expression_id: str) -> List[str]:
    """match (s:symbol) because nodes are created with multiple labels (e.g. :symbol:scalar)"""
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    query = (
        "MATCH (e:expression)-[:HAS_SYMBOL]->(s:symbol) "
        "WHERE e.id = $id "
        "RETURN s.id"
    )
    result = tx.run(query, id=expression_id)
    logger.info("[TRACE] end " + str(trace_id))
    return [record["s.id"] for record in result]


def get_symbol_IDs_in_every_feed(tx):
    """
    `MATCH (f:feed)` selects all nodes with the label feed, regardless of whether you passed an ID list or not.
    `OPTIONAL MATCH ...` is like a "Left Outer Join" in SQL. It attempts to find the pattern (f)-[:HAS_SYMBOL]->(s:symbol).
        - If the pattern exists, s will contain the symbol node.
        - If the pattern does not exist (the feed has no symbols), f is still kept in the result, but s will be null.
    `collect(s.id)` aggregation function automatically ignores null values. Therefore, if s is null (because of the OPTIONAL MATCH), the result is an empty list [] rather than [null].
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (f:feed)
    OPTIONAL MATCH (f)-[:HAS_SYMBOL]->(s:symbol)
    RETURN f.id as feed_id, collect(s.id) as symbol_ids
    """
    result = tx.run(query)

    logger.info("[TRACE] end " + str(trace_id))
    return result


def get_symbol_IDs_in_feed(tx: Transaction, feed_id: str) -> List[str]:
    """match (s:symbol) because nodes are created with multiple labels (e.g. :symbol:scalar)"""
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    logger.info("feed_id=" + feed_id)

    query = "MATCH (f:feed)-[:HAS_SYMBOL]->(s:symbol) WHERE f.id = $id RETURN s.id"
    result = tx.run(query, id=feed_id)
    logger.info("[TRACE] end " + str(trace_id))
    return [record["s.id"] for record in result]


def get_list_of_symbol_IDs_per_category_in_expression_or_feed(
    tx, expression_or_feed: str, expression_or_feed_id: str, symbol_category: str
) -> List[str]:
    """
    an expression has one or more symbols
    This read query returns which symbol IDs are used for the provided expression ID

    this is the opposite query of `expressions_that_use_symbol`
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info("expression_or_feed=" + expression_or_feed)
    assert expression_or_feed in ["expression", "feed"]
    logger.info("symbol_category=" + symbol_category)
    assert symbol_category in list_of_valid.symbol_categories

    # symbol_list = []  # type: List[str]
    # for result in tx.run(
    #     "MATCH (e:"
    #     + expression_or_feed
    #     + ")-[:HAS_SYMBOL]->(s:"
    #     + symbol_category
    #     + ") WHERE e.id='"
    #     + expression_or_feed_id
    #     + "' RETURN s.id"
    # ):
    #     symbol_list.append(result.data()["s.id"])

    # Sanitize dynamic labels to prevent injection and handle special characters
    # Neo4j uses backticks to escape label names. Escape existing backticks by doubling them.
    safe_source_label = f"`{expression_or_feed.replace('`', '``')}`"
    safe_target_label = f"`{symbol_category.replace('`', '``')}`"

    # Construct Query using f-strings and Parameters
    # Labels cannot be parameterized, so we inject the sanitized strings.
    # Values (like IDs) MUST be parameterized ($id).
    query = (
        f"MATCH (e:{safe_source_label})-[:HAS_SYMBOL]->(s:{safe_target_label}) "
        "WHERE e.id = $id "
        "RETURN s.id"
    )

    result = tx.run(query, id=expression_or_feed_id)

    # logger.info(
    #     "expression_or_feed_id="
    #     + str(expression_or_feed_id)
    #     + "symbol_list="
    #     + str(symbol_list)
    # )

    logger.info("[TRACE] end " + str(trace_id))

    # Pythonic list comprehension (faster than .data())
    return [record["s.id"] for record in result]


def get_nodes_of_type(tx: Transaction, node_type: str) -> list:
    """
    for a specific node type (e.g., derivation XOR step XOR symbol, etc)
    return a list of all nodes

    >>> list_nodes_of_type(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    # must be one of these node types. See also 'schema.log' file
    logger.info("node type:" + node_type)

    assert node_type in list_of_valid.node_types

    node_list = []  # type: List[dict]
    for result in tx.run("MATCH (n:" + node_type + ") RETURN n"):
        # print(result.data()["n"])
        node_list.append(result.data()["n"])

    logger.info("[TRACE] end " + str(trace_id))
    return node_list


def get_count_nodes_of_type(tx: Transaction, node_type: str) -> int:
    """
    for a specific node type (e.g., derivation XOR step XOR symbol, etc)
    return a count of all nodes

    >>> count_nodes_of_type(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    # must be one of these node types. See also 'schema.log' file
    logger.info("neo4j_query/get_count_nodes_of_type:  node type:" + node_type)
    assert node_type in list_of_valid.node_types

    node_count = -1
    for result in tx.run("MATCH (n:" + node_type + ") RETURN count(n) as count"):
        logger.info(result.data()["count"])
        node_count = result.data()["count"]

    logger.info("[TRACE] end " + str(trace_id))
    return node_count


def get_expressions_for_every_operation(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (e:expression)-[:HAS_SYMBOL]->(s:operation)
    RETURN s.id AS operation_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["operation_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_expressions_for_every_relation(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (e:expression)-[:HAS_SYMBOL]->(r:relation)
    RETURN r.id AS relation_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["relation_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_expressions_for_every_symbol(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    collect the 'e' nodes into a list for every unique 's'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (e:expression)-[:HAS_SYMBOL]->(s:symbol)
    RETURN s.id AS symbol_id, collect(DISTINCT e) AS expression_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["symbol_id"]: [dict(node) for node in record["expression_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_for_every_relation(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.

    TODO: replace `HAS_SYMBOL` with `HAS_RELATION`
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:HAS_SYMBOL]->(r:relation)
    RETURN r.id AS relation_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["relation_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_for_every_operation(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.

    TODO: replace `HAS_SYMBOL` with `HAS_OPERATION`
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:HAS_SYMBOL]->(s:operation)
    RETURN s.id AS operation_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["operation_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_for_every_symbol(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 's'

    if one derivation has three different steps that all link to the same symbol,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(e:expression)-[:HAS_SYMBOL]->(s:symbol)
    RETURN s.id AS symbol_id, collect(DISTINCT d) AS derivation_nodes
    """
    result = tx.run(query)

    res_dict = {
        record["symbol_id"]: [dict(node) for node in record["derivation_nodes"]]
        for record in result
    }
    logger.info("res_dict=" + str(res_dict))

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_for_every_feed(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 'f'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_for_every_expression(tx) -> Dict[str, List[Dict[str, Any]]]:
    """
    Then collect the 'd' nodes into a list for every unique 'e'

    if one derivation has three different steps that all link to the same expression,
    the MATCH pattern finds three separate paths. `collect(d)` then grabs the derivation
    node once for every path it finds, resulting in three instances of the same node in your list.
    `collect(DISTINCT d)` collapses those into one.

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return res_dict


def get_derivations_that_use_feed(
    tx: Transaction, feed_id: str
) -> List[Dict[str, Any]]:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
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

    logger.info("[TRACE] end " + str(trace_id))

    # list comprehension convert Node objects to dicts directly
    return [dict(record["d"]) for record in result]


def get_derivations_that_use_inference_rule(
    tx: Transaction, inference_rule_id: str
) -> list:
    """
    which derivations contain this inference rule?

    >>> derivations_that_use_inference_rule()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_derivation_dicts


def get_expressions_that_use_symbol(tx, symbol_id: str) -> List[Dict[str, Any]]:
    """
    which expressions contain this symbol?

    Returns a list of expression nodes that are connected to a symbol
    of a specific category and ID.

    >>> expressions_that_use_symbol()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info("symbol_id = " + symbol_id)

    # assert symbol_category in list_of_valid.symbol_categories

    list_of_expression_dicts = []  # type: List[dict]

    # for result in tx.run(
    #     "MATCH (e:expression)-[:HAS_SYMBOL]->(s:"
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

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_expression_dicts


def get_derivations_that_use_symbol(
    tx,
    symbol_id: str,
) -> list:
    """
    which derivations contain this symbol?

    Returns a list of derivation dictionaries that contain a specific symbol.
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
        MATCH (d:derivation)-[:HAS_STEP]->(:step)-[]->(:expression)-[:HAS_SYMBOL]->(s:symbol) 
        WHERE s.id = $symbol_id 
        RETURN d
    """

    result = tx.run(query, symbol_id=symbol_id)

    list_of_derivation_dicts = [record["d"] for record in result]

    logger.info("list_of_derivation_dicts=" + str(list_of_derivation_dicts))

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_derivation_dicts


def get_values_for_constant(tx: Transaction, scalar_id: str) -> list:
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    logger.info("scalar_id=" + scalar_id)

    list_of_value_dicts = []  # type: List[dict]
    for result in tx.run(
        'MATCH (s:scalar {id:"' + scalar_id + '"})-[]->(v:value_with_units) RETURN v',
    ):
        list_of_value_dicts.append(result.data()["v"])
    logger.info("[TRACE] end " + str(trace_id))
    return list_of_value_dicts


def get_number_of_steps_per_derivation(tx) -> dict:
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


def get_list_of_step_dicts_in_this_derivation(
    tx: Transaction, derivation_id: str
) -> list:
    """
    For a given derivation, what are all the associated step IDs?

    >>> get_list_of_step_dicts_in_this_derivation(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    query = """
    MATCH (d:derivation {id: $did})-[r:HAS_STEP]->(s:step)
    RETURN s {.*, sequence_index: r.sequence_index} AS step_data
    ORDER BY r.sequence_index
    """
    result = tx.run(query, did=derivation_id)

    list_of_step_dicts = [record["step_data"] for record in result]

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_step_dicts


# def get_list_of_symbol_IDs_per_derivation(tx: Transaction, derivation_id: str):
#     """ """
#     # TODO
#     return list_of_symbol_IDs


def get_step_has_sequence_index(tx: Transaction, step_id: str) -> int:
    """
    >>> step_has_sequence_index()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    sequence_index = 0
    result = tx.run(
        'MATCH ()-[r:HAS_STEP]->(n:step {id:"' + step_id + '"}) RETURN r.sequence_index'
    )
    # print(type(result)) # don't access the `result` variable more than once, as mentioned on https://neo4j.com/docs/python-manual/current/transformers/
    sequence_index = result.data()[0]["r.sequence_index"]
    logger.info(
        "neo4j_query/step_has_sequence_index: sequence_index=" + str(sequence_index)
    )

    logger.info("[TRACE] end " + str(trace_id))
    return sequence_index


def get_inference_rule_connected_to_step_ID(tx: Transaction, step_id: str):
    """
    use case: when displaying a derivation, user wants to see inference rule per step

    >>> step_has_inference_rule()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return inf_rule_list_of_dicts[0]["m"]


def get_derivation_id_from_step_id(tx: Transaction, step_id: str) -> str:
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return derivation_id


def get_expressions_from_step_id_and_expr_type(
    tx, step_id: str, expression_type: str
) -> list:
    """
    use case: when displaying a derivation,
    for each step the user wants to know the inputs, feeds, and outputs.

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info(
        "neo4j_query/step_has_expressions: step_id="
        + step_id
        + "; expression_type="
        + expression_type
    )
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

    list_of_expression_dicts = []  # type: List[dict]

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

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_expression_dicts


def get_node_properties(tx: Transaction, node_type: str, node_id: str) -> dict:
    """
    metadata associated with the node_id

    >>> node_properties()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    logger.info("node_type=" + node_type)
    assert node_type in list_of_valid.node_types
    logger.info("node_id:" + node_id)

    result = tx.run(
        "MATCH (n: " + str(node_type) + ') WHERE n.id = "' + str(node_id) + '" RETURN n'
    )
    res_data = result.data()

    # logger.info("result.data() =" + str(res_data))

    if len(res_data) == 0:
        logger.info("result.data() is an empty list")
        return None

    # logger.info("result.data()[0] =" + str(res_data[0]))

    node_data = res_data[0]["n"]
    logger.info("node_data=" + str(node_data))

    logger.info("[TRACE]  end " + str(trace_id))
    return node_data


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

    >>> add_derivation(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


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

    >>> add_inference_rule(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def edit_step_notes(
    tx, step_id: str, note_before_step_latex: str, note_after_step_latex: str
) -> None:
    """
    TODO: deprecate this in favor of edit_node_properties
    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify

    >>> edit_step_notes()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    result = tx.run(
        'MERGE (s:step {id:"' + str(step_id) + '", '
        'SET s ={id:"' + str(step_id) + '", '
        'note_before_step_latex: "' + str(note_before_step_latex) + '", '
        'note_before_step_latex: "' + str(note_after_step_latex) + '"}'
    )

    logger.info("[TRACE]  end " + str(trace_id))
    return


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

    >>> edit_expression()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


# def edit_feed(
#     tx,
#     feed_id: str,
#     feed_latex: str,
#     feed_name: str,
#     feed_description: str,
#     now_str: str,
#     author_name_latex: str,
# ) -> None:
#     """
#     >>> edit_feed()
#     """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] start " + str(trace_id))

#     result = tx.run(
#         'MERGE (e:feed {id:"' + str(feed_id) + '"})'
#         'SET e = {id: "' + str(feed_id) + '",'
#         'name_latex: "' + str(feed_name) + '",'
#         'description_latex: "' + str(feed_description) + '",'
#         'created_datetime:"' + now_str + '",'
#         'author_name_latex:"' + author_name_latex + '",'
#         'latex: "' + str(feed_latex) + '"}'
#     )

#     logger.info("[TRACE] end " + str(trace_id))
#     return


def edit_node_property(
    tx, node_type: str, node_id: str, property_key: str, property_value
) -> None:
    """
    property_value can be either str or int

    see https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887#update-node-properties-add-new-or-modify
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

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

    logger.info("[TRACE]  end " + str(trace_id))
    return


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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))
    # TODO
    logger.info("not doing anything yet")
    logger.info("[TRACE]  end " + str(trace_id))
    return


def delete_node(tx: Transaction, node_id: str, node_type) -> None:
    """
    called by "delete derivation"

    https://stackoverflow.com/questions/57553886/neo4j-what-happens-to-a-directional-relationship-when-one-node-is-deleted

    as part of this sequence:
     1) for each step, delete step node. All associated edges disappear automatically
     2) delete derivation node

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    # must be one of these node types. See also 'schema.log' file
    logger.info("neo4j_query/delete_node: node_type=" + node_type)
    assert node_type in list_of_valid.node_types

    result = tx.run(
        "MATCH (d:" + node_type + ' {id:"' + node_id + '"}) DETACH DELETE d'
    )
    logger.info("result.data=" + str(result.data()))

    logger.info("[TRACE]  end " + str(trace_id))
    return


def disconnect_symbol_from_expression(
    tx, symbol_id: str, expression_id: str, symbol_category: str
) -> None:
    """
    called by "edit expression"

    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    logger.info(
        "neo4j_query/disconnect_symbol_from_expression: symbol_category="
        + symbol_category
    )
    assert symbol_category in list_of_valid.symbol_categories

    result = tx.run(
        "MATCH (e:expression)-[r:HAS_SYMBOL]->(s:"
        + symbol_category
        + ")"
        + 'WHERE e.id="'
        + str(expression_id)
        + '" AND s.id="'
        + str(symbol_id)
        + '"  DELETE r'
    )
    logger.info("result.data=" + str(result.data()))

    logger.info("[TRACE]  end " + str(trace_id))
    return


def disconnect_symbol_from_feed(
    tx, symbol_id: str, feed_id: str, symbol_category: str
) -> None:
    """
    called by "edit feed"

    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    logger.info("symbol_category=" + symbol_category)
    assert symbol_category in list_of_valid.symbol_categories

    result = tx.run(
        "MATCH (e:feed)-[r:HAS_SYMBOL]->(s:"
        + symbol_category
        + ")"
        + 'WHERE e.id="'
        + str(feed_id)
        + '" AND s.id="'
        + str(symbol_id)
        + '"  DELETE r'
    )
    logger.info("result.data=" + str(result.data()))

    logger.info("[TRACE]  end " + str(trace_id))
    return


def get_node_labels_from_property(
    tx: Transaction, property_key: str, property_value: str
):
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

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

    logger.info("[TRACE]  end " + str(trace_id))
    return result.data()


def add_symbol_to_expression_or_feed(
    tx,
    expression_or_feed: str,
    symbol_id: str,
    expression_or_feed_id: str,
    symbol_category: str,
) -> None:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))
    logger.info(
        "symbol_id="
        + symbol_id
        + "; expression_or_feed_id="
        + expression_or_feed_id
        + "; symbol_category="
        + symbol_category
    )

    assert expression_or_feed in ["expression", "feed"]
    assert symbol_category in list_of_valid.symbol_categories

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
    #     + "MERGE (e)-[r:HAS_SYMBOL]->(s)"
    # )

    # To avoid triggering a Cartesian product, use
    result = tx.run(
        "MATCH (e:" + expression_or_feed + " {id: '" + expression_or_feed_id + "'})"
        "MATCH (s:" + symbol_category + " {id: '" + symbol_id + "'})"
        "MERGE (e)-[r:HAS_SYMBOL]->(s)"
    )

    logger.info("[TRACE]  end " + str(trace_id))
    return


def get_list_of_sequence_values_for_derivation_id(
    tx: Transaction, derivation_id: str
) -> list:
    """
    sequence value is a positive integer for ordering the steps of a derivation
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    list_of_sequence_values = []  # type: List[int]

    logger.info("derivation_id=" + derivation_id)
    logger.info(
        'MATCH (d:derivation {id:"'
        + derivation_id
        + '"})-[r]->(s:step) RETURN r.sequence_index'
    )
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

    logger.info("[TRACE]  end " + str(trace_id))
    return list_of_sequence_values


def add_step_to_derivation(
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

    >>> add_step_to_derivation()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE]  start " + str(trace_id))

    # # https://neo4j.com/docs/api/python-driver/current/api.html#neo4j.Result
    # print("result=",result.single())

    logger.info("insert step with id; this works")
    result = tx.run(
        'MERGE (:step {id:"' + step_id + '", '
        'author_name_latex:"' + author_name_latex + '", '
        'note_before_step_latex:"' + note_before_step_latex + '", '
        'created_datetime:"' + now_str + '", '
        'note_after_step_latex:"' + note_after_step_latex + '"})'
    )
    # print(result.data()) # this just shows "[]"

    logger.info("step with edge" + derivation_id)
    result = tx.run(
        "MATCH (a:derivation),(b:step) "
        'WHERE a.id="' + str(derivation_id) + '" AND b.id="' + str(step_id) + '" '
        "MERGE (a)-[r:HAS_STEP {sequence_index: "
        + str(new_sequence_value)
        + "}]->(b) RETURN r"
    )

    logger.info("inference_rule_id" + inference_rule_id)
    result = tx.run(
        "MATCH (a:step),(b:inference_rule) "
        'WHERE a.id="' + str(step_id) + '" AND b.id="' + str(inference_rule_id) + '"'
        "MERGE (a)-[:HAS_INFERENCE_RULE]->(b)"
    )
    # print(result.data()) # this just shows "[]"

    logger.info("[TRACE]  end " + str(trace_id))
    return


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

    >>> connect_expressions_to_step()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_expression(
    tx,
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

    TODO: add Lean and SymPy.LHS and SymPy.RHS

    >>> add_expression(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_feed(
    tx,
    feed_id: str,
    feed_latex: str,
    feed_sympy: str,
    feed_lean: str,
    now_str: str,
    author_name_latex: str,
) -> None:
    """
    nothing returned by function because action is to write change to Neo4j database

    >>> add_feed(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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
        "sympy": str(feed_sympy),
        "lean": str(feed_lean),
    }

    query = """
        MERGE (f:feed {id: $id})
        ON CREATE SET 
            f.created_datetime = $created,
            f.latex = $latex,
            f.author_name_latex = $author,
            f.sympy = $sympy,
            f.lean = $lean
        ON MATCH SET 
            f.latex = $latex,
            f.author_name_latex = $author,
            f.sympy = $sympy,
            f.lean = $lean
    """

    result = tx.run(query, params)

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_quantum_operator_symbol(
    tx,
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

    >>> add_symbol(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_constant_value_with_units(
    tx,
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

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_scalar_symbol(
    tx,
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
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_vector_symbol(
    tx,
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
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_matrix_symbol(
    tx,
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
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_operation_symbol(
    tx,
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

    >>> add_operation(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def add_relation_symbol(
    tx,
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

    >>> add_operation(tx,)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

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

    logger.info("[TRACE] end " + str(trace_id))
    return


def get_list_of_all_node_IDs_and_labels(tx) -> list:
    """
    >>> list_of_all_nodes()
    """
    result = tx.run("MATCH (n) RETURN n.id, labels(n)")
    record = result.data()
    # print("neo4j_query/list_of_all_nodes: record=", record)
    return record


def delete_all_nodes_and_relationships(tx) -> None:
    """
    Delete all nodes and relationships from Neo4j database

    This requires write access to Neo4j database

    nothing returned by function because action is to write change to Neo4j database

    >>> delete_all_nodes_and_relationships(tx)
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    tx.run("MATCH (n) DETACH DELETE n")

    logger.info("[TRACE] end " + str(trace_id))
    return


def user_query(tx: Transaction, query: str) -> list:
    """
    User-submitted Cypher query for Neo4j database

    Read-only for Neo4j database

    >>> user_query(tx: Transaction, "test")
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + str(trace_id))

    list_of_results = []
    try:
        for result in tx.run(query):
            list_of_results.append(str(result))
    except neo4j.exceptions.ClientError:
        list_of_results = ["WRITE OPERATIONS NOT ALLOWED (1)"]
    except neo4j.exceptions.TransactionError:
        list_of_results = ["WRITE OPERATIONS NOT ALLOWED (2)"]

    logger.info("[TRACE] end " + str(trace_id))
    return list_of_results


# EOF
