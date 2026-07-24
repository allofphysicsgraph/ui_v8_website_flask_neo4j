#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne
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

API authentication use with Curl:
```
curl -X POST http://localhost:5000/api/resources/derivation \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "derivation_name_latex": "E = mc^2",
    "derivation_abstract_latex": "Mass-energy equivalence derivation."
  }'
```

API authentication using `requests` library:
```
import requests

url = "http://localhost:5000/api/resources/derivation"
headers = {
    "Authorization": "Bearer YOUR_API_KEY",
    "Content-Type": "application/json"
}
payload = {
    "derivation_name_latex": "E = mc^2",
    "derivation_abstract_latex": "Mass-energy equivalence derivation."
}

response = requests.post(url, headers=headers, json=payload)
print(response.json())
```

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
import os
import json
import secrets
import functools
import tokenize

from flask import (
    Blueprint,
    url_for,
    g,
    jsonify,
    request,
    make_response,
)
from werkzeug.exceptions import BadRequest
from typing import Dict, List
import neo4j  # type: ignore

# from flask_wtf.csrf import generate_csrf
# from initialize_flask import csrf  # imported so that we can set .exempt(bp)

import logging

logger = logging.getLogger(__name__)
import sympy  # type: ignore
from sympy.parsing.sympy_parser import (
    parse_expr,
    standard_transformations,
    implicit_multiplication_application,
)
from . import neo4j_query

# from . import compute
from . import list_of_valid
from . import api_keys


from .compute import query_timing_result_type
from .compute import generate_random_id

from .initialize_neo4j import graphDB_Driver

# this works because app.py loads this file first

# http://flask.palletsprojects.com/en/1.1.x/tutorial/views/
api_bp = Blueprint("pdg_api", __name__, url_prefix="/api")

# --- sympy_check configuration -------------------------------------------------
# Maximum length (characters) accepted for a submitted expression. This endpoint
# is unauthenticated, so an unbounded input length would be an easy resource-
# exhaustion (DoS) vector via pathologically large/nested expressions.
MAX_SYMPY_INPUT_LENGTH = 500


# sympy's parse_expr() parses by transforming the input into a Python expression
# and running it through eval(). That is safe-ish for trusted input, but this
# route accepts arbitrary, unauthenticated user input, so eval() must not have
# access to Python builtins (__import__, open, exec, etc.). We build one shared,
# read-only globals dict at import time: it's seeded with `from sympy import *`
# (so function names like sin, cos, pi, Integral... resolve normally) and then
# __builtins__ is explicitly overridden with an empty mapping. sympy also
# compiles in 'eval' mode (a single expression, not statements), so assignment
# or import statements are rejected by the compiler before this even matters.
# Blocking __builtins__ alone is NOT sufficient: Python's attribute-traversal
# gadget (().__class__.__bases__[0].__subclasses__() -> ... -> subprocess.Popen)
# needs no builtins, only dunder attribute access on literals. The route below
# additionally rejects any input containing '__' before parsing; the two
# measures are both required, not redundant.
def _build_safe_sympy_globals():
    safe_globals = {}
    exec("from sympy import *", safe_globals)
    safe_globals["__builtins__"] = {}
    return safe_globals


_SYMPY_SAFE_GLOBALS = _build_safe_sympy_globals()
_SYMPY_TRANSFORMATIONS = standard_transformations + (
    implicit_multiplication_application,
)

HAL_FORMS_MIMETYPE = "application/prs.hal-forms+json"
PLAIN_JSON_MIMETYPE = "application/json"
_SUPPORTED_MIMETYPES = [HAL_FORMS_MIMETYPE, PLAIN_JSON_MIMETYPE]


def _negotiate_response_mimetype():
    """Pick a representation based on the client's Accept header.

    hal-forms+json remains the default representation (matches ties and
    missing/`*/*` Accept headers) so existing HAL clients are unaffected.
    A client that explicitly prefers `application/json` (either by asking
    for it alone, or by weighting it higher than hal-forms+json) gets the
    plain-JSON representation instead.
    """
    return request.accept_mimetypes.best_match(
        _SUPPORTED_MIMETYPES, default=HAL_FORMS_MIMETYPE
    )


def _strip_templates(value):
    """Recursively remove '_templates' keys (the HAL-FORMS extension) from a
    payload. Some list endpoints attach '_templates' directly onto each
    embedded resource, not just at the top level, so a shallow strip isn't
    enough to give plain application/json clients a clean representation."""
    if isinstance(value, dict):
        return {
            key: _strip_templates(val)
            for key, val in value.items()
            if key != "_templates"
        }
    if isinstance(value, list):
        return [_strip_templates(item) for item in value]
    return value


# https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/56
# BHP, 2025-01-09: I am not dealing with log-in requirements,
# so I am disabling csrf for the APIs as per
# https://flask-wtf.readthedocs.io/en/0.15.x/csrf/#exclude-views-from-protection
# https://flask-wtf.readthedocs.io/en/0.15.x/api/
# csrf.exempt(bp)


# The following `def hal_` were suggested 2026-07-11 by Claude Sonnet 5 on "medium"
# https://claude.ai/share/4331b79a-6794-4c68-b95d-82b0c4e47e75


def hal_link(href, title=None, name=None, method=None):
    link = {"href": href}
    if title:
        link["title"] = title
    if name:
        link["name"] = name
    if method:
        link["method"] = method
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


def hal_template(
    method, properties, title=None, content_type="application/json", target=None
):
    template = {"method": method, "contentType": content_type, "properties": properties}
    if title:
        template["title"] = title
    if target:
        template["target"] = target
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
    mimetype = _negotiate_response_mimetype()
    # _templates is a HAL-FORMS extension (application/prs.hal-forms+json); a
    # plain application/json client asked for standard JSON, so drop every
    # occurrence (including ones nested inside _embedded items) rather than
    # leaking a representation-specific field into that response.
    if mimetype == PLAIN_JSON_MIMETYPE:
        payload = _strip_templates(payload)
    resp = jsonify(payload)
    resp.status_code = status
    resp.headers["Content-Type"] = mimetype
    resp.headers["Vary"] = "Accept"
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
    resp.headers["Content-Type"] = _negotiate_response_mimetype()
    resp.headers["Vary"] = "Accept"
    return resp


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


def _parse_bool(value, default=False):
    if value is None:
        return default
    if isinstance(value, bool):
        return value
    if isinstance(value, str):
        return value.strip().lower() in ("true", "1", "yes", "on")
    return bool(value)


def require_auth(view_func):
    """Require a valid `Authorization: Bearer <token>` header.

    Intended for routes that write to Neo4j (create/edit/delete). Read-only
    routes should not use this decorator.
    """

    @functools.wraps(view_func)
    def wrapped_view(*args, **kwargs):
        configured_keys = api_keys.load_configured_api_keys()
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
        supplied_token = api_keys.extract_bearer_token(
            request.headers.get("Authorization")
        )
        caller = (
            api_keys.match_caller(supplied_token, configured_keys)
            if supplied_token
            else None
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


@api_bp.before_request
def _handle_options_request():
    """Self-descriptive OPTIONS support for every resource in this blueprint.

    Rather than writing a bespoke OPTIONS handler per route, this hook fires
    for any OPTIONS request that matched a route (request.url_rule is set)
    and returns a HAL response listing the transitions available on *this*
    URL, together with a standard Allow header. Requests that didn't match
    any route (url_rule is None) fall through so normal 404 handling still
    applies. This runs before @require_auth, so discovering what's possible
    on a resource never requires authentication.
    """
    if request.method != "OPTIONS" or request.url_rule is None:
        return None
    allowed_methods = sorted(request.url_rule.methods)
    transition_methods = sorted(
        m for m in request.url_rule.methods if m not in ("HEAD", "OPTIONS")
    )
    templates = {
        method.lower(): hal_template(method, [], title=f"{method} this resource")
        for method in transition_methods
    }
    resp = hal_response(
        data={
            "title": "Available transitions for this resource",
            "allowed_methods": allowed_methods,
        },
        links={"self": hal_link(request.base_url, "This resource")},
        templates=templates,
    )
    resp.headers["Allow"] = ", ".join(allowed_methods)
    return resp


@api_bp.errorhandler(BadRequest)
def _handle_bad_request(err):
    logger.info("[TRACE] BadRequest on %s %s: %r", request.method, request.path, err)
    return hal_error(
        "The request body could not be parsed. Please ensure it is well-formed JSON.",
        400,
        links={
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            )
        },
        title="Malformed Request",
    )


@api_bp.errorhandler(neo4j.exceptions.DriverError)
def _handle_neo4j_driver_error(err):
    """Centralized fallback for Neo4j driver-side failures that aren't caught
    locally by a view function.

    neo4j.exceptions.DriverError is the base class for connectivity/infrastructure
    problems raised by the driver itself -- ServiceUnavailable, SessionExpired,
    ConnectionPoolError, ResultError, TransactionError, etc. -- as opposed to
    neo4j.exceptions.Neo4jError, which covers errors the server reports about a
    specific query (bad Cypher, constraint violations, and similar). Those are a
    separate class of problem, are meaningful only for the query-carrying
    endpoints, and are intentionally left to be handled locally where they occur
    (see api_cypher_query's ClientError/TransactionError handling), because a
    generic driver-error response isn't a data-error, and mapping it to a 4xx
    would misrepresent it as the caller's fault.

    Without this handler, any of the ~54 session.write_transaction/read_transaction
    calls in this blueprint that don't have a local try/except would let a DB
    outage propagate past hal_error and out of Flask as an unhandled 500 with the
    default HTML error page, instead of a HAL-formatted JSON error.
    """
    logger.error(
        "[TRACE] Neo4j driver error on %s %s: %r", request.method, request.path, err
    )
    return hal_error(
        "The database is temporarily unavailable. Please try again shortly.",
        503,
        links={
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            )
        },
        title="Service Unavailable",
    )


