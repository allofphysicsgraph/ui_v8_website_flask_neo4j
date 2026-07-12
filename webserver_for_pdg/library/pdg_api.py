#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2026
# http://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)


"""
this file separates the API routes from `pdg_app.py`

http://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask

HTTP methods supported by the APIs in this file:

- `GET`: request data from a specified resource.
- `DELETE`
- `POST`
- `PUT`
- `PATCH`: If you only want to change a single field (like updating just the email address without sending the name),

Both `POST` and `PUT` send data to a server to create/update a resource.

+---------------------------------------------------------------+--------------------------------------------------------------+
|                      `PUT`                                    |                `POST`                                         |
+===============================================================+==============================================================+
| Idempotent                                                    | Not Idempotent
+---------------------------------------------------------------+--------------------------------------------------------------+
| Multiple identical requests result in the same server state.  | Multiple identical requests will create duplicate resources. |
+---------------------------------------------------------------+--------------------------------------------------------------+
| Points to a specific resource, e.g., `/users/123`             | Points to a collection or action                             |
+---------------------------------------------------------------+--------------------------------------------------------------+
| Client specifies the resource ID in the URL.                  | Server generates the ID and returns it.                      |
+---------------------------------------------------------------+--------------------------------------------------------------+
| Must send the entire object payload; missing fields           | Sends only the necessary data to initialize the resource.    |
| are overwritten/deleted.                                      |                                                              |
+---------------------------------------------------------------+--------------------------------------------------------------+
| Success Status is `200 OK` or `204 No Content`.               | Success Status is `201 Created` with a `Location` header.    |
+---------------------------------------------------------------+--------------------------------------------------------------+

When sending data via a `POST` or `PUT` request, two common formats (specified via the Content-Type header) are:

- `application/json`
- `application/x-www-form-urlencoded`


"""

import time
import random
import datetime
import uuid
import tokenize
import os
import secrets
import functools
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


# https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/56
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


# The following `def hal_` were suggested 2026-07-11 by Claude Sonnet 5 on "medium"
# https://claude.ai/share/4331b79a-6794-4c68-b95d-82b0c4e47e75


def hal_link(href, title=None, name=None):
    link = {"href": href}
    if title:
        link["title"] = title
    if name:
        link["name"] = name
    return link


def hal_property(
    name,
    type_="text",
    required=False,
    read_only=False,
    options=None,
    regex=None,
    prompt=None,
    value=None,
):
    prop = {"name": name, "type": type_, "required": required, "readOnly": read_only}
    if prompt:
        prop["prompt"] = prompt
    if value is not None:
        prop["value"] = value
    if regex:
        prop["regex"] = regex
    if options:
        # HAL-FORMS "options" block for enumerated values
        prop["options"] = {
            "inline": options,
            "promptField": "prompt",
            "valueField": "value",
        }
    return prop


def hal_template(method, properties, title=None, content_type="application/json"):
    template = {"method": method, "contentType": content_type, "properties": properties}
    if title:
        template["title"] = title
    return template


def hal_response(data=None, links=None, embedded=None, templates=None, status=200):
    payload = {}
    if data:
        payload.update(data)
    payload["_links"] = links or {}
    if embedded:
        payload["_embedded"] = embedded
    if templates:
        payload["_templates"] = templates
    resp = jsonify(payload)
    resp.status_code = status
    resp.headers["Content-Type"] = "application/prs.hal-forms+json"
    return resp


def hal_error(message, status, links=None, title="Error"):
    payload = {
        "title": title,
        "status": status,
        "detail": message,
        "_links": links or {},
    }
    resp = jsonify(payload)
    resp.status_code = status
    resp.headers["Content-Type"] = "application/prs.hal-forms+json"
    return resp


def _get_configured_api_key():
    # Loaded lazily (rather than at import time) so tests/deployments can set
    # or change PDG_API_KEY without needing to reimport this module.
    return os.environ.get("PDG_API_KEY")


def _extract_bearer_token(auth_header):
    if not auth_header:
        return None
    parts = auth_header.split(None, 1)
    if len(parts) != 2 or parts[0].lower() != "bearer":
        return None
    return parts[1].strip()


def require_auth(view_func):
    """Require a valid `Authorization: Bearer <token>` header.

    Intended for routes that write to Neo4j (create/edit/delete). Read-only
    routes should not use this decorator.
    """

    @functools.wraps(view_func)
    def wrapped_view(*args, **kwargs):
        configured_key = _get_configured_api_key()
        if not configured_key:
            logger.critical("PDG_API_KEY is not configured; refusing write request")
            resp = hal_error(
                "Server is not configured for authentication",
                500,
                title="Server Misconfiguration",
            )
            resp.headers["WWW-Authenticate"] = 'Bearer realm="pdg_api"'
            return resp
        supplied_token = _extract_bearer_token(request.headers.get("Authorization"))
        if not supplied_token or not secrets.compare_digest(
            supplied_token, configured_key
        ):
            resp = hal_error(
                "A valid Authorization: Bearer <token> header is required for this operation",
                401,
                title="Unauthorized",
            )
            resp.headers["WWW-Authenticate"] = 'Bearer realm="pdg_api"'
            return resp
        return view_func(*args, **kwargs)

    return wrapped_view


@api_bp.route("/", methods=["GET"])
def api_start_here():
    """
    Entry point for the API using HATEOAS (HAL format).

    https://github.com/allofphysicsgraph/task-tracker/issues/134

    Hypermedia as the Engine of Application State (HATEOAS)
    https://en.wikipedia.org/wiki/HATEOAS

    .. code-block:: bash

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


@api_bp.route("/resources/derivations", methods=["GET"])
def api_list_derivations():
    """

    .. code-block:: bash


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

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )

    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")
        if not item_id:
            logger.critical("Found derivation without ID")
            raise Exception("Found derivation without ID")
        resource["_links"] = {
            "self": hal_link(
                url_for(
                    ".api_derivation_metadata", derivation_id=item_id, _external=True
                ),
                "Get derivation metadata",
            ),
            "steps": hal_link(
                url_for(".api_derivation_steps", derivation_id=item_id, _external=True),
                "View derivation steps",
            ),
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property("derivation_name_latex", required=True),
                    hal_property("derivation_abstract_latex", required=True),
                ],
                title="Edit derivation",
            ),
            "delete": hal_template("DELETE", [], title="Delete derivation"),
        }
        embedded_items.append(resource)

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links={
            "self": hal_link(
                url_for(".api_list_derivations", _external=True), "List of Derivations"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        embedded={"derivations": embedded_items},
        templates={
            "default": hal_template(
                "POST",
                [
                    hal_property(
                        "derivation_name_latex", required=True, prompt="Name (LaTeX)"
                    ),
                    hal_property(
                        "derivation_abstract_latex",
                        required=True,
                        prompt="Abstract (LaTeX)",
                    ),
                    hal_property(
                        "derivation_reference_latex",
                        required=False,
                        prompt="Reference (LaTeX)",
                    ),
                ],
                title="Create a new derivation",
            )
        },
    )


@api_bp.route("/resources/inference_rules", methods=["GET"])
def api_list_inference_rules():
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )
        # query_time_dict["pdg_api/api_list_inference_rules: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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


@api_bp.route("/resources/expressions", methods=["GET"])
def api_list_expressions():
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
        # query_time_dict["pdg_api/api_list_expressions: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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


@api_bp.route("/resources/symbol/operations", methods=["GET"])
def api_list_operation_symbols():
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "operation"
        )
        # query_time_dict["pdg_api/api_list_operation_symbols: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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
                    ".api_operation_metadata", operation_id=item_id, _external=True
                ),
                "title": "Get operation metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_operation", operation_id=item_id, _external=True
                ),
                "title": "Edit this operation",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_operation", operation_id=item_id, _external=True
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


