#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2025
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)


this file separates the API routes from `pdg_app.py`

http://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask

HTTP methods supported by the APIs in this file:
- GET is used to request data from a specified resource.
- POST is used to send data to a server to create/update a resource.



When sending data via a POST or PUT request, two common formats 
(specified via the Content-Type header) are:
- application/json
- application/x-www-form-urlencoded


"""

import time
import random
import datetime

from flask import Blueprint, flash, g, redirect, render_template, jsonify, request

import sys
from typing import NewType, Dict, List
import neo4j


from flask_wtf.csrf import generate_csrf

import logging

logger = logging.getLogger(__name__)

import neo4j_query
import compute
import list_of_valid

from initialize_flask import csrf  # imported so that we can set .exempt(bp)

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
# https://flask-wtf.readthedocs.io/en/0.15.x/api/
csrf.exempt(bp)
# also, CSRF isn't how API authentication is done. See
# https://www.google.com/search?q=how+flask+json+api+authentication+works


@bp.route("/v1/resources/do_nothing", methods=["GET"])
def api_do_nothing():
    """
    to use session cookies,
    curl --head -c cookies.txt http://localhost:5000/api/v1/resources/do_nothing
    where
    `--head`: only fetch the headers of the response.
    `-c cookies.txt`: save the cookies received in the response to a file named cookies.txt.
    Then
    curl -b cookies.txt http://localhost:5000/api/v1/resources/derivation/create


    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info(
        "[TRACE] pdg_api/api_do_nothing start " + trace_id + " " + str(time.time())
    )
    return


