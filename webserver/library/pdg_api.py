#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2024
# http://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
separate the API routes and functions into this file and thus make app.py smaller

http://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
"""

import time
import random
import datetime

from flask import Blueprint, flash, g, redirect, render_template, jsonify, request

import sys
from typing import NewType, Dict, List
import neo4j

import logging

logger = logging.getLogger(__name__)

import neo4j_query
import compute
from compute import query_timing_result_type

# the following creates a circular dependency since `pdg_app.py` imports this file.
from pdg_app import graphDB_Driver

# a fix that BHP hasn't enacted would be to create a new file, `initialization.py`
# which contains the creation of `graphDB_Driver`
# Then both `pdg_app.py` and `pdg_api.py` could import that common variable.
# Since this circular dependency isn't causing a problem as of 2025-01-09,
# BHP is going to leave the circular dependency in place.

# this works because app.py loads this file first

# http://flask.palletsprojects.com/en/1.1.x/tutorial/views/
bp = Blueprint("pdg_api", __name__, url_prefix="/api")


@bp.route("/v1/resources/derivation/list", methods=["GET"])
def api_list_derivations():
    """
    curl -s http://localhost:5000/api/v1/resources/derivation/list | python3 -m json.tool
    [
        {
            "abstract_latex": "my summary",
            "author_name_latex": "ben",
            "created_datetime": "2024-05-19_21-16-29-085813",
            "id": "3445848",
            "name_latex": "this is a new derivation"
        }
    ]

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] pdg_api/api_list_derivations start "
        + trace_id
        + " "
        + str(time.time())
    )
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_list_derivations: list_nodes_of_type, derivation"
        ] = (time.time() - query_start_time)

    logger.info("[TRACE] pdg_api/api_list_derivations end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/inference_rule/list", methods=["GET"])