@api_bp.route("/resources/symbol/relations", methods=["GET"])
def api_list_relation_symbols():
    """

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/symbol/relation/list | python3 -m json.tool

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "relation"
        )
        # query_time_dict[
        #     "pdg_api/api_list_relation_symbols: api_list_relation_symbols"
        # ] = (time.time() - query_start_time)

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
                    ".api_relation_metadata", relation_id=item_id, _external=True
                ),
                "title": "Get relation metadata",
                "type": "GET",
            },
            "edit": {
                "href": url_for(
                    ".api_edit_relation", relation_id=item_id, _external=True
                ),
                "title": "Edit this relation",
                "method": "POST",
            },
            "delete": {
                "href": url_for(
                    ".api_delete_relation", relation_id=item_id, _external=True
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


@api_bp.route("/resources/symbol/scalars", methods=["GET"])
def api_list_scalar_symbols():
    """


    .. code-block:: bash


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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )
        # query_time_dict["pdg_api/api_list_scalar_symbols: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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


@api_bp.route("/resources/symbol/vectors", methods=["GET"])
def api_list_vector_symbols():
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "vector"
        )
        # query_time_dict["pdg_api/api_list_vector_symbols: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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


@api_bp.route("/resources/symbol/matrices", methods=["GET"])
def api_list_matrix_symbols():
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "matrix"
        )
        # query_time_dict["pdg_api/api_list_matrix_symbols: get_nodes_of_type"] = (
        #     time.time() - query_start_time
        # )

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


@api_bp.route("/resources/derivation", methods=["POST"])
@require_auth
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

    .. code-block:: bash

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
        else:
            return hal_error(
                "need to provide derivation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "derivation_abstract_latex" in data_from_user.keys():
            derivation_abstract_latex = data_from_user["derivation_abstract_latex"]
        else:
            return hal_error(
                "need to provide derivation_abstract_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "derivation_reference_latex" in data_from_user.keys():
            derivation_reference_latex = data_from_user["derivation_reference_latex"]
        else:
            derivation_reference_latex = ""

    else:  # "Content-Type: application/x-www-form-urlencoded"
        logger.info("request.args=" + str(request.args))  # returns a dict

        derivation_name_latex = request.args.get("derivation_name_latex")
        if derivation_name_latex:
            logger.info("derivation_name:" + str(derivation_name_latex))
        else:
            return hal_error(
                "need to provide derivation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        derivation_abstract_latex = request.args.get("derivation_abstract_latex")
        if derivation_abstract_latex:
            logger.info("derivation_abstract_latex " + str(derivation_abstract_latex))
        else:
            return hal_error(
                "need to provide derivation_abstract_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        derivation_reference_latex = request.args.get("derivation_reference_latex")
        if derivation_reference_latex:
            logger.info("derivation_reference_latex " + str(derivation_reference_latex))
        else:
            derivation_reference_latex = ""

    # additional reasons to reject user's input: derivation name is already in use
    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )
        # query_time_dict[
        #     "pdg_api/api_create_derivation: get_nodes_of_type derivation"
        # ] = round(time.time() - query_start_time, 3)

    # print("list_of_derivation_dicts=", list_of_derivation_dicts)

    # reject input if derivation name is already in the database
    for derivation_dict in list_of_derivation_dicts:
        if derivation_dict["name_latex"] == derivation_name_latex:
            return hal_error(
                "derivation name '" + str(derivation_name_latex) + "' already exists",
                409,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Conflict",
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
        # query_start_time = time.time()
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
        # query_time_dict["pdg_api/api_create_derivation: add_derivation"] = round(
        #     time.time() - query_start_time, 3
        # )

    return jsonify(
        {"STATUS": "derivation " + str(derivation_name_latex) + " added successfully"}
    )


@api_bp.route("/resources/inference_rule", methods=["POST"])
@require_auth
def api_create_inference_rule():
    """

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/inference_rule/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    # query_time_dict = {}  # type: query_timing_result_type

    if request.is_json:  # "Content-Type: application/json"
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))

        # required
        if "_latex" in data_from_user.keys():
            _latex = data_from_user["_latex"]
        else:
            return hal_error(
                "need to provide _latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
    else:
        logger.info("request.args=" + str(request.args))
        _latex = request.args.get("_latex")
        if _latex:
            logger.info("_latex =" + _latex)
        else:
            return hal_error(
                "need to provide _latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
    return jsonify({"STATUS": "inference rule added successfully"})


@api_bp.route("/resources/expression", methods=["POST"])
@require_auth
def api_create_expression():
    """

    .. code-block:: bash

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
    up_link = {
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point")
    }
    if request.is_json:
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))
        if "expression_latex_lhs" in data_from_user.keys():
            expression_latex_lhs = data_from_user["expression_latex_lhs"]
        else:
            return hal_error(
                "need to provide expression_latex_lhs",
                400,
                links=up_link,
                title="Missing Field",
            )
        if "expression_relation_latex" in data_from_user.keys():
            expression_relation_latex = data_from_user["expression_relation_latex"]
        else:
            return hal_error(
                "need to provide expression_relation_latex",
                400,
                links=up_link,
                title="Missing Field",
            )
        if "expression_latex_rhs" in data_from_user.keys():
            expression_latex_rhs = data_from_user["expression_latex_rhs"]
        else:
            return hal_error(
                "need to provide expression_latex_rhs",
                400,
                links=up_link,
                title="Missing Field",
            )
        if "expression_latex_condition" in data_from_user.keys():
            expression_latex_condition = data_from_user["expression_latex_condition"]
        else:
            expression_latex_condition = ""
        if "expression_name_latex" in data_from_user.keys():
            expression_name_latex = data_from_user["expression_name_latex"]
        else:
            expression_name_latex = ""
        if "expression_reference_latex" in data_from_user.keys():
            expression_reference_latex = data_from_user["expression_reference_latex"]
        else:
            expression_reference_latex = ""
        if "expression_description_latex" in data_from_user.keys():
            expression_description_latex = data_from_user[
                "expression_description_latex"
            ]
        else:
            expression_description_latex = ""
    else:
        logger.info("request.args=" + str(request.args))
        expression_latex_lhs = request.args.get("expression_latex_lhs")
        if expression_latex_lhs:
            logger.info("expression_latex_lhs =" + expression_latex_lhs)
        else:
            return hal_error(
                "need to provide expression_latex_lhs",
                400,
                links=up_link,
                title="Missing Field",
            )
        expression_relation_latex = request.args.get("expression_relation_latex")
        if expression_relation_latex:
            logger.info("expression_relation_latex =" + expression_relation_latex)
        else:
            return hal_error(
                "need to provide expression_relation_latex",
                400,
                links=up_link,
                title="Missing Field",
            )
        expression_latex_rhs = request.args.get("expression_latex_rhs")
        if expression_latex_rhs:
            logger.info("expression_latex_rhs =" + expression_latex_rhs)
        else:
            return hal_error(
                "need to provide expression_latex_rhs",
                400,
                links=up_link,
                title="Missing Field",
            )
        expression_latex_condition = request.args.get("expression_latex_condition")
        if expression_latex_condition:
            logger.info("expression_latex_condition =" + expression_latex_condition)
        else:
            expression_latex_condition = ""
        expression_name_latex = request.args.get("expression_name_latex")
        if expression_name_latex:
            logger.info("expression_name_latex =" + expression_name_latex)
        else:
            expression_name_latex = ""
        expression_reference_latex = request.args.get("expression_reference_latex")
        if expression_reference_latex:
            logger.info("expression_reference_latex =" + expression_reference_latex)
        else:
            expression_reference_latex = ""
        expression_description_latex = request.args.get("expression_description_latex")
        if expression_description_latex:
            logger.info("expression_description_latex =" + expression_description_latex)
        else:
            expression_description_latex = ""
    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
    logger.info("list_of_expression_dicts=" + str(list_of_expression_dicts))
    for expression_dict in list_of_expression_dicts:
        if (
            expression_dict["latex_lhs"] == expression_latex_lhs
            and expression_dict["latex_relation"] == expression_relation_latex
            and (expression_dict["latex_rhs"] == expression_latex_rhs)
        ):
            return hal_error(
                "expression '"
                + str(expression_latex_lhs)
                + str(expression_relation_latex)
                + str(expression_latex_rhs)
                + "' already exists",
                409,
                links=up_link,
                title="Conflict",
            )
    author_name_latex = "ben"
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    expression_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )
    with graphDB_Driver.session() as session:
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
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "expression added successfully",
            "id": expression_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_expression_metadata",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Get the new expression",
            ),
            "collection": hal_link(
                url_for(".api_list_expressions", _external=True), "List of Expressions"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        templates={
            "edit": hal_template(
                "POST",
                [
                    hal_property("expression_name_latex", value=expression_name_latex),
                    hal_property(
                        "expression_latex_lhs",
                        required=True,
                        value=expression_latex_lhs,
                    ),
                    hal_property(
                        "expression_relation_latex",
                        required=True,
                        value=expression_relation_latex,
                    ),
                    hal_property(
                        "expression_latex_rhs",
                        required=True,
                        value=expression_latex_rhs,
                    ),
                    hal_property(
                        "expression_latex_condition", value=expression_latex_condition
                    ),
                    hal_property(
                        "expression_reference_latex", value=expression_reference_latex
                    ),
                    hal_property(
                        "expression_description_latex",
                        value=expression_description_latex,
                    ),
                ],
                title="Edit this expression",
            )
        },
        status=201,
    )