@api_bp.errorhandler(neo4j.exceptions.ClientError)
@api_bp.errorhandler(neo4j.exceptions.TransientError)
@api_bp.errorhandler(neo4j.exceptions.DatabaseError)
def _handle_neo4j_query_error(err):
    """Centralized fallback for Neo4j server-reported errors (neo4j.exceptions.Neo4jError
    subclasses) that aren't caught locally by a view function.

    - ClientError: the query itself was rejected by the server (bad Cypher,
      constraint violation, forbidden operation, auth/token issue). Unlike
      api_cypher_query -- which accepts caller-supplied Cypher and already
      handles ClientError itself as a 400 -- these other endpoints build their
      own Cypher internally, so a ClientError here almost always means a bug in
      the app's query or a genuine data conflict rather than a malformed caller
      request. Surfaced as a 500, not a 4xx.
    - DatabaseError: an internal server-side failure while executing an
      otherwise-valid query (e.g. a corrupted store or execution failure).
      Also a 500 -- not the caller's fault, and an immediate retry is unlikely
      to help.
    - TransientError: a temporary condition (leader election in progress,
      DatabaseUnavailable, a write sent to a database that's momentarily
      read-only) that should typically resolve on retry. Surfaced as a 503,
      like the DriverError handler above.
    """
    status = 503 if isinstance(err, neo4j.exceptions.TransientError) else 500
    title = "Service Unavailable" if status == 503 else "Database Error"
    message = (
        "The database is temporarily unable to service this request. Please try again shortly."
        if status == 503
        else "The database reported an error while processing this request."
    )
    logger.error(
        "[TRACE] Neo4j %s on %s %s: %r",
        type(err).__name__,
        request.method,
        request.path,
        err,
    )
    return hal_error(
        message,
        status,
        links={
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            )
        },
        title=title,
    )


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
    # "self" is mandatory and points to the current resource.
    # The `.` prefix tells Flask to look for these functions within the current Blueprint.
    # use `_external=True` to generate absolute URLs (e.g., http://servername/v1/...) rather than relative paths. This is best practice for APIs, as clients may not know the base domain context.

    data = {
        "message": "Welcome to the Physics Derivation Graph API. Please explore the available resources."
    }
    links = {
        "self": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
        "derivations": hal_link(
            url_for(".api_list_derivations", _external=True), "List derivations"
        ),
        "inference_rules": hal_link(
            url_for(".api_list_inference_rules", _external=True), "List inference rules"
        ),
        "expressions": hal_link(
            url_for(".api_list_expressions", _external=True), "List expressions"
        ),
        "operation_symbols": hal_link(
            url_for(".api_list_operation_symbols", _external=True), "List operations"
        ),
        "relation_symbols": hal_link(
            url_for(".api_list_relation_symbols", _external=True), "List relations"
        ),
        "scalar_symbols": hal_link(
            url_for(".api_list_scalar_symbols", _external=True), "List scalars"
        ),
        "vector_symbols": hal_link(
            url_for(".api_list_vector_symbols", _external=True), "List vectors"
        ),
        "matrix_symbols": hal_link(
            url_for(".api_list_matrix_symbols", _external=True), "List matrices"
        ),
        "whoami": hal_link(
            url_for(".api_whoami", _external=True), "Identify the current API caller"
        ),
        "sympy_check": hal_link(
            url_for(".api_sympy_check", _external=True), "Check a sympy expression"
        ),
        "cypher_query": hal_link(
            url_for(".api_cypher_query", _external=True),
            "Query Neo4j database using Cypher",
        ),
    }
    return hal_response(data=data, links=links)


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


