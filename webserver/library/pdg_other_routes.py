#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2025
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)
"""

import random
import logging
import time
import os

logger = logging.getLogger(__name__)

from initialize_flask import web_app

from flask import (
    render_template,
    redirect,
    request,
    send_from_directory,
    make_response,  # https://stackoverflow.com/a/35672990/1164295
)


###########################################################################


@web_app.route("/api_via_js")
def to_api_via_js() -> str:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_js.html")


###########################################################################


@web_app.route("/api_documentation")
def to_api_documentation() -> str:
    """
    HTML page generated by Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("jinja2_pages/api_documentation.html")


@web_app.route("/workflow_documentation")
def to_workflow_documenation() -> str:
    """
    HTML page generated by Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("jinja2_pages/workflow_documentation.html")


###########################################################################


@web_app.route("/rss/<path:path>")
def to_rss(path):
    """
    TODO

    See https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/43
    """
    print(path)
    response = make_response(render_template("rss.xml"))
    response.headers["Content-Type"] = "application/rss+xml"
    return response


###########################################################################


@web_app.route("/profile/", methods=["GET", "POST"])
def my_profile():
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


@web_app.route("/search", methods=["GET"])
def search_redirect_to_google():
    """
    rather than search local content, rely on Google's index

    This search only works via webform since the value is grabbed from form value "search"
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info(
        "[TRACE] pdg_other_routes/search_form_redirect_to_google start "
        + trace_id
        + " "
        + str(time.time())
    )
    print(
        "request.url: " + str(request.url)
    )  # https://stackoverflow.com/a/46176337/1164295

    # request.url: http://localhost:5000/search?hello=bye

    if len(request.form.keys()) > 0:
        print("request.form =" + str(request.form))
        print("request.form.keys() =" + str(request.form.keys()))

        return redirect(
            "https://www.google.com/search?&q=site%3Aallofphysics.com+"
            + str(request.form.get("search"))
        )
    elif len(request.args.keys()) > 0:

        # request.args are embedded in the URL
        print("request.args=" + str(request.args))
        # request.args=ImmutableMultiDict([('hello', 'bye')])

        print("search term is " + str(request.args.get("q")))

        return redirect(
            "https://www.google.com/search?&q=site%3Aallofphysics.com+"
            + str(request.form.get("q"))
        )

    else:
        print("invalid use")
        return redirect(url_for("to_navigation"))

    return redirect(url_for("to_navigation"))


# @web_app.route("/search", methods=["POST"])
# def search_POST_redirect_to_google():
#     """
#     rather than search local content, rely on Google's index

#     This function expects a URL-based query
#     """
#     logger.info("[TRACE] pdg_other_routes/search_query_redirect_to_google")

#     print(
#         "request.url: " + str(request.url)
#     )  # https://stackoverflow.com/a/46176337/1164295

#     print("request.args=" + str(request.args))

#     search_term = request.args.get("q")

#     print("search_term: " + search_term)

#     return redirect(
#         "https://www.google.com/search?&q=site%3Aallofphysics.com+" + str(search_term)
#     )


###########################################################################


@web_app.route("/favicon.ico")  #     https://www.favicongenerator.com/
@web_app.route(
    "/robots.txt"
)  # https://github.com/allofphysicsgraph/proofofconcept/issues/160
@web_app.route(
    "/sitemap.txt"
)  # https://github.com/allofphysicsgraph/proofofconcept/issues/165
def static_file_from_root():
    """
    https://stackoverflow.com/a/14625619/1164295
    """
    return send_from_directory(web_app.static_folder, request.path[1:])


###########################################################################