@api_bp.route("/resources/symbol/scalar", methods=["POST"])
@require_auth
def api_create_scalar_symbol():
    """

    .. code-block:: bash

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
    collection_link = {
        "up": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        )
    }
    if request.is_json:
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))
        if "scalar_latex" in data_from_user.keys():
            scalar_latex = data_from_user["scalar_latex"]
        else:
            return hal_error("need to provide scalar_latex", 400, links=collection_link)
        if "scalar_name_latex" in data_from_user.keys():
            scalar_name_latex = data_from_user["scalar_name_latex"]
        else:
            scalar_name_latex = ""
        if "scalar_description_latex" in data_from_user.keys():
            scalar_description_latex = data_from_user["scalar_description_latex"]
        else:
            scalar_description_latex = ""
        if "scalar_reference_latex" in data_from_user.keys():
            scalar_reference_latex = data_from_user["scalar_reference_latex"]
        else:
            scalar_reference_latex = ""
        if "scalar_scope" in data_from_user.keys():
            scalar_scope = data_from_user["scalar_scope"]
            if scalar_scope not in list_of_valid.scalar_scope:
                return hal_error(
                    scalar_scope
                    + " is not a valid scalar_scope; choose from "
                    + str(list_of_valid.scalar_scope),
                    400,
                    links=collection_link,
                )
        else:
            return hal_error("need to provide scalar_scope", 400, links=collection_link)
        if "scalar_variable_or_constant" in data_from_user.keys():
            scalar_variable_or_constant = data_from_user["scalar_variable_or_constant"]
            if scalar_variable_or_constant not in ["variable", "constant"]:
                return hal_error(
                    scalar_variable_or_constant
                    + " is not valid for scalar_variable_or_constant",
                    400,
                    links=collection_link,
                )
        else:
            scalar_variable_or_constant = "variable"
        if "scalar_domain" in data_from_user.keys():
            scalar_domain = data_from_user["scalar_domain"]
            if scalar_domain not in list_of_valid.scalar_domain:
                return hal_error(
                    scalar_domain
                    + " is not a valid scalar_domain; choose from "
                    + str(list_of_valid.scalar_domain),
                    400,
                    links=collection_link,
                )
        else:
            scalar_domain = "any"
        if "dimension_length" in data_from_user.keys():
            dimension_length = data_from_user["dimension_length"]
        else:
            dimension_length = 0
        if "dimension_time" in data_from_user.keys():
            dimension_time = data_from_user["dimension_time"]
        else:
            dimension_time = 0
        if "dimension_mass" in data_from_user.keys():
            dimension_mass = data_from_user["dimension_mass"]
        else:
            dimension_mass = 0
        if "dimension_temperature" in data_from_user.keys():
            dimension_temperature = data_from_user["dimension_temperature"]
        else:
            dimension_temperature = 0
        if "dimension_electric_charge" in data_from_user.keys():
            dimension_electric_charge = data_from_user["dimension_electric_charge"]
        else:
            dimension_electric_charge = 0
        if "dimension_amount_of_substance" in data_from_user.keys():
            dimension_amount_of_substance = data_from_user[
                "dimension_amount_of_substance"
            ]
        else:
            dimension_amount_of_substance = 0
        if "dimension_luminous_intensity" in data_from_user.keys():
            dimension_luminous_intensity = data_from_user[
                "dimension_luminous_intensity"
            ]
        else:
            dimension_luminous_intensity = 0
    else:
        logger.info("request.args=" + str(request.args))
        scalar_latex = request.args.get("scalar_latex")
        if scalar_latex:
            logger.info("scalar_latex =" + scalar_latex)
        else:
            return hal_error("need to provide scalar_latex", 400, links=collection_link)
        scalar_name_latex = request.args.get("scalar_name_latex")
        if scalar_name_latex:
            logger.info("scalar_name_latex =" + scalar_name_latex)
        else:
            scalar_name_latex = ""
        scalar_description_latex = request.args.get("scalar_description_latex")
        if scalar_description_latex:
            logger.info("scalar_description_latex =" + scalar_description_latex)
        else:
            scalar_description_latex = ""
        scalar_reference_latex = request.args.get("scalar_reference_latex")
        if scalar_reference_latex:
            logger.info("scalar_reference_latex =" + scalar_reference_latex)
        else:
            scalar_reference_latex = ""
        scalar_scope = request.args.get("scalar_scope")
        if scalar_scope:
            logger.info("scalar_scope =" + scalar_scope)
            if scalar_scope not in list_of_valid.scalar_scope:
                return hal_error(
                    scalar_scope
                    + " is not a valid scalar_scope; choose from "
                    + str(list_of_valid.scalar_scope),
                    400,
                    links=collection_link,
                )
        else:
            scalar_scope = "arbitrary"
        scalar_variable_or_constant = request.args.get("scalar_variable_or_constant")
        if scalar_variable_or_constant:
            logger.info("scalar_variable_or_constant =" + scalar_variable_or_constant)
            if scalar_variable_or_constant not in ["variable", "constant"]:
                return hal_error(
                    scalar_variable_or_constant
                    + " is not valid for scalar_variable_or_constant",
                    400,
                    links=collection_link,
                )
        else:
            scalar_variable_or_constant = "variable"
        scalar_domain = request.args.get("scalar_domain")
        if scalar_domain:
            logger.info("scalar_domain =" + scalar_domain)
            if scalar_domain not in list_of_valid.scalar_domain:
                return hal_error(
                    scalar_domain
                    + " is not a valid scalar_domain; choose from "
                    + str(list_of_valid.scalar_domain),
                    400,
                    links=collection_link,
                )
        else:
            scalar_domain = "any"
        dimension_length = request.args.get("dimension_length")
        if dimension_length:
            logger.info("dimension_length =" + dimension_length)
        else:
            dimension_length = 0
        dimension_time = request.args.get("dimension_time")
        if dimension_time:
            logger.info("dimension_time =" + dimension_time)
        else:
            dimension_time = 0
        dimension_mass = request.args.get("dimension_mass")
        if dimension_mass:
            logger.info("dimension_mass =" + dimension_mass)
        else:
            dimension_mass = 0
        dimension_temperature = request.args.get("dimension_temperature")
        if dimension_temperature:
            logger.info("dimension_temperature =" + dimension_temperature)
        else:
            dimension_temperature = 0
        dimension_electric_charge = request.args.get("dimension_electric_charge")
        if dimension_electric_charge:
            logger.info("dimension_electric_charge =" + dimension_electric_charge)
        else:
            dimension_electric_charge = 0
        dimension_amount_of_substance = request.args.get(
            "dimension_amount_of_substance"
        )
        if dimension_amount_of_substance:
            logger.info(
                "dimension_amount_of_substance =" + dimension_amount_of_substance
            )
        else:
            dimension_amount_of_substance = 0
        dimension_luminous_intensity = request.args.get("dimension_luminous_intensity")
        if dimension_luminous_intensity:
            logger.info("dimension_luminous_intensity =" + dimension_luminous_intensity)
        else:
            dimension_luminous_intensity = 0
    author_name_latex = "ben"
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    scalar_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )
    with graphDB_Driver.session() as session:
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
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"status": "scalar symbol added successfully", "scalar_id": scalar_id},
        links={
            "self": hal_link(
                url_for(".api_scalar_metadata", symbol_id=scalar_id, _external=True),
                "Get scalar metadata",
            ),
            "up": hal_link(
                url_for(".api_list_scalar_symbols", _external=True),
                "List of Scalar Symbols",
            ),
            "edit": hal_link(
                url_for(".api_edit_scalar", symbol_id=scalar_id, _external=True),
                "Edit this scalar",
            ),
            "delete": hal_link(
                url_for(".api_delete_scalar", symbol_id=scalar_id, _external=True),
                "Delete this scalar",
            ),
        },
        status=201,
    )


@api_bp.route("/resources/symbol/vector", methods=["POST"])
@require_auth
def api_create_vector_symbol():
    """

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/symbol/vector/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    collection_link = {
        "up": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        )
    }
    if request.is_json:
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))
        if "vector_latex" in data_from_user.keys():
            vector_latex = data_from_user["vector_latex"]
        else:
            return hal_error("need to provide vector_latex", 400, links=collection_link)
        if "vector_name_latex" in data_from_user.keys():
            vector_name_latex = data_from_user["vector_name_latex"]
        else:
            vector_name_latex = ""
        if "vector_description_latex" in data_from_user.keys():
            vector_description_latex = data_from_user["vector_description_latex"]
        else:
            vector_description_latex = ""
        if "vector_reference_latex" in data_from_user.keys():
            vector_reference_latex = data_from_user["vector_reference_latex"]
        else:
            vector_reference_latex = ""
        if "vector_is_composite" in data_from_user.keys():
            _raw_is_composite = data_from_user["vector_is_composite"]
            vector_is_composite = (
                _raw_is_composite
                if isinstance(_raw_is_composite, bool)
                else str(_raw_is_composite).lower() == "true"
            )
        else:
            vector_is_composite = False
        if "vector_size" in data_from_user.keys():
            vector_size = data_from_user["vector_size"]
        else:
            vector_size = "arbitrary"
        if "vector_orientation" in data_from_user.keys():
            vector_orientation = data_from_user["vector_orientation"]
        else:
            vector_orientation = "column"
        if "vector_number_of_entries" in data_from_user.keys():
            vector_number_of_entries = data_from_user["vector_number_of_entries"]
        else:
            vector_number_of_entries = ""
    else:
        logger.info("request.args=" + str(request.args))
        vector_latex = request.args.get("vector_latex")
        if vector_latex:
            logger.info("vector_latex =" + vector_latex)
        else:
            return hal_error("need to provide vector_latex", 400, links=collection_link)
        vector_name_latex = request.args.get("vector_name_latex")
        if vector_name_latex:
            logger.info("vector_name_latex =" + vector_name_latex)
        else:
            vector_name_latex = ""
        vector_description_latex = request.args.get("vector_description_latex")
        if vector_description_latex:
            logger.info("vector_description_latex =" + vector_description_latex)
        else:
            vector_description_latex = ""
        vector_reference_latex = request.args.get("vector_reference_latex")
        if vector_reference_latex:
            logger.info("vector_reference_latex =" + vector_reference_latex)
        else:
            vector_reference_latex = ""
        _raw_is_composite = request.args.get("vector_is_composite")
        if _raw_is_composite:
            vector_is_composite = _raw_is_composite.lower() == "true"
        else:
            vector_is_composite = False
        vector_size = request.args.get("vector_size")
        if vector_size:
            logger.info("vector_size =" + vector_size)
        else:
            vector_size = "arbitrary"
        vector_orientation = request.args.get("vector_orientation")
        if vector_orientation:
            logger.info("vector_orientation =" + vector_orientation)
        else:
            vector_orientation = "column"
        vector_number_of_entries = request.args.get("vector_number_of_entries")
        if vector_number_of_entries:
            logger.info("vector_number_of_entries =" + vector_number_of_entries)
        else:
            vector_number_of_entries = ""
    author_name_latex = "ben"
    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    symbol_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )
    with graphDB_Driver.session() as session:
        session.write_transaction(
            neo4j_query.add_vector_symbol,
            symbol_id,
            vector_name_latex,
            vector_latex,
            vector_description_latex,
            vector_reference_latex,
            vector_is_composite,
            vector_size,
            vector_orientation,
            vector_number_of_entries,
            now_str,
            author_name_latex,
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"status": "vector symbol added successfully", "symbol_id": symbol_id},
        links={
            "self": hal_link(
                url_for(".api_vector_metadata", symbol_id=symbol_id, _external=True),
                "Get vector metadata",
            ),
            "up": hal_link(
                url_for(".api_list_vector_symbols", _external=True),
                "List of Vector Symbols",
            ),
            "edit": hal_link(
                url_for(".api_edit_vector", symbol_id=symbol_id, _external=True),
                "Edit this vector",
            ),
            "delete": hal_link(
                url_for(".api_delete_vector", symbol_id=symbol_id, _external=True),
                "Delete this vector",
            ),
        },
        status=201,
    )


