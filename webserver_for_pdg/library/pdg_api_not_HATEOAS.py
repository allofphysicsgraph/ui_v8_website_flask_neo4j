#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2026
# http://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)


import os
import uuid
import tokenize
import neo4j  # type: ignore

from sympy.parsing.sympy_parser import parse_expr

from flask import (
    Blueprint,
    jsonify,
    request,
)


import logging

logger = logging.getLogger(__name__)

from .initialize_neo4j import graphDB_Driver
from .compute import hash_of_string
from . import neo4j_query
from . import latex

api_nohateoas_bp = Blueprint("pdg_api_not_HATEOAS", __name__, url_prefix="/api")


# @api_nohateoas_bp.route("/resources/sympy_check", methods=["GET", "POST"])
# def api_sympy_check():
#     """

#     """
#     user_input = request.args.get("sympy")

#     try:
#         expr = parse_expr(user_input)
#     except tokenize.TokenError as err:
#         return jsonify({"INVALID": str(err)})

#     var_names = [str(s) for s in expr.free_symbols]
#     logger.info(str(var_names))

#     canonical_str = str(expr.canonical) if hasattr(expr, "canonical") else str(expr)

#     return jsonify({"canonical": canonical_str, "variables": str(var_names)})


@api_nohateoas_bp.route("/resources/png_from_latex", methods=["GET", "POST"])
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

    on 2026-07-11, Claude Sonnet 5 on 'medium' warns that

    > User-supplied LaTeX is passed to whatever `latex.create_png_from_latex` does
    > (presumably shells out to pdflatex/similar). If shell-escape isn't
    > explicitly disabled, this is command injection; even without shell-escape,
    > LaTeX has `\input` or `\write18`-class footguns. No auth, no rate limiting.

    """

    user_input = request.args.get("tex")

    path_to_png = os.path.join(latex.STATIC_DIR, "temp_for_latex_validation") + "/"

    os.makedirs(path_to_png, exist_ok=True)

    if user_input:
        hash_of_user_input = hash_of_string(user_input)
    else:
        return jsonify({"error": "nothing passed in"})

    path_to_png_with_filename = path_to_png + hash_of_user_input + ".png"

    if not os.path.exists(path_to_png_with_filename):
        latex.create_png_from_latex(user_input, path_to_png, hash_of_user_input)

    # trim "/code" prior to returning the path
    path_to_png_with_filename_no_prefix_directory = path_to_png_with_filename[
        len("/code") :
    ]

    return jsonify({"png_location": path_to_png_with_filename_no_prefix_directory})


# @api_nohateoas_bp.route("/resources/cypher", methods=["GET"])
# def api_cypher_query():
#     r"""

#     .. code-block:: bash

#         curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\(n\)%20RETURN%20DISTINCT%20labels\(n\) | python3 -m json.tool

#     """
#     trace_id = str(uuid.uuid4())
#     logger.info("[TRACE] start " + trace_id)
#     # query_time_dict = {}  # type: query_timing_result_type

#     user_query = request.args.get("query")

#     logger.info("user_query: " + str(user_query))

#     list_of_records = []  # type: List[str]
#     if user_query:
#         try:
#             # https://neo4j.com/docs/python-manual/current/session-api/
#             with graphDB_Driver.session() as session:
#                 # query_start_time = time.time()
#                 list_of_records = session.read_transaction(
#                     neo4j_query.user_query, user_query
#                 )
#                 # query_time_dict["api_cypher_query: user_query"] = round(
#                 #     time.time() - query_start_time, 3
#                 # )
#         except neo4j.exceptions.ClientError:
#             list_of_records = ["WRITE OPERATIONS NOT ALLOWED (ClientError)"]
#         except neo4j.exceptions.TransactionError:
#             list_of_records = ["not a valid Cypher query (TransactionError)"]
#     else:
#         list_of_records = [
#             "use: curl --silent --insecure https://localhost/api/v1/resources/cypher?query=MATCH\\(n\\)%20RETURN%20DISTINCT%20labels\\(n\\)"
#         ]

#     logger.info("[TRACE] end " + trace_id)
#     return jsonify(list_of_records)


# EOF
