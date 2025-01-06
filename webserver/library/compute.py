#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

"""
"""

import os
import random
import time
import neo4j_query
import list_of_valid

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List, Tuple

# ORDERING: this has to come before the functions that use this type
unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)
query_timing_result_type = NewType("query_timing_result_type", Dict[str, float])


def generate_random_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, node_type: str
) -> Tuple[unique_numeric_id_as_str, query_timing_result_type]:
    """
    create statically defined numeric IDs for nodes in the graph

    The node IDs that Neo4j assigns internally are not static,
    so they can't be used for the Physics Derivation Graph
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/generate_random_id start " + trace_id)

    assert node_type in list_of_valid.node_types

    list_of_existing_IDs = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_existing_IDs = session.read_transaction(neo4j_query.list_IDs, node_type)
        query_time_dict["compute/generate_random_id: list_IDs" + node_type] = round(
            time.time() - query_start_time, 3
        )

    found_new_ID = False
    while not found_new_ID:
        new_id = str(random.randint(1000000, 9999999))
        if new_id not in list_of_existing_IDs:
            found_new_ID = True

    print("new_id=", str(new_id))
    print("[TRACE] func: compute/generate_random_id end " + trace_id)
    return str(new_id), query_time_dict


def get_dict_of_node_type_for_every_id(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """
    >>> get_node_type_from_id()
    """
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_records = session.read_transaction(
            neo4j_query.list_of_all_node_IDs_and_labels
        )
        query_time_dict["compute/to_edit_node: list_of_all_node_IDs_and_labels"] = (
            round(time.time() - query_start_time, 3)
        )

    # [{'n.id': '8379131', 'labels(n)': ['relation']},
    #  {'n.id': '2201316', 'labels(n)': ['relation']},
    #  {'n.id': '9729306', 'labels(n)': ['relation']},
    #  {'n.id': '3354598', 'labels(n)': ['operation']},
    #  {'n.id': '3018530', 'labels(n)': ['operation']},
    #  {'n.id': '1685753', 'labels(n)': ['operation']},
    #  {'n.id': '3682453', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '9472315', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '5141110', 'labels(n)': ['value_with_units']},
    #  {'n.id': '6266889', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '8800098', 'labels(n)': ['vector', 'symbol']},
    #  {'n.id': '8047316', 'labels(n)': ['vector', 'symbol']},
    #  {'n.id': '2587054', 'labels(n)': ['vector']}, {'n.id': '7688226', 'labels(n)': ['feed']}, {'n.id': '6529449', 'labels(n)': ['feed']}, {'n.id': '6529458', 'labels(n)': ['feed']}]

    dict_of_symbol_id_and_type = {}  # type:Dict[str,str]
    for this_dict in list_of_records:
        if len(this_dict["labels(n)"]) > 1:
            for symbol_category in this_dict["labels(n)"]:
                if symbol_category != "symbol":
                    dict_of_symbol_id_and_type[this_dict["n.id"]] = symbol_category
        else:  # there's just one node label
            dict_of_symbol_id_and_type[this_dict["n.id"]] = this_dict["labels(n)"][0]

    return dict_of_symbol_id_and_type, query_time_dict


def remove_file_debris(
    list_of_paths_to_files: List[str],
    list_of_file_names: List[str],
    list_of_file_extensions: List[str],
) -> None:
    """

    Args:
        list_of_paths_to_files:
        list_of_file_names:
        list_of_file_extensions
    Returns:
        None

    Raises:

    >>> remove_file_debris(['/path/to/file/'],['filename_without_extension'], ['ext1', 'ext2'])
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/remove_file_debris start " + trace_id)

    for path_to_file in list_of_paths_to_files:
        for file_name in list_of_file_names:
            for file_ext in list_of_file_extensions:
                if os.path.isfile(path_to_file + file_name + "." + file_ext):
                    os.remove(path_to_file + file_name + "." + file_ext)
    print("[TRACE] func: compute/remove_file_debris end " + trace_id)
    return


