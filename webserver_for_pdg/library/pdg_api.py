#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2026
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

---

<https://www.google.com/search?q=how+flask+json+api+authentication+works>

on 2026-02-07, Gemini 3 Pro says
To require authentication for your API, you have two primary paths based
on your specific question: API Keys or Google Auth Cookies.

Given that you are designing a RESTful API (/api/v1/...) intended to be
accessed via methods like curl, API Keys (or Bearer Tokens) are the correct choice.

- The server verifies the API key for every call.
- With API Keys the identity is proven by the X-API-KEY header.
- For API keys CSRF Status is Disabled (Exempt).

https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%221Yd8spj4XZd5UvzITMJL-ndwxeWtGh5uS%22%5D,%22action%22:%22open%22,%22userId%22:%22101193243042884231058%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing, https://drive.google.com/file/d/1db9dcvjqzTAIyieLzOMvxmOrS3bslSyw/view?usp=sharing

IN CONTRAST,
CSRF token relies on Google Authentiation. To use curl with CSRF,
the script must first "log in" to get a cookie, save the cookie to a "cookie jar,"
extract the CSRF token from the HTML, and then send both the
cookie and the token with the POST request.

Instead of the `@require_api_key` decorator you would use Flask-Login's `@login_required`.


"""

import time
import random
import datetime
import uuid
import tokenize
import os

from sympy.parsing.sympy_parser import parse_expr

from flask import (
    Blueprint,
    flash,
    g,
    redirect,
    render_template,
    url_for,
    jsonify,
    request,
    make_response,
)

import sys
from typing import NewType, Dict, List
import neo4j  # type: ignore

# from flask_wtf.csrf import generate_csrf
# from initialize_flask import csrf  # imported so that we can set .exempt(bp)

import logging

logger = logging.getLogger(__name__)

from . import neo4j_query
from . import compute
from . import latex
from . import list_of_valid


from .compute import query_timing_result_type

from .initialize_neo4j import graphDB_Driver

# this works because app.py loads this file first

# http://flask.palletsprojects.com/en/1.1.x/tutorial/views/
api_bp = Blueprint("pdg_api", __name__, url_prefix="/api")


# BHP, 2025-01-09: I am not dealing with log-in requirements,
# so I am disabling csrf for the APIs as per
# https://flask-wtf.readthedocs.io/en/0.15.x/csrf/#exclude-views-from-protection
# https://flask-wtf.readthedocs.io/en/0.15.x/api/
# csrf.exempt(bp)


# @api_bp.route("/v1/resources/do_nothing", methods=["GET"])
# def api_do_nothing():
#     """
#     to use session cookies,
#     curl --head -c cookies.txt https://localhost/api/v1/resources/do_nothing
#     where
#     `--head`: only fetch the headers of the response.
#     `-c cookies.txt`: save the cookies received in the response to a file named cookies.txt.
#     Then
#     curl -b cookies.txt https://localhost/api/v1/resources/derivation/create


#     """
#     trace_id = str(uuid.uuid4())
#     logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
#     return


# @api_bp.route("/v1/auth/csrf", methods=["GET"])
# def api_register():
#     """
#     a CSRF token can be generated manually as per
#     https://stackoverflow.com/a/76495384/1164295

#     However, CSRF has been exempted for the blueprint routes in this file.
#     This API endpoint shouldn't normally be relevant

#     if the web UI is being tested using CURL, see
#     https://stackoverflow.com/a/18772355/1164295
#     https://stackoverflow.com/a/35205378/1164295
#     for creating cookies when submitting forms

#     curl --silent --insecure https://localhost/api/v1/resources/register | python3 -m json.tool

#     """
#     trace_id = str(uuid.uuid4())
#     logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
#     # csrf_token = csrf.generate_csrf() # AttributeError: 'CSRFProtect' object has no attribute 'generate_csrf'

#     # current_token = g.csrf_token

#     csrf_token = generate_csrf(token_key="your key here")

#     return jsonify({"csrf token": csrf_token})