@web_app.route("/static_dir", methods=["GET", "POST"])
def static_dir():
    """
    "static_dir" is a directory listing
    This route is not intended to be linked to
    >>> static_dir()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_other_routes/static_dir start " + trace_id + "]")
    # https://stackoverflow.com/a/3207973/1164295
    (_, _, filenames) = next(os.walk("static"))
    filenames.sort()
    logger.info("[TRACE] pdg_other_routes/static_dir end " + trace_id + "]")
    return render_template(
        "jinja2_pages/static_dir.html",
        list_of_files=filenames,
        folder_name="static",
        title="directory listing",
    )


###########################################################################


@web_app.route("/evaluation_of_LLM_prompts", methods=["GET", "POST"])
def to_evaluation_of_LLM_prompts():
    """ """
    logger.info("[TRACE] pdg_other_routes/evaluation_of_LLM_prompts")
    return render_template("jinja2_pages/evaluation_of_LLM_prompts.html")


###########################################################################


@web_app.route("/documentation/overview", methods=["GET", "POST"])
def to_documentation_overview():
    """
    What documentation is available?
    - user
    - developer
    - design
    - API
    - workflow
    """
    return render_template(
        "jinja2_pages/documentation_overview.html", title="Overview of Documentation"
    )


@web_app.route("/user_documentation", methods=["GET", "POST"])
@web_app.route("/documentation/user", methods=["GET", "POST"])
def to_user_documentation():
    """
    a static page with documentation aimed at users (not developers)

    >>> user_documentation()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/documentation_for_user.html", title="User Documentation"
    )


@web_app.route("/developer_documentation", methods=["GET", "POST"])
@web_app.route("/documentation/developer", methods=["GET", "POST"])
def to_developer_documentation():
    """
    a static page aimed at people interested in contributed code changes

    >>> developer_documentation()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/documentation_for_developer.html", title="Developer Documentation"
    )


@web_app.route("/design_documentation", methods=["GET", "POST"])
def to_design_documentation():
    """
    a static page aimed at people interested in understanding
    design decisions

    >>> design_documentation()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/documentation_of_design.html",
        title="Design Decisions Documentation",
    )


@web_app.route("/faq", methods=["GET", "POST"])
def to_faq():
    """
    "frequently asked questions" is a static page

    >>> faq()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template("jinja2_pages/faq.html", title="Frequently Asked Questions")


@web_app.route("/design_principles_and_goals", methods=["GET", "POST"])
def to_design_principles_and_goals():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/design_principles_and_goals.html",
        title="Design Principles and Goals",
    )


@web_app.route("/other_projects", methods=["GET", "POST"])
def to_other_projects():
    """
    "other projects" is a static page

    >>> other_projects()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template("jinja2_pages/other_projects.html", title="Other projects")


@web_app.route("/literature_review", methods=["GET", "POST"])
def to_literature_review():
    """
    "literature_review" is a static page

    >>> literature_review()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/literature_review.html", title="Literature Review"
    )


@web_app.route("/historical_precedents", methods=["GET", "POST"])
def to_historical_precedents():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/historical_precedents.html", title="historical precedents"
    )


@web_app.route("/site_map", methods=["GET", "POST"])
def to_site_map():
    """
    a static page for site content

    >>> static_map()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template("jinja2_pages/site_map.html", title="Site Map")


###########################################################################


@web_app.route("/login")
def to_login():
    """
    https://realpython.com/flask-google-login/
    """
    # This is a placeholder

    return render_template("jinja2_pages/user_workflow/site_map.html", title="site map")


###########################################################################


@web_app.route("/comparison_of_design_options/cas", methods=["GET", "POST"])
def to_comparison_of_design_options_cas():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/comparison_of_design_options_cas.html",
        title="Comparison of Design Options: Computer Algebra System (CAS)",
    )


@web_app.route("/comparison_of_design_options/proofs", methods=["GET", "POST"])
def to_comparison_of_design_options_proofs():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/comparison_of_design_options_proofs.html",
        title="Comparison of Design Options: Proofs",
    )


@web_app.route("/comparison_of_design_options/syntax", methods=["GET", "POST"])
def to_comparison_of_design_options_syntax():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/comparison_of_design_options_syntax.html",
        title="Comparison of Design Options: Syntax",
    )