@api_bp.route("/resources/symbol/matrix", methods=["POST"])
@require_auth
def api_create_matrix_symbol():
    """

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/symbol/matrix/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    collection_link = {
        "up": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        )
    }
    if request.is_json:
        data_from_user = request.get_json()
        logger.info("data_from_user = " + str(data_from_user))
        if "matrix_latex" in data_from_user.keys():
            matrix_latex = data_from_user["matrix_latex"]
        else:
            return hal_error("need to provide matrix_latex", 400, links=collection_link)
        if "matrix_name_latex" in data_from_user.keys():
            matrix_name_latex = data_from_user["matrix_name_latex"]
        else:
            matrix_name_latex = ""
        if "matrix_description_latex" in data_from_user.keys():
            matrix_description_latex = data_from_user["matrix_description_latex"]
        else:
            matrix_description_latex = ""
        if "matrix_reference_latex" in data_from_user.keys():
            matrix_reference_latex = data_from_user["matrix_reference_latex"]
        else:
            matrix_reference_latex = ""
        if "matrix_is_composite" in data_from_user.keys():
            _raw_is_composite = data_from_user["matrix_is_composite"]
            matrix_is_composite = (
                _raw_is_composite
                if isinstance(_raw_is_composite, bool)
                else str(_raw_is_composite).lower() == "true"
            )
        else:
            matrix_is_composite = False
        if "matrix_size" in data_from_user.keys():
            matrix_size = data_from_user["matrix_size"]
        else:
            matrix_size = "arbitrary"
        if "matrix_number_of_rows" in data_from_user.keys():
            matrix_number_of_rows = data_from_user["matrix_number_of_rows"]
        else:
            matrix_number_of_rows = ""
        if "matrix_number_of_columns" in data_from_user.keys():
            matrix_number_of_columns = data_from_user["matrix_number_of_columns"]
        else:
            matrix_number_of_columns = ""
    else:
        logger.info("request.args=" + str(request.args))
        matrix_latex = request.args.get("matrix_latex")
        if matrix_latex:
            logger.info("matrix_latex =" + matrix_latex)
        else:
            return hal_error("need to provide matrix_latex", 400, links=collection_link)
        matrix_name_latex = request.args.get("matrix_name_latex")
        if matrix_name_latex:
            logger.info("matrix_name_latex =" + matrix_name_latex)
        else:
            matrix_name_latex = ""
        matrix_description_latex = request.args.get("matrix_description_latex")
        if matrix_description_latex:
            logger.info("matrix_description_latex =" + matrix_description_latex)
        else:
            matrix_description_latex = ""
        matrix_reference_latex = request.args.get("matrix_reference_latex")
        if matrix_reference_latex:
            logger.info("matrix_reference_latex =" + matrix_reference_latex)
        else:
            matrix_reference_latex = ""
        _raw_is_composite = request.args.get("matrix_is_composite")
        if _raw_is_composite:
            matrix_is_composite = _raw_is_composite.lower() == "true"
        else:
            matrix_is_composite = False
        matrix_size = request.args.get("matrix_size")
        if matrix_size:
            logger.info("matrix_size =" + matrix_size)
        else:
            matrix_size = "arbitrary"
        matrix_number_of_rows = request.args.get("matrix_number_of_rows")
        if matrix_number_of_rows:
            logger.info("matrix_number_of_rows =" + matrix_number_of_rows)
        else:
            matrix_number_of_rows = ""
        matrix_number_of_columns = request.args.get("matrix_number_of_columns")
        if matrix_number_of_columns:
            logger.info("matrix_number_of_columns =" + matrix_number_of_columns)
        else:
            matrix_number_of_columns = ""
    author_name_latex = "ben"
    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    symbol_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )
    with graphDB_Driver.session() as session:
        session.write_transaction(
            neo4j_query.add_matrix_symbol,
            symbol_id,
            matrix_name_latex,
            matrix_latex,
            matrix_description_latex,
            matrix_reference_latex,
            matrix_is_composite,
            matrix_size,
            matrix_number_of_rows,
            matrix_number_of_columns,
            now_str,
            author_name_latex,
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"status": "matrix symbol added successfully", "symbol_id": symbol_id},
        links={
            "self": hal_link(
                url_for(".api_matrix_metadata", symbol_id=symbol_id, _external=True),
                "Get matrix metadata",
            ),
            "up": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
            ),
            "edit": hal_link(
                url_for(".api_edit_matrix", symbol_id=symbol_id, _external=True),
                "Edit this matrix",
            ),
            "delete": hal_link(
                url_for(".api_delete_matrix", symbol_id=symbol_id, _external=True),
                "Delete this matrix",
            ),
        },
        status=201,
    )


@api_bp.route("/resources/symbol/operation", methods=["POST"])
@require_auth
def api_create_operation_symbol():
    """

    .. code-block:: bash

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
            return hal_error(
                "need to provide operation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "operation_latex" in data_from_user.keys():
            operation_latex = data_from_user["operation_latex"]
        else:
            return hal_error(
                "need to provide operation_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "operation_description_latex" in data_from_user.keys():
            operation_description_latex = data_from_user["operation_description_latex"]
        else:
            return hal_error(
                "need to provide operation_description_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "operation_reference_latex" in data_from_user.keys():
            operation_reference_latex = data_from_user["operation_reference_latex"]
        else:
            operation_reference_latex = ""

        # required
        if "operation_argument_count" in data_from_user.keys():
            operation_argument_count = data_from_user["operation_argument_count"]
        else:
            return hal_error(
                "need to provide operation_argument_count",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
    else:
        logger.info("request.args=" + str(request.args))
        operation_name_latex = request.args.get("operation_name_latex")
        if operation_name_latex:
            logger.info("operation_name_latex =" + operation_name_latex)
        else:
            return hal_error(
                "need to provide operation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        operation_latex = request.args.get("operation_latex")
        if operation_latex:
            logger.info("operation_latex =" + operation_latex)
        else:
            return hal_error(
                "need to provide operation_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        operation_description_latex = request.args.get("operation_description_latex")
        if operation_description_latex:
            logger.info("operation_description_latex =" + operation_description_latex)
        else:
            return hal_error(
                "need to provide operation_description_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
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
            return hal_error(
                "need to provide operation_argument_count",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
    author_name_latex = "ben"

    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    operation_id, query_time_dict = compute.generate_random_id(
        graphDB_Driver, query_time_dict
    )

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
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
    return jsonify({"STATUS": "operation symbol added successfully"})


@api_bp.route("/resources/symbol/relation", methods=["POST"])
@require_auth
def api_create_relation_symbol():
    """

    .. code-block:: bash

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
            return hal_error(
                "need to provide relation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "relation_latex" in data_from_user.keys():
            relation_latex = data_from_user["relation_latex"]
        else:
            return hal_error(
                "need to provide relation_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        if "relation_description_latex" in data_from_user.keys():
            relation_description_latex = data_from_user["relation_description_latex"]
        else:
            return hal_error(
                "need to provide relation_description_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
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
            return hal_error(
                "need to provide relation_name_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        relation_latex = request.args.get("relation_latex")
        if relation_latex:
            logger.info("relation_latex =" + relation_latex)
        else:
            return hal_error(
                "need to provide relation_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
        relation_description_latex = request.args.get("relation_description_latex")
        if relation_description_latex:
            logger.info("relation_description_latex =" + relation_description_latex)
        else:
            return hal_error(
                "need to provide relation_description_latex",
                400,
                links={
                    "up": hal_link(
                        url_for(".api_start_here", _external=True), "API Entry Point"
                    )
                },
                title="Missing Field",
            )
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
        # query_start_time = time.time()
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

    return jsonify({"STATUS": "relation symbol added successfully"})


@api_bp.route("/resources/derivation/<string:derivation_id>/edit", methods=["POST"])
@require_auth
def api_edit_derivation(derivation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )
    if derivation_dict is None:
        return hal_error(
            f"Derivation {derivation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_derivations", _external=True),
                    "List of Derivations",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "derivation_name_latex": "name_latex",
        "derivation_abstract_latex": "abstract_latex",
        "derivation_reference_latex": "reference_latex",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "derivation",
                    derivation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "derivation updated successfully",
            "id": derivation_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_edit_derivation", derivation_id=derivation_id, _external=True
                ),
                "Edit derivation",
            ),
            "derivation": hal_link(
                url_for(
                    ".api_derivation_metadata",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Get derivation metadata",
            ),
            "up": hal_link(
                url_for(".api_list_derivations", _external=True), "List of Derivations"
            ),
        },
    )


@api_bp.route("/resources/inference_rule/<string:infrule_id>/edit", methods=["POST"])
@require_auth
def api_edit_inference_rule(infrule_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        inference_rule_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "inference_rule", infrule_id
        )
    if inference_rule_dict is None:
        return hal_error(
            f"Inference rule {infrule_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_inference_rules", _external=True),
                    "List of Inference Rules",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "inference_rule_name_latex": "name_latex",
        "inference_rule_latex": "latex",
        "number_of_inputs": "number_of_inputs",
        "number_of_feeds": "number_of_feeds",
        "number_of_outputs": "number_of_outputs",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "inference_rule",
                    infrule_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "inference rule updated successfully",
            "id": infrule_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_edit_inference_rule", infrule_id=infrule_id, _external=True
                ),
                "Edit inference rule",
            ),
            "inference_rule": hal_link(
                url_for(
                    ".api_inference_rule_metadata",
                    infrule_id=infrule_id,
                    _external=True,
                ),
                "Get inference rule metadata",
            ),
            "up": hal_link(
                url_for(".api_list_inference_rules", _external=True),
                "List of Inference Rules",
            ),
        },
    )


@api_bp.route("/resources/expression/<string:expression_id>/edit", methods=["POST"])
@require_auth
def api_edit_expression(expression_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        existing_expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )
    if existing_expression_dict is None:
        return hal_error(
            f"Expression {expression_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_expressions", _external=True),
                    "List of Expressions",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    expression_latex_lhs = data_from_user.get(
        "expression_latex_lhs"
    ) or existing_expression_dict.get("latex_lhs", "")
    expression_relation_latex = data_from_user.get(
        "expression_relation_latex"
    ) or existing_expression_dict.get("latex_relation", "")
    expression_latex_rhs = data_from_user.get(
        "expression_latex_rhs"
    ) or existing_expression_dict.get("latex_rhs", "")
    expression_latex_condition = data_from_user.get(
        "expression_latex_condition"
    ) or existing_expression_dict.get("latex_condition", "")
    expression_name_latex = data_from_user.get(
        "expression_name_latex"
    ) or existing_expression_dict.get("name_latex", "")
    expression_description_latex = data_from_user.get(
        "expression_description_latex"
    ) or existing_expression_dict.get("description_latex", "")
    expression_reference_latex = data_from_user.get(
        "expression_reference_latex"
    ) or existing_expression_dict.get("reference_latex", "")
    author_name_latex = existing_expression_dict.get("author_name_latex", "ben")
    with graphDB_Driver.session() as session:
        session.write_transaction(
            neo4j_query.edit_expression,
            expression_id,
            expression_latex_lhs,
            expression_relation_latex,
            expression_latex_rhs,
            expression_latex_condition,
            expression_name_latex,
            expression_description_latex,
            expression_reference_latex,
            author_name_latex,
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"status": "expression updated successfully", "id": expression_id},
        links={
            "self": hal_link(
                url_for(
                    ".api_edit_expression", expression_id=expression_id, _external=True
                ),
                "Edit expression",
            ),
            "expression": hal_link(
                url_for(
                    ".api_expression_metadata",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Get expression metadata",
            ),
            "up": hal_link(
                url_for(".api_list_expressions", _external=True), "List of Expressions"
            ),
        },
    )


@api_bp.route("/resources/symbol/scalar/<string:symbol_id>/edit", methods=["POST"])
@require_auth
def api_edit_scalar(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", symbol_id
        )
    if scalar_dict is None:
        return hal_error(
            f"Scalar {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_scalar_symbols", _external=True),
                    "List of Scalar Symbols",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "scalar_latex": "latex",
        "scalar_name_latex": "name_latex",
        "scalar_description_latex": "description_latex",
        "scalar_reference_latex": "reference_latex",
        "scalar_scope": "scope",
        "scalar_variable_or_constant": "variable_or_constant",
        "scalar_domain": "domain",
        "dimension_length": "dimension_length",
        "dimension_time": "dimension_time",
        "dimension_mass": "dimension_mass",
        "dimension_temperature": "dimension_temperature",
        "dimension_electric_charge": "dimension_electric_charge",
        "dimension_amount_of_substance": "dimension_amount_of_substance",
        "dimension_luminous_intensity": "dimension_luminous_intensity",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "scalar",
                    symbol_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "scalar updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_scalar", symbol_id=symbol_id, _external=True),
                "Edit scalar",
            ),
            "scalar": hal_link(
                url_for(".api_scalar_metadata", symbol_id=symbol_id, _external=True),
                "Get scalar metadata",
            ),
            "up": hal_link(
                url_for(".api_list_scalar_symbols", _external=True),
                "List of Scalar Symbols",
            ),
        },
    )


@api_bp.route("/resources/symbol/vector/<string:symbol_id>/edit", methods=["POST"])
@require_auth
def api_edit_vector(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        vector_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "vector", symbol_id
        )
    if vector_dict is None:
        return hal_error(
            f"Vector {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_vector_symbols", _external=True),
                    "List of Vector Symbols",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "vector_latex": "latex",
        "vector_name_latex": "name_latex",
        "vector_description_latex": "description_latex",
        "vector_reference_latex": "reference_latex",
        "vector_orientation": "orientation",
        "vector_size": "size",
        "vector_number_of_entries": "number_of_entries",
        "vector_is_composite": "is_composite",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "vector",
                    symbol_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "vector updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_vector", symbol_id=symbol_id, _external=True),
                "Edit vector",
            ),
            "vector": hal_link(
                url_for(".api_vector_metadata", symbol_id=symbol_id, _external=True),
                "Get vector metadata",
            ),
            "up": hal_link(
                url_for(".api_list_vector_symbols", _external=True),
                "List of Vector Symbols",
            ),
        },
    )


@api_bp.route("/resources/symbol/matrix/<string:symbol_id>/edit", methods=["POST"])
@require_auth
def api_edit_matrix(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        matrix_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "matrix", symbol_id
        )
    if matrix_dict is None:
        return hal_error(
            f"Matrix {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_matrix_symbols", _external=True),
                    "List of Matrix Symbols",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "matrix_latex": "latex",
        "matrix_name_latex": "name_latex",
        "matrix_description_latex": "description_latex",
        "matrix_reference_latex": "reference_latex",
        "matrix_size": "size",
        "matrix_number_of_rows": "number_of_rows",
        "matrix_number_of_columns": "number_of_columns",
        "matrix_is_composite": "is_composite",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "matrix",
                    symbol_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "matrix updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_matrix", symbol_id=symbol_id, _external=True),
                "Edit matrix",
            ),
            "matrix": hal_link(
                url_for(".api_matrix_metadata", symbol_id=symbol_id, _external=True),
                "Get matrix metadata",
            ),
            "up": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
            ),
        },
    )


@api_bp.route(
    "/resources/symbol/operation/<string:operation_id>/edit", methods=["POST"]
)
@require_auth
def api_edit_operation(operation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        operation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "operation", operation_id
        )
    if operation_dict is None:
        return hal_error(
            f"Operation {operation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_operation_symbols", _external=True),
                    "List of Operation Symbols",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "operation_latex": "latex",
        "operation_name_latex": "name_latex",
        "operation_description_latex": "description_latex",
        "operation_reference_latex": "reference_latex",
        "operation_argument_count": "argument_count",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "operation",
                    operation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "operation updated successfully",
            "id": operation_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_edit_operation", operation_id=operation_id, _external=True
                ),
                "Edit operation",
            ),
            "operation": hal_link(
                url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "Get operation metadata",
            ),
            "up": hal_link(
                url_for(".api_list_operation_symbols", _external=True),
                "List of Operation Symbols",
            ),
        },
    )


@api_bp.route("/resources/symbol/relation/<string:relation_id>/edit", methods=["POST"])
@require_auth
def api_edit_relation(relation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        relation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "relation", relation_id
        )
    if relation_dict is None:
        return hal_error(
            f"Relation {relation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_relation_symbols", _external=True),
                    "List of Relation Symbols",
                )
            },
            title="Not Found",
        )
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "relation_latex": "latex",
        "relation_name_latex": "name_latex",
        "relation_description_latex": "description_latex",
        "relation_reference_latex": "reference_latex",
    }
    updated_fields = []
    with graphDB_Driver.session() as session:
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                session.write_transaction(
                    neo4j_query.edit_node_property,
                    "relation",
                    relation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                updated_fields.append(node_property)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "relation updated successfully",
            "id": relation_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_relation", relation_id=relation_id, _external=True),
                "Edit relation",
            ),
            "relation": hal_link(
                url_for(
                    ".api_relation_metadata", relation_id=relation_id, _external=True
                ),
                "Get relation metadata",
            ),
            "up": hal_link(
                url_for(".api_list_relation_symbols", _external=True),
                "List of Relation Symbols",
            ),
        },
    )


@api_bp.route("/resources/derivation/<string:derivation_id>/metadata", methods=["GET"])
def api_derivation_metadata(derivation_id: str):
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    if "derivation_id" in request.args:
        derivation_id = str(request.args["derivation_id"])
    else:
        return hal_error(
            "expecting 'derivation_id' parameter",
            400,
            links={
                "up": hal_link(
                    url_for(".api_start_here", _external=True), "API Entry Point"
                )
            },
            title="Missing Field",
        )
    logger.info("derivation_id=" + derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )
        # query_time_dict["pdg_api/: "] = time.time() - query_start_time
    logger.info("derivation_dict=" + str(derivation_dict))

    logger.info("[TRACE] end " + trace_id)
    return jsonify(derivation_dict)


@api_bp.route("/resources/inference_rule/<string:infrule_id>/metadata", methods=["GET"])
def api_inference_rule_metadata(infrule_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        inference_rule_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "inference_rule", infrule_id
        )
    if inference_rule_dict is None:
        return hal_error(
            f"Inference rule {infrule_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_inference_rules", _external=True),
                    "List of Inference Rules",
                )
            },
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": inference_rule_dict},
        links={
            "self": hal_link(
                url_for(
                    ".api_inference_rule_metadata",
                    infrule_id=infrule_id,
                    _external=True,
                ),
                "Get inference rule metadata",
            ),
            "edit": hal_link(
                url_for(
                    ".api_edit_inference_rule", infrule_id=infrule_id, _external=True
                ),
                "Edit this inference rule",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_inference_rule", infrule_id=infrule_id, _external=True
                ),
                "Delete this inference rule",
            ),
            "up": hal_link(
                url_for(".api_list_inference_rules", _external=True),
                "List of Inference Rules",
            ),
        },
    )


@api_bp.route("/resources/expression/<string:expression_id>/metadata", methods=["GET"])
def api_expression_metadata(expression_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )
    if expression_dict is None:
        return hal_error(
            f"Expression {expression_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_expressions", _external=True),
                    "List of Expressions",
                )
            },
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": expression_dict},
        links={
            "self": hal_link(
                url_for(
                    ".api_expression_metadata",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Get expression metadata",
            ),
            "edit": hal_link(
                url_for(
                    ".api_edit_expression", expression_id=expression_id, _external=True
                ),
                "Edit this expression",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_expression",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Delete this expression",
            ),
            "up": hal_link(
                url_for(".api_list_expressions", _external=True), "List of Expressions"
            ),
        },
    )


@api_bp.route("/resources/symbol/scalar/<string:symbol_id>/metadata", methods=["GET"])
def api_scalar_metadata(symbol_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", symbol_id
        )
    if scalar_dict is None:
        return hal_error(
            f"Scalar {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_scalar_symbols", _external=True),
                    "List of Scalar Symbols",
                )
            },
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": scalar_dict},
        links={
            "self": hal_link(
                url_for(".api_scalar_metadata", symbol_id=symbol_id, _external=True),
                "Get scalar metadata",
            ),
            "edit": hal_link(
                url_for(".api_edit_scalar", symbol_id=symbol_id, _external=True),
                "Edit this scalar",
            ),
            "delete": hal_link(
                url_for(".api_delete_scalar", symbol_id=symbol_id, _external=True),
                "Delete this scalar",
            ),
            "up": hal_link(
                url_for(".api_list_scalar_symbols", _external=True),
                "List of Scalar Symbols",
            ),
        },
    )


@api_bp.route("/resources/symbol/vector/<string:symbol_id>/metadata", methods=["GET"])
def api_vector_metadata(symbol_id: str):
    """
    What can be done:
    - get: read current
    - set: change existing values
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        vector_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "vector", symbol_id
        )
    if vector_dict is None:
        return hal_error(
            f"Vector {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_vector_symbols", _external=True),
                    "List of Vector Symbols",
                )
            },
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": vector_dict},
        links={
            "self": hal_link(
                url_for(".api_vector_metadata", symbol_id=symbol_id, _external=True),
                "Get vector metadata",
            ),
            "edit": hal_link(
                url_for(".api_edit_vector", symbol_id=symbol_id, _external=True),
                "Edit this vector",
            ),
            "delete": hal_link(
                url_for(".api_delete_vector", symbol_id=symbol_id, _external=True),
                "Delete this vector",
            ),
            "up": hal_link(
                url_for(".api_list_vector_symbols", _external=True),
                "List of Vector Symbols",
            ),
        },
    )


@api_bp.route("/resources/symbol/matrix/<string:symbol_id>/metadata", methods=["GET"])
def api_matrix_metadata(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        matrix_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "matrix", symbol_id
        )
    if matrix_dict is None:
        return hal_error(
            f"Matrix {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_matrix_symbols", _external=True),
                    "List of Matrix Symbols",
                )
            },
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": matrix_dict},
        links={
            "self": hal_link(
                url_for(".api_matrix_metadata", symbol_id=symbol_id, _external=True),
                "Get matrix metadata",
            ),
            "edit": hal_link(
                url_for(".api_edit_matrix", symbol_id=symbol_id, _external=True),
                "Edit this matrix",
            ),
            "delete": hal_link(
                url_for(".api_delete_matrix", symbol_id=symbol_id, _external=True),
                "Delete this matrix",
            ),
            "up": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
            ),
        },
    )