@api_bp.route("/v1", methods=["GET"])
@api_bp.route("/v1/", methods=["GET"])
def api_start_here():
    """
    Entry point for the API using HATEOAS (HAL format).

    https://github.com/allofphysicsgraph/task-tracker/issues/134

    Hypermedia as the Engine of Application State (HATEOAS)
    https://en.wikipedia.org/wiki/HATEOAS

    ```
    $ curl --silent --insecure https://localhost/api/v1/ | python3 -m json.tool

    {
      "_links": {
        "cypher_query": {
          "href": "https://localhost/api/v1/resources/cypher/",
          "title": "Cypher query",
          "type": "GET"
        },
        "derivations": {
          "href": "https://localhost/api/v1/resources/derivations,
          "title": "List derivations",
          "type": "GET"
        }
      }
      "message": "Welcome to the Physics Derivation Graph API. Please explore the available resources."
    }
    ```

    """
    # Construct the HAL payload
    # HAL requires a "_links" key.
    # "self" is mandatory and points to the current resource.
    payload = {
        "message": "Welcome to the Physics Derivation Graph API. Please explore the available resources.",
        "_links": {
            "self": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Entry Point",
                "type": "GET",
            },
            "derivations": {
                "href": url_for(".api_list_derivations", _external=True),
                "title": "List derivations",
                "type": "GET",
            },
            "inference_rules": {
                "href": url_for(".api_list_inference_rules", _external=True),
                "title": "List inference rules",
                "type": "GET",
            },
            "expressions": {
                "href": url_for(".api_list_expressions", _external=True),
                "title": "List expressions",
                "type": "GET",
            },
            "operation_symbols": {
                "href": url_for(".api_list_operation_symbols", _external=True),
                "title": "List operations",
                "type": "GET",
            },
            "relation_symbols": {
                "href": url_for(".api_list_relation_symbols", _external=True),
                "title": "List relations",
                "type": "GET",
            },
            "scalar_symbols": {
                "href": url_for(".api_list_scalar_symbols", _external=True),
                "title": "List scalars",
                "type": "GET",
            },
            "vector_symbols": {
                "href": url_for(".api_list_vector_symbols", _external=True),
                "title": "List vectors",
                "type": "GET",
            },
            "matrix_symbols": {
                "href": url_for(".api_list_matrix_symbols", _external=True),
                "title": "List matrices",
                "type": "GET",
            },
            "cypher_query": {
                "href": url_for(".api_cypher_query", _external=True),
                "title": "Cypher query",
                "type": "GET",
            },
            # TODO: to add: export as {cypher, JSON, CSV, GraphML}
        },
    }
    # The `.` prefix tells Flask to look for these functions within the current Blueprint.
    # use `_external=True` to generate absolute URLs (e.g., http://servername/v1/...) rather than relative paths. This is best practice for APIs, as clients may not know the base domain context.

    # Flask's jsonify defaults to application/json. Since we want HAL compliance,
    # wrap the json in `make_response` and manually override the header to `application/hal+json`.

    response = make_response(jsonify(payload))

    # Set the Content-Type to application/hal+json
    response.headers["Content-Type"] = "application/hal+json"

    return response


