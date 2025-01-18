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

from flask import (
    render_template,
    make_response,
)  # https://stackoverflow.com/a/35672990/1164295


###########################################################################

@web_app.route("/api_via_js")
def to_api_via_js() -> str:
    return render_template("js_with_api/api_js.html")


###########################################################################

@web_app.route("/api_documentation")
def to_api_documenation() -> str:
    return render_template("api_documentation.html")


@web_app.route("/workflow_documentation")
def to_api_documenation() -> str:
    return render_template("workflow_documentation.html")


###########################################################################

@web_app.route("/rss/<path:path>")
def serve(path):
    response = make_response(render_template("rss.xml"))
    response.headers["Content-Type"] = "application/rss+xml"
    return response

###########################################################################

@web_app.route("/profile/", methods=["GET", "POST"])
def profile():
    """
    # TODO -- this is just a stub
    https://github.com/allofphysicsgraph/proofofconcept/issues/126
    >>>
    """
    # TODO
    sign_up_date = "2020-04-12"
    # TODO
    last_previous_contribution_date = "2020-04-10"
    # TODO
    list_of_derivs = ["fun deriv", "another deriv"]
    # TODO
    list_of_exprs = ["424252", "525252"]

    return render_template(
        "jinja2_pages/profile.html",
        # user_name=user_name,
        sign_up_date=sign_up_date,
        last_previous_contribution_date=last_previous_contribution_date,
        list_of_derivs=list_of_derivs,
        list_of_exprs=list_of_exprs,
        # title="PDG profile for " + user_name,
    )

###########################################################################

@web_app.route("/search", methods=["GET", "POST"])
def search_redirect_to_google():
    """
    rather than search local content, rely on Google's index
    """
    logger.info("[trace] search_redirect_to_google")
    logger.debug(
        "request.url: " + str(request.url)
    )  # https://stackoverflow.com/a/46176337/1164295

    # request.args are embedded in the URL
    # logger.debug("search term is " + str(request.args.get("search")))
    # logger.debug("request.args =" + str(request.args))
    logger.debug("request.form =" + str(request.form))
    logger.debug("request.form.keys() =" + str(request.form.keys()))

    return redirect(
        "https://www.google.com/search?&q=site%3Aderivationmap.net+"
        + str(request.form.get("search"))
    )

###########################################################################

@web_app.route("/favicon.ico")  #     https://www.favicongenerator.com/
@web_app.route(
    "/robots.txt"
)  # https://github.com/allofphysicsgraph/proofofconcept/issues/160
@web_app.route(
    "/sitemap.txt"
)  # https://github.com/allofphysicsgraph/proofofconcept/issues/165
def static_from_root():
    """
    https://stackoverflow.com/a/14625619/1164295
    """
    return send_from_directory(app.static_folder, request.path[1:])

###########################################################################

@web_app.route("/static_dir", methods=["GET", "POST"])
def static_dir():
    """
    "static_dir" is a directory listing
    This route is not intended to be linked to
    >>> static_dir()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace page start " + trace_id + "]")
    # https://stackoverflow.com/a/3207973/1164295
    (_, _, filenames) = next(os.walk("static"))
    filenames.sort()
    logger.info("[trace page end " + trace_id + "]")
    return render_template(
        "jinja2_pages/static_dir.html",
        list_of_files=filenames,
        folder_name="static",
        title="directory listing",
    )

###########################################################################

@app.route("/evaluation_of_LLM_prompts", methods=["GET", "POST"])
def evaluation_of_LLM_prompts():
    """ """
    logger.info("[trace page evaluation_of_LLM_prompts")
    return render_template("jinja2_pages/evaluation_of_LLM_prompts.html")

###########################################################################

@web_app.route("/user_documentation", methods=["GET", "POST"])
def user_documentation():
    """
    a static page with documentation aimed at users (not developers)

    >>> user_documentation()
    """
    logger.info("[trace]")
    return render_template("jinja2_pages/user_documentation.html", title="User Documentation")


###########################################################################

@web_app.route("/clickable_layers", methods=["GET", "POST"])
def clickable_layers():
    """ """
    logger.info("[trace page clickable_layers")
    return render_template("clickable_layers.html", title="clickable_layers")

###########################################################################

###########################################################################

###########################################################################

###########################################################################

###########################################################################