@api_bp.route(
    "/resources/symbol/operation/<string:operation_id>/metadata", methods=["GET"]
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
        return hal_error(
            f"Operation {operation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_start_here", _external=True), "API Entry Point"
                )
            },
            title="Not Found",
        )

    response = {
        "metadata": operation_dict,
        "_links": {
            "self": {
                "href": url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "method": "GET",
            },
            "update": {
                "href": url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "method": "PATCH",
                "description": "Update specific metadata fields",
            },
            "replace": {
                "href": url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "method": "PUT",
                "description": "Replace the entire metadata object",
            },
            "expressions": {
                "href": url_for(
                    ".api_list_operation_expressions",
                    operation_id=operation_id,
                    _external=True,
                ),
                "method": "GET",
                "description": "List all expressions that use this operation",
            },
            "parent_operation": {
                "href": url_for(
                    ".api_operation_detail", operation_id=operation_id, _external=True
                ),
                "method": "GET",
            },
        },
    }
    return (jsonify(response), 200)


@api_bp.route(
    "/resources/symbol/relation/<string:relation_id>/metadata", methods=["GET"]
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
        return hal_error(
            f"Relation {relation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_start_here", _external=True), "API Entry Point"
                )
            },
            title="Not Found",
        )
    return hal_response(
        data={"metadata": operation_dict},
        links={
            "self": hal_link(
                url_for(
                    ".api_relation_metadata", relation_id=relation_id, _external=True
                ),
                "Get relation metadata",
            ),
            "edit": hal_link(
                url_for(".api_edit_relation", relation_id=relation_id, _external=True),
                "Edit this relation",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_relation", relation_id=relation_id, _external=True
                ),
                "Delete this relation",
            ),
            "up": hal_link(
                url_for(".api_list_relation_symbols", _external=True),
                "List of Relation Symbols",
            ),
        },
    )