@web_app.route("/comparison_of_design_options/database", methods=["GET", "POST"])
def to_comparison_of_design_options_database():
    """
    a static page
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template(
        "jinja2_pages/comparison_of_design_options_database.html",
        title="Comparison of Design Options: Database",
    )


###########################################################################


@web_app.route("/list_named_expressions", methods=["GET", "POST"])
def to_list_named_expressions():
    """
    TODO:
    https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/53

    Create a table that provides the results from the query
    ```
    MATCH (n) WHERE exists(n.name_latex) AND n.name_latex <> '' RETURN n
    ```

    >>> to_list_named_expressions()
    """
    logger.info("[TRACE] pdg_other_routes/to_list_named_expressions")
    return render_template(
        "jinja2_pages/named_expressions_list.html", title="central expressions"
    )


@web_app.route("/survey_of_named_expressions", methods=["GET", "POST"])
def to_survey_of_named_expressions():
    """
    This is a static page; content that hasn't been integrated into the PDG

    >>> to_survey_of_named_expressions()
    """
    logger.info("[TRACE] pdg_other_routes/to_survey_of_named_expressions")
    return render_template(
        "jinja2_pages/central_expressions_survey.html", title="central expressions"
    )


###########################################################################


@web_app.route("/blog/", methods=["GET"])
def to_blog_list():
    """ """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template("blog/blog_list.html")


@web_app.route("/blog/<YYYY>/<MM>/<blog_title>", methods=["GET"])
def to_blog(YYYY: str, MM: str, blog_title: str):
    """
    blog/YYYY/MM/blog-title

    blog()
    """
    logger.info("[TRACE] pdg_other_routes/")
    return render_template("blog/" + YYYY + "/" + MM + "/" + blog_title)


###########################################################################


@web_app.route("/clickable_layers", methods=["GET", "POST"])
def to_clickable_layers():
    """ """
    logger.info("[TRACE] pdg_other_routes/clickable_layers")
    return render_template(
        "jinja2_pages/clickable_layers.html", title="clickable_layers"
    )


###########################################################################


@web_app.route("/class_notes", methods=["GET", "POST"])
def to_class_notes_overview():
    """
    class notes from school
    """
    logger.info("[TRACE] pdg_other_routes/class_notes]")
    return render_template("class_notes/overview.html", title="class notes overview")


@web_app.route("/class_notes/<which_class>", methods=["GET", "POST"])
def to_class_notes_subpage(which_class: str):
    """
    class notes from school
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_other_routes/start " + trace_id + "] ")

    if which_class == "overview":
        logger.info("URL is overview")
        logger.info("[TRACE] pdg_other_routes/end " + trace_id + "]")
        return render_template("class_notes/overview.html", title="overview")
    elif which_class == "math402_mathematical_physics_hale":
        logger.info("URL is 402")
        logger.info("[TRACE] pdg_other_routes/end " + trace_id + "]")
        return render_template(
            "class_notes/math402_mathematical_physics_hale.html", title="Math 402"
        )

    logger.info("[TRACE] pdg_other_routes/end " + trace_id + "]")
    return render_template("class_notes_overview.html", title="class notes overview")


###########################################################################


@web_app.route("/spectrum_of_precision", methods=["GET", "POST"])
@web_app.route("/spectrum_of_precision/overview", methods=["GET", "POST"])
def to_spectrum_of_precision():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision: Overview"
    return render_template("jinja2_pages/layers_overview.html", title=page_title)


@web_app.route("/spectrum_of_precision/lecture", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_lecture():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template("jinja2_pages/layers_lecture_video.html", title=page_title)


@web_app.route("/spectrum_of_precision/handwritten", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_handwritten():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_handwritten_notes.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/latex", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_latex():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_document_without_decorations.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/tag_sections", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_tag_sections():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_section_document_structure.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/tag_words", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_tag_words():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_words_named_entity_recognition.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/tag_expressions", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_tag_expressions():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template("jinja2_pages/layers_contentML.html", title=page_title)


@web_app.route("/spectrum_of_precision/tag_all", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_tag_all():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_sections_words_contentML.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/variables", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_variables():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_concepts_to_variables.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/all_steps", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_all_steps():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template("jinja2_pages/layers_all_steps.html", title=page_title)


@web_app.route("/spectrum_of_precision/pdg", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_pdg():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_derivation_graph.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/CAS_validation", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_CAS_validation():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template("jinja2_pages/layers_validate_steps.html", title=page_title)


@web_app.route("/spectrum_of_precision/numeric_id", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_numeric_id():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_replace_variables_with_numeric_id.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/dimensional_validation", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_dimensional_validation():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_dimensional_validation.html", title=page_title
    )


@web_app.route("/spectrum_of_precision/proof", methods=["GET", "POST"])
def to_spectrum_of_precision_layer_proof():
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    return render_template(
        "jinja2_pages/layers_proof_of_inference_rule.html", title=page_title
    )


###########################################################################

###########################################################################

###########################################################################
