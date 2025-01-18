#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2025
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)
"""

import logging

logger = logging.getLogger(__name__)

from initialize_flask import web_app

from flask import (render_template, 
                   make_response) # https://stackoverflow.com/a/35672990/1164295


@web_app.route("/api_via_js")
def to_api_via_js() -> str:
    return render_template("js_with_api/api_js.html")


@web_app.route("/api_documentation")
def to_api_documenation() -> str:
    return render_template("api_documentation.html")

from flask import 


@app.route('/rss/<path:path>')
def serve(path):
    response = make_response(render_template('rss.xml'))
    response.headers['Content-Type'] = 'application/rss+xml'
    return response