@api_bp.route("/resources/derivation/<string:derivation_id>/steps", methods=["GET"])
def api_derivation_steps(derivation_id: str):
    """

    .. code-block:: bash

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
    # query_time_dict = {}  # type: query_timing_result_type

    # if "derivation_id" in request.args:
    #     derivation_id = str(request.args["derivation_id"])
    # else:
    #     return jsonify({"ERROR": "expecting 'derivation_id' parameter"})

    logger.info("derivation_id=" + derivation_id)

    # try provided derivation_id; might not be a valid ID
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
        # query_time_dict["pdg_api/: "] = time.time() - query_start_time
    # logger.info("list_of_steps=" + str(list_of_steps))

    logger.info("[TRACE] end " + trace_id)
    return jsonify(list_of_steps)


@api_bp.route("/resources/derivation/<string:derivation_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_derivation(derivation_id: str):
    """
    derivation and all steps

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/derivation/<string:derivation_id>/delete

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE]  start " + trace_id)
    # query_time_dict = {} # type: query_timing_result_type
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )
        # query_time_dict['pdg_api/api_list_derivations: list_nodes_of_type, derivation'] = time.time() - query_start_time
    list_of_id = []
    for derivation_dict in list_of_dicts:
        list_of_id.append(derivation_dict["id"])
    if derivation_id not in list_of_id:
        return hal_error(
            derivation_id + " not found in list of derivation IDs",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_derivations", _external=True),
                    "List of Derivations",
                )
            },
            title="Derivation Not Found",
        )
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
        # query_time_dict['pdg_app/to_review_derivation: get_list_of_steps_in_this_derivation'] = round(time.time() - query_start_time, 3)
    for this_step_dict in list_of_step_dicts:
        with graphDB_Driver.session() as session:
            # query_start_time = time.time()
            session.write_transaction(
                neo4j_query.delete_node, this_step_dict["id"], "step"
            )
            # query_time_dict['pdg_app/to_review_derivation: delete_node step'] = round(time.time() - query_start_time, 3)
    derivation_dict = {}
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )
        # query_time_dict['to_review_derivation: node_properties, derivation'] = round(time.time() - query_start_time, 3)
    logger.info("derivation_dict:" + str(derivation_dict))
    with graphDB_Driver.session() as session:
        # query_start_time = time.time()
        session.write_transaction(neo4j_query.delete_node, derivation_id, "derivation")
        # query_time_dict['pdg_app/to_review_derivation: delete_node derivation'] = round(time.time() - query_start_time, 3)
    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
    return hal_response(
        data={
            "status": "successfully deleted " + derivation_id,
            "deleted_derivation_id": derivation_id,
            "deleted_step_count": len(list_of_step_dicts),
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_delete_derivation",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Delete derivation",
            ),
            "up": hal_link(
                url_for(".api_list_derivations", _external=True), "List of Derivations"
            ),
            "collection": hal_link(
                url_for(".api_list_derivations", _external=True), "Derivations"
            ),
        },
    )


