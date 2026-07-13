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
|                      `PUT`                                    |                `POST`                                        |
+===============================================================+==============================================================+
| Idempotent                                                    | Not Idempotent                                               |
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


<HR>

Prompt:
You are a senior developer with decades of Python experience. You have deep knowledge of HATEOAS-compliant API and are recognized across the world for your quality software development.

Review this file and identify areas that need improvement. If there are things that are missing identify the gap explicitly.
I don't care about efficiency or latency.

If you have questions, AskUserQuestion

"""

import time
import datetime
import uuid
import tokenize
import os
import json
import secrets
import functools
from sympy.parsing.sympy_parser import parse_expr

from flask import (
    Blueprint,
    url_for,
    g,
    jsonify,
    request,
    make_response,
)

from typing import NewType, Dict, List
import neo4j  # type: ignore

# from flask_wtf.csrf import generate_csrf
# from initialize_flask import csrf  # imported so that we can set .exempt(bp)

import logging

logger = logging.getLogger(__name__)

from . import neo4j_query

# from . import compute
# from . import latex
from . import list_of_valid


from .compute import query_timing_result_type
from .compute import generate_random_id

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


def _load_configured_api_keys():
    """Parse PDG_API_KEYS, a JSON array of records identifying each caller.

    Expected shape:
    PDG_API_KEYS='[
        {"token": "long-random-string-1", "author_id": "ben", "author_name_latex": "Ben"},
        {"token": "long-random-string-2", "author_id": "alice", "author_name_latex": "Alice"}
    ]'

    Falls back to the legacy single-key PDG_API_KEY var (attributed to
    author_id "unknown") so existing deployments don't break on upgrade.
    Returns a list of dicts, or [] if nothing is configured / the JSON is malformed.
    """
    raw = os.environ.get("PDG_API_KEYS")
    if raw:
        try:
            records = json.loads(raw)
        except json.JSONDecodeError as err:
            logger.critical("PDG_API_KEYS is not valid JSON: " + str(err))
            return []
        valid_records = []
        for record in records:
            if (
                not isinstance(record, dict)
                or not record.get("token")
                or not record.get("author_id")
            ):
                logger.critical(
                    "Ignoring malformed PDG_API_KEYS entry (needs token + author_id): "
                    + str(record)
                )
                continue
            record.setdefault("author_name_latex", record["author_id"])
            valid_records.append(record)
        return valid_records
    legacy_key = os.environ.get("PDG_API_KEY")
    if legacy_key:
        logger.warning(
            "PDG_API_KEY is deprecated; migrate to PDG_API_KEYS with per-caller identities"
        )
        return [
            {
                "token": legacy_key,
                "author_id": "unknown",
                "author_name_latex": "unknown",
            }
        ]
    return []


def _extract_bearer_token(auth_header):
    if not auth_header:
        return None
    parts = auth_header.split(None, 1)
    if len(parts) != 2 or parts[0].lower() != "bearer":
        return None
    return parts[1].strip()


def _match_caller(supplied_token, configured_keys):
    """Constant-time-compare supplied_token against every configured token.

    Checks every record rather than stopping at the first mismatch so the
    response time doesn't leak which position in the list (if any) is close
    to matching.
    """
    matched = None
    for record in configured_keys:
        if secrets.compare_digest(supplied_token, record["token"]):
            matched = record
    return matched


def _stamp_last_modified(tx, node_type, node_id):
    """Record who last edited a node and when, using the same generic
    property-setter the editable_fields loops already rely on. Called only
    when an edit actually changed something, so untouched resources don't
    pick up a modified timestamp for a no-op request."""
    neo4j_query.edit_node_property(
        tx,
        node_type,
        node_id,
        "last_modified_by_latex",
        g.current_author["author_name_latex"],
    )
    neo4j_query.edit_node_property(
        tx,
        node_type,
        node_id,
        "last_modified_date",
        str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f")),
    )


def require_auth(view_func):
    """Require a valid `Authorization: Bearer <token>` header.

    Intended for routes that write to Neo4j (create/edit/delete). Read-only
    routes should not use this decorator.
    """

    @functools.wraps(view_func)
    def wrapped_view(*args, **kwargs):
        configured_keys = _load_configured_api_keys()
        if not configured_keys:
            logger.critical(
                "No API keys configured (PDG_API_KEYS); refusing write request"
            )
            resp = hal_error(
                "Server is not configured for authentication",
                500,
                title="Server Misconfiguration",
            )
            resp.headers["WWW-Authenticate"] = 'Bearer realm="pdg_api"'
            return resp
        supplied_token = _extract_bearer_token(request.headers.get("Authorization"))
        caller = (
            _match_caller(supplied_token, configured_keys) if supplied_token else None
        )
        if caller is None:
            resp = hal_error(
                "A valid Authorization: Bearer <token> header is required for this operation",
                401,
                title="Unauthorized",
            )
            resp.headers["WWW-Authenticate"] = 'Bearer realm="pdg_api"'
            return resp
        g.current_author = caller
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
            "whoami": {
                "href": url_for(".api_whoami", _external=True),
                "title": "Identify the current API caller",
                "type": "GET",
            },
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


@api_bp.route("/whoami", methods=["GET"])
@require_auth
def api_whoami():
    return hal_response(
        data={
            "author_id": g.current_author["author_id"],
            "author_name_latex": g.current_author["author_name_latex"],
        },
        links={
            "self": hal_link(
                url_for(".api_whoami", _external=True), "Current caller identity"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
    )


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
    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )

    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")
        resource["_links"] = {
            "self": hal_link(
                url_for(
                    ".api_inference_rule_metadata", infrule_id=item_id, _external=True
                ),
                "Get inference rule metadata",
            ),
            "edit": hal_link(
                url_for(".api_edit_inference_rule", infrule_id=item_id, _external=True),
                "Edit this inference rule",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_inference_rule", infrule_id=item_id, _external=True
                ),
                "Delete inference rule",
            ),
        }
        embedded_items.append(resource)

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links={
            "self": hal_link(
                url_for(".api_list_inference_rules", _external=True),
                "List of Inference Rules",
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        embedded={"inference_rules": embedded_items},
        templates={
            "default": hal_template(
                "POST",
                [
                    hal_property(
                        "inference_rule_name_latex",
                        required=True,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "inference_rule_latex",
                        required=True,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "number_of_inputs", type_="number", prompt="Number of Inputs"
                    ),
                    hal_property(
                        "number_of_feeds", type_="number", prompt="Number of Feeds"
                    ),
                    hal_property(
                        "number_of_outputs", type_="number", prompt="Number of Outputs"
                    ),
                ],
                title="Create a new inference rule",
            )
        },
    )


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
    logger.info('[TRACE] start ' + trace_id)
    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(neo4j_query.get_nodes_of_type, 'expression')
        
    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get('id')
        if not item_id:
            logger.warning('Found expression without ID during API list generation.')
            continue
            
        # 1. Read-only actions (GET) go strictly inside _links
        resource['_links'] = {
            'self': hal_link(url_for('.api_expression_metadata', expression_id=item_id, _external=True), 'Get expression metadata')
        }
        
        # 2. Non-safe actions (POST, DELETE) belong inside item-level _templates
        resource['_templates'] = {
            'edit': hal_template('POST', [
                hal_property('expression_latex_lhs', value=resource.get('latex_lhs'), required=True, prompt='LHS (LaTeX)'),
                hal_property('expression_relation_latex', value=resource.get('latex_relation'), required=True, prompt='Relation (LaTeX)'),
                hal_property('expression_latex_rhs', value=resource.get('latex_rhs'), required=True, prompt='RHS (LaTeX)'),
                hal_property('expression_latex_condition', value=resource.get('latex_condition'), prompt='Condition (LaTeX)'),
                hal_property('expression_name_latex', value=resource.get('name_latex'), prompt='Name (LaTeX)'),
                hal_property('expression_description_latex', value=resource.get('description_latex'), prompt='Description (LaTeX)'),
                hal_property('expression_reference_latex', value=resource.get('reference_latex'), prompt='Reference (LaTeX)')
            ], title='Edit this expression'),
            'delete': hal_template('DELETE', [], title='Delete this expression')
        }
        embedded_items.append(resource)
        
    # Collection-level read links
    links = {
        'self': hal_link(url_for('.api_list_expressions', _external=True), 'List of Expressions'),
        'up': hal_link(url_for('.api_start_here', _external=True), 'API Entry Point')
    }
    
    # Collection-level write templates (e.g., adding an Expression)
    templates = {
        'default': hal_template('POST', [
            hal_property('expression_latex_lhs', required=True, prompt='LHS (LaTeX)'),
            hal_property('expression_relation_latex', required=True, prompt='Relation (LaTeX)'),
            hal_property('expression_latex_rhs', required=True, prompt='RHS (LaTeX)'),
            hal_property('expression_latex_condition', prompt='Condition (LaTeX)'),
            hal_property('expression_name_latex', prompt='Name (LaTeX)'),
            hal_property('expression_description_latex', prompt='Description (LaTeX)'),
            hal_property('expression_reference_latex', prompt='Reference (LaTeX)')
        ], title='Create a new expression')
    }
    
    logger.info('[TRACE] end ' + trace_id)
    # Serves the correct application/prs.hal-forms+json media type automatically
    return hal_response(
        data={'count': len(embedded_items)},
        links=links,
        embedded={'expressions': embedded_items},
        templates=templates,
        status=200
    )


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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    if request.is_json:
        data_from_user = request.get_json()
        derivation_name_latex = data_from_user.get("derivation_name_latex")
        derivation_abstract_latex = data_from_user.get("derivation_abstract_latex")
        derivation_reference_latex = data_from_user.get(
            "derivation_reference_latex", ""
        )
    else:
        derivation_name_latex = request.args.get("derivation_name_latex")
        derivation_abstract_latex = request.args.get("derivation_abstract_latex")
        derivation_reference_latex = request.args.get("derivation_reference_latex", "")

    if not derivation_name_latex or not derivation_abstract_latex:
        return hal_error(
            "Missing required fields (derivation_name_latex, derivation_abstract_latex)",
            400,
            links={
                "up": hal_link(
                    url_for(".api_start_here", _external=True), "API Entry Point"
                )
            },
            title="Missing Field",
        )

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    query_time_dict = {}
    derivation_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        return neo4j_query.add_derivation(
            tx,
            derivation_id,
            now_str,
            derivation_name_latex,
            derivation_abstract_latex,
            derivation_reference_latex,
            author_name_latex,
        )

    with graphDB_Driver.session() as session:
        success = session.write_transaction(_create_atomic)

    if not success:
        return hal_error(
            f"derivation name '{derivation_name_latex}' already exists",
            409,
            links={
                "up": hal_link(
                    url_for(".api_start_here", _external=True), "API Entry Point"
                )
            },
            title="Conflict",
        )

    return hal_response(
        data={
            "status": "derivation "
            + str(derivation_name_latex)
            + " added successfully",
            "id": derivation_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_derivation_metadata",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Get the new derivation",
            ),
            "steps": hal_link(
                url_for(
                    ".api_derivation_steps", derivation_id=derivation_id, _external=True
                ),
                "View derivation steps",
            ),
            "collection": hal_link(
                url_for(".api_list_derivations", _external=True), "List of Derivations"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        templates={
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "derivation_name_latex",
                        required=True,
                        value=derivation_name_latex,
                    ),
                    hal_property(
                        "derivation_abstract_latex",
                        required=True,
                        value=derivation_abstract_latex,
                    ),
                    hal_property(
                        "derivation_reference_latex", value=derivation_reference_latex
                    ),
                ],
                title="Edit this derivation",
            )
        },
        status=201,
    )


@api_bp.route("/resources/inference_rule", methods=["POST"])
@require_auth
def api_create_inference_rule():
    """

    .. code-block:: bash

        curl --silent --insecure https://localhost/api/v1/resources/inference_rule/create

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point")
    }
    if request.is_json:
        data_from_user = request.get_json()
        inference_rule_name_latex = data_from_user.get("inference_rule_name_latex")
        inference_rule_latex = data_from_user.get("inference_rule_latex")
        number_of_inputs = data_from_user.get("number_of_inputs", 0)
        number_of_feeds = data_from_user.get("number_of_feeds", 0)
        number_of_outputs = data_from_user.get("number_of_outputs", 0)
    else:
        inference_rule_name_latex = request.args.get("inference_rule_name_latex")
        inference_rule_latex = request.args.get("inference_rule_latex")
        number_of_inputs = request.args.get("number_of_inputs", 0)
        number_of_feeds = request.args.get("number_of_feeds", 0)
        number_of_outputs = request.args.get("number_of_outputs", 0)

    if not inference_rule_name_latex or not inference_rule_latex:
        return hal_error(
            "Missing required fields (inference_rule_name_latex, inference_rule_latex)",
            400,
            links=up_link,
            title="Missing Field",
        )

    try:
        number_of_inputs = int(number_of_inputs)
        number_of_feeds = int(number_of_feeds)
        number_of_outputs = int(number_of_outputs)
    except (TypeError, ValueError):
        return hal_error(
            "number_of_inputs, number_of_feeds, and number_of_outputs must be integers",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if number_of_inputs < 0 or number_of_feeds < 0 or number_of_outputs < 0:
        return hal_error(
            "number_of_inputs, number_of_feeds, and number_of_outputs must not be negative",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if number_of_inputs == 0 and number_of_feeds == 0 and (number_of_outputs == 0):
        return hal_error(
            "at least one of number_of_inputs, number_of_feeds, or number_of_outputs must be greater than 0",
            400,
            links=up_link,
            title="Invalid Field",
        )

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}
    inference_rule_id, query_time_dict = generate_random_id(
        graphDB_Driver, query_time_dict
    )

    def _create_atomic(tx):
        return neo4j_query.add_inference_rule(
            tx,
            inference_rule_id,
            inference_rule_name_latex,
            inference_rule_latex,
            number_of_inputs,
            number_of_feeds,
            number_of_outputs,
            now_str,
            author_name_latex,
        )

    with graphDB_Driver.session() as session:
        success = session.write_transaction(_create_atomic)

    if not success:
        return hal_error(
            f"inference rule name '{inference_rule_name_latex}' already exists",
            409,
            links=up_link,
            title="Conflict",
        )

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "inference rule "
            + str(inference_rule_name_latex)
            + " added successfully",
            "id": inference_rule_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_inference_rule_metadata",
                    infrule_id=inference_rule_id,
                    _external=True,
                ),
                "Get the new inference rule",
            ),
            "collection": hal_link(
                url_for(".api_list_inference_rules", _external=True),
                "List of Inference Rules",
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        templates={
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "inference_rule_name_latex",
                        required=True,
                        value=inference_rule_name_latex,
                    ),
                    hal_property(
                        "inference_rule_latex",
                        required=True,
                        value=inference_rule_latex,
                    ),
                    hal_property(
                        "number_of_inputs", type_="number", value=number_of_inputs
                    ),
                    hal_property(
                        "number_of_feeds", type_="number", value=number_of_feeds
                    ),
                    hal_property(
                        "number_of_outputs", type_="number", value=number_of_outputs
                    ),
                ],
                title="Edit this inference rule",
            )
        },
        status=201,
    )


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
        expression_latex_lhs = data_from_user.get("expression_latex_lhs")
        expression_relation_latex = data_from_user.get("expression_relation_latex")
        expression_latex_rhs = data_from_user.get("expression_latex_rhs")
        expression_latex_condition = data_from_user.get(
            "expression_latex_condition", ""
        )
        expression_name_latex = data_from_user.get("expression_name_latex", "")
        expression_reference_latex = data_from_user.get(
            "expression_reference_latex", ""
        )
        expression_description_latex = data_from_user.get(
            "expression_description_latex", ""
        )
    else:
        expression_latex_lhs = request.args.get("expression_latex_lhs")
        expression_relation_latex = request.args.get("expression_relation_latex")
        expression_latex_rhs = request.args.get("expression_latex_rhs")
        expression_latex_condition = request.args.get("expression_latex_condition", "")
        expression_name_latex = request.args.get("expression_name_latex", "")
        expression_reference_latex = request.args.get("expression_reference_latex", "")
        expression_description_latex = request.args.get(
            "expression_description_latex", ""
        )

    if (
        not expression_latex_lhs
        or not expression_relation_latex
        or not expression_latex_rhs
    ):
        return hal_error(
            "Missing required expression formula fields",
            400,
            links=up_link,
            title="Missing Field",
        )

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    query_time_dict = {}
    expression_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        return neo4j_query.add_expression(
            tx,
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

    with graphDB_Driver.session() as session:
        success = session.write_transaction(_create_atomic)

    if not success:
        return hal_error(
            f"expression '{expression_latex_lhs}{expression_relation_latex}{expression_latex_rhs}' already exists",
            409,
            links=up_link,
            title="Conflict",
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


@api_bp.route("/resources/derivation/<string:derivation_id>/edit", methods=["POST"])
@require_auth
def api_edit_derivation(derivation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "derivation_name_latex": "name_latex",
        "derivation_abstract_latex": "abstract_latex",
        "derivation_reference_latex": "reference_latex",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(
            tx, "derivation", derivation_id
        )
        if existing is None:
            return False

        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                updated = neo4j_query.edit_node_property(
                    tx,
                    "derivation",
                    derivation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                if updated:
                    updated_fields.append(node_property)
        if updated_fields:
            _stamp_last_modified(tx, "derivation", derivation_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_edit_atomic)

    if not found:
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
    data_from_user = request.get_json() if request.is_json else request.args
    editable_fields = {
        "inference_rule_name_latex": "name_latex",
        "inference_rule_latex": "latex",
        "number_of_inputs": "number_of_inputs",
        "number_of_feeds": "number_of_feeds",
        "number_of_outputs": "number_of_outputs",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(
            tx, "inference_rule", infrule_id
        )
        if existing is None:
            return False

        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key):
                updated = neo4j_query.edit_node_property(
                    tx,
                    "inference_rule",
                    infrule_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                if updated:
                    updated_fields.append(node_property)
        if updated_fields:
            _stamp_last_modified(tx, "inference_rule", infrule_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_edit_atomic)

    if not found:
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
    data_from_user = request.get_json() if request.is_json else request.args
    last_modified_by_latex = g.current_author["author_name_latex"]

    def _edit_atomic(tx):
        existing_expression_dict = neo4j_query.get_node_properties_from_id(
            tx, "expression", expression_id
        )
        if existing_expression_dict is None:
            return "NOT_FOUND"

        # Build payload fellback values
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
        author_name_latex = existing_expression_dict.get("author_name_latex", "unknown")

        success = neo4j_query.edit_expression(
            tx,
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
        if not success:
            return "CONFLICT"

        _stamp_last_modified(tx, "expression", expression_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_edit_atomic)

    if status == "NOT_FOUND":
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
    elif status == "CONFLICT":
        return hal_error(
            "An expression with that formula already exists",
            409,
            links={
                "up": hal_link(
                    url_for(".api_list_expressions", _external=True),
                    "List of Expressions",
                )
            },
            title="Conflict",
        )

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "expression updated successfully",
            "id": expression_id,
            "last_modified_by_latex": last_modified_by_latex,
        },
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


@api_bp.route("/resources/derivation/<string:derivation_id>/metadata", methods=["GET"])
def api_derivation_metadata(derivation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    logger.info("derivation_id=" + derivation_id)
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
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": derivation_dict},
        links={
            "self": hal_link(
                url_for(
                    ".api_derivation_metadata",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Get derivation metadata",
            ),
            "steps": hal_link(
                url_for(
                    ".api_derivation_steps", derivation_id=derivation_id, _external=True
                ),
                "View derivation steps",
            ),
            "edit": hal_link(
                url_for(
                    ".api_edit_derivation", derivation_id=derivation_id, _external=True
                ),
                "Edit this derivation",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_derivation",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Delete this derivation",
            ),
            "up": hal_link(
                url_for(".api_list_derivations", _external=True), "List of Derivations"
            ),
        },
    )


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
    logger.info('[TRACE] start ' + trace_id)
    with graphDB_Driver.session() as session:
        expression_dict = session.read_transaction(neo4j_query.get_node_properties_from_id, 'expression', expression_id)
        
    if expression_dict is None:
        return hal_error(
            f'Expression {expression_id} does not exist', 
            404, 
            links={'up': hal_link(url_for('.api_list_expressions', _external=True), 'List of Expressions')}, 
            title='Not Found'
        )
        
    # Safe link transitions
    links = {
        'self': hal_link(url_for('.api_expression_metadata', expression_id=expression_id, _external=True), 'Get expression metadata'),
        'up': hal_link(url_for('.api_list_expressions', _external=True), 'List of Expressions')
    }
    
    # State-changing operations formatted as templates
    templates = {
        'edit': hal_template('POST', [
            hal_property('expression_latex_lhs', value=expression_dict.get('latex_lhs'), required=True, prompt='LHS (LaTeX)'),
            hal_property('expression_relation_latex', value=expression_dict.get('latex_relation'), required=True, prompt='Relation (LaTeX)'),
            hal_property('expression_latex_rhs', value=expression_dict.get('latex_rhs'), required=True, prompt='RHS (LaTeX)'),
            hal_property('expression_latex_condition', value=expression_dict.get('latex_condition'), prompt='Condition (LaTeX)'),
            hal_property('expression_name_latex', value=expression_dict.get('name_latex'), prompt='Name (LaTeX)'),
            hal_property('expression_description_latex', value=expression_dict.get('description_latex'), prompt='Description (LaTeX)'),
            hal_property('expression_reference_latex', value=expression_dict.get('reference_latex'), prompt='Reference (LaTeX)')
        ], title='Edit this expression'),
        'delete': hal_template('DELETE', [], title='Delete this expression'),
        'associate-symbol': hal_template('POST', [
            hal_property('symbol_id', required=True, prompt='Symbol ID to Associate')
        ], title='Associate symbol with this expression')
    }
    
    logger.info('[TRACE] end ' + trace_id)
    return hal_response(
        data={'metadata': expression_dict},
        links=links,
        templates=templates
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
    return hal_response(
        data={"metadata": operation_dict},
        links={
            "self": hal_link(
                url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "Get operation metadata",
            ),
            "edit": hal_link(
                url_for(
                    ".api_edit_operation", operation_id=operation_id, _external=True
                ),
                "Edit this operation",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_operation", operation_id=operation_id, _external=True
                ),
                "Delete this operation",
            ),
            "up": hal_link(
                url_for(".api_list_operation_symbols", _external=True),
                "List of Operation Symbols",
            ),
        },
    )


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
        relation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "relation", relation_id
        )

    if relation_dict is None:
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
        data={"metadata": relation_dict},
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
    formatted_steps = []
    for step in list_of_steps:
        step_copy = step.copy()
        step_id = step.get("id")
        step_copy["_links"] = {
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "View step details",
            ),
            "delete": hal_link(
                url_for(
                    ".api_delete_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Delete step",
            ),
        }
        formatted_steps.append(step_copy)
    logger.info("[TRACE] end " + trace_id)
    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property(
                    "inference_rule_id", required=True, prompt="Inference Rule ID"
                ),
                hal_property(
                    "sequence_index",
                    type_="number",
                    required=False,
                    prompt="Sequence Index (Auto if omitted)",
                ),
                hal_property(
                    "note_before_step_latex",
                    required=False,
                    prompt="Note Before Step (LaTeX)",
                ),
                hal_property(
                    "note_after_step_latex",
                    required=False,
                    prompt="Note After Step (LaTeX)",
                ),
            ],
            title="Create step in this derivation",
        )
    }
    return hal_response(
        data={"count": len(formatted_steps)},
        links={
            "self": hal_link(
                url_for(
                    ".api_derivation_steps", derivation_id=derivation_id, _external=True
                ),
                "Steps in this derivation",
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
        embedded={"steps": formatted_steps},
        templates=templates,
    )


@api_bp.route("/resources/derivation/<string:derivation_id>/steps", methods=["POST"])
@require_auth
def api_create_step(derivation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    data_from_user = request.get_json() if request.is_json else request.args
    inference_rule_id = data_from_user.get("inference_rule_id")
    if not inference_rule_id:
        return hal_error(
            "need to provide inference_rule_id", 400, title="Missing Field"
        )

    note_before_step_latex = data_from_user.get("note_before_step_latex", "")
    note_after_step_latex = data_from_user.get("note_after_step_latex", "")
    list_of_input_expression_IDs = data_from_user.get("inputs", [])
    list_of_feed_data = data_from_user.get("feeds", [])
    list_of_output_expression_IDs = data_from_user.get("outputs", [])
    sequence_index_req = data_from_user.get("sequence_index")

    if sequence_index_req is not None:
        try:
            sequence_index_req = int(sequence_index_req)
        except (TypeError, ValueError):
            return hal_error(
                "sequence_index must be an integer", 400, title="Invalid Field"
            )

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    # Pre-generate IDs for inline feed creations outside transaction to prevent nested session loops
    list_of_feed_IDs_or_dicts = []
    query_time_dict = {}
    for feed_item in list_of_feed_data:
        if isinstance(feed_item, dict):
            feed_latex = feed_item.get("feed_latex") or feed_item.get("latex")
            if not feed_latex:
                return hal_error(
                    "feed object must contain feed_latex", 400, title="Invalid Field"
                )
            feed_id, query_time_dict = generate_random_id(
                graphDB_Driver, query_time_dict
            )
            list_of_feed_IDs_or_dicts.append({"id": feed_id, "latex": feed_latex})
        else:
            list_of_feed_IDs_or_dicts.append(str(feed_item))

    step_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_step_atomic(tx):
        # Transactionally connects step with write lock ensuring atomic sequence index calculations
        result_data = neo4j_query.connect_step_to_derivation(
            tx,
            step_id,
            derivation_id,
            inference_rule_id,
            sequence_index_req,
            now_str,
            note_before_step_latex,
            note_after_step_latex,
            author_name_latex,
        )
        if not result_data:
            return None

        final_feed_ids = []
        for item in list_of_feed_IDs_or_dicts:
            if isinstance(item, dict):
                neo4j_query.add_feed(
                    tx, item["id"], item["latex"], now_str, author_name_latex
                )
                final_feed_ids.append(item["id"])
            else:
                final_feed_ids.append(item)

        if (
            len(list_of_input_expression_IDs) > 0
            or len(final_feed_ids) > 0
            or len(list_of_output_expression_IDs) > 0
        ):
            neo4j_query.connect_expressions_to_step(
                tx,
                step_id,
                now_str,
                list_of_input_expression_IDs,
                final_feed_ids,
                list_of_output_expression_IDs,
                author_name_latex,
            )

        return result_data

    with graphDB_Driver.session() as session:
        step_res = session.write_transaction(_create_step_atomic)

    if step_res is None:
        return hal_error(
            f"Derivation {derivation_id} or Inference Rule {inference_rule_id} does not exist",
            404,
            title="Not Found",
        )

    return hal_response(
        data={
            "status": "step added successfully",
            "step_id": step_id,
            "sequence_index": step_res["sequence_index"],
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            ),
            "derivation": hal_link(
                url_for(
                    ".api_derivation_metadata",
                    derivation_id=derivation_id,
                    _external=True,
                ),
                "Get Derivations",
            ),
            "steps": hal_link(
                url_for(
                    ".api_derivation_steps", derivation_id=derivation_id, _external=True
                ),
                "View steps",
            ),
        },
        status=201,
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>",
    methods=["GET"],
)
def api_get_step(derivation_id: str, step_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    def _read_step_details_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return None

        step_dict["inputs"] = neo4j_query.get_list_of_input_expressions_used_in_step(
            tx, step_id
        )
        step_dict["feeds"] = neo4j_query.get_feeds_used_in_step(tx, step_id)
        step_dict["outputs"] = neo4j_query.get_list_of_output_expressions_used_in_step(
            tx, step_id
        )
        step_dict["inference_rule"] = (
            neo4j_query.get_inference_rule_connected_to_step_ID(tx, step_id)
        )
        step_dict["sequence_index"] = neo4j_query.get_sequence_index_for_step(
            tx, step_id
        )
        return step_dict

    with graphDB_Driver.session() as session:
        full_step_data = session.read_transaction(_read_step_details_atomic)

    if full_step_data is None:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")

    links = {
        "self": hal_link(
            url_for(
                ".api_get_step",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Get Step",
        ),
        "derivation": hal_link(
            url_for(
                ".api_derivation_metadata", derivation_id=derivation_id, _external=True
            ),
            "Get Derivations",
        ),
        "steps": hal_link(
            url_for(
                ".api_derivation_steps", derivation_id=derivation_id, _external=True
            ),
            "View steps",
        ),
        "edit-notes": hal_link(
            url_for(
                ".api_edit_step_notes",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Edit step notes",
        ),
        "swap-input": hal_link(
            url_for(
                ".api_swap_step_input",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Swap input",
        ),
        "swap-feed": hal_link(
            url_for(
                ".api_swap_step_feed",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Swap feed",
        ),
        "swap-output": hal_link(
            url_for(
                ".api_swap_step_output",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Swap output",
        ),
        "add-feed": hal_link(
            url_for(
                ".api_add_step_feed",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Add inline feed to step",
        ),
        "delete": hal_link(
            url_for(
                ".api_delete_step",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
            "Delete step",
        ),
    }
    return hal_response(data=full_step_data, links=links)


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/edit-notes",
    methods=["POST"],
)
@require_auth
def api_edit_step_notes(derivation_id: str, step_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    before = data_from_user.get("note_before_step_latex", "")
    after = data_from_user.get("note_after_step_latex", "")

    def _edit_notes_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.edit_step_notes(tx, step_id, before, after)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_edit_notes_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": "step notes updated successfully"},
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/inputs/swap",
    methods=["POST"],
)
@require_auth
def api_swap_step_input(derivation_id: str, step_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    old_input_id = data_from_user.get("old_input_id")
    new_input_id = data_from_user.get("new_input_id")
    if not old_input_id or not new_input_id:
        return hal_error(
            "need to provide old_input_id and new_input_id", 400, title="Missing Fields"
        )

    def _swap_input_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.edit_step_input(tx, step_id, old_input_id, new_input_id)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_swap_input_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": "step input swapped successfully"},
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/feeds/swap",
    methods=["POST"],
)
@require_auth
def api_swap_step_feed(derivation_id: str, step_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    old_feed_id = data_from_user.get("old_feed_id")
    new_feed_id = data_from_user.get("new_feed_id")
    if not old_feed_id or not new_feed_id:
        return hal_error(
            "need to provide old_feed_id and new_feed_id", 400, title="Missing Fields"
        )

    def _swap_feed_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.edit_step_feed(tx, step_id, old_feed_id, new_feed_id)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_swap_feed_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": "step feed swapped successfully"},
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/outputs/swap",
    methods=["POST"],
)
@require_auth
def api_swap_step_output(derivation_id: str, step_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    old_output_id = data_from_user.get("old_output_id")
    new_output_id = data_from_user.get("new_output_id")
    if not old_output_id or not new_output_id:
        return hal_error(
            "need to provide old_output_id and new_output_id",
            400,
            title="Missing Fields",
        )

    def _swap_output_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.edit_step_output(tx, step_id, old_output_id, new_output_id)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_swap_output_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": "step output swapped successfully"},
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/feeds/<string:feed_id>",
    methods=["DELETE"],
)
@require_auth
def api_remove_step_feed(derivation_id: str, step_id: str, feed_id: str):
    def _remove_feed_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.disconnect_feed_from_step(tx, step_id, feed_id)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_remove_feed_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={
            "status": f"feed {feed_id} disconnected from step {step_id} successfully"
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/feeds",
    methods=["POST"],
)
@require_auth
def api_add_step_feed(derivation_id: str, step_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    feed_latex = data_from_user.get("feed_latex") or data_from_user.get("latex")
    if not feed_latex:
        return hal_error("need to provide feed_latex", 400, title="Missing Field")

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    query_time_dict = {}
    feed_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _add_feed_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False

        neo4j_query.add_feed(tx, feed_id, feed_latex, now_str, author_name_latex)
        existing_feeds = neo4j_query.get_feeds_used_in_step(tx, step_id)
        existing_feed_ids = [f["id"] for f in existing_feeds]
        existing_feed_ids.append(feed_id)

        existing_inputs = neo4j_query.get_list_of_input_expressions_used_in_step(
            tx, step_id
        )
        existing_input_ids = [e["id"] for e in existing_inputs]

        existing_outputs = neo4j_query.get_list_of_output_expressions_used_in_step(
            tx, step_id
        )
        existing_output_ids = [e["id"] for e in existing_outputs]

        neo4j_query.connect_expressions_to_step(
            tx,
            step_id,
            now_str,
            existing_input_ids,
            existing_feed_ids,
            existing_output_ids,
            author_name_latex,
        )
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_add_feed_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": "feed added successfully to step", "feed_id": feed_id},
        links={
            "self": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
        status=201,
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>",
    methods=["DELETE"],
)
@require_auth
def api_delete_step(derivation_id: str, step_id: str):
    def _delete_step_atomic(tx):
        step_dict = neo4j_query.get_node_properties_from_id(tx, "step", step_id)
        if step_dict is None:
            return False
        neo4j_query.delete_node(tx, step_id, "step")
        _stamp_last_modified(tx, "derivation", derivation_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_step_atomic)

    if not found:
        return hal_error(f"Step {step_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={"status": f"step {step_id} deleted successfully"},
        links={
            "steps": hal_link(
                url_for(
                    ".api_derivation_steps", derivation_id=derivation_id, _external=True
                ),
                "View steps",
            )
        },
    )


@api_bp.route("/resources/expressions/<string:expression_id>/symbols", methods=["POST"])
@require_auth
def api_associate_symbol_with_expression(expression_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    symbol_id = data_from_user.get("symbol_id")
    if not symbol_id:
        return hal_error("need to provide symbol_id", 400, title="Missing Field")

    def _associate_symbol_atomic(tx):
        expr_dict = neo4j_query.get_node_properties_from_id(
            tx, "expression", expression_id
        )
        if expr_dict is None:
            return "EXPR_NOT_FOUND"
        symbol_exists = neo4j_query.symbol_exists(tx, symbol_id)
        if not symbol_exists:
            return "SYMBOL_NOT_FOUND"

        neo4j_query.connect_symbol_to_expression(tx, symbol_id, expression_id)
        _stamp_last_modified(tx, "expression", expression_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_associate_symbol_atomic)

    if status == "EXPR_NOT_FOUND":
        return hal_error(
            f"Expression {expression_id} does not exist", 404, title="Not Found"
        )
    elif status == "SYMBOL_NOT_FOUND":
        return hal_error(f"Symbol {symbol_id} does not exist", 404, title="Not Found")

    return hal_response(
        data={
            "status": f"symbol {symbol_id} successfully associated with expression {expression_id}"
        },
        links={
            "expression": hal_link(
                url_for(
                    ".api_expression_metadata",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Get expression metadata",
            )
        },
    )


@api_bp.route(
    "/resources/expressions/<string:expression_id>/symbols/<string:symbol_id>",
    methods=["DELETE"],
)
@require_auth
def api_dissociate_symbol_from_expression(expression_id: str, symbol_id: str):
    def _dissociate_symbol_atomic(tx):
        expr_dict = neo4j_query.get_node_properties_from_id(
            tx, "expression", expression_id
        )
        if expr_dict is None:
            return False
        neo4j_query.disconnect_symbol_from_expression(tx, symbol_id, expression_id)
        _stamp_last_modified(tx, "expression", expression_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_dissociate_symbol_atomic)

    if not found:
        return hal_error(
            f"Expression {expression_id} does not exist", 404, title="Not Found"
        )
    return hal_response(
        data={
            "status": f"symbol {symbol_id} successfully dissociated from expression {expression_id}"
        },
        links={
            "expression": hal_link(
                url_for(
                    ".api_expression_metadata",
                    expression_id=expression_id,
                    _external=True,
                ),
                "Get expression metadata",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/feeds/<string:feed_id>/symbols",
    methods=["POST"],
)
@require_auth
def api_associate_symbol_with_feed(derivation_id: str, step_id: str, feed_id: str):
    data_from_user = request.get_json() if request.is_json else request.args
    symbol_id = data_from_user.get("symbol_id")
    if not symbol_id:
        return hal_error("need to provide symbol_id", 400, title="Missing Field")

    def _associate_feed_symbol_atomic(tx):
        feed_exists = neo4j_query.feed_exists(tx, feed_id)
        if not feed_exists:
            return "FEED_NOT_FOUND"
        symbol_exists = neo4j_query.symbol_exists(tx, symbol_id)
        if not symbol_exists:
            return "SYMBOL_NOT_FOUND"

        neo4j_query.connect_symbol_to_feed(tx, symbol_id, feed_id)
        _stamp_last_modified(tx, "step", step_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_associate_feed_symbol_atomic)

    if status == "FEED_NOT_FOUND":
        return hal_error(f"Feed {feed_id} does not exist", 404, title="Not Found")
    elif status == "SYMBOL_NOT_FOUND":
        return hal_error(f"Symbol {symbol_id} does not exist", 404, title="Not Found")

    return hal_response(
        data={
            "status": f"symbol {symbol_id} successfully associated with feed {feed_id}"
        },
        links={
            "step": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route(
    "/resources/derivation/<string:derivation_id>/steps/<string:step_id>/feeds/<string:feed_id>/symbols/<string:symbol_id>",
    methods=["DELETE"],
)
@require_auth
def api_dissociate_symbol_from_feed(
    derivation_id: str, step_id: str, feed_id: str, symbol_id: str
):
    def _dissociate_feed_symbol_atomic(tx):
        feed_exists = neo4j_query.feed_exists(tx, feed_id)
        if not feed_exists:
            return False
        neo4j_query.disconnect_symbol_from_feed(tx, symbol_id, feed_id)
        _stamp_last_modified(tx, "step", step_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_dissociate_feed_symbol_atomic)

    if not found:
        return hal_error(f"Feed {feed_id} does not exist", 404, title="Not Found")
    return hal_response(
        data={
            "status": f"symbol {symbol_id} successfully dissociated from feed {feed_id}"
        },
        links={
            "step": hal_link(
                url_for(
                    ".api_get_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
                "Get Step",
            )
        },
    )


@api_bp.route("/resources/derivation/<string:derivation_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_derivation(derivation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    def _delete_derivation_atomic(tx):
        derivation_dict = neo4j_query.get_node_properties_from_id(
            tx, "derivation", derivation_id
        )
        if derivation_dict is None:
            return None

        list_of_step_dicts = neo4j_query.get_list_of_steps_in_this_derivation(
            tx, derivation_id
        )
        for this_step_dict in list_of_step_dicts:
            neo4j_query.delete_node(tx, this_step_dict["id"], "step")

        neo4j_query.delete_node(tx, derivation_id, "derivation")
        return len(list_of_step_dicts)

    with graphDB_Driver.session() as session:
        deleted_steps_count = session.write_transaction(_delete_derivation_atomic)

    if deleted_steps_count is None:
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

    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
    return hal_response(
        data={
            "status": "successfully deleted " + derivation_id,
            "deleted_derivation_id": derivation_id,
            "deleted_step_count": deleted_steps_count,
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

    def _delete_infrule_atomic(tx):
        inference_rule_dict = neo4j_query.get_node_properties_from_id(
            tx, "inference_rule", infrule_id
        )
        if inference_rule_dict is None:
            return False
        neo4j_query.delete_node(tx, infrule_id, "inference_rule")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_infrule_atomic)

    if not found:
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

    def _delete_expression_atomic(tx):
        expression_dict = neo4j_query.get_node_properties_from_id(
            tx, "expression", expression_id
        )
        if expression_dict is None:
            return False
        neo4j_query.delete_node(tx, expression_id, "expression")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_expression_atomic)

    if not found:
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