@api_bp.route("/v1/resources/derivations", methods=["GET"])
def api_list_derivations():
    """
    curl --silent --insecure https://localhost/api/v1/resources/derivation/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )
        # query_time_dict[
        #     "pdg_api/api_list_derivations: list_nodes_of_type, derivation"
        # ] = (time.time() - query_start_time)

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        # Create a copy to avoid mutating the original database result
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.critical("Found derivation without ID")
            raise Exception("Found derivation without ID")

        # Add links specific to this individual resource
        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_derivation_metadata", derivation_id=item_id, _external=True
                ),
                "title": "Get derivation metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_derivation", derivation_id=item_id, _external=True
                ),
                "title": "Edit derivation",
                "type": "GET",
            },
            "steps": {
                "href": url_for(
                    ".api_derivation_steps", derivation_id=item_id, _external=True
                ),
                "title": "View derivation steps",
                "type": "GET",
            },
            "delete": {
                # Note: This API uses POST for delete, not the standard HTTP DELETE verb.
                # Explicitly stating the method helps the client know how to interact.
                "href": url_for(
                    ".api_delete_derivation", derivation_id=item_id, _external=True
                ),
                "title": "Delete derivation",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_derivations", _external=True),
                "title": "List of Derivations",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Entry Point",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_derivation", _external=True),
                "title": "Create a new derivation",
                "method": "POST",
            },
        },
        "_embedded": {"derivations": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/inference_rules", methods=["GET"])
def api_list_inference_rules():
    """
    curl --silent --insecure https://localhost/api/v1/resources/inference_rule/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )
        query_time_dict["pdg_api/api_list_inference_rules: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_inference_rule_metadata", infrule_id=item_id, _external=True
                ),
                "title": "Get inference rule metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_inference_rule", infrule_id=item_id, _external=True
                ),
                "title": "Edit this inference rule",
                "method": "PUT",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_inference_rule", infrule_id=item_id, _external=True
                ),
                "title": "Delete inference rule",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_inference_rules", _external=True),
                "title": "List of Inference Rules",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
            },
            "create": {
                "href": url_for(".api_create_inference_rule", _external=True),
                "title": "Create a new inference rule",
                "method": "POST",
            },
        },
        "_embedded": {"inference_rules": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/expressions", methods=["GET"])
def api_list_expressions():
    """
curl --silent --insecure https://localhost/api/v1/resources/expressions | python3 -c "
import sys, json

data = json.load(sys.stdin)
data.pop('_links', None)
if '_embedded' in data and 'expressions' in data['_embedded']:
    for entry in data['_embedded']['expressions']:
        entry.pop('_links', None)
        entry.pop('author_name_latex', None)

print(json.dumps(data, indent=2))
" 

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
        query_time_dict["pdg_api/api_list_expressions: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning("Found expression without ID during API list generation.")
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_expression_metadata", expression_id=item_id, _external=True
                ),
                "title": "Get expression metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_expression", expression_id=item_id, _external=True
                ),
                "title": "Edit this expression",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_expression", expression_id=item_id, _external=True
                ),
                "title": "Delete expression",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_expressions", _external=True),
                "title": "List of Expressions",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_expression", _external=True),
                "title": "Create a new expression",
                "method": "POST",
            },
        },
        "_embedded": {"expressions": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/symbol/operations", methods=["GET"])
def api_list_operation_symbols():
    """
    curl --silent --insecure https://localhost/api/v1/resources/operation/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "operation"
        )
        query_time_dict["pdg_api/api_list_operation_symbols: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning(
                "Found operation symbol without ID during API list generation."
            )
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_operation_metadata", symbol_id=item_id, _external=True
                ),
                "title": "Get operation metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_operation", symbol_id=item_id, _external=True
                ),
                "title": "Edit this operation",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_operation", symbol_id=item_id, _external=True
                ),
                "title": "Delete operation",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_operation_symbols", _external=True),
                "title": "List of Operation Symbols",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_operation_symbol", _external=True),
                "title": "Create a new operation symbol",
                "method": "POST",
            },
        },
        "_embedded": {"operation_symbols": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/symbol/relations", methods=["GET"])
def api_list_relation_symbols():
    """
    curl --silent --insecure https://localhost/api/v1/resources/symbol/relation/list | python3 -m json.tool

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "relation"
        )
        query_time_dict[
            "pdg_api/api_list_relation_symbols: api_list_relation_symbols"
        ] = (time.time() - query_start_time)

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning(
                "Found relation symbol without ID during API list generation."
            )
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_relation_metadata", symbol_id=item_id, _external=True
                ),
                "title": "Get relation metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_relation", symbol_id=item_id, _external=True
                ),
                "title": "Edit this relation",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_relation", symbol_id=item_id, _external=True
                ),
                "title": "Delete relation",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_relation_symbols", _external=True),
                "title": "List of Relation Symbols",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_relation_symbol", _external=True),
                "title": "Create a new relation symbol",
                "method": "POST",
            },
        },
        "_embedded": {"relation_symbols": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/symbol/scalars", methods=["GET"])
def api_list_scalar_symbols():
    """
curl --silent --insecure https://localhost/api/v1/resources/symbol/scalars | python3 -c "
import sys, json

data = json.load(sys.stdin)
data.pop('_links', None)
if '_embedded' in data and 'scalar_symbols' in data['_embedded']:
    for entry in data['_embedded']['scalar_symbols']:
        entry.pop('_links', None)
        entry.pop('author_name_latex', None)

print(json.dumps(data, indent=2))
"

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )
        query_time_dict["pdg_api/api_list_scalar_symbols: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning("Found scalar symbol without ID during API list generation.")
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_scalar_metadata", symbol_id=item_id, _external=True
                ),
                "title": "Get scalar metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(".api_edit_scalar", symbol_id=item_id, _external=True),
                "title": "Edit this scalar",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_scalar", symbol_id=item_id, _external=True
                ),
                "title": "Delete scalar",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_scalar_symbols", _external=True),
                "title": "List of Scalar Symbols",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_scalar_symbol", _external=True),
                "title": "Create a new scalar symbol",
                "method": "POST",
            },
        },
        "_embedded": {"scalar_symbols": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/symbol/vectors", methods=["GET"])
def api_list_vector_symbols():
    """
    curl --silent --insecure https://localhost/api/v1/resources/vector/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "vector"
        )
        query_time_dict["pdg_api/api_list_vector_symbols: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning("Found vector symbol without ID during API list generation.")
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_vector_metadata", symbol_id=item_id, _external=True
                ),
                "title": "Get vector metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(".api_edit_vector", symbol_id=item_id, _external=True),
                "title": "Edit this vector",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_vector", symbol_id=item_id, _external=True
                ),
                "title": "Delete vector",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_vector_symbols", _external=True),
                "title": "List of Vector Symbols",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_vector_symbol", _external=True),
                "title": "Create a new vector symbol",
                "method": "POST",
            },
        },
        "_embedded": {"vector_symbols": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/symbol/matrices", methods=["GET"])
def api_list_matrix_symbols():
    """
    curl --silent --insecure https://localhost/api/v1/resources/matrix/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "matrix"
        )
        query_time_dict["pdg_api/api_list_matrix_symbols: get_nodes_of_type"] = (
            time.time() - query_start_time
        )

    # For HATEOAS, Transform the raw data to include item-level links
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")

        if not item_id:
            logger.warning("Found matrix symbol without ID during API list generation.")
            continue

        resource["_links"] = {
            "self": {
                "href": url_for(
                    ".api_matrix_metadata", symbol_id=item_id, _external=True
                ),
                "title": "Get matrix metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(".api_edit_matrix", symbol_id=item_id, _external=True),
                "title": "Edit this matrix",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_matrix", symbol_id=item_id, _external=True
                ),
                "title": "Delete matrix",
                "method": "DELETE",
            },
        }
        embedded_items.append(resource)

    # For HATEOAS, Construct the Collection-level HAL payload
    payload = {
        "count": len(embedded_items),
        "_links": {
            "self": {
                "href": url_for(".api_list_matrix_symbols", _external=True),
                "title": "List of Matrix Symbols",
                "type": "GET",
            },
            "up": {
                "href": url_for(".api_start_here", _external=True),
                "title": "API Home",
                "type": "GET",
            },
            "create": {
                "href": url_for(".api_create_matrix_symbol", _external=True),
                "title": "Create a new matrix symbol",
                "method": "POST",
            },
        },
        "_embedded": {"matrix_symbols": embedded_items},
    }

    response = make_response(jsonify(payload))
    response.headers["Content-Type"] = "application/hal+json"

    logger.info("[TRACE] end " + trace_id)
    return response


