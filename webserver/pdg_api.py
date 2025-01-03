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

from flask import Blueprint, flash, g, redirect, render_template, jsonify, request

import sys
from typing import NewType, Dict, List

sys.path.append("library")

import neo4j_query

# the following creates a circular dependency since `app.py` imports this file.
from pdg_app import graphDB_Driver

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
    print("[TRACE] func: pdg_api/api_list_derivations start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_list_derivations: list_nodes_of_type, derivation"
        ] = (time.time() - query_start_time)

    print("[TRACE] func: pdg_api/api_list_derivations end " + trace_id)
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
    print("[TRACE] func: pdg_api/api_list_inference_rules start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "inference_rule"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_inference_rules end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/operation/list", methods=["GET"])
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
    print("[TRACE] func: pdg_api/api_list_symbols start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "operation"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/scalar/list", methods=["GET"])
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
    print("[TRACE] func: pdg_api/api_list_symbols start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/vector/list", methods=["GET"])
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
    print("[TRACE] func: pdg_api/api_list_symbols start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "vector"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_symbols end " + trace_id)
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/matrix/list", methods=["GET"])
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
    print("[TRACE] func: pdg_api/api_list_symbols start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "matrix"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_symbols end " + trace_id)
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
    print("[TRACE] func: pdg_api/api_list_expressions start " + trace_id)

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "expression"
        )
    print("list_of_dicts=", list_of_dicts)

    print("[TRACE] func: pdg_api/api_list_expressions end " + trace_id)
    return jsonify(list_of_dicts)


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
    print("[TRACE] func: pdg_api/api_derivation_metadata start " + trace_id)

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    print("derivation_id=", derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
    print("derivation_dict=", derivation_dict)

    print("[TRACE] func: pdg_api/api_derivation_metadata end " + trace_id)
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
    print("[TRACE] func: pdg_api/api_derivation_steps start " + trace_id)

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    print("derivation_id=", derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )

    print("list_of_steps=", list_of_steps)

    print("[TRACE] func: pdg_api/api_derivation_steps end " + trace_id)
    return jsonify(list_of_steps)

#EOF