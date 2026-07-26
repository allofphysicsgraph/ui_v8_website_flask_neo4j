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

    Visiting https://localhost/api/resources/png_from_latex in a browser gets
    {"error":"nothing passed in"}

    Visiting https://localhost/api/resources/png_from_latex?tex=$x^2%2By$ in a browser gets
    {"png_location":"/static/temp_for_latex_validation/4f8033d7c6767c8119993bbd1ddc785b663a10911851d57b93dc87f7986513c1.png"}
    which can be viewed using
    https://localhost/static/temp_for_latex_validation/4f8033d7c6767c8119993bbd1ddc785b663a10911851d57b93dc87f7986513c1.png

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

    if request.method == "GET":
        user_input = request.args.get("tex")

        if user_input is None:
            return jsonify({"Error": "'tex' parameter is required!"}), 400

    elif request.method == "POST":
        data = request.get_json()

        if not data:
            return jsonify({"error": "Invalid or missing JSON"}), 400

        if "tex" not in data:
            return jsonify({"error": "Required 'tex' field is missing"}), 400

        user_input = data.get("tex")

    path_to_png = os.path.join(latex.STATIC_DIR, "temp_for_latex_validation") + "/"

    os.makedirs(path_to_png, exist_ok=True)

    if user_input:
        hash_of_user_input = hash_of_string(user_input)
    else:
        return jsonify({"error": "nothing passed in"}), 400

    path_to_png_with_filename = path_to_png + hash_of_user_input + ".png"

    if not os.path.exists(path_to_png_with_filename):
        latex.create_png_from_latex(user_input, path_to_png, hash_of_user_input)

    # trim "/code" prior to returning the path
    path_to_png_with_filename_no_prefix_directory = path_to_png_with_filename[
        len("/code") :
    ]

    return jsonify({"png_location": path_to_png_with_filename_no_prefix_directory}), 400


# EOF