@bp.route("/v1/resources/register_csrf", methods=["GET"])
def api_register():
    """
    a CSRF token can be generated manually as per
    https://stackoverflow.com/a/76495384/1164295

    However, CSRF has been exempted for the blueprint routes in this file.
    This API endpoint shouldn't normally be relevant

    if the web UI is being tested using CURL, see
    https://stackoverflow.com/a/18772355/1164295
    https://stackoverflow.com/a/35205378/1164295
    for creating cookies when submitting forms

    curl -s http://localhost:5000/api/v1/resources/register | python3 -m json.tool

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info(
        "[TRACE] pdg_api/api_register start " + trace_id + " " + str(time.time())
    )
    # csrf_token = csrf.generate_csrf() # AttributeError: 'CSRFProtect' object has no attribute 'generate_csrf'

    # current_token = g.csrf_token

    csrf_token = generate_csrf(token_key="your key here")

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
    logger.info(
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
        query_time_dict[
            "pdg_api/api_list_inference_rules: get_list_node_dicts_of_type"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict[
            "pdg_api/api_list_operation_symbols: get_list_node_dicts_of_type"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict[
            "pdg_api/api_list_relation_symbols: api_list_relation_symbols"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict[
            "pdg_api/api_list_scalar_symbols: get_list_node_dicts_of_type"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict[
            "pdg_api/api_list_vector_symbols: get_list_node_dicts_of_type"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict[
            "pdg_api/api_list_matrix_symbols: get_list_node_dicts_of_type"
        ] = (time.time() - query_start_time)
    # print("list_of_dicts=", list_of_dicts)

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
        query_time_dict["pdg_api/api_list_expressions: get_list_node_dicts_of_type"] = (
            time.time() - query_start_time
        )
    # print("list_of_dicts=", list_of_dicts)

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

    # print("request=" + str(request)) # shows the user-submitted URL and type (POST)
    # print(request.method)

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()

        if "derivation_name_latex" in data_from_user.keys():
            derivation_name_latex = data_from_user["derivation_name_latex"]
        else:  # was not provided
            return jsonify({"ERROR": "need to provide derivation_name_latex"})

        if "derivation_abstract_latex" in data_from_user.keys():
            derivation_abstract_latex = data_from_user["derivation_abstract_latex"]
        else:
            return jsonify({"ERROR": "need to provide derivation_abstract_latex"})

        if "derivation_reference_latex" in data_from_user.keys():
            derivation_reference_latex = data_from_user["derivation_reference_latex"]
        else:
            derivation_reference_latex = ""

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict

        derivation_name_latex = request.args.get("derivation_name_latex")
        if derivation_name_latex:
            print("derivation_name:" + str(derivation_name_latex))
        else:  # was not provided
            return jsonify({"ERROR": "need to provide derivation_name_latex"})

        derivation_abstract_latex = request.args.get("derivation_abstract_latex")
        if derivation_abstract_latex:
            print("derivation_abstract_latex " + str(derivation_abstract_latex))
        else:
            return jsonify({"ERROR": "need to provide derivation_abstract_latex"})

        derivation_reference_latex = request.args.get("derivation_reference_latex")
        if derivation_reference_latex:
            print("derivation_reference_latex " + str(derivation_reference_latex))
        else:
            derivation_reference_latex = ""

    # additional reasons to reject user's input: derivation name is already in use
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

    # at this point the inputs are valid and we can proceed to add the content to the database

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
            now_str,
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

    curl --request POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --show-error --silent \
    http://localhost:5000/api/v1/resources/expression/create?expression_latex_lhs=4*2\&expression_relation_latex==\&expression_latex_rhs=9 \
     | python3 -m json.tool


    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"expression_latex_lhs": "4^3", "expression_relation_latex": "=", "expression_latex_rhs": "k"}' \
     http://localhost:5000/api/v1/resources/expression/create | python3 -m json.tool

    user-provided dictionary is required to have latex and name

    TODO: account for SymPy representation

    see `to_add_expression`

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/api_create_expression start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "expression_latex_lhs" in data_from_user.keys():
            expression_latex_lhs = data_from_user["expression_latex_lhs"]
        else:
            return jsonify({"ERROR": "need to provide expression_latex_lhs"})

        # required
        if "expression_relation_latex" in data_from_user.keys():
            expression_relation_latex = data_from_user["expression_relation_latex"]
        else:
            return jsonify({"ERROR": "need to provide expression_relation_latex"})

        # required
        if "expression_latex_rhs" in data_from_user.keys():
            expression_latex_rhs = data_from_user["expression_latex_rhs"]
        else:
            return jsonify({"ERROR": "need to provide expression_latex_rhs"})

        # optional
        if "expression_latex_condition" in data_from_user.keys():
            expression_latex_condition = data_from_user["expression_latex_condition"]
        else:
            expression_latex_condition = ""

        # optional
        if "expression_name_latex" in data_from_user.keys():
            expression_name_latex = data_from_user["expression_name_latex"]
        else:
            expression_name_latex = ""

        # optional
        if "expression_reference_latex" in data_from_user.keys():
            expression_reference_latex = data_from_user["expression_reference_latex"]
        else:
            expression_reference_latex = ""

        # optional
        if "expression_description_latex" in data_from_user.keys():
            expression_description_latex = data_from_user[
                "expression_description_latex"
            ]
        else:
            expression_description_latex = ""

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict

        # required
        expression_latex_lhs = request.args.get("expression_latex_lhs")
        if expression_latex_lhs:
            print("expression_latex_lhs =" + expression_latex_lhs)
        else:
            return jsonify({"ERROR": "need to provide expression_latex_lhs"})

        # required
        expression_relation_latex = request.args.get("expression_relation_latex")
        if expression_relation_latex:
            print("expression_relation_latex =" + expression_relation_latex)
        else:
            return jsonify({"ERROR": "need to provide expression_relation_latex"})

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
    for expression_dict in list_of_expression_dicts:
        if (
            expression_dict["latex_lhs"] == expression_latex_lhs
            and expression_dict["latex_relation"] == expression_relation_latex
            and expression_dict["latex_rhs"] == expression_latex_rhs
        ):
            return jsonify(
                {
                    "ERROR:": "expression '"
                    + str(expression_latex_lhs)
                    + str(expression_relation_latex)
                    + str(expression_latex_rhs)
                    + "' already exists"
                }
            )

    # at this point the inputs are valid and we can proceed to add the content to the database

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

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
            expression_relation_latex,
            expression_latex_rhs,
            expression_latex_condition,
            expression_description_latex,
            expression_reference_latex,
            now_str,
            author_name_latex,
        )
        query_time_dict["pdg_app/to_add_expression: add_expression"] = round(
            time.time() - query_start_time, 3
        )

    return jsonify(
        {"STATUS": "expression added successfully", "query times": query_time_dict}
    )


@bp.route("/v1/resources/symbol/scalar/create", methods=["POST"])
def api_create_scalar_symbol():
    """

    curl --request POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --show-error --silent \
    http://localhost:5000/api/v1/resources/symbol/scalar/create?scalar_latex=a | python3 -m json.tool


    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"scalar_latex": "b"}' \
     http://localhost:5000/api/v1/resources/symbol/scalar/create | python3 -m json.tool


    see `to_add_symbol_scalar`

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "scalar_latex" in data_from_user.keys():
            scalar_latex = data_from_user["scalar_latex"]
        else:
            return jsonify({"ERROR": "need to provide scalar_latex"})

        # optional
        if "scalar_name_latex" in data_from_user.keys():
            scalar_name_latex = data_from_user["scalar_name_latex"]
        else:
            scalar_name_latex = ""

        # optional
        if "scalar_description_latex" in data_from_user.keys():
            scalar_description_latex = data_from_user["scalar_description_latex"]
        else:
            scalar_description_latex = ""

        # optional
        if "scalar_reference_latex" in data_from_user.keys():
            scalar_reference_latex = data_from_user["scalar_reference_latex"]
        else:
            scalar_reference_latex = ""

        # optional
        if "scalar_scope" in data_from_user.keys():
            scalar_scope = data_from_user["scalar_scope"]
            if scalar_scope not in list_of_valid.scalar_scope:
                return jsonify(
                    {
                        "ERROR": scalar_scope
                        + " is not a valid scalar_scope; choose from "
                        + str(list_of_valid.scalar_scope)
                    }
                )

        else:
            return jsonify({"ERROR": "need to provide scalar_scope"})

        # optional
        if "scalar_variable_or_constant" in data_from_user.keys():
            scalar_variable_or_constant = data_from_user["scalar_variable_or_constant"]
            if scalar_variable_or_constant not in ["variable", "constant"]:
                return jsonify(
                    {
                        "ERROR": scalar_variable_or_constant
                        + " is not valid for scalar_variable_or_constant"
                    }
                )
        else:
            scalar_variable_or_constant = "variable"

        # optional
        if "scalar_domain" in data_from_user.keys():
            scalar_domain = data_from_user["scalar_domain"]
            if scalar_domain not in list_of_valid.scalar_domain:
                return jsonify(
                    {
                        "ERROR": scalar_domain
                        + " is not a valid scalar_domain; choose from "
                        + str(list_of_valid.scalar_domain)
                    }
                )
        else:
            scalar_domain = "any"

        # optional
        if "dimension_length" in data_from_user.keys():
            dimension_length = data_from_user["dimension_length"]
        else:
            dimension_length = 0

        # optional
        if "dimension_time" in data_from_user.keys():
            dimension_time = data_from_user["dimension_time"]
        else:
            dimension_time = 0

        # optional
        if "dimension_mass" in data_from_user.keys():
            dimension_mass = data_from_user["dimension_mass"]
        else:
            dimension_mass = 0

        # optional
        if "dimension_temperature" in data_from_user.keys():
            dimension_temperature = data_from_user["dimension_temperature"]
        else:
            dimension_temperature = 0

        # optional
        if "dimension_electric_charge" in data_from_user.keys():
            dimension_electric_charge = data_from_user["dimension_electric_charge"]
        else:
            dimension_electric_charge = 0

        # optional
        if "dimension_amount_of_substance" in data_from_user.keys():
            dimension_amount_of_substance = data_from_user[
                "dimension_amount_of_substance"
            ]
        else:
            dimension_amount_of_substance = 0

        # optional
        if "dimension_luminous_intensity" in data_from_user.keys():
            dimension_luminous_intensity = data_from_user[
                "dimension_luminous_intensity"
            ]
        else:
            dimension_luminous_intensity = 0

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict

        # required
        scalar_latex = request.args.get("scalar_latex")
        if scalar_latex:
            print("scalar_latex =" + scalar_latex)
        else:
            return jsonify({"ERROR": "need to provide scalar_latex"})

        # optional
        scalar_name_latex = request.args.get("scalar_name_latex")
        if scalar_name_latex:
            print("scalar_name_latex =" + scalar_name_latex)
        else:
            scalar_name_latex = ""

        # optional
        scalar_description_latex = request.args.get("scalar_description_latex")
        if scalar_description_latex:
            print("scalar_description_latex =" + scalar_description_latex)
        else:
            scalar_description_latex = ""

        # optional
        scalar_reference_latex = request.args.get("scalar_reference_latex")
        if scalar_reference_latex:
            print("scalar_reference_latex =" + scalar_reference_latex)
        else:
            scalar_reference_latex = ""

        # optional
        scalar_scope = request.args.get("scalar_scope")
        if scalar_scope:
            print("scalar_scope =" + scalar_scope)
            if scalar_scope not in list_of_valid.scalar_scope:
                return jsonify(
                    {
                        "ERROR": scalar_scope
                        + " is not a valid scalar_scope; choose from "
                        + str(list_of_valid.scalar_scope)
                    }
                )

        else:
            scalar_scope = "arbitrary"

        # optional
        scalar_variable_or_constant = request.args.get("scalar_variable_or_constant")
        if scalar_variable_or_constant:
            print("scalar_variable_or_constant =" + scalar_variable_or_constant)
            if scalar_variable_or_constant not in ["variable", "constant"]:
                return jsonify(
                    {
                        "ERROR": scalar_variable_or_constant
                        + " is not valid for scalar_variable_or_constant"
                    }
                )
        else:
            scalar_variable_or_constant = "variable"

        # optional
        scalar_domain = request.args.get("scalar_domain")
        if scalar_domain:
            print("scalar_domain =" + scalar_domain)
            if scalar_domain not in list_of_valid.scalar_domain:
                return jsonify(
                    {
                        "ERROR": scalar_domain
                        + " is not a valid scalar_domain; choose from "
                        + str(list_of_valid.scalar_domain)
                    }
                )
        else:
            scalar_domain = "any"

        # optional
        dimension_length = request.args.get("dimension_length")
        if dimension_length:
            print("dimension_length =" + dimension_length)
        else:
            dimension_length = 0

        # optional
        dimension_time = request.args.get("dimension_time")
        if dimension_time:
            print("dimension_time =" + dimension_time)
        else:
            dimension_time = 0

        # optional
        dimension_mass = request.args.get("dimension_mass")
        if dimension_mass:
            print("dimension_mass =" + dimension_mass)
        else:
            dimension_mass = 0

        # optional
        dimension_temperature = request.args.get("dimension_temperature")
        if dimension_temperature:
            print("dimension_temperature =" + dimension_temperature)
        else:
            dimension_temperature = 0

        # optional
        dimension_electric_charge = request.args.get("dimension_electric_charge")
        if dimension_electric_charge:
            print("dimension_electric_charge =" + dimension_electric_charge)
        else:
            dimension_electric_charge = 0

        # optional
        dimension_amount_of_substance = request.args.get(
            "dimension_amount_of_substance"
        )
        if dimension_amount_of_substance:
            print("dimension_amount_of_substance =" + dimension_amount_of_substance)
        else:
            dimension_amount_of_substance = 0

        # optional
        dimension_luminous_intensity = request.args.get("dimension_luminous_intensity")
        if dimension_luminous_intensity:
            print("dimension_luminous_intensity =" + dimension_luminous_intensity)
        else:
            dimension_luminous_intensity = 0

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    scalar_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict, "scalar"
    )

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(
            neo4j_query.add_scalar_symbol,
            scalar_id,
            scalar_name_latex,
            scalar_latex,
            scalar_description_latex,
            scalar_reference_latex,
            scalar_scope,
            scalar_variable_or_constant,
            scalar_domain,
            dimension_length,
            dimension_time,
            dimension_mass,
            dimension_temperature,
            dimension_electric_charge,
            dimension_amount_of_substance,
            dimension_luminous_intensity,
            now_str,
            author_name_latex,
        )

    return jsonify(
        {"STATUS": "scalar symbol added successfully", "query times": query_time_dict}
    )