def get_list_of_symbol_IDs_in_expression_or_feed(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_or_feed: str,
    expression_id: unique_numeric_id_as_str,
) -> Tuple[List[str], query_timing_result_type]:
    """
    >>> get_list_of_symbol_IDs_in_expression_or_feed()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: compute/get_list_of_symbol_IDs_in_expression_or_feed start "
        + trace_id
    )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed = session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "operation",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed operation"
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "relation",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed relation"
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed scalar"
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "vector",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed vector"
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed matrix"
        ] = round(time.time() - query_start_time, 3)

    print(
        "[TRACE] func: compute/get_list_of_symbol_IDs_in_expression_or_feed end "
        + trace_id
    )
    return list_of_symbol_IDs_in_expression_or_feed, query_time_dict


def get_list_of_expression_dicts_that_use_symbol_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, symbol_id: str
) -> Tuple[List[dict], Dict[str, float]]:
    """
    This helper function returns all expressions for any category, unlike
    neo4j_query.get_dict_of_derivations_that_use_symbol_id_by_category
    which requires category as input

    This cannot be combined with
    get_list_of_derivations_that_use_symbol_id
    because the cypher query is different

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: compute/get_list_of_expression_dicts_that_use_symbol_id start "
        + trace_id
    )

    list_of_expression_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category operation"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category scalar"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "vector",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category vector"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category matrix"
        ] = round(time.time() - query_start_time, 3)

    print(
        "[TRACE] func: compute/get_list_of_expression_dicts_that_use_symbol_id end "
        + trace_id
    )
    return list_of_expression_dicts, query_time_dict


def get_list_of_derivation_dicts_that_use_symbol_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, symbol_id: str
):
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: compute/get_list_of_derivation_dicts_that_use_symbol_id start "
        + trace_id
    )

    list_of_derivation_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol operation"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol scalar"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "vector",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol vector"
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivation_dicts_that_use_symbol matrix"
        ] = round(time.time() - query_start_time, 3)

    print(
        "[TRACE] func: compute/get_list_of_derivation_dicts_that_use_symbol_id end "
        + trace_id
    )
    return list_of_derivation_dicts, query_time_dict


# def get_list_of_derivation_dicts_that_use_feed_id(
#     graphDB_Driver, query_time_dict: dict, feed_id:str
# ):
#     """ """
#     trace_id = str(random.randint(1000000, 9999999))
#     print("[TRACE] func: compute/ start " + trace_id)

#     list_of_derivation_dicts_that_use_feed = {}  # type: Dict[str, list]

#     return dict_of_derivation_dicts_that_use_feed, query_time_dict


def get_list_of_all_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> list:
    """
    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:operation OR n:relation OR n:scalar OR n:vector OR n:matrix
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/get_list_of_all_symbol_dicts start " + trace_id)

    list_of_symbol_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "operation"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            round(time.time() - query_start_time, 3)
        )
    for this_symbol_dict in list_of_operation_symbol_dicts:
        this_symbol_dict["symbol_category"] = "operation"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            round(time.time() - query_start_time, 3)
        )
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "vector"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            round(time.time() - query_start_time, 3)
        )
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "matrix"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            round(time.time() - query_start_time, 3)
        )
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_symbol_dicts.append(this_symbol_dict)

    print("[TRACE] func: compute/get_list_of_all_symbol_dicts end " + trace_id)
    return list_of_symbol_dicts, query_time_dict


def get_list_of_all_nonoperation_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> list:
    """
    use for "new feed" when promoting existing symbols to feed

    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:scalar OR n:vector OR n:matrix
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>> get_list_of_all_nonoperation_symbol_dicts
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: compute/get_list_of_all_nonoperation_symbol_dicts start "
        + trace_id
    )

    list_of_nonoperation_symbol_dicts = []  # type: List[dict]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "vector"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "matrix"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    print(
        "[TRACE] func: compute/get_list_of_all_nonoperation_symbol_dicts end "
        + trace_id
    )
    return list_of_nonoperation_symbol_dicts, query_time_dict


def get_dict_of_all_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """
    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:symbol
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/get_dict_of_all_symbol_dicts start " + trace_id)

    dict_of_all_symbol_dicts = {}  # type: Dict[str,dict]

    dict_of_all_operation_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "operation"
    )
    for ke, val in dict_of_all_operation_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_scalar_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "scalar"
    )
    for ke, val in dict_of_all_scalar_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_vector_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "vector"
    )
    for ke, val in dict_of_all_vector_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_matrix_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "matrix"
    )
    for ke, val in dict_of_all_matrix_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    return dict_of_all_symbol_dicts, query_time_dict


def get_dict_of_node_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type, node_type: str
) -> Tuple[dict, query_timing_result_type]:
    """
    >>> get_dict_of_node_dicts()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/get_dict_of_node_dicts start " + trace_id)

    assert node_type in [
        "derivation",
        "inference_rule",
        "operation",
        "feed",
        "scalar",
        "vector",
        "matrix",
        "step",
        "expression",
    ]
    # print("compute/get_dict_of_node_dicts: node type=", node_type)

    list_of_all_node_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_all_node_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, node_type
        )
        query_time_dict["get_dict_of_node_dicts, list_nodes_of_type"] = round(
            time.time() - query_start_time, 3
        )
    # print("list_of_all_node_dicts=", list_of_all_node_dicts)

    dict_of_all_node_dicts = {}
    for this_node_dict in list_of_all_node_dicts:
        this_node_dict["node_type"] = node_type
        dict_of_all_node_dicts[this_node_dict["id"]] = this_node_dict
    # print("dict_of_all_node_dicts=", dict_of_all_node_dicts)

    print("[TRACE] func: compute/get_dict_of_node_dicts end " + trace_id)
    return dict_of_all_node_dicts, query_time_dict