def api_list_inference_rules():
    """
    curl -s http://localhost:5000/api/v1/resources/inference_rule/list | python3 -m json.tool
    [
        {
            "author_name_latex": "ben",
            "id": "7681529",
            "latex": "ADD _ to BOTH sides",
            "name_latex": "add x to both sides",
            "number_of_feeds": 1,
            "number_of_inputs": 1,
            "number_of_outputs": 1
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_inference_rules start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "inference_rule"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_inference_rules end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/symbol/operation/list", methods=["GET"])
def api_list_operation_symbols():
    """
    curl -s http://localhost:5000/api/v1/resources/operation/list | python3 -m json.tool
    [
        {
            "argument_count": 2,
            "author_name_latex": "ben",
            "description_latex": "",
            "id": "7052411",
            "latex": "=",
            "name_latex": "equals",
            "requires_arguments": true
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_symbols start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "operation"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/symbol/relation/list", methods=["GET"])
def api_list_relation_symbols():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/relation/list | python3 -m json.tool

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_relation_symbols start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "relation"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_relation_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/symbol/scalar/list", methods=["GET"])
def api_list_scalar_symbols():
    """
    curl -s http://localhost:5000/api/v1/resources/scalar/list | python3 -m json.tool
    [
        {
            "argument_count": 2,
            "author_name_latex": "ben",
            "description_latex": "",
            "id": "7052411",
            "latex": "=",
            "name_latex": "equals",
            "requires_arguments": true
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_symbols start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/symbol/vector/list", methods=["GET"])
def api_list_vector_symbols():
    """
    curl -s http://localhost:5000/api/v1/resources/vector/list | python3 -m json.tool
    [
        {
            "argument_count": 2,
            "author_name_latex": "ben",
            "description_latex": "",
            "id": "7052411",
            "latex": "=",
            "name_latex": "equals",
            "requires_arguments": true
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_symbols start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "vector"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/symbol/matrix/list", methods=["GET"])
def api_list_matrix_symbols():
    """
    curl -s http://localhost:5000/api/v1/resources/matrix/list | python3 -m json.tool
    [
        {
            "argument_count": 2,
            "author_name_latex": "ben",
            "description_latex": "",
            "id": "7052411",
            "latex": "=",
            "name_latex": "equals",
            "requires_arguments": true
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_symbols start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "matrix"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/expression/list", methods=["GET"])
def api_list_expressions():
    """
    curl -s http://localhost:5000/api/v1/resources/expression/list | python3 -m json.tool
    [
        {
            "author_name_latex": "ben",
            "description_latex": "",
            "id": "1852486",
            "latex": "a+b=2",
            "name_latex": ""
        },
    ]
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_list_expressions start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "expression"
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_dicts=", list_of_dicts)

    logger.info("[TRACE] pdg_api/api_list_expressions end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/derivation/create", methods=["GET"])
def api_create_derivation():
    """
    required inputs:
    - derivation name as latex
    - derivation reference as latex
    - derivation abstract as latex
    - author name


    see `pdg_app/to_add_derivation` for the web UI implementation

    curl -s http://localhost:5000/api/v1/resources/derivation/create?derivation_name_latex=hello\&derivation_reference_latex=this_is\&derivation_abstract_latex=mine


    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_create_derivation start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # TODO: reject input if derivation name is already in the database
    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_create_derivation: get_list_node_dicts_of_type derivation"
        ] = round(time.time() - query_start_time, 3)

    print("list_of_derivation_dicts=", list_of_derivation_dicts)

    derivation_name_latex = request.args.get("derivation_name_latex")
    if derivation_name_latex:
        print("derivation_name:" + str(derivation_name_latex))
    else:
        return jsonify({"ERROR": "need to provide derivation_name_latex"})

    derivation_reference_latex = request.args.get("derivation_reference_latex")
    if derivation_reference_latex:
        print("derivation_reference_latex " + str(derivation_reference_latex))
    else:
        return jsonify({"ERROR": "need to provide derivation_reference_latex"})

    derivation_abstract_latex = request.args.get("derivation_abstract_latex")
    if derivation_abstract_latex:
        print("derivation_abstract_latex " + str(derivation_abstract_latex))
    else:
        return jsonify({"ERROR": "need to provide derivation_abstract_latex"})

    author_name_latex = "ben"

    derivation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict, "derivation"
    )
    print("pdg_app/api_create_derivation: derivation_id=", derivation_id)

    # as per https://strftime.org/
    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(
            neo4j_query.add_derivation,
            derivation_id,
            now_str,
            derivation_name_latex,
            derivation_abstract_latex,
            derivation_reference_latex,
            author_name_latex,
        )
        query_time_dict["pdg_api/api_create_derivation: add_derivation"] = round(
            time.time() - query_start_time, 3
        )

    return jsonify(
        {"STATUS": "derivation " + str(derivation_name_latex) + " added successfully"}
    )


@bp.route("/v1/resources/expression/create", methods=["GET"])
def api_create_expression():
    """
    curl -s http://localhost:5000/api/v1/resources/expression/create

    user-provided dictionary is required to have latex and name

    see `to_add_expression`

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    expression_latex_lhs = request.args.get("expression_latex_lhs")
    if expression_latex_lhs:
        print("expression_latex_lhs =" + expression_latex_lhs)
    else:
        return jsonify({"ERROR": "need to provide expression_latex_lhs"})

    expression_relation = request.args.get("")
    if expression_relation:
        print("expression_relation =" + expression_relation)
    else:
        return jsonify({"ERROR": "need to provide expression_relation"})

    expression_latex_rhs = request.args.get("")
    if expression_latex_rhs:
        print("expression_latex_rhs =" + expression_latex_rhs)
    else:
        return jsonify({"ERROR": "need to provide expression_latex_rhs"})

    expression_latex_condition = request.args.get("")
    if expression_latex_condition:
        print("expression_latex_condition =" + expression_latex_condition)

    expression_name_latex = request.args.get("")
    if expression_name_latex:
        print("expression_name_latex =" + expression_name_latex)

    expression_reference_latex = request.args.get("")
    if expression_reference_latex:
        print("expression_reference_latex =" + expression_reference_latex)

    expression_description_latex = request.args.get("")
    if expression_description_latex:
        print("expression_description_latex =" + expression_description_latex)

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "expression"
        )
        query_time_dict["to_add_expression: list_nodes_of_type"] = round(
            time.time() - query_start_time, 3
        )

    return


@bp.route("/v1/resources/symbol/scalar/create", methods=["GET"])
def api_create_scalar_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/scalar/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/vector/create", methods=["GET"])
def api_create_vector_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/vector/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/matrix/create", methods=["GET"])
def api_create_matrix_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/matrix/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/operation/create", methods=["GET"])
def api_create_operation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/operation/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/relation/create", methods=["GET"])
def api_create_relation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/relation/create

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/inference_rule/create", methods=["GET"])
def api_create_inference_rule():
    """
    curl -s http://localhost:5000/api/v1/resources/inference_rule/create

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/derivation/metadata", methods=["GET"])
def api_derivation_metadata():
    """
    curl -s http://localhost:5000/api/v1/resources/derivation/metadata?derivation_id=3445848 | python3 -m json.tool
    {
        "abstract_latex": "my summary",
        "author_name_latex": "ben",
        "created_datetime": "2024-05-19_21-16-29-085813",
        "id": "3445848",
        "name_latex": "this is a new derivation"
    }

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_derivation_metadata start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    print("derivation_id=", derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("derivation_dict=", derivation_dict)

    logger.info("[TRACE] pdg_api/api_derivation_metadata end " + trace_id)
    return jsonify(derivation_dict)


@bp.route("/v1/resources/derivation/step/list", methods=["GET"])
def api_derivation_steps():
    """
    curl -s http://localhost:5000/api/v1/resources/derivation/step/list?derivation_id=3445848 | python3 -m json.tool
    [
        {
            "author_name_latex": "benno",
            "created_datetime": "2024-05-19_23-23-11-337900",
            "id": "1800596",
            "note_after_step_latex": "",
            "note_before_step_latex": ""
        }
    ]

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_derivation_steps start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    print("derivation_id=", derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    print("list_of_steps=", list_of_steps)

    logger.info("[TRACE] pdg_api/api_derivation_steps end " + trace_id)
    return jsonify(list_of_steps)


@bp.route("/v1/resources/cypher/", methods=["GET"])
def api_cypher_query():
    """
    curl -s http://localhost:5000/api/v1/resources/cypher/?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\) | python3 -m json.tool
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_cypher_query start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    user_query = request.args.get("query")

    print("user_query:", user_query)

    list_of_records = []  # type:List[str]
    if user_query:
        try:
            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                list_of_records = session.read_transaction(
                    neo4j_query.user_query, user_query
                )
                query_time_dict["api_cypher_query: user_query"] = round(
                    time.time() - query_start_time, 3
                )
        except neo4j.exceptions.ClientError:
            list_of_records = ["WRITE OPERATIONS NOT ALLOWED (ClientError)"]
        except neo4j.exceptions.TransactionError:
            list_of_records = ["not a valid Cypher query (TransactionError)"]
    else:
        list_of_records = [
            "use: curl -s http://localhost:5000/api/v1/resources/cypher?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\)"
        ]

    logger.info("[TRACE] pdg_api/api_cypher_query end " + trace_id)
    return jsonify(list_of_records)


# EOF