@api_bp.route("/v1/resources/derivation", methods=["POST"])
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
     https://localhost/api/v1/resources/derivation/create?derivation_name_latex=hello%20again\&derivation_reference_latex=this%20is\&derivation_abstract_latex=mine%20yours

    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"derivation_name_latex":"hello again", "derivation_reference_latex":"this was", "derivation_abstract_latex": "yes no"}' \
     https://localhost/api/v1/resources/derivation/create


    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
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
        logger.info("request.args=" + str(request.args))  # returns a dict

        derivation_name_latex = request.args.get("derivation_name_latex")
        if derivation_name_latex:
            logger.info("derivation_name:" + str(derivation_name_latex))
        else:  # was not provided
            return jsonify({"ERROR": "need to provide derivation_name_latex"})

        derivation_abstract_latex = request.args.get("derivation_abstract_latex")
        if derivation_abstract_latex:
            logger.info("derivation_abstract_latex " + str(derivation_abstract_latex))
        else:
            return jsonify({"ERROR": "need to provide derivation_abstract_latex"})

        derivation_reference_latex = request.args.get("derivation_reference_latex")
        if derivation_reference_latex:
            logger.info("derivation_reference_latex " + str(derivation_reference_latex))
        else:
            derivation_reference_latex = ""

    # additional reasons to reject user's input: derivation name is already in use
    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )
        query_time_dict[
            "pdg_api/api_create_derivation: get_nodes_of_type derivation"
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

    # TODO
    # author_name_latex = latex.make_string_safe_for_latex(current_user.email)
    author_name_latex = "ben"

    derivation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )
    logger.info("pdg_app/api_create_derivation: derivation_id=" + derivation_id)

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


