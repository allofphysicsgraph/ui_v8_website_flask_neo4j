#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2024
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)
"""

import logging

logger = logging.getLogger(__name__)

from initialize_flask import web_app

from flask import render_template


@web_app.route("/api_via_js")
def to_api_via_js() -> str:
    return render_template("js_with_api/api_js.html")


@web_app.route("/api_documentation")
def to_api_documenation() -> str:
    return render_template("api_documentation.html")