def get_dict_of_derivations_used_per_inference_rule(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    list_of_inference_rule_dicts: list,
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: compute/get_dict_of_derivations_used_per_inference_rule start "
        + trace_id
    )

    dict_of_derivations_used_per_inference_rule = {}
    for this_inference_rule_dict in list_of_inference_rule_dicts:
        list_of_derivations_that_use_this_inference_rule_id = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivations_that_use_this_inference_rule_id = (
                session.read_transaction(
                    neo4j_query.derivations_that_use_inference_rule,
                    this_inference_rule_dict["id"],
                )
            )
            query_time_dict[
                "compute/get_dict_of_derivations_used_per_inference_rule: derivations_that_use_inference_rule"
            ] = round(time.time() - query_start_time, 3)
        print(
            "list_of_derivations_that_use_this_inference_rule_id=",
            list_of_derivations_that_use_this_inference_rule_id,
        )
        # can't use set on a list of dicts
        # list_of_derivations_that_use_this_inference_rule_id = list(
        #    set(list_of_derivations_that_use_this_inference_rule_id)
        # )
        new_temp_dict = {}
        for this_derivation_dict in list_of_derivations_that_use_this_inference_rule_id:
            new_temp_dict[this_derivation_dict["id"]] = this_derivation_dict

        list_of_derivations_that_use_this_inference_rule_id = []
        for derivation_id, derivation_dict in new_temp_dict.items():
            list_of_derivations_that_use_this_inference_rule_id.append(derivation_dict)

        dict_of_derivations_used_per_inference_rule[this_inference_rule_dict["id"]] = (
            list_of_derivations_that_use_this_inference_rule_id
        )
    return dict_of_derivations_used_per_inference_rule, query_time_dict


# def symbols_per_expression_or_feed(
#     graphDB_Driver,
#     query_time_dict: dict,
#     expression_or_feed: str,
#     list_of_expression_or_feed_dicts: list,
# ):
#     """
#     >>>
#     """
#     trace_id = str(random.randint(1000000, 9999999))
#     print("[TRACE] func: app/symbols_per_expression start " + trace_id)

#     symbols_per_expression_or_feed = {}  # type: Dict[str, list]
#     for this_expression_or_feed_dict in list_of_expression_or_feed_dicts:
#         list_of_symbol_IDs_in_expression_or_feed = []

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "operation",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "scalar",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "vector",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "matrix",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )
#         symbols_per_expression_or_feed[this_expression_or_feed_dict["id"]] = (
#             list_of_symbol_IDs_in_expression_or_feed
#         )

#     print("[TRACE] func: app/symbols_per_expression_or_feed end " + trace_id)
#     return symbols_per_expression_or_feed, query_time_dict