@api_bp.route("/v1/resources/inference_rule", methods=["POST"])
def api_create_inference_rule():
    """
    curl --silent --insecure https://localhost/api/v1/resources/inference_rule/create

    >>>
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

        # required
        if "_latex" in data_from_user.keys():
            _latex = data_from_user[""]
        else:
            return jsonify({"ERROR": "need to provide _latex"})

    else:  # "Content-Type: application/x-www-form-urlencoded"
        logger.info("request.args=" + str(request.args))  # returns a dict
        # required
        _latex = request.args.get("_latex")
        if _latex:
            logger.info("_latex =" + _latex)
        else:
            return jsonify({"ERROR": "need to provide _latex"})

    return jsonify(
        {"STATUS": "inference rule added successfully", "query times": query_time_dict}
    )


@api_bp.route("/v1/resources/expression", methods=["POST"])
def api_create_expression():
    """

    curl --request POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --show-error --silent \
    https://localhost/api/v1/resources/expression/create?expression_latex_lhs=4*2\&expression_relation_latex==\&expression_latex_rhs=9 \
     | python3 -m json.tool


    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"expression_latex_lhs": "4^3", "expression_relation_latex": "=", "expression_latex_rhs": "k"}' \
     https://localhost/api/v1/resources/expression/create | python3 -m json.tool

    user-provided dictionary is required to have latex and name

    TODO: account for SymPy representation

    see `to_add_expression`

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

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
        logger.info("request.args=" + str(request.args))  # returns a dict

        # required
        expression_latex_lhs = request.args.get("expression_latex_lhs")
        if expression_latex_lhs:
            logger.info("expression_latex_lhs =" + expression_latex_lhs)
        else:
            return jsonify({"ERROR": "need to provide expression_latex_lhs"})

        # required
        expression_relation_latex = request.args.get("expression_relation_latex")
        if expression_relation_latex:
            logger.info("expression_relation_latex =" + expression_relation_latex)
        else:
            return jsonify({"ERROR": "need to provide expression_relation_latex"})

        # required
        expression_latex_rhs = request.args.get("expression_latex_rhs")
        if expression_latex_rhs:
            logger.info("expression_latex_rhs =" + expression_latex_rhs)
        else:
            return jsonify({"ERROR": "need to provide expression_latex_rhs"})

        # optional
        expression_latex_condition = request.args.get("expression_latex_condition")
        if expression_latex_condition:
            logger.info("expression_latex_condition =" + expression_latex_condition)
        else:
            expression_latex_condition = ""

        # optional
        expression_name_latex = request.args.get("expression_name_latex")
        if expression_name_latex:
            logger.info("expression_name_latex =" + expression_name_latex)
        else:
            expression_name_latex = ""

        # optional
        expression_reference_latex = request.args.get("expression_reference_latex")
        if expression_reference_latex:
            logger.info("expression_reference_latex =" + expression_reference_latex)
        else:
            expression_reference_latex = ""

        # optional
        expression_description_latex = request.args.get("expression_description_latex")
        if expression_description_latex:
            logger.info("expression_description_latex =" + expression_description_latex)
        else:
            expression_description_latex = ""

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
        query_time_dict["to_add_expression: list_nodes_of_type"] = round(
            time.time() - query_start_time, 3
        )

    logger.info("list_of_expression_dicts=" + str(list_of_expression_dicts))

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
        graphDB_Driver, query_time_dict
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


@api_bp.route("/v1/resources/symbol/scalar", methods=["POST"])
def api_create_scalar_symbol():
    """

    curl --request POST \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --show-error --silent \
    https://localhost/api/v1/resources/symbol/scalar/create?scalar_latex=a | python3 -m json.tool


    curl --request POST \
    --header "Content-Type: application/json" \
    --show-error --silent \
    --data '{"scalar_latex": "b"}' \
     https://localhost/api/v1/resources/symbol/scalar/create | python3 -m json.tool


    see `to_add_symbol_scalar`

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

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
        logger.info("request.args=" + str(request.args))  # returns a dict

        # required
        scalar_latex = request.args.get("scalar_latex")
        if scalar_latex:
            logger.info("scalar_latex =" + scalar_latex)
        else:
            return jsonify({"ERROR": "need to provide scalar_latex"})

        # optional
        scalar_name_latex = request.args.get("scalar_name_latex")
        if scalar_name_latex:
            logger.info("scalar_name_latex =" + scalar_name_latex)
        else:
            scalar_name_latex = ""

        # optional
        scalar_description_latex = request.args.get("scalar_description_latex")
        if scalar_description_latex:
            logger.info("scalar_description_latex =" + scalar_description_latex)
        else:
            scalar_description_latex = ""

        # optional
        scalar_reference_latex = request.args.get("scalar_reference_latex")
        if scalar_reference_latex:
            logger.info("scalar_reference_latex =" + scalar_reference_latex)
        else:
            scalar_reference_latex = ""

        # optional
        scalar_scope = request.args.get("scalar_scope")
        if scalar_scope:
            logger.info("scalar_scope =" + scalar_scope)
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
            logger.info("scalar_variable_or_constant =" + scalar_variable_or_constant)
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
            logger.info("scalar_domain =" + scalar_domain)
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
            logger.info("dimension_length =" + dimension_length)
        else:
            dimension_length = 0

        # optional
        dimension_time = request.args.get("dimension_time")
        if dimension_time:
            logger.info("dimension_time =" + dimension_time)
        else:
            dimension_time = 0

        # optional
        dimension_mass = request.args.get("dimension_mass")
        if dimension_mass:
            logger.info("dimension_mass =" + dimension_mass)
        else:
            dimension_mass = 0

        # optional
        dimension_temperature = request.args.get("dimension_temperature")
        if dimension_temperature:
            logger.info("dimension_temperature =" + dimension_temperature)
        else:
            dimension_temperature = 0

        # optional
        dimension_electric_charge = request.args.get("dimension_electric_charge")
        if dimension_electric_charge:
            logger.info("dimension_electric_charge =" + dimension_electric_charge)
        else:
            dimension_electric_charge = 0

        # optional
        dimension_amount_of_substance = request.args.get(
            "dimension_amount_of_substance"
        )
        if dimension_amount_of_substance:
            logger.info(
                "dimension_amount_of_substance =" + dimension_amount_of_substance
            )
        else:
            dimension_amount_of_substance = 0

        # optional
        dimension_luminous_intensity = request.args.get("dimension_luminous_intensity")
        if dimension_luminous_intensity:
            logger.info("dimension_luminous_intensity =" + dimension_luminous_intensity)
        else:
            dimension_luminous_intensity = 0

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    scalar_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
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


@api_bp.route("/v1/resources/symbol/vector", methods=["POST"])
def api_create_vector_symbol():
    """
    curl --silent --insecure https://localhost/api/v1/resources/symbol/vector/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    return jsonify({"STATUS": "TODO"})


