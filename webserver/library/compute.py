#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

"""
"""

import random
import time
import neo4j_query

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List

# ORDERING: this has to come before the functions that use this type
unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)


def generate_random_id(list_of_current_IDs: list) -> unique_numeric_id_as_str:
    """
    create statically defined numeric IDs for nodes in the graph

    The node IDs that Neo4j assigns internally are not static,
    so they can't be used for the Physics Derivation Graph
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: compute/generate_random_id start " + trace_id)

    found_new_ID = False
    while not found_new_ID:
        new_id = str(random.randint(1000000, 9999999))
        if new_id not in list_of_current_IDs:
            found_new_ID = True

    print("new_id=", str(new_id))
    print("[TRACE] func: compute/generate_random_id end " + trace_id)
    return str(new_id)


def get_dict_of_expressions_that_use_symbol(
    graphDB_Driver, query_time_dict: dict, list_of_symbol_dicts: list
):
    """ """
    dict_of_expressions_that_use_symbol = {}
    for this_symbol_dict in list_of_symbol_dicts:
        list_of_expression_dicts = []  # type: List[dict]
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_expression_dicts += session.read_transaction(
                neo4j_query.expressions_that_use_symbol,
                this_symbol_dict["id"],
                "operation",
            )
            query_time_dict[
                "get_dict_of_expressions_that_use_symbol: expressions_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_expression_dicts += session.read_transaction(
                neo4j_query.expressions_that_use_symbol,
                this_symbol_dict["id"],
                "scalar",
            )
            query_time_dict[
                "get_dict_of_expressions_that_use_symbol: expressions_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_expression_dicts += session.read_transaction(
                neo4j_query.expressions_that_use_symbol,
                this_symbol_dict["id"],
                "vector",
            )
            query_time_dict[
                "get_dict_of_expressions_that_use_symbol: expressions_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_expression_dicts += session.read_transaction(
                neo4j_query.expressions_that_use_symbol,
                this_symbol_dict["id"],
                "matrix",
            )
            query_time_dict[
                "get_dict_of_expressions_that_use_symbol: expressions_that_use_symbol"
            ] = (time.time() - query_start_time)

        dict_of_expressions_that_use_symbol[this_symbol_dict["id"]] = (
            list_of_expression_dicts
        )
    return dict_of_expressions_that_use_symbol, query_time_dict


def get_dict_of_derivations_that_use_symbol(
    graphDB_Driver, query_time_dict: dict, list_of_symbol_dicts: list
):
    dict_of_derivations_that_use_symbol = {}
    for this_symbol_dict in list_of_symbol_dicts:
        list_of_derivation_dicts = []  # type: List[dict]
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_dicts += session.read_transaction(
                neo4j_query.derivations_that_use_symbol,
                this_symbol_dict["id"],
                "operation",
            )
            query_time_dict[
                "get_dict_of_derivations_that_use_symbol: derivations_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_dicts += session.read_transaction(
                neo4j_query.derivations_that_use_symbol,
                this_symbol_dict["id"],
                "scalar",
            )
            query_time_dict[
                "get_dict_of_derivations_that_use_symbol: derivations_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_dicts += session.read_transaction(
                neo4j_query.derivations_that_use_symbol,
                this_symbol_dict["id"],
                "vector",
            )
            query_time_dict[
                "get_dict_of_derivations_that_use_symbol: derivations_that_use_symbol"
            ] = (time.time() - query_start_time)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_dicts += session.read_transaction(
                neo4j_query.derivations_that_use_symbol,
                this_symbol_dict["id"],
                "matrix",
            )
            query_time_dict[
                "get_dict_of_derivations_that_use_symbol: derivations_that_use_symbol"
            ] = (time.time() - query_start_time)

        dict_of_derivations_that_use_symbol[this_symbol_dict["id"]] = (
            list_of_derivation_dicts
        )
    return dict_of_derivations_that_use_symbol, query_time_dict


def get_dict_of_derivations_that_use_feed(
    graphDB_Driver, query_time_dict: dict, list_of_feed_dicts: list
):
    """ """
    dict_of_derivations_that_use_feed = {}  # type: Dict[str, list]
    for this_feed_dict in list_of_feed_dicts:
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_dicts = session.read_transaction(
                neo4j_query.derivations_that_use_feed, this_feed_dict["id"]
            )
            query_time_dict[
                "get_dict_of_derivations_that_use_feed: derivations_that_use_feed"
            ] = (time.time() - query_start_time)
        dict_of_derivations_that_use_feed[this_feed_dict["id"]] = (
            list_of_derivation_dicts
        )
    return dict_of_derivations_that_use_feed, query_time_dict


def get_list_of_all_symbol_dicts(graphDB_Driver, query_time_dict: dict) -> list:
    """
    >>>
    """
    list_of_symbol_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "operation"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            time.time() - query_start_time
        )
    for this_symbol_dict in list_of_operation_symbol_dicts:
        this_symbol_dict["symbol_category"] = "operation"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "scalar"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            time.time() - query_start_time
        )
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "vector"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            time.time() - query_start_time
        )
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "matrix"
        )
        query_time_dict["compute/get_list_of_all_symbol_dicts, list_nodes_of_type"] = (
            time.time() - query_start_time
        )
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_symbol_dicts.append(this_symbol_dict)

    return list_of_symbol_dicts, query_time_dict


def get_list_of_all_nonoperation_symbol_dicts(
    graphDB_Driver, query_time_dict: dict
) -> list:
    """
    use for "new feed" when promoting existing symbols to feed

    >>> get_list_of_all_nonoperation_symbol_dicts
    """
    list_of_nonoperation_symbol_dicts = []  # type: List[dict]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "scalar"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = (time.time() - query_start_time)
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "vector"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = (time.time() - query_start_time)
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "matrix"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
        ] = (time.time() - query_start_time)
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    return list_of_nonoperation_symbol_dicts, query_time_dict


def get_dict_of_all_symbol_dicts(graphDB_Driver, query_time_dict: dict) -> dict:
    """
    >>>
    """
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


def get_dict_of_node_dicts(graphDB_Driver, query_time_dict: dict, node_type: str):
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
    print("              node type:", node_type)

    list_of_all_node_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_all_node_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, node_type
        )
        query_time_dict["get_dict_of_node_dicts, list_nodes_of_type"] = (
            time.time() - query_start_time
        )
    print("list_of_all_node_dicts=", list_of_all_node_dicts)

    dict_of_all_node_dicts = {}
    for this_node_dict in list_of_all_node_dicts:
        dict_of_all_node_dicts[this_node_dict["id"]] = this_node_dict
    print("dict_of_all_node_dicts=", dict_of_all_node_dicts)

    print("[TRACE] func: compute/get_dict_of_node_dicts end " + trace_id)
    return dict_of_all_node_dicts, query_time_dict


def get_dict_of_derivations_used_per_inference_rule(
    graphDB_Driver, list_of_inference_rule_dicts: list
) -> dict:
    """ """
    dict_of_derivations_used_per_inference_rule = {}
    for this_inference_rule_dict in list_of_inference_rule_dicts:
        list_of_derivations_that_use_this_inference_rule_id = []
        with graphDB_Driver.session() as session:
            list_of_derivations_that_use_this_inference_rule_id = (
                session.read_transaction(
                    neo4j_query.derivations_that_use_inference_rule,
                    this_inference_rule_dict["id"],
                )
            )
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
    return dict_of_derivations_used_per_inference_rule


def symbols_per_expression_or_feed(
    graphDB_Driver,
    query_time_dict: dict,
    expression_or_feed: str,
    list_of_expression_or_feed_dicts: list,
):
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/symbols_per_expression start " + trace_id)

    symbols_per_expression_or_feed = {}  # type: Dict[str, list]
    for this_expression_or_feed_dict in list_of_expression_or_feed_dicts:
        list_of_symbol_IDs_in_expression_or_feed = []

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
                neo4j_query.symbols_in_expression_or_feed,
                expression_or_feed,
                this_expression_or_feed_dict["id"],
                "operation",
            )
            query_time_dict["symbols_per_expression_or_feed"] = (
                time.time() - query_start_time
            )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
                neo4j_query.symbols_in_expression_or_feed,
                expression_or_feed,
                this_expression_or_feed_dict["id"],
                "scalar",
            )
            query_time_dict["symbols_per_expression_or_feed"] = (
                time.time() - query_start_time
            )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
                neo4j_query.symbols_in_expression_or_feed,
                expression_or_feed,
                this_expression_or_feed_dict["id"],
                "vector",
            )
            query_time_dict["symbols_per_expression_or_feed"] = (
                time.time() - query_start_time
            )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
                neo4j_query.symbols_in_expression_or_feed,
                expression_or_feed,
                this_expression_or_feed_dict["id"],
                "matrix",
            )
            query_time_dict["symbols_per_expression_or_feed"] = (
                time.time() - query_start_time
            )
        symbols_per_expression_or_feed[this_expression_or_feed_dict["id"]] = (
            list_of_symbol_IDs_in_expression_or_feed
        )

    print("[TRACE] func: app/symbols_per_expression_or_feed end " + trace_id)
    return symbols_per_expression_or_feed, query_time_dict


def all_steps_in_derivation(
    graphDB_Driver, derivation_id: unique_numeric_id_as_str, query_time_dict: dict
):
    """
    >>> all_steps_in_derivation()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/all_steps_in_derivation start " + trace_id)

    # list all steps in this derivation
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.steps_in_this_derivation, derivation_id
        )
        query_time_dict["all_steps_in_derivation: steps_in_this_derivation"] = (
            time.time() - query_start_time
        )
    print("list of steps for", str(derivation_id), ":", list_of_step_dicts)

    all_steps = {}
    for this_step_dict in list_of_step_dicts:
        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            inference_rule_dict = session.read_transaction(
                neo4j_query.step_has_inference_rule, this_step_dict["id"]
            )
            query_time_dict["all_steps_in_derivation: step_has_inference_rule"] = (
                time.time() - query_start_time
            )
        print("inference_rule_dict=", inference_rule_dict)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_input_IDs = session.read_transaction(
                neo4j_query.step_has_expressions, this_step_dict["id"], "HAS_INPUT"
            )
            query_time_dict[
                "all_steps_in_derivation: step_has_expressions, HAS_INPUT"
            ] = (time.time() - query_start_time)
        print("list_of_input_IDs=", list_of_input_IDs)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_feed_IDs = session.read_transaction(
                neo4j_query.step_has_expressions, this_step_dict["id"], "HAS_FEED"
            )
            query_time_dict[
                "all_steps_in_derivation: step_has_expressions, HAS_FEED"
            ] = (time.time() - query_start_time)
        print("list_of_feed_IDs=", list_of_feed_IDs)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_output_IDs = session.read_transaction(
                neo4j_query.step_has_expressions, this_step_dict["id"], "HAS_OUTPUT"
            )
            query_time_dict[
                "all_steps_in_derivation: step_has_expressions, HAS_OUTPUT"
            ] = (time.time() - query_start_time)
        print("list_of_output_IDs=", list_of_output_IDs)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            sequence_index = session.read_transaction(
                neo4j_query.step_has_sequence_index, this_step_dict["id"]
            )
            query_time_dict["all_steps_in_derivation: step_has_sequence_index"] = (
                time.time() - query_start_time
            )
        print("sequence_index=", sequence_index)

        all_steps[this_step_dict["id"]] = {
            "sequence index": sequence_index,
            "inference rule dict": inference_rule_dict,
            "list of input IDs": list_of_input_IDs,
            "list of feed IDs": list_of_feed_IDs,
            "list of output IDs": list_of_output_IDs,
        }
    print("[TRACE] func: app/all_steps_in_derivation end " + trace_id)
    return all_steps, query_time_dict


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