@api_bp.route(
    "/resources/inference_rule/<string:infrule_id>/delete", methods=["DELETE"]
)
@require_auth
def api_delete_inference_rule(infrule_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        inference_rule_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "inference_rule", infrule_id
        )
    if inference_rule_dict is None:
        return hal_error(
            f"Inference rule {infrule_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_inference_rules", _external=True),
                    "List of Inference Rules",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, infrule_id, "inference_rule")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + infrule_id,
            "deleted_inference_rule_id": infrule_id,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_delete_inference_rule", infrule_id=infrule_id, _external=True
                ),
                "Delete inference rule",
            ),
            "up": hal_link(
                url_for(".api_list_inference_rules", _external=True),
                "List of Inference Rules",
            ),
            "collection": hal_link(
                url_for(".api_list_inference_rules", _external=True), "Inference Rules"
            ),
        },
    )


@api_bp.route("/resources/expression/<string:expression_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_expression(expression_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )
    if expression_dict is None:
        return hal_error(
            f"Expression {expression_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_expressions", _external=True),
                    "List of Expressions",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, expression_id, "expression")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + expression_id,
            "deleted_expression_id": expression_id,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_delete_expression",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Delete expression",
            ),
            "up": hal_link(
                url_for(".api_list_expressions", _external=True), "List of Expressions"
            ),
            "collection": hal_link(
                url_for(".api_list_expressions", _external=True), "Expressions"
            ),
        },
    )


