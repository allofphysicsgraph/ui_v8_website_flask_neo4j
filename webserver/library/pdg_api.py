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

# BHP, 2025-01-09: I am not dealing with log-in requirements,
# so I am disabling csrf for the APIs as per
# https://flask-wtf.readthedocs.io/en/0.15.x/csrf/#exclude-views-from-protection
csrf.exempt(bp)
# also, CSRF isn't how API authentication is done. See
# https://www.google.com/search?q=how+flask+json+api+authentication+works


@bp.route("/v1/resources/register", methods=["GET"])
def api_list_derivations():
    """
    curl -s http://localhost:5000/api/v1/resources/register | python3 -m json.tool
    """
    csrf_token = csrf.generate_csrf()
    return jsonify({"csrf token": csrf_token})


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


@bp.route("/v1/resources/derivation/create", methods=["POST"])
def api_create_derivation():
    """
    required inputs:
    - derivation name as latex
    - derivation abstract as latex
    optional input:
    - derivation reference as latex
    unexposed inputs:
    - author name
    - current time

    see `pdg_app/to_add_derivation` for the web UI implementation

    curl --request POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --show-error --silent \
     http://localhost:5000/api/v1/resources/derivation/create?derivation_name_latex=hello%20again\&derivation_reference_latex=this%20is\&derivation_abstract_latex=mine%20yours

    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"derivation_name_latex":"hello again", "derivation_reference_latex":"this was", "derivation_abstract_latex": "yes no"}' \
     http://localhost:5000/api/v1/resources/derivation/create


    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_create_derivation start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    print("request=" + str(request))
    print("request.args=" + str(request.args))

    if request.is_json:
        data = request.get_json()
    else:
        Print("not JSON")

    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_create_derivation: get_list_node_dicts_of_type derivation"
        ] = round(time.time() - query_start_time, 3)

    # print("list_of_derivation_dicts=", list_of_derivation_dicts)

    derivation_name_latex = request.args.get("derivation_name_latex")
    if derivation_name_latex:
        print("derivation_name:" + str(derivation_name_latex))
    else:
        return jsonify({"ERROR": "need to provide derivation_name_latex"})

    # reject input if derivation name is already in the database
    for derivation_dict in list_of_derivation_dicts:
        if derivation_dict["name_latex"] == derivation_name_latex:
            return jsonify(
                {
                    "ERROR:": "derivation name '"
                    + str(derivation_name_latex)
                    + "' already exists"
                }
            )

    derivation_reference_latex = request.args.get("derivation_reference_latex")
    if derivation_reference_latex:
        print("derivation_reference_latex " + str(derivation_reference_latex))
    else:
        derivation_reference_latex = ""

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


@bp.route("/v1/resources/expression/create", methods=["POST"])
def api_create_expression():
    """
    curl -s http://localhost:5000/api/v1/resources/expression/create

    user-provided dictionary is required to have latex and name

    see `to_add_expression`

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_create_expression start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    print(request.method)

    # required
    expression_latex_lhs = request.args.get("expression_latex_lhs")
    if expression_latex_lhs:
        print("expression_latex_lhs =" + expression_latex_lhs)
    else:
        return jsonify({"ERROR": "need to provide expression_latex_lhs"})

    # required
    expression_relation = request.args.get("expression_relation")
    if expression_relation:
        print("expression_relation =" + expression_relation)
    else:
        return jsonify({"ERROR": "need to provide expression_relation"})

    # required
    expression_latex_rhs = request.args.get("expression_latex_rhs")
    if expression_latex_rhs:
        print("expression_latex_rhs =" + expression_latex_rhs)
    else:
        return jsonify({"ERROR": "need to provide expression_latex_rhs"})

    # optional
    expression_latex_condition = request.args.get("expression_latex_condition")
    if expression_latex_condition:
        print("expression_latex_condition =" + expression_latex_condition)
    else:
        expression_latex_condition = ""

    # optional
    expression_name_latex = request.args.get("expression_name_latex")
    if expression_name_latex:
        print("expression_name_latex =" + expression_name_latex)
    else:
        expression_name_latex = ""

    # optional
    expression_reference_latex = request.args.get("expression_reference_latex")
    if expression_reference_latex:
        print("expression_reference_latex =" + expression_reference_latex)
    else:
        expression_reference_latex = ""

    # optional
    expression_description_latex = request.args.get("expression_description_latex")
    if expression_description_latex:
        print("expression_description_latex =" + expression_description_latex)
    else:
        expression_description_latex = ""

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "expression"
        )
        query_time_dict["to_add_expression: list_nodes_of_type"] = round(
            time.time() - query_start_time, 3
        )

    print("list_of_expression_dicts=", list_of_expression_dicts)
    # if lhs and relation and rhs are same, then reject

    author_name_latex = "ben"

    expression_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict, "expression"
    )

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(
            neo4j_query.add_expression,
            expression_id,
            expression_name_latex,
            expression_latex_lhs,
            expression_relation,
            expression_latex_rhs,
            expression_latex_condition,
            expression_description_latex,
            expression_reference_latex,
            author_name_latex,
        )
        query_time_dict["pdg_app/to_add_expression: add_expression"] = round(
            time.time() - query_start_time, 3
        )

    # return jsonify({"STATUS": "expression added successfully"})
    query_time_dict["STATUS"] = "expression added successfully"
    return query_time_dict


@bp.route("/v1/resources/symbol/scalar/create", methods=["POST"])
def api_create_scalar_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/scalar/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/vector/create", methods=["POST"])
def api_create_vector_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/vector/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/matrix/create", methods=["POST"])
def api_create_matrix_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/matrix/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/operation/create", methods=["POST"])
def api_create_operation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/operation/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/symbol/relation/create", methods=["POST"])
def api_create_relation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/relation/create

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    return


@bp.route("/v1/resources/inference_rule/create", methods=["POST"])
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