@bp.route("/v1/resources/symbol/vector/create", methods=["POST"])
def api_create_vector_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/vector/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    return jsonify({"STATUS": "TODO"})


@bp.route("/v1/resources/symbol/matrix/create", methods=["POST"])
def api_create_matrix_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/matrix/create

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    return jsonify({"STATUS": "TODO"})


@bp.route("/v1/resources/symbol/operation/create", methods=["POST"])
def api_create_operation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/operation/create

    see `to_add_operation`

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "operation_name_latex" in data_from_user.keys():
            operation_name_latex = data_from_user["operation_name_latex"]
        else:
            return jsonify({"ERROR": "need to provide operation_name_latex"})

        # required
        if "operation_latex" in data_from_user.keys():
            operation_latex = data_from_user["operation_latex"]
        else:
            return jsonify({"ERROR": "need to provide operation_latex"})

        # required
        if "operation_description_latex" in data_from_user.keys():
            operation_description_latex = data_from_user["operation_description_latex"]
        else:
            return jsonify({"ERROR": "need to provide operation_description_latex"})

        # optional
        if "operation_reference_latex" in data_from_user.keys():
            operation_reference_latex = data_from_user["operation_reference_latex"]
        else:
            operation_reference_latex = ""

        # required
        if "operation_argument_count" in data_from_user.keys():
            operation_argument_count = data_from_user["operation_argument_count"]
        else:
            return jsonify({"ERROR": "need to provide operation_argument_count"})

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict
        # required
        operation_name_latex = request.args.get("operation_name_latex")
        if operation_name_latex:
            print("operation_name_latex =" + operation_name_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_name_latex"})

        # required
        operation_latex = request.args.get("operation_latex")
        if operation_latex:
            print("operation_latex =" + operation_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_latex"})

        # required
        operation_description_latex = request.args.get("operation_description_latex")
        if operation_description_latex:
            print("operation_description_latex =" + operation_description_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_description_latex"})

        # optional
        operation_reference_latex = request.args.get("operation_reference_latex")
        if operation_reference_latex:
            print("operation_reference_latex =" + operation_reference_latex)
        else:
            operation_reference_latex = ""

        # required
        operation_argument_count = request.args.get("operation_argument_count")
        if operation_argument_count:
            print("operation_argument_count =" + operation_argument_count)
        else:
            return jsonify({"ERROR": "need to provide operation_argument_count"})

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    operation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict, "operation"
    )

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(
            neo4j_query.add_operation_symbol,
            operation_id,
            operation_name_latex,
            operation_latex,
            operation_description_latex,
            operation_reference_latex,
            operation_argument_count,
            now_str,
            author_name_latex,
        )
        print(
            "[TRACE] pdg_app/to_add_operation end " + trace_id + " " + str(time.time())
        )

    return jsonify(
        {
            "STATUS": "operation symbol added successfully",
            "query times": query_time_dict,
        }
    )


@bp.route("/v1/resources/symbol/relation/create", methods=["POST"])
def api_create_relation_symbol():
    """
    curl -s http://localhost:5000/api/v1/resources/symbol/relation/create

    see `to_add_relation`
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "relation_name_latex" in data_from_user.keys():
            relation_name_latex = data_from_user["relation_name_latex"]
        else:
            return jsonify({"ERROR": "need to provide relation_name_latex"})

        # required
        if "relation_latex" in data_from_user.keys():
            relation_latex = data_from_user["relation_latex"]
        else:
            return jsonify({"ERROR": "need to provide relation_latex"})

        # required
        if "relation_description_latex" in data_from_user.keys():
            relation_description_latex = data_from_user["relation_description_latex"]
        else:
            return jsonify({"ERROR": "need to provide relation_description_latex"})

        # optional
        if "relation_reference_latex" in data_from_user.keys():
            relation_reference_latex = data_from_user["relation_reference_latex"]
        else:
            relation_reference_latex = ""

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict
        # required
        relation_name_latex = request.args.get("relation_name_latex")
        if relation_name_latex:
            print("relation_name_latex =" + relation_name_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_name_latex"})

        # required
        relation_latex = request.args.get("relation_latex")
        if relation_latex:
            print("relation_latex =" + relation_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_latex"})

        # required
        relation_description_latex = request.args.get("relation_description_latex")
        if relation_description_latex:
            print("relation_description_latex =" + relation_description_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_description_latex"})

        # optional
        relation_reference_latex = request.args.get("relation_reference_latex")
        if relation_reference_latex:
            print("relation_reference_latex =" + relation_reference_latex)
        else:
            relation_reference_latex = ""

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    relation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict, "relation"
    )

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(
            neo4j_query.add_relation_symbol,
            relation_id,
            relation_name_latex,
            relation_latex,
            relation_description_latex,
            relation_reference_latex,
            now_str,
            author_name_latex,
        )
        print(
            "[TRACE] pdg_app/to_add_relation end " + trace_id + " " + str(time.time())
        )

    return jsonify(
        {"STATUS": "relation symbol added successfully", "query times": query_time_dict}
    )


@bp.route("/v1/resources/inference_rule/create", methods=["POST"])
def api_create_inference_rule():
    """
    curl -s http://localhost:5000/api/v1/resources/inference_rule/create

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "_latex" in data_from_user.keys():
            _latex = data_from_user[""]
        else:
            return jsonify({"ERROR": "need to provide _latex"})

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict
        # required
        _latex = request.args.get("_latex")
        if _latex:
            print("_latex =" + _latex)
        else:
            return jsonify({"ERROR": "need to provide _latex"})

    return jsonify(
        {"STATUS": "inference rule added successfully", "query times": query_time_dict}
    )


@bp.route("/v1/resources/derivation/delete", methods=["POST"])
def api_delete_derivation():
    """
    derivation and all steps

    curl -s http://localhost:5000/api/v1/resources//delete
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_api/ start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        print("data_from_user = " + str(data_from_user))

        # required
        if "derivation_id" in data_from_user.keys():
            derivation_id = data_from_user["derivation_id"]
        else:
            return jsonify({"ERROR": "need to provide derivation_id"})

    else:  # "Content-Type: application/x-www-form-urlencoded"
        print("request.args=" + str(request.args))  # returns a dict
        # required
        derivation_id = request.args.get("derivation_id")
        if derivation_id:
            print("derivation_id =" + derivation_id)
        else:
            return jsonify({"ERROR": "need to provide derivation_id"})

    # does this derivation_id exist?

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_list_derivations: list_nodes_of_type, derivation"
        ] = (time.time() - query_start_time)

    list_of_id = []
    for derivation_dict in list_of_dicts:
        list_of_id.append(derivation_dict["id"])
    if derivation_id not in list_of_id:
        return jsonify(
            {"ERROR": derivation_id + " not found in list of derivation IDs"}
        )

    # at this point inputs have been validated

    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )
        query_time_dict[
            "pdg_app/to_review_derivation: get_list_of_step_dicts_in_this_derivation"
        ] = round(time.time() - query_start_time, 3)

    for this_step_dict in list_of_step_dicts:
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.delete_node, this_step_dict["id"], "step"
            )
            query_time_dict["pdg_app/to_review_derivation: delete_node step"] = round(
                time.time() - query_start_time, 3
            )

    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
        query_time_dict["to_review_derivation: node_properties, derivation"] = round(
            time.time() - query_start_time, 3
        )
    print("derivation_dict:", derivation_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(neo4j_query.delete_node, derivation_id, "derivation")
        query_time_dict["pdg_app/to_review_derivation: delete_node derivation"] = round(
            time.time() - query_start_time, 3
        )
    print(
        "[TRACE] pdg_app/to_review_derivation end " + trace_id + " " + str(time.time())
    )

    return jsonify({"STATUS": "successfully deleted" + derivation_id})


@bp.route("/v1/resources/expression/delete", methods=["POST"])
def api_delete_expression():
    """
    derivation and all steps
    """
    return jsonify({"STATUS": "TODO"})


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