@api_bp.route("/v1/resources/symbol/matrix", methods=["POST"])
def api_create_matrix_symbol():
    """
    curl --silent --insecure https://localhost/api/v1/resources/symbol/matrix/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    return jsonify({"STATUS": "TODO"})


@api_bp.route("/v1/resources/symbol/operation", methods=["POST"])
def api_create_operation_symbol():
    """
    curl --silent --insecure https://localhost/api/v1/resources/symbol/operation/create

    see `to_add_operation`

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

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
        logger.info("request.args=" + str(request.args))  # returns a dict
        # required
        operation_name_latex = request.args.get("operation_name_latex")
        if operation_name_latex:
            logger.info("operation_name_latex =" + operation_name_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_name_latex"})

        # required
        operation_latex = request.args.get("operation_latex")
        if operation_latex:
            logger.info("operation_latex =" + operation_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_latex"})

        # required
        operation_description_latex = request.args.get("operation_description_latex")
        if operation_description_latex:
            logger.info("operation_description_latex =" + operation_description_latex)
        else:
            return jsonify({"ERROR": "need to provide operation_description_latex"})

        # optional
        operation_reference_latex = request.args.get("operation_reference_latex")
        if operation_reference_latex:
            logger.info("operation_reference_latex =" + operation_reference_latex)
        else:
            operation_reference_latex = ""

        # required
        operation_argument_count = request.args.get("operation_argument_count")
        if operation_argument_count:
            logger.info("operation_argument_count =" + operation_argument_count)
        else:
            return jsonify({"ERROR": "need to provide operation_argument_count"})

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    operation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
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
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))

    return jsonify(
        {
            "STATUS": "operation symbol added successfully",
            "query times": query_time_dict,
        }
    )