@api_bp.route("/resources/symbol/scalar/<string:symbol_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_scalar(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", symbol_id
        )
    if scalar_dict is None:
        return hal_error(
            f"Scalar {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_scalar_symbols", _external=True),
                    "List of Scalar Symbols",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, symbol_id, "scalar")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_scalar_id": symbol_id,
        },
        links={
            "self": hal_link(
                url_for(".api_delete_scalar", symbol_id=symbol_id, _external=True),
                "Delete scalar",
            ),
            "up": hal_link(
                url_for(".api_list_scalar_symbols", _external=True),
                "List of Scalar Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_scalar_symbols", _external=True), "Scalar Symbols"
            ),
        },
    )


@api_bp.route("/resources/symbol/vector/<string:symbol_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_vector(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        vector_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "vector", symbol_id
        )
    if vector_dict is None:
        return hal_error(
            f"Vector {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_vector_symbols", _external=True),
                    "List of Vector Symbols",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, symbol_id, "vector")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_vector_id": symbol_id,
        },
        links={
            "self": hal_link(
                url_for(".api_delete_vector", symbol_id=symbol_id, _external=True),
                "Delete vector",
            ),
            "up": hal_link(
                url_for(".api_list_vector_symbols", _external=True),
                "List of Vector Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_vector_symbols", _external=True), "Vector Symbols"
            ),
        },
    )


@api_bp.route("/resources/symbol/matrix/<string:symbol_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_matrix(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        matrix_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "matrix", symbol_id
        )
    if matrix_dict is None:
        return hal_error(
            f"Matrix {symbol_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_matrix_symbols", _external=True),
                    "List of Matrix Symbols",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, symbol_id, "matrix")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_matrix_id": symbol_id,
        },
        links={
            "self": hal_link(
                url_for(".api_delete_matrix", symbol_id=symbol_id, _external=True),
                "Delete matrix",
            ),
            "up": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_matrix_symbols", _external=True), "Matrix Symbols"
            ),
        },
    )


@api_bp.route(
    "/resources/symbol/operation/<string:operation_id>/delete", methods=["DELETE"]
)
@require_auth
def api_delete_operation(operation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        operation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "operation", operation_id
        )
    if operation_dict is None:
        return hal_error(
            f"Operation {operation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_operation_symbols", _external=True),
                    "List of Operation Symbols",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, operation_id, "operation")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + operation_id,
            "deleted_operation_id": operation_id,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_delete_operation", operation_id=operation_id, _external=True
                ),
                "Delete operation",
            ),
            "up": hal_link(
                url_for(".api_list_operation_symbols", _external=True),
                "List of Operation Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_operation_symbols", _external=True),
                "Operation Symbols",
            ),
        },
    )


@api_bp.route(
    "/resources/symbol/relation/<string:relation_id>/delete", methods=["DELETE"]
)
@require_auth
def api_delete_relation(relation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        relation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "relation", relation_id
        )
    if relation_dict is None:
        return hal_error(
            f"Relation {relation_id} does not exist",
            404,
            links={
                "up": hal_link(
                    url_for(".api_list_relation_symbols", _external=True),
                    "List of Relation Symbols",
                )
            },
            title="Not Found",
        )
    with graphDB_Driver.session() as session:
        session.write_transaction(neo4j_query.delete_node, relation_id, "relation")
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + relation_id,
            "deleted_relation_id": relation_id,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_delete_relation", relation_id=relation_id, _external=True
                ),
                "Delete relation",
            ),
            "up": hal_link(
                url_for(".api_list_relation_symbols", _external=True),
                "List of Relation Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_relation_symbols", _external=True),
                "Relation Symbols",
            ),
        },
    )


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
    r"""
    `GET` method is necessary; otherwise user can't explore this endpoint from the browser.

    Originally <string:user_input> was passed as an argument.
    Gemini 3.1 Pro says

    .. code-block:: bash

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
    r"""

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\) | python3 -m json.tool

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # query_time_dict = {}  # type: query_timing_result_type

    user_query = request.args.get("query")

    logger.info("user_query: " + str(user_query))

    list_of_records = []  # type: List[str]
    if user_query:
        try:
            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session:
                # query_start_time = time.time()
                list_of_records = session.read_transaction(
                    neo4j_query.user_query, user_query
                )
                # query_time_dict["api_cypher_query: user_query"] = round(
                #     time.time() - query_start_time, 3
                # )
        except neo4j.exceptions.ClientError:
            list_of_records = ["WRITE OPERATIONS NOT ALLOWED (ClientError)"]
        except neo4j.exceptions.TransactionError:
            list_of_records = ["not a valid Cypher query (TransactionError)"]
    else:
        list_of_records = [
            "use: curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\\(n\\)%20RETURN%20DISTINCT%20labels\\(n\\)"
        ]

    logger.info("[TRACE] end " + trace_id)
    return jsonify(list_of_records)


# EOF
