#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2024
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
separate the API routes and functions into this file and thus make controller.py smaller

https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
"""

from flask import Blueprint, flash, g, redirect, render_template, jsonify, request

import sys
sys.path.append("library")

import neo4j_query


# https://flask.palletsprojects.com/en/1.1.x/tutorial/views/
bp = Blueprint('pdg_api', __name__, url_prefix='/api')



@bp.route("/v1/resources/derivation/list", methods=["GET"])
def api_list_derivations():
    """
    curl http://localhost:5000/api/v1/resources/derivations/list
    >>>
    """
    list_of_dicts = session.read_transaction(
        neo4j_query.list_nodes_of_type, "derivation"
    )
    return jsonify(list_of_dicts)

@bp.route("/v1/resources/inference_rule/list", methods=["GET"])
def api_list_inference_rules(node_type: str):
    """
    curl 
    >>> 
    """
    list_of_dicts = session.read_transaction(
        neo4j_query.list_nodes_of_type, "inference_rule"
    )
    return jsonify(list_of_dicts)

@bp.route("/v1/resources/symbol/list", methods=["GET"])
def api_list_symbols(node_type: str):
    """
    curl 
    >>> 
    """
    list_of_dicts = session.read_transaction(
        neo4j_query.list_nodes_of_type, "symbol"
    )
    return jsonify(list_of_dicts)


@bp.route("/v1/resources/expression/list", methods=["GET"])
def api_list_expressions(node_type: str):
    """
    curl 
    >>> 
    """
    list_of_dicts = session.read_transaction(
        neo4j_query.list_nodes_of_type, "expression"
    )
    return jsonify(list_of_dicts)



@bp.route("/v1/resources/derivation", methods=["GET"])
def api_derivation():
    """
    https://derivationmap.net/api/v1/resources/derivation?id=000007
    """
    if "id" in request.args:
        derivation_id = str(request.args["id"])