@api_bp.route("/v1/resources/symbol/relation", methods=["POST"])
def api_create_relation_symbol():
    """
    curl --silent --insecure https://localhost/api/v1/resources/symbol/relation/create

    see `to_add_relation`
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

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
        logger.info("request.args=" + str(request.args))  # returns a dict
        # required
        relation_name_latex = request.args.get("relation_name_latex")
        if relation_name_latex:
            logger.info("relation_name_latex =" + relation_name_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_name_latex"})

        # required
        relation_latex = request.args.get("relation_latex")
        if relation_latex:
            logger.info("relation_latex =" + relation_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_latex"})

        # required
        relation_description_latex = request.args.get("relation_description_latex")
        if relation_description_latex:
            logger.info("relation_description_latex =" + relation_description_latex)
        else:
            return jsonify({"ERROR": "need to provide relation_description_latex"})

        # optional
        relation_reference_latex = request.args.get("relation_reference_latex")
        if relation_reference_latex:
            logger.info("relation_reference_latex =" + relation_reference_latex)
        else:
            relation_reference_latex = ""

    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    relation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
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
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))

    return jsonify(
        {"STATUS": "relation symbol added successfully", "query times": query_time_dict}
    )


@api_bp.route("/v1/resources/derivation/<string:derivation_id>/edit", methods=["POST"])
def api_edit_derivation(derivation_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/inference_rule/<string:infrule_id>/edit", methods=["POST"])
def api_edit_inference_rule(infrule_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/expression/<string:expression_id>/edit", methods=["POST"])
def api_edit_expression(expression_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/symbol/scalar/<string:symbol_id>/edit", methods=["POST"])
def api_edit_scalar(symbol_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/symbol/vector/<string:symbol_id>/edit", methods=["POST"])
def api_edit_vector(symbol_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/symbol/matrix/<string:symbol_id>/edit", methods=["POST"])
def api_edit_matrix(symbol_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route(
    "/v1/resources/symbol/operation/<string:symbol_id>/edit", methods=["POST"]
)
def api_edit_operation(symbol_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route("/v1/resources/symbol/relation/<string:symbol_id>/edit", methods=["POST"])
def api_edit_relation(symbol_id: str):
    return jsonify({"STATUS": "Nothing here yet"})


@api_bp.route(
    "/v1/resources/derivation/<string:derivation_id>/metadata", methods=["GET"]
)
def api_derivation_metadata(derivation_id: str):
    """
    curl --silent --insecure https://localhost/api/v1/resources/derivation/3445848/metadata | python3 -m json.tool
    {
        "abstract_latex": "my summary",
        "author_name_latex": "ben",
        "created_datetime": "2024-05-19_21-16-29-085813",
        "id": "3445848",
        "name_latex": "this is a new derivation"
    }

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    logger.info("derivation_id=" + derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    logger.info("derivation_dict=" + str(derivation_dict))

    logger.info("[TRACE] end " + trace_id)
    return jsonify(derivation_dict)


@api_bp.route(
    "/v1/resources/inference_rule/<string:infrule_id>/metadata", methods=["GET"]
)
def api_inference_rule_metadata(expression_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """

    # with graphDB_Driver.session() as session:
    #     OUTPUT = session.read_transaction(
    #         neo4j_query.FUNCTION_NAME
    #     )

    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/expression/<string:expression_id>/metadata", methods=["GET"]
)
def api_expression_metadata(expression_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """

    # with graphDB_Driver.session() as session:
    #     OUTPUT = session.read_transaction(
    #         neo4j_query.FUNCTION_NAME
    #     )

    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/scalar/<string:symbol_id>/metadata", methods=["GET"]
)
def api_scalar_metadata(symbol_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """

    # with graphDB_Driver.session() as session:
    #     OUTPUT = session.read_transaction(
    #         neo4j_query.FUNCTION_NAME
    #     )

    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/vector/<string:symbol_id>/metadata", methods=["GET"]
)
def api_vector_metadata(symbol_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """

    # with graphDB_Driver.session() as session:
    #     OUTPUT = session.read_transaction(
    #         neo4j_query.FUNCTION_NAME
    #     )

    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/matrix/<string:symbol_id>/metadata", methods=["GET"]
)
def api_matrix_metadata(symbol_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """

    # with graphDB_Driver.session() as session:
    #     OUTPUT = session.read_transaction(
    #         neo4j_query.FUNCTION_NAME
    #     )

    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/operation/<string:operation_id>/metadata", methods=["GET"]
)
def api_operation_metadata(operation_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    - list expressions that use this operation
    """

    with graphDB_Driver.session() as session:
        operation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "operation", operation_id
        )

    if operation_dict is None:
        return (
            jsonify(
                {
                    "error": "Not Found",
                    "message": f"Operation {operation_id} does not exist",
                    "_links": {
                        "index": {
                            "href": url_for("api_bp.some_index_route", _external=True)
                        }
                    },
                }
            ),
            404,
        )

    response = {
        "metadata": operation_dict,
        "_links": {
            "self": {
                "href": url_for(
                    "api_bp.api_operation_metadata",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "GET",
            },
            "update": {
                "href": url_for(
                    "api_bp.api_operation_metadata",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "PATCH",
                "description": "Update specific metadata fields",
            },
            "replace": {
                "href": url_for(
                    "api_bp.api_operation_metadata",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "PUT",
                "description": "Replace the entire metadata object",
            },
            "expressions": {
                "href": url_for(
                    "api_bp.api_list_operation_expressions",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "GET",
                "description": "List all expressions that use this operation",
            },
            "parent_operation": {
                "href": url_for(
                    "api_bp.api_operation_detail",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "GET",
            },
        },
    }

    return jsonify(response), 200


@api_bp.route(
    "/v1/resources/symbol/relation/<string:relation_id>/metadata", methods=["GET"]
)
def api_relation_metadata(relation_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    - list expressions that use this relation
    """

    with graphDB_Driver.session() as session:
        operation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "relation", relation_id
        )

    if operation_dict is None:
        jsonify({"STATUS": relation_id + " does not exist in the database"})

    return jsonify({"STATUS": "TODO"})


@api_bp.route("/v1/resources/derivation/<string:derivation_id>/steps", methods=["GET"])
def api_derivation_steps(derivation_id: str):
    """
    curl --silent --insecure https://localhost/api/v1/resources/derivation/3445848/step/list | python3 -m json.tool
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # if "derivation_id" in request.args:
    #     derivation_id = str(request.args["derivation_id"])
    # else:
    #     return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    logger.info("derivation_id=" + derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
        query_time_dict["pdg_api/: "] = time.time() - query_start_time
    # logger.info("list_of_steps=" + str(list_of_steps))

    logger.info("[TRACE] end " + trace_id)
    return jsonify(list_of_steps)


@api_bp.route(
    "/v1/resources/derivation/<string:derivation_id>/delete", methods=["DELETE"]
)
def api_delete_derivation(derivation_id: str):
    """
    derivation and all steps

    curl --silent --insecure https://localhost/api/v1/resources/derivation/<string:derivation_id>/delete
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # if request.is_json:  # "Content-Type: application/json"
    #     data_from_user = request.get_json()
    #     logger.info("data_from_user = " + str(data_from_user))

    #     # required
    #     if "derivation_id" in data_from_user.keys():
    #         derivation_id = data_from_user["derivation_id"]
    #     else:
    #         return jsonify({"ERROR": "need to provide derivation_id"})

    # else:  # "Content-Type: application/x-www-form-urlencoded"
    #     logger.info("request.args=" + str(request.args))  # returns a dict
    #     # required
    #     derivation_id = request.args.get("derivation_id")
    #     if derivation_id:
    #         logger.info("derivation_id =" + derivation_id)
    #     else:
    #         return jsonify({"ERROR": "need to provide derivation_id"})

    # does this derivation_id exist?

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
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
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
        query_time_dict[
            "pdg_app/to_review_derivation: get_list_of_steps_in_this_derivation"
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
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )
        query_time_dict["to_review_derivation: node_properties, derivation"] = round(
            time.time() - query_start_time, 3
        )
    logger.info("derivation_dict:" + str(derivation_dict))

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        session.write_transaction(neo4j_query.delete_node, derivation_id, "derivation")
        query_time_dict["pdg_app/to_review_derivation: delete_node derivation"] = round(
            time.time() - query_start_time, 3
        )
    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))

    return jsonify({"STATUS": "successfully deleted" + derivation_id})


@api_bp.route(
    "/v1/resources/inference_rule/<string:infrule_id>/delete", methods=["DELETE"]
)
def api_delete_inference_rule(infrule_id: str):
    """
    delete inference rule
    """
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/expression/<string:expression_id>/delete", methods=["DELETE"]
)
def api_delete_expression(expression_id: str):
    """
    delete expression
    """
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/scalar/<string:symbol_id>/delete", methods=["DELETE"]
)
def api_delete_scalar(symbol_id: str):
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/vector/<string:symbol_id>/delete", methods=["DELETE"]
)
def api_delete_vector(symbol_id: str):
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/matrix/<string:symbol_id>/delete", methods=["DELETE"]
)
def api_delete_matrix(symbol_id: str):
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/operation/<string:symbol_id>/delete", methods=["DELETE"]
)
def api_delete_operation(symbol_id: str):
    return jsonify({"STATUS": "TODO"})


@api_bp.route(
    "/v1/resources/symbol/relation/<string:symbol_id>/delete", methods=["DELETE"]
)
def api_delete_relation(symbol_id: str):
    return jsonify({"STATUS": "TODO"})


@api_bp.route("/v1/resources/sympy_check", methods=["GET", "POST"])
def api_sympy_check():
    """
    <https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/134>

    """
    user_input = request.args.get("sympy")

    try:
        expr = parse_expr(user_input)
    except tokenize.TokenError as err:
        return jsonify({"INVALID": str(err)})

    var_names = [str(s) for s in expr.free_symbols]

    return jsonify({"canonical": str(expr.canonical), "variables": str(var_names)})


@api_bp.route("/v1/resources/png_from_latex", methods=["GET", "POST"])
def api_png_from_latex():
    """
    `GET` method is necessary; otherwise user can't explore this endpoint from the browswer.

    Originally <string:user_input> was passed as an argument.
    Gemini 3.1 Pro says
        LaTeX strings contain characters like backslashes \, curly braces {}, and
        sometimes forward slashes /. Even with encodeURIComponent, sending this
        much complex data as a URL Path will frequently cause your Flask backend
        (or web server like Nginx/Apache) to reject the request with a "404 Not Found"
        or "400 Bad Request" before your Python code even runs.

    """

    user_input = request.args.get("tex")

    path_to_png = "/code/static/temp_for_latex_validation/"

    os.makedirs(path_to_png, exist_ok=True)

    hash_of_user_input = compute.hash_of_string(user_input)

    path_to_png_with_filename = path_to_png + hash_of_user_input + ".png"

    if not os.path.exists(path_to_png_with_filename):
        latex.create_png_from_latex(user_input, path_to_png, hash_of_user_input)

    # trim "/code" prior to returning the path
    path_to_png_with_filename_no_prefix_directory = path_to_png_with_filename[
        len("/code") :
    ]

    return jsonify({"png_location": path_to_png_with_filename_no_prefix_directory})


@api_bp.route("/v1/resources/cypher", methods=["GET"])
def api_cypher_query():
    """
    curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\) | python3 -m json.tool
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    user_query = request.args.get("query")

    logger.info("user_query: " + str(user_query))

    list_of_records = []  # type: List[str]
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
            "use: curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\)"
        ]

    logger.info("[TRACE] end " + trace_id)
    return jsonify(list_of_records)


# EOF