@api_bp.route("/resources/sympy_check", methods=["GET", "POST"])
def api_sympy_check():
    """Parse a user-supplied math expression with sympy and report its
    canonical form and free variables.

    <https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/134>

    on 2026-07-11, Claude Sonnet 5 on 'medium' warns that
    > parse_expr is not a safe sandboxed parser for untrusted strings —
    > it's a known vector for resource-exhaustion and code-execution-adjacent
    > abuse depending on the sympy version and transformations in use. There's
    > no auth, no length limit, no timeout.

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point")
    }

    if request.is_json:
        data_from_user = request.get_json()
        user_input = data_from_user.get("sympy")
    else:
        user_input = request.args.get("sympy")

    if not user_input:
        return hal_error(
            "Missing required field: sympy", 400, links=up_link, title="Missing Field"
        )

    if len(user_input) > MAX_SYMPY_INPUT_LENGTH:
        return hal_error(
            f"sympy expression exceeds maximum length of {MAX_SYMPY_INPUT_LENGTH} characters",
            400,
            links=up_link,
            title="Invalid Field",
        )

    if "__" in user_input:
        # Blocking __builtins__ in the eval globals (below) is not sufficient on
        # its own: Python's attribute-traversal sandbox-escape gadget
        # (().__class__.__bases__[0].__subclasses__() -> ... -> subprocess.Popen)
        # needs no builtins at all, only dunder attribute access on ordinary
        # literals. No legitimate sympy expression needs a double underscore,
        # so it's rejected outright rather than attempting to allow-list safe
        # dunder uses.
        return hal_error(
            "Expression must not contain double underscores",
            400,
            links=up_link,
            title="Invalid Expression",
        )

    try:
        expr = parse_expr(
            user_input,
            transformations=_SYMPY_TRANSFORMATIONS,
            global_dict=_SYMPY_SAFE_GLOBALS,
            evaluate=True,
        )
    except (
        tokenize.TokenError,
        SyntaxError,
        TypeError,
        AttributeError,
        sympy.SympifyError,
    ) as err:
        return hal_error(str(err), 400, links=up_link, title="Invalid Expression")
    except Exception as err:
        # Defensive catch-all: parse_expr can raise a variety of exception
        # types depending on the malformed input, and a 500 is never an
        # appropriate response to "the user typed something we can't parse".
        logger.warning(
            "[TRACE] " + trace_id + " unexpected sympy_check parse failure: " + str(err)
        )
        return hal_error(
            "Could not parse the supplied expression",
            400,
            links=up_link,
            title="Invalid Expression",
        )

    var_names = sorted((str(s) for s in expr.free_symbols))
    logger.info("[TRACE] " + trace_id + " variables: " + str(var_names))

    # SymPy does not define a `.canonical` attribute on standard algebraic
    # expression classes (such as Add, Mul, Pow, or Symbol)
    # In SymPy, only Relational objects (such as equations or inequalities
    # like `x < y`) feature a `.canonical` property (used to reorder the
    # sides of an inequality or move terms to a preferred side).
    # For standard algebraic expressions like Add, SymPy automatically
    # applies basic canonicalization and ordering during construction,
    # meaning the parsed expr itself is already in its default canonical form.
    canonical_str = str(expr.canonical) if hasattr(expr, "canonical") else str(expr)

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"input": user_input, "canonical": canonical_str, "variables": var_names},
        links={
            "self": hal_link(
                url_for(".api_sympy_check", _external=True), "Sympy expression check"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        templates={
            "default": hal_template(
                "GET",
                [
                    hal_property(
                        "sympy",
                        required=True,
                        prompt="Expression (sympy/Python syntax)",
                        value=user_input,
                    )
                ],
                title="Check another expression",
            )
        },
    )


EXAMPLE_CYPHER_QUERY = "MATCH (n) RETURN DISTINCT labels(n)"


@api_bp.route("/resources/cypher", methods=["GET", "POST"])
def api_cypher_query():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point")
    }
    self_template = {
        "default": hal_template(
            "GET",
            [
                hal_property(
                    "query",
                    required=True,
                    prompt="Cypher query (read-only)",
                    value=None,
                )
            ],
            title="Run a Cypher query",
            content_type="application/x-www-form-urlencoded",
        )
    }
    if request.is_json:
        data_from_user = request.get_json(silent=True) or {}
        user_query = data_from_user.get("query")
    else:
        user_query = request.args.get("query")
    logger.info("[TRACE] " + trace_id + " user_query: " + str(user_query))
    if not user_query:
        return hal_error(
            "Missing required field: query. Example: GET /api/resources/cypher?query="
            + EXAMPLE_CYPHER_QUERY,
            400,
            links=up_link,
            title="Missing Field",
        )
    try:
        with graphDB_Driver.session() as session:
            list_of_records = session.read_transaction(
                neo4j_query.user_query, user_query
            )
    except neo4j.exceptions.ClientError as err:
        logger.info("[TRACE] " + trace_id + " rejected ClientError: " + str(err))
        return hal_error(
            "Write operations are not allowed on this read-only endpoint (ClientError): "
            + str(err),
            400,
            links=up_link,
            title="Write Operation Rejected",
        )
    except neo4j.exceptions.TransactionError as err:
        logger.info("[TRACE] " + trace_id + " rejected TransactionError: " + str(err))
        return hal_error(
            "Not a valid Cypher query (TransactionError): " + str(err),
            400,
            links=up_link,
            title="Invalid Query",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "query": user_query,
            "count": len(list_of_records),
            "records": list_of_records,
        },
        links={
            "self": hal_link(
                url_for(".api_cypher_query", _external=True), "Cypher query result"
            ),
            "up": hal_link(
                url_for(".api_start_here", _external=True), "API Entry Point"
            ),
        },
        templates=self_template,
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
                    hal_property(
                        "derivation_name_latex",
                        required=True,
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "derivation_abstract_latex",
                        required=True,
                        value=resource.get("abstract_latex"),
                        prompt="Abstract (LaTeX)",
                    ),
                    hal_property(
                        "derivation_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                ],
                title="Edit this derivation",
                target=url_for(
                    ".api_edit_derivation", derivation_id=item_id, _external=True
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this derivation",
                target=url_for(
                    ".api_delete_derivation", derivation_id=item_id, _external=True
                ),
            ),
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
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "inference_rule_name_latex",
                        required=True,
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "inference_rule_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "number_of_inputs",
                        type_="number",
                        value=resource.get("number_of_inputs"),
                        prompt="Number of Inputs",
                    ),
                    hal_property(
                        "number_of_feeds",
                        type_="number",
                        value=resource.get("number_of_feeds"),
                        prompt="Number of Feeds",
                    ),
                    hal_property(
                        "number_of_outputs",
                        type_="number",
                        value=resource.get("number_of_outputs"),
                        prompt="Number of Outputs",
                    ),
                ],
                title="Edit this inference rule",
                target=url_for(
                    ".api_edit_inference_rule", infrule_id=item_id, _external=True
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this inference rule",
                target=url_for(
                    ".api_delete_inference_rule", infrule_id=item_id, _external=True
                ),
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
    logger.info("[TRACE] start " + trace_id)
    with graphDB_Driver.session() as session:
        list_of_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )

    embedded_items = []
    for item in list_of_dicts:
        resource = item.copy()
        item_id = resource.get("id")
        if not item_id:
            logger.warning("Found expression without ID during API list generation.")
            continue

        # 1. Read-only actions (GET) go strictly inside _links
        resource["_links"] = {
            "self": hal_link(
                url_for(
                    ".api_expression_metadata", expression_id=item_id, _external=True
                ),
                "Get expression metadata",
            )
        }

        # 2. Non-safe actions (POST, DELETE) belong inside item-level _templates
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "expression_latex_lhs",
                        value=resource.get("latex_lhs"),
                        required=True,
                        prompt="LHS (LaTeX)",
                    ),
                    hal_property(
                        "expression_relation_latex",
                        value=resource.get("latex_relation"),
                        required=True,
                        prompt="Relation (LaTeX)",
                    ),
                    hal_property(
                        "expression_latex_rhs",
                        value=resource.get("latex_rhs"),
                        required=True,
                        prompt="RHS (LaTeX)",
                    ),
                    hal_property(
                        "expression_latex_condition",
                        value=resource.get("latex_condition"),
                        prompt="Condition (LaTeX)",
                    ),
                    hal_property(
                        "expression_name_latex",
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "expression_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "expression_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                ],
                title="Edit this expression",
                target=url_for(
                    ".api_edit_expression", expression_id=item_id, _external=True
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this expression",
                target=url_for(
                    ".api_delete_expression", expression_id=item_id, _external=True
                ),
            ),
        }
        embedded_items.append(resource)

    # Collection-level read links
    links = {
        "self": hal_link(
            url_for(".api_list_expressions", _external=True), "List of Expressions"
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
    }

    # Collection-level write templates (e.g., adding an Expression)
    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property(
                    "expression_latex_lhs", required=True, prompt="LHS (LaTeX)"
                ),
                hal_property(
                    "expression_relation_latex",
                    required=True,
                    prompt="Relation (LaTeX)",
                ),
                hal_property(
                    "expression_latex_rhs", required=True, prompt="RHS (LaTeX)"
                ),
                hal_property("expression_latex_condition", prompt="Condition (LaTeX)"),
                hal_property("expression_name_latex", prompt="Name (LaTeX)"),
                hal_property(
                    "expression_description_latex", prompt="Description (LaTeX)"
                ),
                hal_property("expression_reference_latex", prompt="Reference (LaTeX)"),
            ],
            title="Create a new expression",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    # Serves the correct application/prs.hal-forms+json media type automatically
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"expressions": embedded_items},
        templates=templates,
        status=200,
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

        # Use hal_link helper to generate standard transitions
        resource["_links"] = {
            "self": hal_link(
                url_for(
                    ".api_operation_metadata", operation_id=item_id, _external=True
                ),
                "Get operation metadata",
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "operation_name_latex",
                        required=True,
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "operation_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "operation_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "operation_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "operation_argument_count",
                        type_="number",
                        required=True,
                        value=resource.get("argument_count"),
                        prompt="Number of Arguments",
                    ),
                ],
                title="Edit this operation symbol",
                target=url_for(
                    ".api_edit_operation", operation_id=item_id, _external=True
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this operation symbol",
                target=url_for(
                    ".api_delete_operation", operation_id=item_id, _external=True
                ),
            ),
        }
        embedded_items.append(resource)

    links = {
        "self": hal_link(
            url_for(".api_list_operation_symbols", _external=True),
            "List of Operation Symbols",
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Home"),
    }

    # Expose the creation option as a HAL-Forms template instead of a custom POST link
    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property(
                    "operation_name_latex", required=True, prompt="Name (LaTeX)"
                ),
                hal_property(
                    "operation_latex", required=True, prompt="LaTeX Representation"
                ),
                hal_property(
                    "operation_description_latex", prompt="Description (LaTeX)"
                ),
                hal_property("operation_reference_latex", prompt="Reference (LaTeX)"),
                hal_property(
                    "operation_argument_count",
                    type_="number",
                    required=True,
                    prompt="Number of Arguments",
                ),
            ],
            title="Create a new operation symbol",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"operation_symbols": embedded_items},
        templates=templates,
    )


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
            "self": hal_link(
                url_for(".api_relation_metadata", relation_id=item_id, _external=True),
                "Get relation metadata",
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "relation_name_latex",
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "relation_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "relation_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "relation_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                ],
                title="Edit this relation symbol",
                target=url_for(
                    ".api_edit_relation", relation_id=item_id, _external=True
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this relation symbol",
                target=url_for(
                    ".api_delete_relation", relation_id=item_id, _external=True
                ),
            ),
        }
        embedded_items.append(resource)

    links = {
        "self": hal_link(
            url_for(".api_list_relation_symbols", _external=True),
            "List of Relation Symbols",
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
    }

    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property("relation_name_latex", prompt="Name (LaTeX)"),
                hal_property(
                    "relation_latex", required=True, prompt="LaTeX Representation"
                ),
                hal_property(
                    "relation_description_latex", prompt="Description (LaTeX)"
                ),
                hal_property("relation_reference_latex", prompt="Reference (LaTeX)"),
            ],
            title="Create a new relation symbol",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"relation_symbols": embedded_items},
        templates=templates,
    )


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
            "self": hal_link(
                url_for(".api_scalar_metadata", symbol_id=item_id, _external=True),
                "Get scalar metadata",
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "symbol_name_latex",
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_scope",
                        required=True,
                        value=resource.get("scope"),
                        options=list_of_valid.scalar_scope,
                        prompt="Scope",
                    ),
                    hal_property(
                        "symbol_variable_or_constant",
                        required=True,
                        value=resource.get("variable_or_constant"),
                        options=["variable", "constant"],
                        prompt="Variable or Constant",
                    ),
                    hal_property(
                        "symbol_domain",
                        value=resource.get("domain"),
                        options=list_of_valid.scalar_domain,
                        prompt="Domain",
                    ),
                    hal_property(
                        "dimension_length",
                        type_="number",
                        value=resource.get("dimension_length"),
                        prompt="Dimension: Length exponent",
                    ),
                    hal_property(
                        "dimension_time",
                        type_="number",
                        value=resource.get("dimension_time"),
                        prompt="Dimension: Time exponent",
                    ),
                    hal_property(
                        "dimension_mass",
                        type_="number",
                        value=resource.get("dimension_mass"),
                        prompt="Dimension: Mass exponent",
                    ),
                    hal_property(
                        "dimension_temperature",
                        type_="number",
                        value=resource.get("dimension_temperature"),
                        prompt="Dimension: Temperature exponent",
                    ),
                    hal_property(
                        "dimension_electric_charge",
                        type_="number",
                        value=resource.get("dimension_electric_charge"),
                        prompt="Dimension: Electric charge exponent",
                    ),
                    hal_property(
                        "dimension_amount_of_substance",
                        type_="number",
                        value=resource.get("dimension_amount_of_substance"),
                        prompt="Dimension: Amount of substance exponent",
                    ),
                    hal_property(
                        "dimension_luminous_intensity",
                        type_="number",
                        value=resource.get("dimension_luminous_intensity"),
                        prompt="Dimension: Luminous intensity exponent",
                    ),
                ],
                title="Edit this scalar symbol",
                target=url_for(".api_edit_scalar", symbol_id=item_id, _external=True),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this scalar symbol",
                target=url_for(".api_delete_scalar", symbol_id=item_id, _external=True),
            ),
        }
        embedded_items.append(resource)

    links = {
        "self": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
    }

    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property("symbol_name_latex", prompt="Name (LaTeX)"),
                hal_property(
                    "symbol_latex", required=True, prompt="LaTeX Representation"
                ),
                hal_property("symbol_description_latex", prompt="Description (LaTeX)"),
                hal_property("symbol_reference_latex", prompt="Reference (LaTeX)"),
                hal_property(
                    "symbol_scope",
                    required=True,
                    options=list_of_valid.scalar_scope,
                    prompt="Scope",
                ),
                hal_property(
                    "symbol_variable_or_constant",
                    required=True,
                    options=["variable", "constant"],
                    prompt="Variable or Constant",
                ),
                hal_property(
                    "symbol_domain",
                    value="any",
                    options=list_of_valid.scalar_domain,
                    prompt="Domain",
                ),
                hal_property(
                    "dimension_length",
                    type_="number",
                    value=0,
                    prompt="Dimension: Length exponent",
                ),
                hal_property(
                    "dimension_time",
                    type_="number",
                    value=0,
                    prompt="Dimension: Time exponent",
                ),
                hal_property(
                    "dimension_mass",
                    type_="number",
                    value=0,
                    prompt="Dimension: Mass exponent",
                ),
                hal_property(
                    "dimension_temperature",
                    type_="number",
                    value=0,
                    prompt="Dimension: Temperature exponent",
                ),
                hal_property(
                    "dimension_electric_charge",
                    type_="number",
                    value=0,
                    prompt="Dimension: Electric charge exponent",
                ),
                hal_property(
                    "dimension_amount_of_substance",
                    type_="number",
                    value=0,
                    prompt="Dimension: Amount of substance exponent",
                ),
                hal_property(
                    "dimension_luminous_intensity",
                    type_="number",
                    value=0,
                    prompt="Dimension: Luminous intensity exponent",
                ),
            ],
            title="Create a new scalar symbol",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"scalar_symbols": embedded_items},
        templates=templates,
    )


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
            "self": hal_link(
                url_for(".api_vector_metadata", symbol_id=item_id, _external=True),
                "Get vector metadata",
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "symbol_name_latex",
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_is_composite",
                        type_="checkbox",
                        value=resource.get("is_composite"),
                        prompt="Is Composite?",
                    ),
                    hal_property(
                        "symbol_size",
                        required=True,
                        value=resource.get("size"),
                        prompt='Size ("arbitrary" or a fixed size)',
                    ),
                    hal_property(
                        "symbol_orientation",
                        value=resource.get("orientation"),
                        prompt="Orientation",
                    ),
                    hal_property(
                        "symbol_number_of_entries",
                        value=resource.get("number_of_entries"),
                        prompt="Number of Entries",
                    ),
                ],
                title="Edit this vector symbol",
                target=url_for(".api_edit_vector", symbol_id=item_id, _external=True),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this vector symbol",
                target=url_for(".api_delete_vector", symbol_id=item_id, _external=True),
            ),
        }
        embedded_items.append(resource)

    links = {
        "self": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
    }

    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property("symbol_name_latex", prompt="Name (LaTeX)"),
                hal_property(
                    "symbol_latex", required=True, prompt="LaTeX Representation"
                ),
                hal_property("symbol_description_latex", prompt="Description (LaTeX)"),
                hal_property("symbol_reference_latex", prompt="Reference (LaTeX)"),
                hal_property(
                    "symbol_is_composite",
                    type_="checkbox",
                    value=False,
                    prompt="Is Composite?",
                ),
                hal_property(
                    "symbol_size",
                    required=True,
                    value="arbitrary",
                    prompt='Size ("arbitrary" or a fixed size)',
                ),
                hal_property("symbol_orientation", prompt="Orientation"),
                hal_property("symbol_number_of_entries", prompt="Number of Entries"),
            ],
            title="Create a new vector symbol",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"vector_symbols": embedded_items},
        templates=templates,
    )


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
            "self": hal_link(
                url_for(".api_matrix_metadata", symbol_id=item_id, _external=True),
                "Get matrix metadata",
            )
        }
        resource["_templates"] = {
            "edit": hal_template(
                "POST",
                [
                    hal_property(
                        "symbol_name_latex",
                        value=resource.get("name_latex"),
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=resource.get("latex"),
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=resource.get("description_latex"),
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=resource.get("reference_latex"),
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_is_composite",
                        type_="checkbox",
                        value=resource.get("is_composite"),
                        prompt="Is Composite?",
                    ),
                    hal_property(
                        "symbol_size",
                        required=True,
                        value=resource.get("size"),
                        prompt='Size ("arbitrary" or a fixed size)',
                    ),
                    hal_property(
                        "symbol_number_of_rows",
                        value=resource.get("number_of_rows"),
                        prompt="Number of Rows",
                    ),
                    hal_property(
                        "symbol_number_of_columns",
                        value=resource.get("number_of_columns"),
                        prompt="Number of Columns",
                    ),
                ],
                title="Edit this matrix symbol",
                target=url_for(".api_edit_matrix", symbol_id=item_id, _external=True),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this matrix symbol",
                target=url_for(".api_delete_matrix", symbol_id=item_id, _external=True),
            ),
        }
        embedded_items.append(resource)

    links = {
        "self": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        ),
        "up": hal_link(url_for(".api_start_here", _external=True), "API Entry Point"),
    }

    templates = {
        "default": hal_template(
            "POST",
            [
                hal_property("symbol_name_latex", prompt="Name (LaTeX)"),
                hal_property(
                    "symbol_latex", required=True, prompt="LaTeX Representation"
                ),
                hal_property("symbol_description_latex", prompt="Description (LaTeX)"),
                hal_property("symbol_reference_latex", prompt="Reference (LaTeX)"),
                hal_property(
                    "symbol_is_composite",
                    type_="checkbox",
                    value=False,
                    prompt="Is Composite?",
                ),
                hal_property(
                    "symbol_size",
                    required=True,
                    value="arbitrary",
                    prompt='Size ("arbitrary" or a fixed size)',
                ),
                hal_property("symbol_number_of_rows", prompt="Number of Rows"),
                hal_property("symbol_number_of_columns", prompt="Number of Columns"),
            ],
            title="Create a new matrix symbol",
        )
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"count": len(embedded_items)},
        links=links,
        embedded={"matrix_symbols": embedded_items},
        templates=templates,
    )


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

    query_time_dict = {}  # type: query_timing_result_type
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
    query_time_dict = {}  # type: query_timing_result_type
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
        or (not expression_relation_latex)
        or (not expression_latex_rhs)
    ):
        return hal_error(
            "Missing required expression formula fields",
            400,
            links=up_link,
            title="Missing Field",
        )

    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    query_time_dict = {}  # type: query_timing_result_type
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


@api_bp.route("/resources/symbol/operation", methods=["POST"])
@require_auth
def api_create_operation_symbol():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_operation_symbols", _external=True),
            "List of Operation Symbols",
        )
    }
    data_from_user = request.get_json() if request.is_json else request.args
    operation_name_latex = data_from_user.get("operation_name_latex", "")
    operation_latex = data_from_user.get("operation_latex")
    operation_description_latex = data_from_user.get("operation_description_latex", "")
    operation_reference_latex = data_from_user.get("operation_reference_latex", "")
    operation_argument_count = data_from_user.get("operation_argument_count", 0)
    if not operation_name_latex or not operation_latex:
        return hal_error(
            "Missing required fields (operation_name_latex, operation_latex)",
            400,
            links=up_link,
            title="Missing Field",
        )
    try:
        operation_argument_count = int(operation_argument_count)
    except (TypeError, ValueError):
        return hal_error(
            "operation_argument_count must be an integer",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if operation_argument_count <= 0:
        return hal_error(
            "operation_argument_count must be greater than 0",
            400,
            links=up_link,
            title="Invalid Field",
        )
    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}  # type: query_timing_result_type
    operation_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        neo4j_query.add_operation_symbol(
            tx,
            operation_id,
            operation_name_latex,
            operation_latex,
            operation_description_latex,
            operation_reference_latex,
            operation_argument_count,
            now_str,
            author_name_latex,
        )
        return True

    with graphDB_Driver.session() as session:
        session.write_transaction(_create_atomic)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "operation symbol "
            + str(operation_name_latex)
            + " added successfully",
            "id": operation_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_operation_metadata", operation_id=operation_id, _external=True
                ),
                "Get the new operation symbol",
            ),
            "collection": hal_link(
                url_for(".api_list_operation_symbols", _external=True),
                "List of Operation Symbols",
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
                        "operation_name_latex",
                        required=True,
                        value=operation_name_latex,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "operation_latex",
                        required=True,
                        value=operation_latex,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "operation_description_latex",
                        value=operation_description_latex,
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "operation_reference_latex",
                        value=operation_reference_latex,
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "operation_argument_count",
                        type_="number",
                        required=True,
                        value=operation_argument_count,
                        prompt="Number of Arguments",
                    ),
                ],
                title="Edit this operation symbol",
            )
        },
        status=201,
    )


@api_bp.route("/resources/symbol/relation", methods=["POST"])
@require_auth
def api_create_relation_symbol():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_relation_symbols", _external=True),
            "List of Relation Symbols",
        )
    }
    data_from_user = request.get_json() if request.is_json else request.args
    relation_name_latex = data_from_user.get("relation_name_latex", "")
    relation_latex = data_from_user.get("relation_latex")
    relation_description_latex = data_from_user.get("relation_description_latex", "")
    relation_reference_latex = data_from_user.get("relation_reference_latex", "")
    if not relation_name_latex or not relation_latex:
        return hal_error(
            "Missing required fields (relation_name_latex, relation_latex)",
            400,
            links=up_link,
            title="Missing Field",
        )
    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}  # type: query_timing_result_type
    relation_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        neo4j_query.add_relation_symbol(
            tx,
            relation_id,
            relation_name_latex,
            relation_latex,
            relation_description_latex,
            relation_reference_latex,
            now_str,
            author_name_latex,
        )
        return True

    with graphDB_Driver.session() as session:
        session.write_transaction(_create_atomic)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "relation symbol "
            + str(relation_name_latex)
            + " added successfully",
            "id": relation_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_relation_metadata", relation_id=relation_id, _external=True
                ),
                "Get the new relation symbol",
            ),
            "collection": hal_link(
                url_for(".api_list_relation_symbols", _external=True),
                "List of Relation Symbols",
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
                        "relation_name_latex",
                        required=True,
                        value=relation_name_latex,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "relation_latex",
                        required=True,
                        value=relation_latex,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "relation_description_latex",
                        value=relation_description_latex,
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "relation_reference_latex",
                        value=relation_reference_latex,
                        prompt="Reference (LaTeX)",
                    ),
                ],
                title="Edit this relation symbol",
            )
        },
        status=201,
    )


@api_bp.route("/resources/symbol/scalar", methods=["POST"])
@require_auth
def api_create_scalar_symbol():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        )
    }
    data_from_user = request.get_json() if request.is_json else request.args
    symbol_name_latex = data_from_user.get("symbol_name_latex", "")
    symbol_latex = data_from_user.get("symbol_latex")
    symbol_description_latex = data_from_user.get("symbol_description_latex", "")
    symbol_reference_latex = data_from_user.get("symbol_reference_latex", "")
    symbol_scope = data_from_user.get("symbol_scope")
    symbol_variable_or_constant = data_from_user.get("symbol_variable_or_constant")
    symbol_domain = data_from_user.get("symbol_domain", "any") or "any"
    if not symbol_latex:
        return hal_error(
            "Missing required field: symbol_latex",
            400,
            links=up_link,
            title="Missing Field",
        )
    if not symbol_scope or symbol_scope not in list_of_valid.scalar_scope:
        return hal_error(
            f"symbol_scope is required and must be one of {list_of_valid.scalar_scope}",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if not symbol_variable_or_constant or symbol_variable_or_constant not in (
        "variable",
        "constant",
    ):
        return hal_error(
            'symbol_variable_or_constant is required and must be "variable" or "constant"',
            400,
            links=up_link,
            title="Invalid Field",
        )
    if symbol_domain not in list_of_valid.scalar_domain:
        return hal_error(
            f"symbol_domain must be one of {list_of_valid.scalar_domain}",
            400,
            links=up_link,
            title="Invalid Field",
        )
    dimension_field_names = [
        "dimension_length",
        "dimension_time",
        "dimension_mass",
        "dimension_temperature",
        "dimension_electric_charge",
        "dimension_amount_of_substance",
        "dimension_luminous_intensity",
    ]
    dimension_values = {}
    for field_name in dimension_field_names:
        raw_value = data_from_user.get(field_name, 0)
        try:
            dimension_values[field_name] = (
                int(raw_value) if raw_value not in (None, "") else 0
            )
        except (TypeError, ValueError):
            return hal_error(
                f"{field_name} must be an integer",
                400,
                links=up_link,
                title="Invalid Field",
            )
    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}  # type: query_timing_result_type
    symbol_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        neo4j_query.add_scalar_symbol(
            tx,
            symbol_id,
            symbol_name_latex,
            symbol_latex,
            symbol_description_latex,
            symbol_reference_latex,
            symbol_scope,
            symbol_variable_or_constant,
            symbol_domain,
            dimension_values["dimension_length"],
            dimension_values["dimension_time"],
            dimension_values["dimension_mass"],
            dimension_values["dimension_temperature"],
            dimension_values["dimension_electric_charge"],
            dimension_values["dimension_amount_of_substance"],
            dimension_values["dimension_luminous_intensity"],
            now_str,
            author_name_latex,
        )
        return True

    with graphDB_Driver.session() as session:
        session.write_transaction(_create_atomic)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "scalar symbol " + str(symbol_name_latex) + " added successfully",
            "id": symbol_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(".api_scalar_metadata", symbol_id=symbol_id, _external=True),
                "Get the new scalar symbol",
            ),
            "collection": hal_link(
                url_for(".api_list_scalar_symbols", _external=True),
                "List of Scalar Symbols",
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
                        "symbol_name_latex",
                        value=symbol_name_latex,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=symbol_latex,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=symbol_description_latex,
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=symbol_reference_latex,
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_scope",
                        required=True,
                        value=symbol_scope,
                        options=list_of_valid.scalar_scope,
                        prompt="Scope",
                    ),
                    hal_property(
                        "symbol_variable_or_constant",
                        required=True,
                        value=symbol_variable_or_constant,
                        options=["variable", "constant"],
                        prompt="Variable or Constant",
                    ),
                    hal_property(
                        "symbol_domain",
                        value=symbol_domain,
                        options=list_of_valid.scalar_domain,
                        prompt="Domain",
                    ),
                    hal_property(
                        "dimension_length",
                        type_="number",
                        value=dimension_values["dimension_length"],
                        prompt="Dimension: Length exponent",
                    ),
                    hal_property(
                        "dimension_time",
                        type_="number",
                        value=dimension_values["dimension_time"],
                        prompt="Dimension: Time exponent",
                    ),
                    hal_property(
                        "dimension_mass",
                        type_="number",
                        value=dimension_values["dimension_mass"],
                        prompt="Dimension: Mass exponent",
                    ),
                    hal_property(
                        "dimension_temperature",
                        type_="number",
                        value=dimension_values["dimension_temperature"],
                        prompt="Dimension: Temperature exponent",
                    ),
                    hal_property(
                        "dimension_electric_charge",
                        type_="number",
                        value=dimension_values["dimension_electric_charge"],
                        prompt="Dimension: Electric charge exponent",
                    ),
                    hal_property(
                        "dimension_amount_of_substance",
                        type_="number",
                        value=dimension_values["dimension_amount_of_substance"],
                        prompt="Dimension: Amount of substance exponent",
                    ),
                    hal_property(
                        "dimension_luminous_intensity",
                        type_="number",
                        value=dimension_values["dimension_luminous_intensity"],
                        prompt="Dimension: Luminous intensity exponent",
                    ),
                ],
                title="Edit this scalar symbol",
            )
        },
        status=201,
    )


@api_bp.route("/resources/symbol/vector", methods=["POST"])
@require_auth
def api_create_vector_symbol():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        )
    }
    data_from_user = request.get_json() if request.is_json else request.args
    symbol_name_latex = data_from_user.get("symbol_name_latex", "")
    symbol_latex = data_from_user.get("symbol_latex")
    symbol_description_latex = data_from_user.get("symbol_description_latex", "")
    symbol_reference_latex = data_from_user.get("symbol_reference_latex", "")
    symbol_is_composite = _parse_bool(
        data_from_user.get("symbol_is_composite"), default=False
    )
    symbol_size = data_from_user.get("symbol_size", "arbitrary") or "arbitrary"
    symbol_orientation = data_from_user.get("symbol_orientation", "")
    symbol_number_of_entries = data_from_user.get("symbol_number_of_entries", "")
    if not symbol_latex:
        return hal_error(
            "Missing required field: symbol_latex",
            400,
            links=up_link,
            title="Missing Field",
        )
    if symbol_size != "arbitrary" and (not symbol_number_of_entries):
        return hal_error(
            'symbol_number_of_entries is required unless symbol_size is "arbitrary"',
            400,
            links=up_link,
            title="Missing Field",
        )
    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}  # type: query_timing_result_type
    symbol_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        neo4j_query.add_vector_symbol(
            tx,
            symbol_id,
            symbol_name_latex,
            symbol_latex,
            symbol_description_latex,
            symbol_reference_latex,
            symbol_is_composite,
            symbol_size,
            symbol_orientation,
            symbol_number_of_entries,
            now_str,
            author_name_latex,
        )
        return True

    with graphDB_Driver.session() as session:
        session.write_transaction(_create_atomic)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "vector symbol " + str(symbol_name_latex) + " added successfully",
            "id": symbol_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(".api_vector_metadata", symbol_id=symbol_id, _external=True),
                "Get the new vector symbol",
            ),
            "collection": hal_link(
                url_for(".api_list_vector_symbols", _external=True),
                "List of Vector Symbols",
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
                        "symbol_name_latex",
                        value=symbol_name_latex,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=symbol_latex,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=symbol_description_latex,
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=symbol_reference_latex,
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_is_composite",
                        type_="checkbox",
                        value=symbol_is_composite,
                        prompt="Is Composite?",
                    ),
                    hal_property(
                        "symbol_size",
                        required=True,
                        value=symbol_size,
                        prompt='Size ("arbitrary" or a fixed size)',
                    ),
                    hal_property(
                        "symbol_orientation",
                        value=symbol_orientation,
                        prompt="Orientation",
                    ),
                    hal_property(
                        "symbol_number_of_entries",
                        value=symbol_number_of_entries,
                        prompt="Number of Entries",
                    ),
                ],
                title="Edit this vector symbol",
            )
        },
        status=201,
    )


@api_bp.route("/resources/symbol/matrix", methods=["POST"])
@require_auth
def api_create_matrix_symbol():
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        )
    }
    data_from_user = request.get_json() if request.is_json else request.args
    symbol_name_latex = data_from_user.get("symbol_name_latex", "")
    symbol_latex = data_from_user.get("symbol_latex")
    symbol_description_latex = data_from_user.get("symbol_description_latex", "")
    symbol_reference_latex = data_from_user.get("symbol_reference_latex", "")
    symbol_is_composite = _parse_bool(
        data_from_user.get("symbol_is_composite"), default=False
    )
    symbol_size = data_from_user.get("symbol_size", "arbitrary") or "arbitrary"
    symbol_number_of_rows = data_from_user.get("symbol_number_of_rows", "")
    symbol_number_of_columns = data_from_user.get("symbol_number_of_columns", "")
    if not symbol_latex:
        return hal_error(
            "Missing required field: symbol_latex",
            400,
            links=up_link,
            title="Missing Field",
        )
    if symbol_size != "arbitrary" and (
        not symbol_number_of_rows or not symbol_number_of_columns
    ):
        return hal_error(
            'symbol_number_of_rows and symbol_number_of_columns are required unless symbol_size is "arbitrary"',
            400,
            links=up_link,
            title="Missing Field",
        )
    author_name_latex = g.current_author["author_name_latex"]
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))
    query_time_dict = {}  # type: query_timing_result_type
    symbol_id, query_time_dict = generate_random_id(graphDB_Driver, query_time_dict)

    def _create_atomic(tx):
        neo4j_query.add_matrix_symbol(
            tx,
            symbol_id,
            symbol_name_latex,
            symbol_latex,
            symbol_description_latex,
            symbol_reference_latex,
            symbol_is_composite,
            symbol_size,
            symbol_number_of_rows,
            symbol_number_of_columns,
            now_str,
            author_name_latex,
        )
        return True

    with graphDB_Driver.session() as session:
        session.write_transaction(_create_atomic)
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "matrix symbol " + str(symbol_name_latex) + " added successfully",
            "id": symbol_id,
            "created": now_str,
        },
        links={
            "self": hal_link(
                url_for(".api_matrix_metadata", symbol_id=symbol_id, _external=True),
                "Get the new matrix symbol",
            ),
            "collection": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
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
                        "symbol_name_latex",
                        value=symbol_name_latex,
                        prompt="Name (LaTeX)",
                    ),
                    hal_property(
                        "symbol_latex",
                        required=True,
                        value=symbol_latex,
                        prompt="LaTeX Representation",
                    ),
                    hal_property(
                        "symbol_description_latex",
                        value=symbol_description_latex,
                        prompt="Description (LaTeX)",
                    ),
                    hal_property(
                        "symbol_reference_latex",
                        value=symbol_reference_latex,
                        prompt="Reference (LaTeX)",
                    ),
                    hal_property(
                        "symbol_is_composite",
                        type_="checkbox",
                        value=symbol_is_composite,
                        prompt="Is Composite?",
                    ),
                    hal_property(
                        "symbol_size",
                        required=True,
                        value=symbol_size,
                        prompt='Size ("arbitrary" or a fixed size)',
                    ),
                    hal_property(
                        "symbol_number_of_rows",
                        value=symbol_number_of_rows,
                        prompt="Number of Rows",
                    ),
                    hal_property(
                        "symbol_number_of_columns",
                        value=symbol_number_of_columns,
                        prompt="Number of Columns",
                    ),
                ],
                title="Edit this matrix symbol",
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


@api_bp.route(
    "/resources/symbol/operation/<string:operation_id>/edit", methods=["POST"]
)
@require_auth
def api_edit_operation(operation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    data_from_user = request.get_json() if request.is_json else request.args
    up_link = {
        "up": hal_link(
            url_for(".api_list_operation_symbols", _external=True),
            "List of Operation Symbols",
        )
    }
    editable_fields = {
        "operation_name_latex": "name_latex",
        "operation_latex": "latex",
        "operation_description_latex": "description_latex",
        "operation_reference_latex": "reference_latex",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(
            tx, "operation", operation_id
        )
        if existing is None:
            return "NOT_FOUND"
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                updated = neo4j_query.edit_node_property(
                    tx,
                    "operation",
                    operation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                if updated:
                    updated_fields.append(node_property)
        if "operation_argument_count" in data_from_user and data_from_user.get(
            "operation_argument_count"
        ) not in (None, ""):
            try:
                argument_count = int(data_from_user.get("operation_argument_count"))
            except (TypeError, ValueError):
                return "INVALID_ARGUMENT_COUNT"
            if argument_count <= 0:
                return "INVALID_ARGUMENT_COUNT"
            updated = neo4j_query.edit_node_property(
                tx, "operation", operation_id, "argument_count", argument_count
            )
            if updated:
                updated_fields.append("argument_count")
        if updated_fields:
            _stamp_last_modified(tx, "operation", operation_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_edit_atomic)
    if status == "NOT_FOUND":
        return hal_error(
            f"Operation {operation_id} does not exist",
            404,
            links=up_link,
            title="Not Found",
        )
    elif status == "INVALID_ARGUMENT_COUNT":
        return hal_error(
            "operation_argument_count must be a positive integer",
            400,
            links=up_link,
            title="Invalid Field",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "operation symbol updated successfully",
            "id": operation_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(
                    ".api_edit_operation", operation_id=operation_id, _external=True
                ),
                "Edit operation symbol",
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
    data_from_user = request.get_json() if request.is_json else request.args
    up_link = {
        "up": hal_link(
            url_for(".api_list_relation_symbols", _external=True),
            "List of Relation Symbols",
        )
    }
    editable_fields = {
        "relation_name_latex": "name_latex",
        "relation_latex": "latex",
        "relation_description_latex": "description_latex",
        "relation_reference_latex": "reference_latex",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "relation", relation_id)
        if existing is None:
            return False
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                updated = neo4j_query.edit_node_property(
                    tx,
                    "relation",
                    relation_id,
                    node_property,
                    data_from_user.get(form_key),
                )
                if updated:
                    updated_fields.append(node_property)
        if updated_fields:
            _stamp_last_modified(tx, "relation", relation_id)
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_edit_atomic)
    if not found:
        return hal_error(
            f"Relation {relation_id} does not exist",
            404,
            links=up_link,
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "relation symbol updated successfully",
            "id": relation_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_relation", relation_id=relation_id, _external=True),
                "Edit relation symbol",
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


@api_bp.route("/resources/symbol/scalar/<string:symbol_id>/edit", methods=["POST"])
@require_auth
def api_edit_scalar(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    data_from_user = request.get_json() if request.is_json else request.args
    up_link = {
        "up": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        )
    }
    text_fields = {
        "symbol_name_latex": "name_latex",
        "symbol_latex": "latex",
        "symbol_description_latex": "description_latex",
        "symbol_reference_latex": "reference_latex",
    }
    numeric_fields = [
        "dimension_length",
        "dimension_time",
        "dimension_mass",
        "dimension_temperature",
        "dimension_electric_charge",
        "dimension_amount_of_substance",
        "dimension_luminous_intensity",
    ]
    updated_fields = []
    if (
        "symbol_scope" in data_from_user
        and data_from_user.get("symbol_scope")
        and (data_from_user.get("symbol_scope") not in list_of_valid.scalar_scope)
    ):
        return hal_error(
            f"symbol_scope must be one of {list_of_valid.scalar_scope}",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if (
        "symbol_domain" in data_from_user
        and data_from_user.get("symbol_domain")
        and (data_from_user.get("symbol_domain") not in list_of_valid.scalar_domain)
    ):
        return hal_error(
            f"symbol_domain must be one of {list_of_valid.scalar_domain}",
            400,
            links=up_link,
            title="Invalid Field",
        )
    if (
        "symbol_variable_or_constant" in data_from_user
        and data_from_user.get("symbol_variable_or_constant")
        and (
            data_from_user.get("symbol_variable_or_constant")
            not in ("variable", "constant")
        )
    ):
        return hal_error(
            'symbol_variable_or_constant must be "variable" or "constant"',
            400,
            links=up_link,
            title="Invalid Field",
        )

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "scalar", symbol_id)
        if existing is None:
            return "NOT_FOUND"
        for form_key, node_property in text_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                updated = neo4j_query.edit_node_property(
                    tx, "scalar", symbol_id, node_property, data_from_user.get(form_key)
                )
                if updated:
                    updated_fields.append(node_property)
        if "symbol_scope" in data_from_user and data_from_user.get("symbol_scope"):
            updated = neo4j_query.edit_node_property(
                tx, "scalar", symbol_id, "scope", data_from_user.get("symbol_scope")
            )
            if updated:
                updated_fields.append("scope")
        if "symbol_variable_or_constant" in data_from_user and data_from_user.get(
            "symbol_variable_or_constant"
        ):
            updated = neo4j_query.edit_node_property(
                tx,
                "scalar",
                symbol_id,
                "variable_or_constant",
                data_from_user.get("symbol_variable_or_constant"),
            )
            if updated:
                updated_fields.append("variable_or_constant")
        if "symbol_domain" in data_from_user and data_from_user.get("symbol_domain"):
            updated = neo4j_query.edit_node_property(
                tx, "scalar", symbol_id, "domain", data_from_user.get("symbol_domain")
            )
            if updated:
                updated_fields.append("domain")
        for form_key in numeric_fields:
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                try:
                    value = int(data_from_user.get(form_key))
                except (TypeError, ValueError):
                    return "INVALID_DIMENSION"
                updated = neo4j_query.edit_node_property(
                    tx, "scalar", symbol_id, form_key, value
                )
                if updated:
                    updated_fields.append(form_key)
        if updated_fields:
            _stamp_last_modified(tx, "scalar", symbol_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_edit_atomic)
    if status == "NOT_FOUND":
        return hal_error(
            f"Scalar {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    elif status == "INVALID_DIMENSION":
        return hal_error(
            "dimension fields must be integers",
            400,
            links=up_link,
            title="Invalid Field",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "scalar symbol updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_scalar", symbol_id=symbol_id, _external=True),
                "Edit scalar symbol",
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
    data_from_user = request.get_json() if request.is_json else request.args
    up_link = {
        "up": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        )
    }
    editable_fields = {
        "symbol_name_latex": "name_latex",
        "symbol_latex": "latex",
        "symbol_description_latex": "description_latex",
        "symbol_reference_latex": "reference_latex",
        "symbol_size": "size",
        "symbol_orientation": "orientation",
        "symbol_number_of_entries": "number_of_entries",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "vector", symbol_id)
        if existing is None:
            return "NOT_FOUND"
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                updated = neo4j_query.edit_node_property(
                    tx, "vector", symbol_id, node_property, data_from_user.get(form_key)
                )
                if updated:
                    updated_fields.append(node_property)
        if "symbol_is_composite" in data_from_user:
            value = _parse_bool(data_from_user.get("symbol_is_composite"))
            updated = neo4j_query.edit_node_property(
                tx, "vector", symbol_id, "is_composite", value
            )
            if updated:
                updated_fields.append("is_composite")
        if updated_fields:
            _stamp_last_modified(tx, "vector", symbol_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_edit_atomic)
    if status == "NOT_FOUND":
        return hal_error(
            f"Vector {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "vector symbol updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_vector", symbol_id=symbol_id, _external=True),
                "Edit vector symbol",
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
    data_from_user = request.get_json() if request.is_json else request.args
    up_link = {
        "up": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        )
    }
    editable_fields = {
        "symbol_name_latex": "name_latex",
        "symbol_latex": "latex",
        "symbol_description_latex": "description_latex",
        "symbol_reference_latex": "reference_latex",
        "symbol_size": "size",
        "symbol_number_of_rows": "number_of_rows",
        "symbol_number_of_columns": "number_of_columns",
    }
    updated_fields = []

    def _edit_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "matrix", symbol_id)
        if existing is None:
            return "NOT_FOUND"
        for form_key, node_property in editable_fields.items():
            if form_key in data_from_user and data_from_user.get(form_key) not in (
                None,
                "",
            ):
                updated = neo4j_query.edit_node_property(
                    tx, "matrix", symbol_id, node_property, data_from_user.get(form_key)
                )
                if updated:
                    updated_fields.append(node_property)
        if "symbol_is_composite" in data_from_user:
            value = _parse_bool(data_from_user.get("symbol_is_composite"))
            updated = neo4j_query.edit_node_property(
                tx, "matrix", symbol_id, "is_composite", value
            )
            if updated:
                updated_fields.append("is_composite")
        if updated_fields:
            _stamp_last_modified(tx, "matrix", symbol_id)
        return "SUCCESS"

    with graphDB_Driver.session() as session:
        status = session.write_transaction(_edit_atomic)
    if status == "NOT_FOUND":
        return hal_error(
            f"Matrix {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "matrix symbol updated successfully",
            "id": symbol_id,
            "updated_fields": updated_fields,
        },
        links={
            "self": hal_link(
                url_for(".api_edit_matrix", symbol_id=symbol_id, _external=True),
                "Edit matrix symbol",
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
    links = {
        "self": hal_link(
            url_for(
                ".api_derivation_metadata", derivation_id=derivation_id, _external=True
            ),
            "Get derivation metadata",
        ),
        "steps": hal_link(
            url_for(
                ".api_derivation_steps", derivation_id=derivation_id, _external=True
            ),
            "View derivation steps",
        ),
        "up": hal_link(
            url_for(".api_list_derivations", _external=True), "List of Derivations"
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "derivation_name_latex",
                    required=True,
                    value=derivation_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "derivation_abstract_latex",
                    required=True,
                    value=derivation_dict.get("abstract_latex"),
                    prompt="Abstract (LaTeX)",
                ),
                hal_property(
                    "derivation_reference_latex",
                    value=derivation_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
            ],
            title="Edit this derivation",
            target=url_for(
                ".api_edit_derivation", derivation_id=derivation_id, _external=True
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this derivation",
            target=url_for(
                ".api_delete_derivation", derivation_id=derivation_id, _external=True
            ),
        ),
    }
    return hal_response(
        data={"metadata": derivation_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(
                ".api_inference_rule_metadata", infrule_id=infrule_id, _external=True
            ),
            "Get inference rule metadata",
        ),
        "up": hal_link(
            url_for(".api_list_inference_rules", _external=True),
            "List of Inference Rules",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "inference_rule_name_latex",
                    required=True,
                    value=inference_rule_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "inference_rule_latex",
                    required=True,
                    value=inference_rule_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "number_of_inputs",
                    type_="number",
                    value=inference_rule_dict.get("number_of_inputs"),
                    prompt="Number of Inputs",
                ),
                hal_property(
                    "number_of_feeds",
                    type_="number",
                    value=inference_rule_dict.get("number_of_feeds"),
                    prompt="Number of Feeds",
                ),
                hal_property(
                    "number_of_outputs",
                    type_="number",
                    value=inference_rule_dict.get("number_of_outputs"),
                    prompt="Number of Outputs",
                ),
            ],
            title="Edit this inference rule",
            target=url_for(
                ".api_edit_inference_rule", infrule_id=infrule_id, _external=True
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this inference rule",
            target=url_for(
                ".api_delete_inference_rule", infrule_id=infrule_id, _external=True
            ),
        ),
    }
    return hal_response(
        data={"metadata": inference_rule_dict}, links=links, templates=templates
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

    # Safe link transitions
    links = {
        "self": hal_link(
            url_for(
                ".api_expression_metadata", expression_id=expression_id, _external=True
            ),
            "Get expression metadata",
        ),
        "up": hal_link(
            url_for(".api_list_expressions", _external=True), "List of Expressions"
        ),
    }

    # State-changing operations formatted as templates
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "expression_latex_lhs",
                    value=expression_dict.get("latex_lhs"),
                    required=True,
                    prompt="LHS (LaTeX)",
                ),
                hal_property(
                    "expression_relation_latex",
                    value=expression_dict.get("latex_relation"),
                    required=True,
                    prompt="Relation (LaTeX)",
                ),
                hal_property(
                    "expression_latex_rhs",
                    value=expression_dict.get("latex_rhs"),
                    required=True,
                    prompt="RHS (LaTeX)",
                ),
                hal_property(
                    "expression_latex_condition",
                    value=expression_dict.get("latex_condition"),
                    prompt="Condition (LaTeX)",
                ),
                hal_property(
                    "expression_name_latex",
                    value=expression_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "expression_description_latex",
                    value=expression_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "expression_reference_latex",
                    value=expression_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
            ],
            title="Edit this expression",
            target=url_for(
                ".api_edit_expression", expression_id=expression_id, _external=True
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this expression",
            target=url_for(
                ".api_delete_expression", expression_id=expression_id, _external=True
            ),
        ),
        "associate-symbol": hal_template(
            "POST",
            [hal_property("symbol_id", required=True, prompt="Symbol ID to Associate")],
            title="Associate symbol with this expression",
            target=url_for(
                ".api_associate_symbol_with_expression",
                expression_id=expression_id,
                _external=True,
            ),
        ),
    }

    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={"metadata": expression_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(".api_scalar_metadata", symbol_id=symbol_id, _external=True),
            "Get scalar metadata",
        ),
        "up": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "symbol_name_latex",
                    value=scalar_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "symbol_latex",
                    required=True,
                    value=scalar_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "symbol_description_latex",
                    value=scalar_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "symbol_reference_latex",
                    value=scalar_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
                hal_property(
                    "symbol_scope",
                    required=True,
                    value=scalar_dict.get("scope"),
                    options=list_of_valid.scalar_scope,
                    prompt="Scope",
                ),
                hal_property(
                    "symbol_variable_or_constant",
                    required=True,
                    value=scalar_dict.get("variable_or_constant"),
                    options=["variable", "constant"],
                    prompt="Variable or Constant",
                ),
                hal_property(
                    "symbol_domain",
                    value=scalar_dict.get("domain"),
                    options=list_of_valid.scalar_domain,
                    prompt="Domain",
                ),
                hal_property(
                    "dimension_length",
                    type_="number",
                    value=scalar_dict.get("dimension_length"),
                    prompt="Dimension: Length exponent",
                ),
                hal_property(
                    "dimension_time",
                    type_="number",
                    value=scalar_dict.get("dimension_time"),
                    prompt="Dimension: Time exponent",
                ),
                hal_property(
                    "dimension_mass",
                    type_="number",
                    value=scalar_dict.get("dimension_mass"),
                    prompt="Dimension: Mass exponent",
                ),
                hal_property(
                    "dimension_temperature",
                    type_="number",
                    value=scalar_dict.get("dimension_temperature"),
                    prompt="Dimension: Temperature exponent",
                ),
                hal_property(
                    "dimension_electric_charge",
                    type_="number",
                    value=scalar_dict.get("dimension_electric_charge"),
                    prompt="Dimension: Electric charge exponent",
                ),
                hal_property(
                    "dimension_amount_of_substance",
                    type_="number",
                    value=scalar_dict.get("dimension_amount_of_substance"),
                    prompt="Dimension: Amount of substance exponent",
                ),
                hal_property(
                    "dimension_luminous_intensity",
                    type_="number",
                    value=scalar_dict.get("dimension_luminous_intensity"),
                    prompt="Dimension: Luminous intensity exponent",
                ),
            ],
            title="Edit this scalar symbol",
            target=url_for(".api_edit_scalar", symbol_id=symbol_id, _external=True),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this scalar symbol",
            target=url_for(".api_delete_scalar", symbol_id=symbol_id, _external=True),
        ),
    }
    return hal_response(
        data={"metadata": scalar_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(".api_vector_metadata", symbol_id=symbol_id, _external=True),
            "Get vector metadata",
        ),
        "up": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "symbol_name_latex",
                    value=vector_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "symbol_latex",
                    required=True,
                    value=vector_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "symbol_description_latex",
                    value=vector_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "symbol_reference_latex",
                    value=vector_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
                hal_property(
                    "symbol_is_composite",
                    type_="checkbox",
                    value=vector_dict.get("is_composite"),
                    prompt="Is Composite?",
                ),
                hal_property(
                    "symbol_size",
                    required=True,
                    value=vector_dict.get("size"),
                    prompt='Size ("arbitrary" or a fixed size)',
                ),
                hal_property(
                    "symbol_orientation",
                    value=vector_dict.get("orientation"),
                    prompt="Orientation",
                ),
                hal_property(
                    "symbol_number_of_entries",
                    value=vector_dict.get("number_of_entries"),
                    prompt="Number of Entries",
                ),
            ],
            title="Edit this vector symbol",
            target=url_for(".api_edit_vector", symbol_id=symbol_id, _external=True),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this vector symbol",
            target=url_for(".api_delete_vector", symbol_id=symbol_id, _external=True),
        ),
    }
    return hal_response(
        data={"metadata": vector_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(".api_matrix_metadata", symbol_id=symbol_id, _external=True),
            "Get matrix metadata",
        ),
        "up": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "symbol_name_latex",
                    value=matrix_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "symbol_latex",
                    required=True,
                    value=matrix_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "symbol_description_latex",
                    value=matrix_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "symbol_reference_latex",
                    value=matrix_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
                hal_property(
                    "symbol_is_composite",
                    type_="checkbox",
                    value=matrix_dict.get("is_composite"),
                    prompt="Is Composite?",
                ),
                hal_property(
                    "symbol_size",
                    required=True,
                    value=matrix_dict.get("size"),
                    prompt='Size ("arbitrary" or a fixed size)',
                ),
                hal_property(
                    "symbol_number_of_rows",
                    value=matrix_dict.get("number_of_rows"),
                    prompt="Number of Rows",
                ),
                hal_property(
                    "symbol_number_of_columns",
                    value=matrix_dict.get("number_of_columns"),
                    prompt="Number of Columns",
                ),
            ],
            title="Edit this matrix symbol",
            target=url_for(".api_edit_matrix", symbol_id=symbol_id, _external=True),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this matrix symbol",
            target=url_for(".api_delete_matrix", symbol_id=symbol_id, _external=True),
        ),
    }
    return hal_response(
        data={"metadata": matrix_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(
                ".api_operation_metadata", operation_id=operation_id, _external=True
            ),
            "Get operation metadata",
        ),
        "up": hal_link(
            url_for(".api_list_operation_symbols", _external=True),
            "List of Operation Symbols",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "operation_name_latex",
                    required=True,
                    value=operation_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "operation_latex",
                    required=True,
                    value=operation_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "operation_description_latex",
                    value=operation_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "operation_reference_latex",
                    value=operation_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
                hal_property(
                    "operation_argument_count",
                    type_="number",
                    required=True,
                    value=operation_dict.get("argument_count"),
                    prompt="Number of Arguments",
                ),
            ],
            title="Edit this operation symbol",
            target=url_for(
                ".api_edit_operation", operation_id=operation_id, _external=True
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this operation symbol",
            target=url_for(
                ".api_delete_operation", operation_id=operation_id, _external=True
            ),
        ),
    }
    return hal_response(
        data={"metadata": operation_dict}, links=links, templates=templates
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
    links = {
        "self": hal_link(
            url_for(".api_relation_metadata", relation_id=relation_id, _external=True),
            "Get relation metadata",
        ),
        "up": hal_link(
            url_for(".api_list_relation_symbols", _external=True),
            "List of Relation Symbols",
        ),
    }
    templates = {
        "edit": hal_template(
            "POST",
            [
                hal_property(
                    "relation_name_latex",
                    value=relation_dict.get("name_latex"),
                    prompt="Name (LaTeX)",
                ),
                hal_property(
                    "relation_latex",
                    required=True,
                    value=relation_dict.get("latex"),
                    prompt="LaTeX Representation",
                ),
                hal_property(
                    "relation_description_latex",
                    value=relation_dict.get("description_latex"),
                    prompt="Description (LaTeX)",
                ),
                hal_property(
                    "relation_reference_latex",
                    value=relation_dict.get("reference_latex"),
                    prompt="Reference (LaTeX)",
                ),
            ],
            title="Edit this relation symbol",
            target=url_for(
                ".api_edit_relation", relation_id=relation_id, _external=True
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this relation symbol",
            target=url_for(
                ".api_delete_relation", relation_id=relation_id, _external=True
            ),
        ),
    }
    return hal_response(
        data={"metadata": relation_dict}, links=links, templates=templates
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
            "derivation": hal_link(
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
                "Steps in this derivation",
            ),
        }
        step_copy["_templates"] = {
            "edit-notes": hal_template(
                "POST",
                [
                    hal_property(
                        "note_before_step_latex",
                        value=step.get("note_before_step_latex"),
                        prompt="Note Before Step (LaTeX)",
                    ),
                    hal_property(
                        "note_after_step_latex",
                        value=step.get("note_after_step_latex"),
                        prompt="Note After Step (LaTeX)",
                    ),
                ],
                title="Edit step notes",
                target=url_for(
                    ".api_edit_step_notes",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
            ),
            "delete": hal_template(
                "DELETE",
                [],
                title="Delete this step",
                target=url_for(
                    ".api_delete_step",
                    derivation_id=derivation_id,
                    step_id=step_id,
                    _external=True,
                ),
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
    query_time_dict = {}  # type: query_timing_result_type
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
    }
    templates = {
        "edit-notes": hal_template(
            "POST",
            [
                hal_property(
                    "note_before_step_latex",
                    value=full_step_data.get("note_before_step_latex"),
                    prompt="Note Before Step (LaTeX)",
                ),
                hal_property(
                    "note_after_step_latex",
                    value=full_step_data.get("note_after_step_latex"),
                    prompt="Note After Step (LaTeX)",
                ),
            ],
            title="Edit step notes",
            target=url_for(
                ".api_edit_step_notes",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
        "swap-input": hal_template(
            "POST",
            [
                hal_property(
                    "old_input_id", required=True, prompt="Existing Input Expression ID"
                ),
                hal_property(
                    "new_input_id", required=True, prompt="New Input Expression ID"
                ),
            ],
            title="Swap an input expression",
            target=url_for(
                ".api_swap_step_input",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
        "swap-feed": hal_template(
            "POST",
            [
                hal_property("old_feed_id", required=True, prompt="Existing Feed ID"),
                hal_property("new_feed_id", required=True, prompt="New Feed ID"),
            ],
            title="Swap a feed",
            target=url_for(
                ".api_swap_step_feed",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
        "swap-output": hal_template(
            "POST",
            [
                hal_property(
                    "old_output_id",
                    required=True,
                    prompt="Existing Output Expression ID",
                ),
                hal_property(
                    "new_output_id", required=True, prompt="New Output Expression ID"
                ),
            ],
            title="Swap an output expression",
            target=url_for(
                ".api_swap_step_output",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
        "add-feed": hal_template(
            "POST",
            [hal_property("feed_latex", required=True, prompt="Feed (LaTeX)")],
            title="Add an inline feed to this step",
            target=url_for(
                ".api_add_step_feed",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
        "delete": hal_template(
            "DELETE",
            [],
            title="Delete this step",
            target=url_for(
                ".api_delete_step",
                derivation_id=derivation_id,
                step_id=step_id,
                _external=True,
            ),
        ),
    }
    return hal_response(data=full_step_data, links=links, templates=templates)


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

    query_time_dict = {}  # type: query_timing_result_type
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


@api_bp.route(
    "/resources/symbol/operation/<string:operation_id>/delete", methods=["DELETE"]
)
@require_auth
def api_delete_operation(operation_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_operation_symbols", _external=True),
            "List of Operation Symbols",
        )
    }

    def _delete_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(
            tx, "operation", operation_id
        )
        if existing is None:
            return False
        neo4j_query.delete_node(tx, operation_id, "operation")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_atomic)
    if not found:
        return hal_error(
            f"Operation {operation_id} does not exist",
            404,
            links=up_link,
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + operation_id,
            "deleted_operation_id": operation_id,
        },
        links={
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
    up_link = {
        "up": hal_link(
            url_for(".api_list_relation_symbols", _external=True),
            "List of Relation Symbols",
        )
    }

    def _delete_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "relation", relation_id)
        if existing is None:
            return False
        neo4j_query.delete_node(tx, relation_id, "relation")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_atomic)
    if not found:
        return hal_error(
            f"Relation {relation_id} does not exist",
            404,
            links=up_link,
            title="Not Found",
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + relation_id,
            "deleted_relation_id": relation_id,
        },
        links={
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


@api_bp.route("/resources/symbol/scalar/<string:symbol_id>/delete", methods=["DELETE"])
@require_auth
def api_delete_scalar(symbol_id: str):
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    up_link = {
        "up": hal_link(
            url_for(".api_list_scalar_symbols", _external=True),
            "List of Scalar Symbols",
        )
    }

    def _delete_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "scalar", symbol_id)
        if existing is None:
            return False
        neo4j_query.delete_node(tx, symbol_id, "scalar")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_atomic)
    if not found:
        return hal_error(
            f"Scalar {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_scalar_id": symbol_id,
        },
        links={
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
    up_link = {
        "up": hal_link(
            url_for(".api_list_vector_symbols", _external=True),
            "List of Vector Symbols",
        )
    }

    def _delete_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "vector", symbol_id)
        if existing is None:
            return False
        neo4j_query.delete_node(tx, symbol_id, "vector")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_atomic)
    if not found:
        return hal_error(
            f"Vector {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_vector_id": symbol_id,
        },
        links={
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
    up_link = {
        "up": hal_link(
            url_for(".api_list_matrix_symbols", _external=True),
            "List of Matrix Symbols",
        )
    }

    def _delete_atomic(tx):
        existing = neo4j_query.get_node_properties_from_id(tx, "matrix", symbol_id)
        if existing is None:
            return False
        neo4j_query.delete_node(tx, symbol_id, "matrix")
        return True

    with graphDB_Driver.session() as session:
        found = session.write_transaction(_delete_atomic)
    if not found:
        return hal_error(
            f"Matrix {symbol_id} does not exist", 404, links=up_link, title="Not Found"
        )
    logger.info("[TRACE] end " + trace_id)
    return hal_response(
        data={
            "status": "successfully deleted " + symbol_id,
            "deleted_matrix_id": symbol_id,
        },
        links={
            "up": hal_link(
                url_for(".api_list_matrix_symbols", _external=True),
                "List of Matrix Symbols",
            ),
            "collection": hal_link(
                url_for(".api_list_matrix_symbols", _external=True), "Matrix Symbols"
            ),
        },
    )