def all_steps_in_derivation(
    graphDB_Driver, derivation_id: unique_numeric_id_as_str, query_time_dict: dict
):
    """
    >>> all_steps_in_derivation()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/all_steps_in_derivation start " + trace_id)

    # list all steps in this derivation
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )
        query_time_dict["compute/all_steps_in_derivation: steps_in_this_derivation"] = (
            round(time.time() - query_start_time, 3)
        )
    print("list of steps for", str(derivation_id), ":", list_of_step_dicts)

    all_steps = {}
    for this_step_dict in list_of_step_dicts:
        print('this_step_dict["id"]:', this_step_dict["id"])
        (
            inference_rule_dict,
            list_of_input_dicts,
            list_of_feed_dicts,
            list_of_output_dicts,
            query_time_dict,
        ) = input_feed_output_infrule_for_step(
            graphDB_Driver, query_time_dict, this_step_dict["id"]
        )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            sequence_index = session.read_transaction(
                neo4j_query.step_has_sequence_index, this_step_dict["id"]
            )
            query_time_dict[
                "compute/all_steps_in_derivation: step_has_sequence_index"
            ] = round(time.time() - query_start_time, 3)
        # print("sequence_index=", sequence_index)

        all_steps[this_step_dict["id"]] = {
            "sequence index": sequence_index,
            "inference rule dict": inference_rule_dict,
            "list of input dicts": list_of_input_dicts,
            "list of feed dicts": list_of_feed_dicts,
            "list of output dicts": list_of_output_dicts,
        }
    print("[TRACE] func: compute/all_steps_in_derivation end " + trace_id)
    return all_steps, query_time_dict


def input_feed_output_infrule_for_step(
    graphDB_Driver, query_time_dict: query_timing_result_type, step_id: str
):
    """
    >>> input_feed_output_infrule_for_step()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/input_feed_output_infrule_for_step start " + trace_id)

    inference_rule_dict = {}
    list_of_input_dicts = []
    list_of_feed_dicts = []
    list_of_output_dicts = []

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        inference_rule_dict = session.read_transaction(
            neo4j_query.step_has_inference_rule, step_id
        )
        query_time_dict["compute/all_steps_in_derivation: step_has_inference_rule"] = (
            round(time.time() - query_start_time, 3)
        )
    # print("inference_rule_dict=", inference_rule_dict)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_input_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_INPUT",
        )
        query_time_dict[
            "compute/all_steps_in_derivation: step_id_has_expressions, HAS_INPUT"
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_input_dicts=", list_of_input_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_feed_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_FEED",
        )
        query_time_dict[
            "compute/all_steps_in_derivation: step_id_has_expressions, HAS_FEED"
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_feed_dicts=", list_of_feed_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_output_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_OUTPUT",
        )
        query_time_dict[
            "compute/all_steps_in_derivation: step_id_has_expressions, HAS_OUTPUT"
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_output_dicts=", list_of_output_dicts)

    print("[TRACE] func: compute/input_feed_output_infrule_for_step end " + trace_id)
    return (
        inference_rule_dict,
        list_of_input_dicts,
        list_of_feed_dicts,
        list_of_output_dicts,
        query_time_dict,
    )


def remove_latex_presention_markings(latex_str: str) -> str:
    """
    clean the latex string

    based on the struggle with spacing,
    https://github.com/sympy/sympy/issues/19075#issuecomment-633643570
    BHP realized removing the presentation-related aspects would make the task for Sympy easier

    >>> remove_latex_presention_markings('a\\ b = c')
    'a b = c'
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/remove_latex_presention_markings start " + trace_id)

    print("latex to be cleaned: " + latex_str)

    if "\\left." in latex_str:
        latex_str = latex_str.replace("\\left.", "")
    if "\\right." in latex_str:
        latex_str = latex_str.replace("\\right.", "")
    if "\\left|" in latex_str:
        latex_str = latex_str.replace("\\left|", "|")
    if "\\right|" in latex_str:
        latex_str = latex_str.replace("\\right|", "|")
    if "\\left(" in latex_str:
        latex_str = latex_str.replace("\\left(", "(")
    if "\\right)" in latex_str:
        latex_str = latex_str.replace("\\right)", ")")
    if "\\," in latex_str:
        # logger.debug("found space \\,")
        latex_str = latex_str.replace("\\,", " ")  # thinspace
    if "\\ " in latex_str:
        # logger.debug("found space \\ ")
        latex_str = latex_str.replace("\\ ", " ")
    if "\\;" in latex_str:
        # logger.debug("found space \\;")
        latex_str = latex_str.replace("\\;", " ")  # thick space
    if "\\:" in latex_str:
        # logger.debug("found space \\:")
        latex_str = latex_str.replace("\\:", " ")  # medium space
    if "\\!" in latex_str:
        # logger.debug("found space \\!")
        latex_str = latex_str.replace("\\!", " ")  # negative space
    if "\\;" in latex_str:
        # logger.debug("found space \\ ")
        latex_str = latex_str.replace("\\ ", " ")
    if "\\quad" in latex_str:
        # logger.debug("found space \\quad")
        latex_str = latex_str.replace("\\quad", " ")
    if "\\qquad" in latex_str:
        # logger.debug("found space \\qquad")
        latex_str = latex_str.replace("\\qquad", " ")

    print("latex after cleaning: " + latex_str)

    print("[TRACE] func: compute/remove_latex_presention_markings end " + trace_id)
    return latex_str


# EOF
