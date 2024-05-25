#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

"""
This is a from-scratch rewrite of the front-end and back-end of
https://derivationmap.net/
and will eventually replace that website. (The current site
uses a JSON file for the back-end and has a poor
model-view-controller implementation.)

This new iteration is based on a property graph (specifically Neo4j)
with cleaner separation between the MVC and the database.

Previous versions had a "local ID" which is needed when including
more than one derivation in the same Latex document.
For this version, the specific-to-Latex "local ID" (for expression labels)
can be contructed using <derivation_id>_<expression_id>.


# options for connecting to Neo4j from Python
- native driver
- py2neo
- neomodel
See https://neo4j.com/developer/python/

# Python native driver
- https://neo4j.com/docs/api/python-driver/current/api.html
- https://pypi.org/project/neo4j/
- https://github.com/neo4j/neo4j-python-driver

# demo of a local Flask app connecting to a remote Neo4j server
- https://neo4j.com/developer/python-movie-app/
- https://github.com/neo4j-examples/neo4j-movies-template/blob/master/flask-api/app.py

# Tips on using Cypher from Python
- https://neo4j.com/docs/python-manual/current/cypher-workflow/

****************************

# convention: every call to flash must be either a string or the content must be wrapped in str()
# reason: when content is passed to flash() that cannot be serialized, the Flask error and the website crashes

"""

# TODO as of 2023-08-27: move neo4j queries into separate module
# reasoning: separate front-end from back-end to make refactoring easier

import random
import time
import datetime

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List


import neo4j
from neo4j import GraphDatabase

# https://docs.python.org/3/howto/logging.html
import logging

# https://gist.github.com/ibeex/3257877
from logging.handlers import RotatingFileHandler

import os

# import logging

# logger = logging.getLogger(__name__)

# https://hplgit.github.io/web4sciapps/doc/pub/._web4sa_flask004.html
from flask import (
    Flask,
    g,
    redirect,
    render_template,
    request,
    url_for,
    send_from_directory,
    flash,
    jsonify,
    Response,
)

# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
from flask_wtf import FlaskForm, CSRFProtect, Form  # type: ignore

# https://stackoverflow.com/a/61729817/1164295
from werkzeug.utils import secure_filename

# removed "Form" from wtforms; see https://stackoverflow.com/a/20577177/1164295
from wtforms import StringField, validators, FieldList, FormField, IntegerField, RadioField, PasswordField, SubmitField, BooleanField  # type: ignore

from secure import SecureHeaders  # type: ignore

import sys
sys.path.append("library")

import neo4j_query
import compute

# ORDERING: this has to come before the functions that use this type
from compute import unique_numeric_id_as_str

# unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)

# Database Credentials
# "bolt" vs "neo4j" https://community.neo4j.com/t/different-between-neo4j-and-bolt/18498
uri = "bolt://neo4j_docker:7687"
# userName        = "neo4j"
# password        = "test"


# ORDERING: must come after constrain_id_to_be_unique
# Connect to the neo4j database server
neo4j_available = False
while not neo4j_available:
    print("TRACE: started while loop")
    try:
        graphDB_Driver = GraphDatabase.driver(uri)
        neo4j_available = True
        time.sleep(1)
    except ValueError:
        print("waiting 5 seconds for neo4j connection")
        time.sleep(5)

try:
    with graphDB_Driver.session() as session:
        # NO TIMING NEEDED HERE
        list_of_derivation_IDs = session.write_transaction(
            neo4j_query.constrain_unique_id
        )
        if list_of_derivation_IDs:
            number_of_derivations = len(list_of_derivation_IDs)
        else:  # list_of_derivation_IDs was "None"
            number_of_derivations = 0

except neo4j.exceptions.ClientError as er:
    print("Neo4j exception: " + str(er))


class Config(object):
    """
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
    """

    SECRET_KEY = os.environ.get("SECRET_KEY")


# ORDERING: this has to come before using the function wrapper
# ORDERING: this has to be after the class "Config" is specified
app = Flask(__name__, static_folder="static")
app.config.from_object(
    Config
)  # https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
app.config["UPLOAD_FOLDER"] = (
    # the following folder on the host is accessible to both flask and neo4j
    "/scratch/dumping_grounds/"  # https://flask.palletsprojects.com/en/3.0.x/patterns/fileuploads/
)
app.config["SEND_FILE_MAX_AGE_DEFAULT"] = (
    0  # https://stackoverflow.com/questions/34066804/disabling-caching-in-flask
)
app.config["DEBUG"] = True


import pdg_api

app.register_blueprint(pdg_api.bp)


class SpecifyNewDerivationForm(FlaskForm):
    """
    web form for user to provide name of (new) derivation

    https://wtforms.readthedocs.io/en/2.3.x/validators/

    the validators here need to also be present
    in the HTML, otherwise the form validation fails
    without a clear indicator to the HTML user
    """

    derivation_name_latex = StringField(
        "derivation name (latex)",
        validators=[validators.InputRequired(), validators.Length(min=5, max=1000)],
    )
    abstract_latex = StringField(
        "abstract (latex)",
        validators=[validators.InputRequired(), validators.Length(min=5, max=10000)],
    )


class SpecifyNewInferenceRuleForm(FlaskForm):
    """
    web form for user to provide inference rule

    https://wtforms.readthedocs.io/en/2.3.x/validators/
    """

    inference_rule_name = StringField(
        "name (latex)",
        validators=[validators.InputRequired(), validators.Length(min=5, max=1000)],
    )
    inference_rule_latex = StringField(
        "latex",
        validators=[validators.InputRequired(), validators.Length(min=5, max=10000)],
    )
    inference_rule_number_of_inputs = IntegerField(
        "number of inputs (non-negative integer)",
        validators=[validators.InputRequired(), validators.NumberRange(min=0, max=20)],
        default=0,
    )
    inference_rule_number_of_feeds = IntegerField(
        "number of feeds (non-negative integer)",
        validators=[validators.InputRequired(), validators.NumberRange(min=0, max=20)],
        default=0,
    )
    inference_rule_number_of_outputs = IntegerField(
        "number of outputs (non-negative integer)",
        validators=[validators.InputRequired(), validators.NumberRange(min=0, max=20)],
        default=0,
    )


class SpecifyNewStepForm(FlaskForm):
    """
    web form for user to specify inference rule for a step
    """

    note_before_step_latex = StringField(
        "note before step (latex)",
        validators=[validators.Length(max=1000)],
    )
    note_after_step_latex = StringField(
        "note after step (latex)",
        validators=[validators.Length(max=1000)],
    )


class SpecifyNewExpressionForm(FlaskForm):
    """
    web form for user to specify expressions used by steps

    this class is "LatexIO" in v7
    """

    expression_latex = StringField(
        "LaTeX expression",
        validators=[validators.Length(min=1, max=1000)],
    )
    expression_name = StringField(
        "name (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    expression_description = StringField(
        "description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )


class SpecifyNewSympyLeanForm(FlaskForm):
    """
    web form for user to provide SymPy and Lean vesions of expression

    https://wtforms.readthedocs.io/en/2.3.x/validators/

    the validators here need to also be present
    in the HTML, otherwise the form validation fails
    without a clear indicator to the HTML user
    """

    sympy = StringField(
        "SymPy",
        # validators=[validators.InputRequired(), validators.Length(min=5, max=1000)],
    )
    lean = StringField(
        "Lean",
        # validators=[validators.InputRequired(), validators.Length(min=5, max=10000)],
    )


class SpecifyNewSymbolDIRECTScalarForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    symbol_latex = StringField(
        label="LaTeX symbol",
        validators=[validators.Length(min=1, max=1000), validators.InputRequired()],
    )

    symbol_name = StringField(
        label="name (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_description = StringField(
        label="description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_reference = StringField("reference")

    symbol_scope = RadioField(
        label="scope",
        choices=[
            ("real", "real"),
            ("complex", "complex"),
            ("integer", "integer"),
            ("arbitrary", "arbitrary"),
        ],
        default="real",
        validators=[validators.InputRequired()],
    )

    symbol_variable_or_constant = RadioField(
        label="variable or constant",
        choices=[("variable", "variable"), ("constant", "constant")],
        default="variable",
        validators=[validators.InputRequired()],
    )

    # domain = input; range = output
    symbol_domain = RadioField(
        "domain",
        choices=[
            ("any", "any"),
            ("positive", "positive"),
            ("negative", "negative"),
            ("non-negative", "non-negative"),
        ],
        default="any",
        validators=[validators.InputRequired()],
    )
    dimension_length = IntegerField(
        "dimension: length",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_time = IntegerField(
        "dimension: time",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_mass = IntegerField(
        "dimension: mass",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_temperature = IntegerField(
        "dimension: temperature",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_electric_charge = IntegerField(
        "dimension: electric charge",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_amount_of_substance = IntegerField(
        "dimension: amount of substance",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_luminous_intensity = IntegerField(
        "dimension: luminous intensity",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )


class SpecifyNewSymbolDIRECTVectorForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    symbol_latex = StringField(
        label="LaTeX symbol",
        validators=[validators.Length(min=1, max=1000), validators.InputRequired()],
    )

    symbol_name = StringField(
        label="name (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_description = StringField(
        label="description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_reference = StringField("reference")

    symbol_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )

    symbol_size = RadioField(
        label="size",
        choices=[("arbitrary", "arbitrary"), ("fixed", "fixed")],
        default="arbitrary",
        validators=[validators.InputRequired()],
    )

    symbol_orientation = RadioField(
        label="orientation",
        choices=[
            ("row vector", "row vector"),
            ("column vector", "column vector"),
            ("arbitrary", "arbitrary"),
        ],
        default="arbitrary",
    )

    symbol_number_of_entries = IntegerField(
        label="number of entries",
        validators=[validators.NumberRange(min=1, max=20)],
        default=1,
    )


class SpecifyNewSymbolDIRECTMatrixForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    symbol_latex = StringField(
        label="LaTeX symbol",
        validators=[validators.Length(min=1, max=1000), validators.InputRequired()],
    )

    symbol_name = StringField(
        label="name (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_description = StringField(
        label="description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_reference = StringField("reference")

    symbol_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )

    symbol_size = RadioField(
        label="size",
        choices=[("arbitrary", "arbitrary"), ("fixed", "fixed")],
        default="arbitrary",
        validators=[validators.InputRequired()],
    )

    symbol_number_of_rows = IntegerField(
        label="number of rows",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )
    symbol_number_of_columns = IntegerField(
        label="number of columns",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )


class SpecifyNewSymbolDIRECTOperationForm(FlaskForm):
    operation_latex = StringField(
        "LaTeX symbol",
        validators=[validators.Length(min=1, max=1000), validators.InputRequired()],
    )

    operation_argument_count = IntegerField(
        label="number of arguments",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )

    operation_name = StringField(
        "name (LaTeX)",
        validators=[validators.InputRequired(), validators.Length(max=1000)],
    )
    operation_description = StringField(
        "description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    operation_reference = StringField("reference")


class SpecifyNewSymbolForm(FlaskForm):
    """
    web form for user to specify symbols used in expressions

    user hasn't specified whether this is an operation, scalar, vector, or matrix
    """

    symbol_latex = StringField(
        label="LaTeX symbol",
        validators=[validators.Length(min=1, max=1000), validators.InputRequired()],
    )

    symbol_requires_arguments = BooleanField(
        label="requires arguments",
        description="check for 'yes' (as in +); unchecked for 'no' (as in c)",
    )

    symbol_name = StringField(
        label="name (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_description = StringField(
        label="description (LaTeX)",
        validators=[validators.Length(max=1000)],
    )
    symbol_reference = StringField("reference")


class SpecifyNewSymbolArgumentCountForm(FlaskForm):
    """
    user has specified this is an operation, so now they need to specify number of arguments
    """

    argument_count = IntegerField(
        label="number of arguments",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )


class SpecifyNewSymbolDimensionCountForm(FlaskForm):
    """
    User has specified this is NOT an opersion, so now they need to specify whether the symbol is scalar, vector, or matrix
    """

    dimension_count = IntegerField(
        label="number of dimensions",
        validators=[validators.InputRequired(), validators.NumberRange(min=0, max=3)],
        default=0,
    )


class SpecifyNewSymbolDimension0Form(FlaskForm):
    """
    This overlaps with SpecifyNewSymbolDIRECTScalarForm
    """

    # https://en.wikipedia.org/wiki/List_of_types_of_numbers
    symbol_scope = RadioField(
        label="scope",
        choices=[("real", "real"), ("complex", "complex"), ("integer", "integer")],
        default="real",
        validators=[validators.InputRequired()],
    )

    symbol_variable_or_constant = RadioField(
        label="variable or constant",
        choices=[("variable", "variable"), ("constant", "constant")],
        default="variable",
        validators=[validators.InputRequired()],
    )

    # domain = input; range = output
    symbol_domain = RadioField(
        "domain",
        choices=[
            ("any", "any"),
            ("positive", "positive"),
            ("negative", "negative"),
            ("non-negative", "non-negative"),
        ],
        default="any",
        validators=[validators.InputRequired()],
    )
    dimension_length = IntegerField(
        "dimension: length",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_time = IntegerField(
        "dimension: time",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_mass = IntegerField(
        "dimension: mass",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_temperature = IntegerField(
        "dimension: temperature",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_electric_charge = IntegerField(
        "dimension: electric charge",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_amount_of_substance = IntegerField(
        "dimension: amount of substance",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_luminous_intensity = IntegerField(
        "dimension: luminous intensity",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )


class SpecifyNewSymbolDimension1Form(FlaskForm):
    symbol_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )


class SpecifyNewSymbolDimension2Form(FlaskForm):
    symbol_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )


class CypherQueryForm(FlaskForm):
    """
    web form for user to provide Cypher query for Neo4j database

    although a minimum input length of 1 sounds reasonable,
    that causes the empty form to fail
    """

    query = StringField(
        "Cypher query",
        validators=[validators.InputRequired()],
    )


class NoOptionsForm(FlaskForm):
    """
    no text input
    """

    pass


# @app.before_request
# def before_request():
#     """
#     needed for "g.request_time()" to show page load latency

#     TODO: this is referenced in _footer.html but doesn't work

#     Note: this function need to be before almost all other functions

#     tutorial: https://pythonise.com/series/learning-flask/python-before-after-request

#     https://stackoverflow.com/questions/12273889/calculate-execution-time-for-every-page-in-pythons-flask
#     actually, https://gist.github.com/lost-theory/4521102
#     >>> before_request():
#     """
#     g.start = time.time()
#     g.request_start_time = time.time()
#     elapsed_time = lambda: "%.5f seconds" % (time.time() - g.request_start_time)
#     # logger.debug("created elapsed_time function")
#     g.request_time = elapsed_time
#     return


@app.route("/", methods=["GET", "POST"])
def main() -> str:
    """
    initial page

    file upload: see https://flask.palletsprojects.com/en/3.0.x/patterns/fileuploads/

    >>> main()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/main start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    if request.method == "POST":
        print("request.form = %s", request.form)

        # check if the post request has the file part
        if "file" not in request.files:
            error_message_for_user = "ERROR: file not in request files"
            print("ERROR: file not in request files")
            print("[TRACE] func: app/main end " + trace_id)
            return redirect(request.url)
        file_obj = request.files["file"]

        print("request.files", request.files)
        # if user does not select file, browser also
        # submit an empty part without filename
        if file_obj.filename == "":
            error_message_for_user = "WARN: no selected file"
            print("WARN: no selected file")
            print("[TRACE] func: app/main end " + trace_id)
            return redirect(request.url)
        if "upload_cypher" in request.form.keys():
            allowed_bool = True
        else:
            print("[TRACE] func: app/main end " + trace_id)
            raise Exception("unrecognized button")

        if file_obj and allowed_bool:
            print("file_obj.filename=", file_obj.filename)
            filename = secure_filename(file_obj.filename)
            print("filename = ", filename)
            path_to_uploaded_file = os.path.join(app.config["UPLOAD_FOLDER"], filename)
            print("path_to_uploaded_file=", path_to_uploaded_file)
            try:
                file_obj.save(path_to_uploaded_file)
            except FileNotFoundError as e:
                error_message_for_user = "ERROR: unable to save file" + str(e)
                print("ERROR: unable to save file" + str(e))
                return redirect(request.url)

            # shutil.copy(path_to_uploaded_file, "/code/" + path_to_db)

            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                str_to_print = session.write_transaction(
                    neo4j_query.delete_all_nodes_and_relationships
                )
                query_time_dict["main: delete_all_nodes_and_relationships"] = (
                    time.time() - query_start_time
                )
            # upload Cypher content inside the neo4j docker image
            # TODO: how to automate this?
            print(
                "docker exec <CONTAINER_ID> bin/cypher-shell --file dumping_grounds/pdg.cypher"
            )

    # TODO: replace the counts below with
    # MATCH (n) RETURN distinct labels(n), count(*)

    number_of_derivations = None
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        number_of_derivations = len(
            session.read_transaction(neo4j_query.list_nodes_of_type, "derivation")
        )
        query_time_dict["main: list_nodes_of_type, derivation"] = (
            time.time() - query_start_time
        )

    number_of_inference_rules = None
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        number_of_inference_rules = len(
            session.read_transaction(neo4j_query.list_nodes_of_type, "inference_rule")
        )
        query_time_dict["main: list_nodes_of_type, inference_rule"] = (
            time.time() - query_start_time
        )

    number_of_expressions = None
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        number_of_expressions = len(
            session.read_transaction(neo4j_query.list_nodes_of_type, "expression")
        )
        query_time_dict["main: list_nodes_of_type, expression"] = (
            time.time() - query_start_time
        )

    number_of_symbols = None
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        number_of_symbols = len(
            session.read_transaction(neo4j_query.list_nodes_of_type, "symbol")
        )
        query_time_dict["main: list_nodes_of_type, symbol"] = (
            time.time() - query_start_time
        )

    number_of_operations = 0
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "symbol"
        )
        query_time_dict["main: list_nodes_of_type, symbol for operation"] = (
            time.time() - query_start_time
        )
    # filter "list_of_symbol_dicts" down to "list_of_operation_dicts"
    for this_symbol_dict in list_of_symbol_dicts:
        if this_symbol_dict["requires_arguments"]:
            number_of_operations += 1

    print("[TRACE] func: app/main end " + trace_id)
    return render_template(
        "site_map.html",
        title="site map",
        query_time_dict=query_time_dict,
        number_of_derivations=number_of_derivations,
        number_of_inference_rules=number_of_inference_rules,
        number_of_expressions=number_of_expressions,
        number_of_symbols=number_of_symbols,
        number_of_operations=number_of_operations,
    )


@app.route("/new_derivation", methods=["GET", "POST"])
def to_add_derivation() -> str:
    """
    create new derivation
    user provides deritivation name and abstract

    WIP:
    http://localhost:5000/new_derivation?derivation_name=asdf123&derivation_abstract=4924858miminginasf
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_derivation start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    # TODO: check that the name of the derivation doesn't
    #       conflict with existing derivation names

    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "derivation"
        )

    number_of_steps_per_derivation = {}
    for derivation_dict in list_of_derivation_dicts:
        print("derivation_dict", derivation_dict)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_steps = session.read_transaction(
                neo4j_query.steps_in_this_derivation, derivation_dict["id"]
            )
        number_of_steps_per_derivation[derivation_dict["id"]] = len(list_of_steps)

    print("derivations in the database:")
    for deriv_dict in list_of_derivation_dicts:
        print("deriv_dict:", deriv_dict)

    # derivation_name_from_URL = None
    # derivation_abstract_from_URL = None
    # # via URL keyword
    # derivation_name_from_URL = str(request.args.get("derivation_name", None))
    # derivation_abstract_from_URL = str(request.args.get("derivation_abstract", None))
    # if derivation_name_from_URL and derivation_abstract_from_URL:
    #     print("derivation_name_from_URL:", derivation_name_from_URL)
    #     print("derivation_abstract_from_URL:", derivation_abstract_from_URL)

    print("request.form=", request.form)
    web_form = SpecifyNewDerivationForm(request.form)

    print("request.method=", request.method)
    print("web_form.validate()=", web_form.validate())

    if request.method == "POST" and web_form.validate():
        print("request.form =", request.form)
        derivation_name_latex = str(web_form.derivation_name_latex.data).strip()
        abstract_latex = str(web_form.abstract_latex.data).strip()
        print("       derivation:", derivation_name_latex)
        print("       abstract:", abstract_latex)
        author_name_latex = "ben"

        list_of_derivation_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivation_IDs = session.read_transaction(
                neo4j_query.list_IDs, "derivation"
            )

        derivation_id = compute.generate_random_id(list_of_derivation_IDs)
        print("derivation_id=", derivation_id)

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
                abstract_latex,
                author_name_latex,
            )

        print("[TRACE] func: app/to_add_derivation end " + trace_id)
        return redirect(
            url_for(
                "to_add_step_select_inference_rule",
                derivation_id=derivation_id,
            )
        )

    print("[TRACE] func: app/to_add_derivation end " + trace_id)
    return render_template(
        "derivation_create.html",
        query_time_dict=query_time_dict,
        form=web_form,
        list_of_derivation_dicts=list_of_derivation_dicts,
        number_of_steps_per_derivation=number_of_steps_per_derivation,
    )


@app.route("/review_derivation/<derivation_id>", methods=["GET", "POST"])
def to_review_derivation(derivation_id: unique_numeric_id_as_str) -> str:
    """
    options from this page:
    * add step to existing derivation
    * delete step from existing derivation
    * edit step in derivation
    * delete derivation

    https://derivationmap.net/static/property_graph_schema.png

    >>> to_review_derivation()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_review_derivation start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    #    if request.method == "POST" and web_form.validate():

    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.node_properties, "derivation", derivation_id
        )
        query_time_dict["to_review_derivation: node_properties, derivation"] = (
            time.time() - query_start_time
        )
    print("derivation_dict:", derivation_dict)

    all_steps, query_time_dict = compute.all_steps_in_derivation(
        graphDB_Driver, derivation_id, query_time_dict
    )

    web_form = NoOptionsForm(request.form)
    if request.method == "POST":
        print("request.form = ", request.form)
        # delete derivation (yikes!). Here's how:
        # 1) for each step,
        #      * disconnect step from inference rule (remove edge)
        #      * disconnect step from expressions (remove edge)
        #      * disconnect step from derivation (remove edge)
        #      * delete step node
        # 2) delete derivation node

        list_of_step_dicts = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_step_dicts = session.read_transaction(
                neo4j_query.steps_in_this_derivation, derivation_id
            )
            query_time_dict["to_review_derivation: steps_in_this_derivation"] = (
                time.time() - query_start_time
            )
        print("list_of_step_dicts=", list_of_step_dicts)

        for this_step_dict in list_of_step_dicts:
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.disconnect_step_from_inference_rule,
                    this_step_dict["id"],
                )
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.disconnect_step_from_expressions, this_step_dict["id"]
                )
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.disconnect_step_from_derivation, this_step_dict["id"]
                )
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.delete_node, this_step_dict["id"], "step"
                )
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.delete_node, derivation_id, "derivation"
            )

    print("[TRACE] func: app/to_review_derivation end " + trace_id)
    return render_template(
        "derivation_review.html",
        query_time_dict=query_time_dict,
        derivation_dict=derivation_dict,
        all_steps=all_steps,
        form=web_form,
    )


@app.route("/select_step/<derivation_id>/", methods=["GET", "POST"])
def to_select_step(derivation_id: unique_numeric_id_as_str) -> str:
    """
    User wants to delete step or edit step
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_select_step start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    # get properties for derivation ID
    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.node_properties, "derivation", derivation_id
        )
        query_time_dict["to_select_step: node_properties, derivation"] = (
            time.time() - query_start_time
        )
    print("derivation_dict:", derivation_dict)

    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.steps_in_this_derivation, derivation_id
        )
        query_time_dict["to_select_step: steps_in_this_derivation"] = (
            time.time() - query_start_time
        )
    print("list_of_step_dicts=", list_of_step_dicts)

    # inference_rule_per_step = {}
    # for this_step_dict in list_of_step_dicts:
    #    with graphDB_Driver.session() as session:
    #        neo4j_query.step_has_inference_rule,

    #    with graphDB_Driver.session() as session:
    #        neo4j_query.step_has_expressions

    all_steps, query_time_dict = compute.all_steps_in_derivation(
        graphDB_Driver, derivation_id, query_time_dict
    )

    print("[TRACE] func: app/to_select_step end " + trace_id)
    return render_template(
        "derivation_select_step.html",
        derivation_dict=derivation_dict,
        list_of_step_dicts=list_of_step_dicts,
        all_steps=all_steps,
        query_time_dict=query_time_dict,
    )


@app.route("/edit_derivation_metadata/<derivation_id>/", methods=["GET", "POST"])
def to_edit_derivation_metadata(derivation_id: unique_numeric_id_as_str) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_derivation_metadata start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form = SpecifyNewDerivationForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        # request.form =  ImmutableMultiDict(('derivation_name_latex', 'this isa'), ('abstract_latex', 'heresasdf00')])

        derivation_name_latex = str(web_form.derivation_name_latex.data).strip()
        abstract_latex = str(web_form.abstract_latex.data).strip()

        # as per https://strftime.org/
        # %f = Microsecond as a decimal number, zero-padded on the left.
        now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

        author_name_latex = "Ben"

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_derivation_metadata,
                derivation_id,
                derivation_name_latex,
                abstract_latex,
                now_str,
                author_name_latex,
            )
            query_time_dict["to_edit_derivation_metadata: edit_derivation_metadata"] = (
                time.time() - query_start_time
            )

    # get properties for derivation ID
    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.node_properties, "derivation", derivation_id
        )
        query_time_dict["to_edit_derivation_metadata: node_properties"] = (
            time.time() - query_start_time
        )
    print("derivation_dict:", derivation_dict)

    print("[TRACE] func: app/to_edit_derivation_metadata end " + trace_id)
    return render_template(
        "derivation_edit_metadata.html",
        query_time_dict=query_time_dict,
        form=web_form,
        derivation_dict=derivation_dict,
    )


@app.route("/new_step_select_inference_rule/<derivation_id>/", methods=["GET", "POST"])
def to_add_step_select_inference_rule(derivation_id: unique_numeric_id_as_str) -> str:
    """
    add new step to existing derivation

    What inference rule should be used for this step?
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_step_select_inference_rule start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    print("derivation_id: ", derivation_id)

    # # web_form = SpecifyNewStepForm(request.form)
    # if request.method == "POST": #and web_form.validate():
    #     print("request.form = ", request.form)

    #     # TODO: get user name from Google login
    #     author_name_latex = "ben"

    #     # TODO: get the inference_rule_id from the webform
    #     # inference_rule_id =
    #     print(inference_rule_id)

    #     print("[TRACE] func: app/to_add_step_select_inference_rule end " + trace_id)
    #     redirect(
    #         url_for(
    #             "to_add_step_select_expressions",
    #             derivation_id=derivation_id,
    #             inference_rule_id=inference_rule_id,
    #         )
    #     )

    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "inference_rule"
        )

    print("list_of_inference_rule_dicts=", list_of_inference_rule_dicts)

    # Inference rules have the schema
    # [{'id': '7616707',
    #   'author_name_latex': 'ben',
    #   'name': 'add x to both sides',
    #   'latex': 'ADD _ to BOTH sides'},...]

    # to populate the dropdown menu we need the list of inference rule IDs
    list_of_inference_rule_IDs = []
    for inference_rule_dict in list_of_inference_rule_dicts:
        list_of_inference_rule_IDs.append(inference_rule_dict["id"])

    # get properties of this derivation
    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.node_properties, "derivation", derivation_id
        )
    print("derivation_dict:", derivation_dict)

    print("[TRACE] func: app/to_add_step_select_inference_rule end " + trace_id)
    return render_template(
        "new_step_select_inference_rule.html",
        query_time_dict=query_time_dict,
        list_of_inference_rule_dicts=list_of_inference_rule_dicts,
        derivation_dict=derivation_dict,
    )
    # # workflow shouldn't reach this condition, but if it does,
    # print("[TRACE] func: app/to_add_step_select_inference_rule end " + trace_id)
    # raise Exception("How did you reach this?")

    # print("[TRACE] func: app/to_add_step_select_inference_rule end " + trace_id)
    # return redirect(url_for("to_review_derivation", derivation_id=derivation_id))


@app.route("/edit_expression/<expression_id>", methods=["GET", "POST"])
def to_edit_expression(expression_id: unique_numeric_id_as_str) -> str:
    """
    novel expression
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_expression start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    print("expression_id: ", expression_id)

    expression_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.node_properties, "expression", expression_id
        )
    print("expression_dict:", expression_dict)

    # editing the expression includes modifying the symbols present.

    dict_of_all_symbol_dicts, query_time_dict = compute.get_dict_of_symbol_dicts(
        graphDB_Driver, query_time_dict
    )
    print("dict_of_all_symbol_dicts=", dict_of_all_symbol_dicts)
    # dict_of_all_operation_dicts = compute.get_dict_of_operation_dicts(graphDB_Driver)
    # print("dict_of_all_operation_dicts=", dict_of_all_operation_dicts)

    list_of_symbol_IDs_in_expression = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression = session.read_transaction(
            neo4j_query.symbols_in_expression, expression_id
        )
    print(
        "expression_id=",
        expression_id,
        "list_of_symbol_IDs_in_expression=",
        list_of_symbol_IDs_in_expression,
    )

    dict_of_symbol_dicts_in_expression = {}
    for this_symbol_ID in list_of_symbol_IDs_in_expression:
        print("this_symbol_ID=", this_symbol_ID)
        print("dict_of_all_symbol_dicts.keys()=", dict_of_all_symbol_dicts.keys())
        dict_of_symbol_dicts_in_expression[this_symbol_ID] = dict_of_all_symbol_dicts[
            this_symbol_ID
        ]
    print("dict_of_symbol_dicts_in_expression=", dict_of_symbol_dicts_in_expression)

    # create new dict of symbols NOT used in expression
    dict_of_symbol_dicts_not_in_expression = {}
    for this_symbol_id in dict_of_all_symbol_dicts.keys():
        if this_symbol_id not in dict_of_symbol_dicts_in_expression.keys():
            dict_of_symbol_dicts_not_in_expression[this_symbol_id] = (
                dict_of_all_symbol_dicts[this_symbol_id]
            )
    print(
        "dict_of_symbol_dicts_not_in_expression=",
        dict_of_symbol_dicts_not_in_expression,
    )

    # # create new dict of operations NOT used in expression
    # dict_of_operation_dicts_not_in_expression = {}
    # for this_operation_id in dict_of_all_operation_dicts.keys():
    #     if this_operation_id not in dict_of_operation_dicts_in_expression.keys():
    #         dict_of_operation_dicts_not_in_expression[this_operation_id] = (
    #             dict_of_all_operation_dicts[this_operation_id]
    #         )

    web_form_new_expression = SpecifyNewExpressionForm(request.form)
    if request.method == "POST" and web_form_new_expression.validate():
        print("with web_form, request.form = ", request.form)

        expression_latex = str(web_form_new_expression.expression_latex.data).strip()
        expression_name = str(web_form_new_expression.expression_name.data).strip()
        expression_description = str(
            web_form_new_expression.expression_description.data
        ).strip()

        print("expression_latex=", expression_latex)
        print("expression_name=", expression_name)
        print("expression_description=", expression_description)

        # %f = Microsecond as a decimal number, zero-padded on the left.
        now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

        author_name_latex = "ben"

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_expression,
                expression_id,
                expression_latex,
                expression_name,
                expression_description,
                now_str,
                author_name_latex,
            )

    web_form_no_options = NoOptionsForm(request.form)
    if request.method == "POST":
        print("no web_form; request.form = ", request.form)

        if "symbol_select_id_to_disconnect" in request.form.keys():
            symbol_id_to_disconnect = str(
                request.form["symbol_select_id_to_disconnect"]
            )
            print("symbol_id_to_disconnect=", symbol_id_to_disconnect)

            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.disconnect_symbol_from_expression,
                    symbol_id_to_disconnect,
                    expression_id,
                )

        if "symbol_select_id_to_add" in request.form.keys():
            symbol_id_to_add = str(request.form["symbol_select_id_to_add"])
            print("symbol_id_to_add=", symbol_id_to_add)

            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                session.write_transaction(
                    neo4j_query.add_symbol_to_expression,
                    symbol_id_to_add,
                    expression_id,
                )

        # if "operation_select_id_to_disconnect" in request.form.keys():
        #     operation_id_to_disconnect = str(
        #         request.form["operation_select_id_to_disconnect"]
        #     )
        #     print("symbol_id_to_disconnect=", operation_id_to_disconnect)

        #     # https://neo4j.com/docs/python-manual/current/session-api/
        #     with graphDB_Driver.session() as session:
        #         session.write_transaction(
        #             neo4j_query.disconnect_operation_from_expression,
        #             operation_id_to_disconnect,
        #             expression_id,
        #         )

        # if "operation_select_id_to_add" in request.form.keys():
        #     operation_id_to_add = str(request.form["operation_select_id_to_add"])
        #     print("symbol_id_to_add=", operation_id_to_add)

        #     # https://neo4j.com/docs/python-manual/current/session-api/
        #     with graphDB_Driver.session() as session:
        #         session.write_transaction(
        #             neo4j_query.add_operation_to_expression,
        #             symbol_id_to_add,
        #             expression_id,
        #         )

    print("[TRACE] func: app/to_edit_expression end " + trace_id)
    return render_template(
        "expression_edit.html",
        query_time_dict=query_time_dict,
        form_no_options=web_form_no_options,
        form_new_expression=web_form_new_expression,
        dict_of_symbol_dicts_in_expression=dict_of_symbol_dicts_in_expression,
        # dict_of_operation_dicts_in_expression=dict_of_operation_dicts_in_expression,
        dict_of_symbol_dicts_not_in_expression=dict_of_symbol_dicts_not_in_expression,
        # dict_of_operation_dicts_not_in_expression=dict_of_operation_dicts_not_in_expression,
        expression_dict=expression_dict,
        dict_of_all_symbol_dicts=dict_of_all_symbol_dicts,
        # dict_of_all_operation_dicts=dict_of_all_operation_dicts,
    )
    # return redirect(url_for("to_list_expressions"))


@app.route("/new_expression/", methods=["GET", "POST"])
def to_add_expression() -> str:
    """
    novel expression
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_expression start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "expression"
        )

        symbols_per_expression = compute.symbols_per_expression(
            graphDB_Driver, query_time_dict, list_of_expression_dicts
        )

    web_form = SpecifyNewExpressionForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        # request.form =  ImmutableMultiDict([('input1', 'a = b'), ('submit_button', 'Submit')])

        expression_latex = str(web_form.expression_latex.data).strip()
        expression_name = str(web_form.expression_name.data).strip()
        expression_description = str(web_form.expression_description.data).strip()

        print("expression_latex:", expression_latex)
        # TODO: validate that this string is actually Latex before adding to database

        print("expression_name:", expression_name)
        print("expression_description", expression_description)

        # TODO: this shouldn't be hardcoded
        author_name_latex = "ben"

        list_of_expression_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_expression_IDs = session.read_transaction(
                neo4j_query.list_IDs, "expression"
            )
        expression_id = compute.generate_random_id(list_of_expression_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_expression,
                expression_id,
                expression_name,
                expression_latex,
                expression_description,
                author_name_latex,
            )

        # after user provides latex for expression have them provide symbol count
        print("[TRACE] func: app/ end " + trace_id)
        return redirect(
            url_for(
                "to_add_symbols_and_operations_for_expression",
                expression_id=expression_id,
            )
        )

    print("[TRACE] func: app/to_add_expression end " + trace_id)
    return render_template(
        "expression_create.html",
        query_time_dict=query_time_dict,
        form=web_form,
        symbols_per_expression=symbols_per_expression,
        list_of_expression_dicts=list_of_expression_dicts,
    )


@app.route("/edit_operation/<operation_id>", methods=["GET", "POST"])
def to_edit_operation(operation_id: unique_numeric_id_as_str) -> str:
    """
    edit operation
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_operation start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    print("expression_id: ", operation_id)

    web_form = SpecifyNewSymbolForm(request.form)
    print("request.method =", request.method)
    print("request.form = ", request.form)
    if request.method == "POST" and web_form.validate():
        print("in POST the request.form = ", request.form)

        operation_latex = str(web_form.operation_latex.data).strip()
        operation_name = str(web_form.operation_name.data).strip()
        operation_description = str(web_form.operation_description.data).strip()
        operation_number_of_arguments = str(
            web_form.operation_number_of_arguments.data
        ).strip()

        author_name_latex = "ben"

        # # https://neo4j.com/docs/python-manual/current/session-api/
        # with graphDB_Driver.session() as session:
        #     query_start_time = time.time()
        #     session.write_transaction(
        #         neo4j_query.add_operation,
        #         operation_id,
        #         operation_name,
        #         operation_latex,
        #         operation_description,
        #         operation_number_of_arguments,
        #         author_name_latex,
        #     )

    # operation_dict = {}
    # # get properties of this operation
    # with graphDB_Driver.session() as session:
    #     query_start_time = time.time()
    #     operation_dict = session.read_transaction(
    #         neo4j_query.node_properties, "operation", operation_id
    #     )

    # print("operation_dict:", operation_dict)

    print("[TRACE] func: app/to_edit_operation end " + trace_id)
    return render_template(
        "symbol_edit_operation.html",
        query_time_dict=query_time_dict,
        form=web_form,
        # operation_dict=operation_dict,
    )
    # return redirect(url_for("to_list_operations"))


@app.route("/edit_symbol/<symbol_id>", methods=["GET", "POST"])
def to_edit_symbol(symbol_id: unique_numeric_id_as_str) -> str:
    """
    edit symbol

    >>> to_edit_symbol()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_symbol start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    print("symbol_id: ", symbol_id)

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict["to_edit_symbol: node_properties"] = (
            time.time() - query_start_time
        )
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolForm(request.form)
    web_form_no_options = NoOptionsForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_latex = str(web_form_symbol_properties.symbol_latex.data).strip()
        symbol_name = str(web_form_symbol_properties.symbol_name.data).strip()
        symbol_description = str(
            web_form_symbol_properties.symbol_description.data
        ).strip()
        symbol_reference = str(web_form_symbol_properties.symbol_reference.data).strip()

        # shouldn't change this aspect
        symbol_requires_arguments = symbol_dict["requires_arguments"]

        author_name_latex = "ben"

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol,
                symbol_id,
                symbol_name,
                symbol_latex,
                symbol_description,
                symbol_requires_arguments,
                symbol_reference,
                author_name_latex,
            )
    # elif request.method == "POST" and web_form_symbol_properties_vector.validate():
    #     print("request.form = ", request.form)

    #     print("[TRACE] func: app/to_edit_symbol end " + trace_id)
    #     return redirect(url_for("to_list_symbols"))

    elif request.method == "POST":
        print("request.form = ", request.form)

        # TODO: delete symbol

        print("[TRACE] func: app/to_edit_symbol end " + trace_id)
        return redirect(url_for("to_list_symbols"))

    print("[TRACE] func: app/to_edit_symbol end " + trace_id)
    return render_template(
        "symbol_edit.html",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        form_no_options=web_form_no_options,
        symbol_dict=symbol_dict,
    )
    # return redirect(url_for("to_list_symbols"))


@app.route("/new_symbol_scalar/", methods=["GET", "POST"])
def to_add_symbol_scalar() -> str:
    """
    novel scalar symbol
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_scalar start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form_symbol_properties = SpecifyNewSymbolDIRECTScalarForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_latex = str(web_form_symbol_properties.symbol_latex.data).strip()
        symbol_name = str(web_form_symbol_properties.symbol_name.data).strip()
        symbol_description = str(
            web_form_symbol_properties.symbol_description.data
        ).strip()
        symbol_reference = str(web_form_symbol_properties.symbol_reference.data).strip()

        print("symbol_latex:", symbol_latex)
        print("symbol_name:", symbol_name)
        print("symbol_description", symbol_description)

        symbol_scope = web_form_symbol_properties.symbol_scope.data
        symbol_variable_or_constant = (
            web_form_symbol_properties.symbol_variable_or_constant.data
        )
        symbol_domain = web_form_symbol_properties.symbol_domain.data
        dimension_length = web_form_symbol_properties.dimension_length.data
        dimension_time = web_form_symbol_properties.dimension_time.data
        dimension_mass = web_form_symbol_properties.dimension_mass.data
        dimension_temperature = web_form_symbol_properties.dimension_temperature.data
        dimension_electric_charge = (
            web_form_symbol_properties.dimension_electric_charge.data
        )
        dimension_amount_of_substance = (
            web_form_symbol_properties.dimension_amount_of_substance.data
        )
        dimension_luminous_intensity = (
            web_form_symbol_properties.dimension_luminous_intensity.data
        )

        author_name_latex = "ben"

        list_of_symbol_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs = session.read_transaction(
                neo4j_query.list_IDs, "symbol"
            )
        symbol_id = compute.generate_random_id(list_of_symbol_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol_direct_scalar,
                symbol_id,
                symbol_name,
                symbol_latex,
                symbol_description,
                symbol_reference,
                symbol_scope,
                symbol_variable_or_constant,
                symbol_domain,
                dimension_length,
                dimension_time,
                dimension_mass,
                dimension_temperature,
                dimension_electric_charge,
                dimension_amount_of_substance,
                dimension_luminous_intensity,
                author_name_latex,
            )
        return redirect(url_for("to_list_symbols"))

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )

    print("[TRACE] func: app/to_add_symbol_scalar end " + trace_id)
    return render_template(
        "symbol_create_direct_scalar.html",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        list_of_dimension0_symbol_dicts=list_of_dimension0_symbol_dicts,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
    )


@app.route("/new_symbol_vector/", methods=["GET", "POST"])
def to_add_symbol_vector() -> str:
    """
    novel symbol
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_vector start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form_symbol_properties = SpecifyNewSymbolDIRECTVectorForm(request.form)

    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_latex = str(web_form_symbol_properties.symbol_latex.data).strip()
        symbol_name = str(web_form_symbol_properties.symbol_name.data).strip()
        symbol_description = str(
            web_form_symbol_properties.symbol_description.data
        ).strip()
        symbol_reference = str(web_form_symbol_properties.symbol_reference.data).strip()
        symbol_is_composite = web_form_symbol_properties.symbol_is_composite.data

        symbol_size = str(web_form_symbol_properties.symbol_size.data).strip()
        symbol_orientation = str(
            web_form_symbol_properties.symbol_orientation.data
        ).strip()

        print("symbol_latex:", symbol_latex)
        print("symbol_name:", symbol_name)
        print("symbol_description", symbol_description)

        symbol_number_of_entries = str(
            web_form_symbol_properties.symbol_number_of_entries.data
        ).strip()

        author_name_latex = "ben"  # TODO: get username

        list_of_symbol_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs = session.read_transaction(
                neo4j_query.list_IDs, "symbol"
            )
        symbol_id = compute.generate_random_id(list_of_symbol_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol_direct_vector,
                symbol_id,
                symbol_name,
                symbol_latex,
                symbol_description,
                symbol_reference,
                symbol_is_composite,
                symbol_size,
                symbol_orientation,
                symbol_number_of_entries,
                author_name_latex,
            )
        return redirect(url_for("to_list_symbols"))

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    print("[TRACE] func: app/to_add_symbol_vector end " + trace_id)
    return render_template(
        "symbol_create_direct_vector.html",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        list_of_dimension1_symbol_dicts=list_of_dimension1_symbol_dicts,
    )


@app.route("/new_symbol_matrix/", methods=["GET", "POST"])
def to_add_symbol_matrix() -> str:
    """
    novel symbol
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_matrix start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form_symbol_properties = SpecifyNewSymbolDIRECTMatrixForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_latex = str(web_form_symbol_properties.symbol_latex.data).strip()
        symbol_name = str(web_form_symbol_properties.symbol_name.data).strip()
        symbol_description = str(
            web_form_symbol_properties.symbol_description.data
        ).strip()
        symbol_reference = str(web_form_symbol_properties.symbol_reference.data).strip()

        symbol_is_composite = web_form_symbol_properties.symbol_is_composite.data

        symbol_size = str(web_form_symbol_properties.symbol_size.data).strip()

        print("symbol_latex:", symbol_latex)
        print("symbol_name:", symbol_name)
        print("symbol_description", symbol_description)

        symbol_number_of_rows = str(
            web_form_symbol_properties.symbol_number_of_rows.data
        ).strip()
        symbol_number_of_columns = str(
            web_form_symbol_properties.symbol_number_of_columns.data
        ).strip()

        author_name_latex = "ben"  # TODO: get username

        list_of_symbol_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs = session.read_transaction(
                neo4j_query.list_IDs, "symbol"
            )
        symbol_id = compute.generate_random_id(list_of_symbol_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol_direct_matrix,
                symbol_id,
                symbol_name,
                symbol_latex,
                symbol_description,
                symbol_reference,
                symbol_is_composite,
                symbol_size,
                symbol_number_of_rows,
                symbol_number_of_columns,
                author_name_latex,
            )
        return redirect(url_for("to_list_symbols"))

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    print("[TRACE] func: app/to_add_symbol_matrix end " + trace_id)
    return render_template(
        "symbol_create_direct_matrix.html",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        list_of_dimension2ormore_symbol_dicts=list_of_dimension2ormore_symbol_dicts,
    )


@app.route("/new_symbol/", methods=["GET", "POST"])
def to_add_symbol() -> str:
    """
    novel symbol
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form_symbol_properties = SpecifyNewSymbolForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_latex = str(web_form_symbol_properties.symbol_latex.data).strip()
        symbol_name = str(web_form_symbol_properties.symbol_name.data).strip()
        symbol_description = str(
            web_form_symbol_properties.symbol_description.data
        ).strip()
        symbol_requires_arguments = (
            web_form_symbol_properties.symbol_requires_arguments.data
        )
        symbol_reference = str(web_form_symbol_properties.symbol_reference.data).strip()

        print("symbol_latex:", symbol_latex)
        print("symbol_name:", symbol_name)
        print("symbol_description", symbol_description)

        author_name_latex = "ben"

        list_of_symbol_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs = session.read_transaction(
                neo4j_query.list_IDs, "symbol"
            )
        symbol_id = compute.generate_random_id(list_of_symbol_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol,
                symbol_id,
                symbol_name,
                symbol_latex,
                symbol_description,
                symbol_requires_arguments,
                symbol_reference,
                author_name_latex,
                # symbol_scope,
                # symbol_variable_or_constant,
                # symbol_domain,
                # dimension_length,
                # dimension_time,
                # dimension_mass,
                # dimension_temperature,
                # dimension_electric_charge,
                # dimension_amount_of_substance,
                # dimension_luminous_intensity,
            )

        print("[TRACE] func: app/to_add_symbol end " + trace_id)
        if symbol_requires_arguments:
            return redirect(
                url_for("to_add_symbol_required_argument_count", symbol_id=symbol_id)
            )
        else:
            return redirect(
                url_for("to_add_symbol_dimension_count", symbol_id=symbol_id)
            )

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )

    print("[TRACE] func: app/to_add_symbol end " + trace_id)
    return render_template(
        "symbol_create.html",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
        list_of_symbol_dicts=list_of_symbol_dicts,
        list_of_operation_dicts=list_of_operation_dicts,
        list_of_dimension0_symbol_dicts=list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts=list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts=list_of_dimension2ormore_symbol_dicts,
    )


@app.route("/new_symbol_required_argument_count/<symbol_id>", methods=["GET", "POST"])
def to_add_symbol_required_argument_count(symbol_id: unique_numeric_id_as_str) -> str:
    """
    novel symbol: how many arguments?
    see https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_required_argument_count start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict[
            "to_add_symbol_required_argument_count: node_properties, symbol"
        ] = (time.time() - query_start_time)
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolArgumentCountForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        argument_count = str(web_form_symbol_properties.argument_count.data).strip()
        return redirect(url_for("to_list_symbols"))

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "argument_count",
                argument_count,
            )
            query_time_dict[
                "to_add_symbol_required_argument_count: edit_node_property, argument_count"
            ] = (time.time() - query_start_time)

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )

    print("[TRACE] func: app/to_add_symbol_required_argument_count end " + trace_id)
    return render_template(
        "symbol_create_required_argument_count.html",
        form_symbol_properties=web_form_symbol_properties,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
        symbol_dict=symbol_dict,
        query_time_dict=query_time_dict,
        list_of_operation_dicts=list_of_operation_dicts,
    )


@app.route("/new_symbol_specify_dimension_count/<symbol_id>", methods=["GET", "POST"])
def to_add_symbol_dimension_count(symbol_id: unique_numeric_id_as_str):
    """
    novel symbol: how many dimensions?
    see https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_dimension_count start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict["to_add_symbol_dimension_count: node_properties, symbol"] = (
            time.time() - query_start_time
        )
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolDimensionCountForm(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_dimension_count = int(web_form_symbol_properties.dimension_count.data)

        print("symbol_dimension_count=", symbol_dimension_count)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_count",
                symbol_dimension_count,
            )
            query_time_dict[
                "to_add_symbol_dimension_count: edit_node_property, symbol"
            ] = (time.time() - query_start_time)

        if symbol_dimension_count == 0:  # scalar
            print(
                "[TRACE] func: app/to_add_symbol_dimension_count end; redirect to to_add_symbol_dimension0_properties"
                + trace_id
            )
            return redirect(
                url_for("to_add_symbol_dimension0_properties", symbol_id=symbol_id)
            )
        elif symbol_dimension_count == 1:  # vector
            print(
                "[TRACE] func: app/to_add_symbol_dimension_count end; redirect to to_add_symbol_dimension1_properties"
                + trace_id
            )
            return redirect(
                url_for("to_add_symbol_dimension1_properties", symbol_id=symbol_id)
            )
        elif symbol_dimension_count == 2:  # vector
            print(
                "[TRACE] func: app/to_add_symbol_dimension_count end; redirect to to_add_symbol_dimension2_properties"
                + trace_id
            )
            return redirect(
                url_for("to_add_symbol_dimension2_properties", symbol_id=symbol_id)
            )

    # can't use this because the dimension hasn't been specified yet
    # (
    #     query_time_dict,
    #     list_of_symbol_dicts,
    #     list_of_operation_dicts,
    #     list_of_dimension0_symbol_dicts,
    #     list_of_dimension1_symbol_dicts,
    #     list_of_dimension2ormore_symbol_dicts,
    # ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    print(
        "[TRACE] func: app/to_add_symbol_dimension_count end; render template "
        + trace_id
    )
    return render_template(
        "symbol_create_specify_dimension_count.html",
        form_symbol_properties=web_form_symbol_properties,
        symbol_dict=symbol_dict,
        query_time_dict=query_time_dict,
        # list_of_dimension0_symbol_dicts=list_of_dimension0_symbol_dicts,
        # list_of_dimension1_symbol_dicts=list_of_dimension1_symbol_dicts,
        # list_of_dimension2ormore_symbol_dicts=list_of_dimension2ormore_symbol_dicts,
    )


@app.route("/new_symbol_dimension0_properties/<symbol_id>", methods=["GET", "POST"])
def to_add_symbol_dimension0_properties(symbol_id: unique_numeric_id_as_str):
    """
    novel symbol: how many dimensions?
    see https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_dimension0_properties start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict[
            "to_add_symbol_dimension0_properties: node_properties, symbol"
        ] = (time.time() - query_start_time)
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolDimension0Form(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_scope = str(web_form_symbol_properties.symbol_scope.data).strip()
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "scope",
                symbol_scope,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, symbol_scope"
            ] = (time.time() - query_start_time)

        symbol_variable_or_constant = str(
            web_form_symbol_properties.symbol_variable_or_constant.data
        ).strip()
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "variable_or_constant",
                symbol_variable_or_constant,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, symbol_variable_or_constant"
            ] = (time.time() - query_start_time)

        symbol_domain = str(web_form_symbol_properties.symbol_domain.data).strip()
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "domain",
                symbol_domain,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, symbol_domain"
            ] = (time.time() - query_start_time)

        dimension_length = int(web_form_symbol_properties.dimension_length.data)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_length",
                dimension_length,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_length"
            ] = (time.time() - query_start_time)

        dimension_time = int(web_form_symbol_properties.dimension_time.data)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_time",
                dimension_time,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_time"
            ] = (time.time() - query_start_time)

        dimension_mass = int(web_form_symbol_properties.dimension_mass.data)
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_mass",
                dimension_mass,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_mass"
            ] = (time.time() - query_start_time)

        dimension_temperature = int(
            web_form_symbol_properties.dimension_temperature.data
        )
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_temperature",
                dimension_temperature,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_temperature"
            ] = (time.time() - query_start_time)

        dimension_electric_charge = int(
            web_form_symbol_properties.dimension_electric_charge.data
        )
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_electric_charge",
                dimension_electric_charge,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_electric_charge"
            ] = (time.time() - query_start_time)

        dimension_amount_of_substance = int(
            web_form_symbol_properties.dimension_amount_of_substance.data
        )
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_amount_of_substance",
                dimension_amount_of_substance,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_amount_of_substance"
            ] = (time.time() - query_start_time)

        dimension_luminous_intensity = int(
            web_form_symbol_properties.dimension_luminous_intensity.data
        )
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_node_property,
                "symbol",
                symbol_id,
                "dimension_luminous_intensity",
                dimension_luminous_intensity,
            )
            query_time_dict[
                "to_add_symbol_dimension0_properties: edit_node_property, dimension_luminous_intensity"
            ] = (time.time() - query_start_time)

        return redirect(url_for("to_list_symbols"))

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    print("[TRACE] func: app/to_add_symbol_dimension0_properties end " + trace_id)
    return render_template(
        "symbol_create_dimension0.html",
        form_symbol_properties=web_form_symbol_properties,
        symbol_dict=symbol_dict,
        query_time_dict=query_time_dict,
        list_of_dimension0_symbol_dicts=list_of_dimension0_symbol_dicts,
    )


@app.route("/new_symbol_dimension1_properties/<symbol_id>", methods=["GET", "POST"])
def to_add_symbol_dimension1_properties(symbol_id: unique_numeric_id_as_str) -> str:
    """

    see https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_dimension1_properties start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict[
            "to_add_symbol_dimension1_properties: node_properties, symbol"
        ] = (time.time() - query_start_time)
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolDimension1Form(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_is_composite = web_form_symbol_properties.symbol_is_composite.data
        print("symbol_is_composite=", symbol_is_composite)

        return redirect(url_for("to_list_symbols"))

    print("[TRACE] func: app/to_add_symbol_dimension1_properties end " + trace_id)
    return render_template(
        "symbol_create_dimension1.html",
        form_symbol_properties=web_form_symbol_properties,
        symbol_dict=symbol_dict,
        query_time_dict=query_time_dict,
    )


@app.route("/new_symbol_dimension2_properties/<symbol_id>", methods=["GET", "POST"])
def to_add_symbol_dimension2_properties(symbol_id: unique_numeric_id_as_str) -> str:
    """

    see https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_dimension2_properties start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    symbol_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        symbol_dict = session.read_transaction(
            neo4j_query.node_properties, "symbol", symbol_id
        )
        query_time_dict[
            "to_add_symbol_dimension2_properties: node_properties, symbol"
        ] = (time.time() - query_start_time)
    print("symbol_dict:", symbol_dict)

    web_form_symbol_properties = SpecifyNewSymbolDimension2Form(request.form)
    if request.method == "POST" and web_form_symbol_properties.validate():
        print("request.form = ", request.form)

        symbol_is_composite = web_form_symbol_properties.symbol_is_composite.data
        print("symbol_is_composite=", symbol_is_composite)

        return redirect(url_for("to_list_symbols"))

    print("[TRACE] func: app/to_add_symbol_dimension2_properties end " + trace_id)
    return render_template(
        "symbol_create_dimension2.html",
        form_symbol_properties=web_form_symbol_properties,
        symbol_dict=symbol_dict,
        query_time_dict=query_time_dict,
    )


@app.route("/new_operation/", methods=["GET", "POST"])
def to_add_operation() -> str:
    """
    novel operation
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_operation start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_operation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "symbol"
        )
    # filter "list_of_symbol_dicts" down to "list_of_operation_dicts"
    for this_symbol_dict in list_of_symbol_dicts:
        if this_symbol_dict["requires_arguments"]:
            list_of_operation_dicts.append(this_symbol_dict)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_operation_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_operation_dicts
    )

    web_form = SpecifyNewSymbolDIRECTOperationForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        # request.form =  ImmutableMultiDict([('input1', 'a = b'), ('submit_button', 'Submit')])

        operation_latex = str(web_form.operation_latex.data).strip()
        operation_name = str(web_form.operation_name.data).strip()
        operation_description = str(web_form.operation_description.data).strip()
        operation_argument_count = int(web_form.operation_argument_count.data)

        print("operation_latex:", operation_latex)
        print("operation_name:", operation_name)
        print("operation_description", operation_description)
        print("operation_argument_count", operation_argument_count)

        author_name_latex = "ben"

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_IDs = session.read_transaction(
                neo4j_query.list_IDs, "symbol"
            )
        operation_id = compute.generate_random_id(list_of_symbol_IDs)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_symbol_direct_operation,
                operation_id,
                operation_name,
                operation_latex,
                operation_description,
                operation_argument_count,
                author_name_latex,
            )
        print("[TRACE] func: app/to_add_operation end " + trace_id)
        return redirect(url_for("to_list_operations"))

    print("[TRACE] func: app/to_add_operation end " + trace_id)
    return render_template(
        "symbol_create_direct_operation.html",
        query_time_dict=query_time_dict,
        form_operation_properties=web_form,
        list_of_operation_dicts=list_of_operation_dicts,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
    )


@app.route(
    "/new_step_expressions/<derivation_id>/<inference_rule_id>", methods=["GET", "POST"]
)
def to_add_step_select_expressions(
    derivation_id: unique_numeric_id_as_str, inference_rule_id: unique_numeric_id_as_str
) -> str:
    """
    derivation_id is the numeric ID of the derivation being edited

    inference_rule_id is the numeric ID of the inference rule being used for this step

    here we assume all expressions already exist
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_step_select_expressions start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    print("derivation_id:", derivation_id)
    print("inference_rule_id:", inference_rule_id)

    # get list of expressions
    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "expression"
        )

    print("list_of_expression_dicts=", list_of_expression_dicts)

    list_of_expression_IDs = []
    for expression_dict in list_of_expression_dicts:
        list_of_expression_IDs.append(expression_dict["id"])

    dict_of_expression_dicts = {}
    for expression_dict in list_of_expression_dicts:
        dict_of_expression_dicts[expression_dict["id"]] = expression_dict

    # get properties for derivation
    derivation_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.node_properties, "derivation", derivation_id
        )
    print("derivation_dict is ", derivation_dict)

    inference_rule_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        inference_rule_dict = session.read_transaction(
            neo4j_query.node_properties, "inference_rule", inference_rule_id
        )

    print("inference_rule_dict is ", inference_rule_dict)

    web_form = SpecifyNewStepForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        note_before_step_latex = str(web_form.note_before_step_latex.data).strip()
        note_after_step_latex = str(web_form.note_after_step_latex.data).strip()

        list_of_input_expression_IDs = []
        list_of_feed_expression_IDs = []
        list_of_output_expression_IDs = []
        for k, v in request.form.items():
            print("k=", k, "v=", v)
            if ("input" in k) and (
                "expression_" in k
            ):  # field name is what matters here
                print("input adding", v)
                list_of_input_expression_IDs.append(str(v))
            if ("feed" in k) and (
                "expression_" in k
            ):  # field name is what matters here
                print("feed adding", v)
                list_of_feed_expression_IDs.append(str(v))
            if ("output" in k) and (
                "expression_" in k
            ):  # field name is what matters here
                print("out adding", v)
                list_of_output_expression_IDs.append(str(v))

        author_name_latex = "benno"

        list_of_step_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_step_IDs = session.read_transaction(neo4j_query.list_IDs, "step")
        step_id = compute.generate_random_id(list_of_step_IDs)
        print("generated step_id=", step_id)

        # for the derivation, determine the list of all sequence_index values,
        #       then increment max to get the sequence_index for this step
        list_of_sequence_values = []
        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_sequence_values = session.read_transaction(
                neo4j_query.list_sequence_values, derivation_id
            )
        print("list_of_sequence_values=", list_of_sequence_values)
        if len(list_of_sequence_values) > 0:
            new_sequence_value = int(max(list_of_sequence_values) + 1)
        else:
            new_sequence_value = 0

        # %f = Microsecond as a decimal number, zero-padded on the left.
        now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_step_to_derivation,
                step_id,
                derivation_id,
                inference_rule_id,
                new_sequence_value,
                now_str,
                note_before_step_latex,
                note_after_step_latex,
                author_name_latex,
            )

            # adding expressions can only be done after step exists
            session.write_transaction(
                neo4j_query.add_expressions_to_step,
                step_id,
                now_str,
                list_of_input_expression_IDs,
                list_of_feed_expression_IDs,
                list_of_output_expression_IDs,
                author_name_latex,
            )

        return redirect(
            url_for(
                "to_review_derivation",
                derivation_id=derivation_id,
            )
        )

    # first visit to this page
    print("[TRACE] func: app/to_add_step_select_expressions end " + trace_id)
    return render_template(
        "new_step_select_expressions_for_inference_rule.html",
        query_time_dict=query_time_dict,
        form=web_form,
        list_of_expression_IDs=list_of_expression_IDs,
        dict_of_expression_dicts=dict_of_expression_dicts,
        inference_rule_dict=inference_rule_dict,
        derivation_dict=derivation_dict,
    )


@app.route(
    "/symbols_count_for_expression/<expression_id>",
    methods=["GET", "POST"],
)
def to_add_symbol_count_for_expression(
    expression_id: unique_numeric_id_as_str,
) -> str:
    """
    derivation_id is the numeric ID of the derivation being edited
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_symbol_count_for_expression start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.node_properties, "expression", expression_id
        )
    print("expression_dict=", expression_dict)

    # TODO: use the right form
    web_form_no_options = NoOptionsForm(request.form)
    if request.method == "POST":
        print("request.form = ", request.form)

        # after user provides latex for expression have them provide symbol count
        print("[TRACE] func: app/to_add_symbol_count_for_expression end " + trace_id)
        return redirect(
            url_for(
                "to_add_symbols_and_operations_for_expression",
                expression_id=expression_id,
            )
        )

    print("[TRACE] func: app/to_add_symbol_count_for_expression end " + trace_id)
    return render_template(
        "expression_symbol_count.html",
        query_time_dict=query_time_dict,
        form=web_form_no_options,
        expression_dict=expression_dict,
    )


@app.route(
    "/symbols_and_operations_for_expression/<expression_id>",
    methods=["GET", "POST"],
)
def to_add_symbols_and_operations_for_expression(
    expression_id: unique_numeric_id_as_str,
) -> str:
    """
    expression_id is the numeric ID of the expression

    This step comes immediately after the Latex expression is provided.

    Although Latex-to-SymPy could be performed after the Latex is provided,
    sometimes the symbols used in the latex inhibit converstion to Latex.
    For example,
    r_{\rm Earth} = 6
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: app/to_add_symbols_and_operations_for_expression start "
        + trace_id
    )
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.node_properties, "expression", expression_id
        )
        query_time_dict[
            "to_add_symbols_and_operations_for_expression, node_properties"
        ] = (time.time() - query_start_time)
    print("expression_dict=", expression_dict)

    # TODO: given a Latex expression, and given all existing symbols,
    # sort the symbol_latex by length
    # then search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"

    list_of_symbol_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "symbol"
        )
        query_time_dict[
            "to_add_symbols_and_operations_for_expression, list_nodes_of_type"
        ] = (time.time() - query_start_time)
    print("list_of_symbols", list_of_symbol_dicts)

    list_of_symbol_latex = []  # type: List[str]
    dict_of_symbol_dicts = {}
    for this_symbol_dict in list_of_symbol_dicts:
        dict_of_symbol_dicts[this_symbol_dict["id"]] = this_symbol_dict
        # list_of_symbol_latex.append(this_symbol_dict["latex"])

    # https://stackoverflow.com/a/2587419/1164295
    # list_of_symbol_latex.sort(key=len)

    # https://stackoverflow.com/a/73050/1164295
    list_of_symbol_dicts_sorted_by_latex = sorted(
        list_of_symbol_dicts, key=lambda d: d["latex"]
    )

    print("list_of_symbol_dicts_sorted_by_latex=", list_of_symbol_dicts_sorted_by_latex)

    # TODO: search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.node_properties, "expression", expression_id
        )
        query_time_dict[
            "to_add_symbols_and_operations_for_expression, node_properties"
        ] = (time.time() - query_start_time)
    print("expression_dict=", expression_dict)

    print("expression_dict[latex]=", expression_dict["latex"])

    potential_symbols_found = []  # type: List[str]

    # TODO: use the right form
    web_form_no_options = NoOptionsForm(request.form)
    if request.method == "POST":
        print("request.form = ", request.form)
        # TODO
        print(
            "[TRACE] func: app/to_add_symbols_and_operations_for_expression end "
            + trace_id
        )
        return redirect(
            url_for(
                "to_add_sympy_and_lean_for_latex_expression",
                expression_id=expression_id,
            )
        )
    return render_template(
        "expression_symbols_and_operations.html",
        query_time_dict=query_time_dict,
        form=web_form_no_options,
        expression_dict=expression_dict,
        list_of_symbol_dicts=list_of_symbol_dicts,
    )


@app.route("/sympy_and_latex_for_step/<expression_id>", methods=["GET", "POST"])
def to_add_sympy_and_lean_for_latex_expression(
    expression_id: unique_numeric_id_as_str,
) -> str:
    """
    derivation_id is the numeric ID of the derivation being edited
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: app/to_add_sympy_and_lean_for_latex_expression start " + trace_id
    )
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.node_properties, "expression", expression_id
        )
        query_time_dict[
            "to_add_sympy_and_lean_for_latex_expression, node_properties"
        ] = (time.time() - query_start_time)
    print("expression_dict=", expression_dict)

    # TODO: provide a guess for the SymPy based on the Latex provided

    # TODO: provide the symbol IDs to be used in the SymPy and Lean strings

    web_form = SpecifyNewSympyLeanForm(request.form)
    if request.method == "POST":
        print("request.form = ", request.form)

        sympy = str(web_form.sympy.data).strip()
        lean = str(web_form.lean.data).strip()

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.write_transaction(
                neo4j_query.edit_node_property,
                "expression",
                expression_id,
                "sympy",
                sympy,
            )
            query_time_dict[
                "to_add_sympy_and_lean_for_latex_expression: edit_node_property, expression sympy"
            ] = (time.time() - query_start_time)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.write_transaction(
                neo4j_query.edit_node_property,
                "expression",
                expression_id,
                "lean",
                lean,
            )
            query_time_dict[
                "to_add_sympy_and_lean_for_latex_expression: edit_node_property, expression lean"
            ] = (time.time() - query_start_time)

        print(
            "[TRACE] func: app/to_add_sympy_and_lean_for_latex_expression start "
            + trace_id
        )
        return redirect(url_for("to_list_expressions"))

    return render_template(
        "expression_sympy_and_lean.html",
        query_time_dict=query_time_dict,
        form=web_form,
        expression_dict=expression_dict,
    )


@app.route("/new_inference_rule/", methods=["GET", "POST"])
def to_add_inference_rule() -> str:
    """
    create inference rule

    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_add_inference_rule start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "inference_rule"
        )

    dict_of_derivations_used_per_inference_rule = (
        compute.get_dict_of_derivations_used_per_inference_rule(
            graphDB_Driver, list_of_inference_rule_dicts
        )
    )

    web_form = SpecifyNewInferenceRuleForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        # request.form =  ImmutableMultiDict([('inference_rule_name', 'add x to both sides'),
        # ('inference_rule_latex', 'add _ to both sides'),
        # ('inference_rule_number_of_inputs', '1'), ('inference_rule_number_of_feeds', '1'), ('inference_rule_number_of_outputs', '1')])

        inference_rule_name = str(web_form.inference_rule_name.data).strip()
        inference_rule_latex = str(web_form.inference_rule_latex.data).strip()
        number_of_inputs = int(
            str(web_form.inference_rule_number_of_inputs.data).strip()
        )
        number_of_feeds = int(str(web_form.inference_rule_number_of_feeds.data).strip())
        number_of_outputs = int(
            str(web_form.inference_rule_number_of_outputs.data).strip()
        )
        # TODO: name should come from authenticated user session
        author_name_latex = "ben"

        # https://neo4j.com/docs/python-manual/current/session-api/
        list_of_inference_rule_dicts = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.read_transaction(
                neo4j_query.list_nodes_of_type, "inference_rule"
            )

        print("inference_rule_name", inference_rule_name)
        for inference_rule_dict in list_of_inference_rule_dicts:
            print("inference_rule_dict is", inference_rule_dict)
            print(
                "inference_rule_dict['name_latex']", inference_rule_dict["name_latex"]
            )
            if inference_rule_name == inference_rule_dict["name_latex"]:
                print("INVALID INPUT: inference rule with that name already exists")
                # TODO: a notice should be provided to the user

                print("[TRACE] func: app/to_add_inference_rule end " + trace_id)
                return redirect(url_for("to_add_inference_rule"))
            if inference_rule_latex == inference_rule_dict["latex"]:
                print("INVALID INPUT: inference rule with that latex already exists")
                # TODO: a notice should be provided to the user

                print("[TRACE] func: app/to_add_inference_rule end " + trace_id)
                return redirect(url_for("to_add_inference_rule"))

        print("status: No conflicting name or latex detected")

        list_of_inference_rule_IDs = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_IDs = session.read_transaction(
                neo4j_query.list_IDs, "inference_rule"
            )
        inference_rule_id = compute.generate_random_id(list_of_inference_rule_IDs)
        print("new inference_rule_id:", inference_rule_id)

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_inference_rule,
                inference_rule_id=inference_rule_id,
                inference_rule_name=inference_rule_name,
                inference_rule_latex=inference_rule_latex,
                number_of_inputs=number_of_inputs,
                number_of_feeds=number_of_feeds,
                number_of_outputs=number_of_outputs,
                author_name_latex=author_name_latex,
            )
        print("[TRACE] func: app/to_add_inference_rule end " + trace_id)
        return redirect(url_for("to_list_inference_rules"))

    print("[TRACE] func: app/to_add_inference_rule end " + trace_id)
    return render_template(
        "inference_rule_create.html",
        query_time_dict=query_time_dict,
        form=web_form,
        list_of_inference_rule_dicts=list_of_inference_rule_dicts,
        dict_of_derivations_used_per_inference_rule=dict_of_derivations_used_per_inference_rule,
    )


@app.route("/edit_step/<derivation_id>/<step_id>", methods=["GET", "POST"])
def to_edit_step(
    derivation_id: unique_numeric_id_as_str, step_id: unique_numeric_id_as_str
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_step start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    # list all steps in this derivation
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.steps_in_this_derivation, derivation_id
        )

    for each_step_dict in list_of_step_dicts:
        if each_step_dict["id"] == step_id:
            this_step_dict = each_step_dict
            break
    print("this_step_dict=", this_step_dict)

    web_form = SpecifyNewStepForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        note_before_step_latex = str(web_form.note_before_step_latex.data).strip()
        note_after_step_latex = str(web_form.note_after_step_latex.data).strip()

        print("note_before_step_latex", note_before_step_latex)
        print("note_after_step_latex", note_after_step_latex)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.edit_step_notes,
                step_id,
                note_before_step_latex,
                note_after_step_latex,
            )

    print("[TRACE] func: app/to_edit_step end " + trace_id)
    return render_template(
        "step_edit.html",
        query_time_dict=query_time_dict,
        form=web_form,
        step_dict=this_step_dict,
    )


@app.route("/edit_inference_rule/<inference_rule_id>", methods=["GET", "POST"])
def to_edit_inference_rule(inference_rule_id: unique_numeric_id_as_str) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_edit_inference_rule start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form = SpecifyNewInferenceRuleForm(request.form)
    if request.method == "POST" and web_form.validate():
        print("request.form = ", request.form)

        # request.form =  ImmutableMultiDict(('inference_rule_name', 'asdfmmimimimim'), ('inference_rule_latex', 'mimimmkm'), ('inference_rule_number_of_inputs', '1'), ('inference_rule_number_of_feeds', '1'), ('inference_rule_number_of_outputs', '1')])

        inference_rule_name = str(web_form.inference_rule_name.data).strip()
        inference_rule_latex = str(web_form.inference_rule_latex.data).strip()
        number_of_inputs = int(
            str(web_form.inference_rule_number_of_inputs.data).strip()
        )
        number_of_feeds = int(str(web_form.inference_rule_number_of_feeds.data).strip())
        number_of_outputs = int(
            str(web_form.inference_rule_number_of_outputs.data).strip()
        )
        # TODO: name should come from authenticated user session
        author_name_latex = "ben"

        # https://neo4j.com/docs/python-manual/current/session-api/
        list_of_inference_rule_dicts = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.read_transaction(
                neo4j_query.list_nodes_of_type, "inference_rule"
            )

        for inference_rule_dict in list_of_inference_rule_dicts:
            print("inference_rule_name", inference_rule_name)
            print("inference_rule_dict['name']", inference_rule_dict["name"])
            if inference_rule_name == inference_rule_dict["name"]:
                print("INVALID INPUT: inference rule with that name already exists")
                # TODO: a notice should be provided to the user

                print("[TRACE] func: app/to_edit_inference_rule end " + trace_id)
                return redirect(url_for("to_add_inference_rule"))
            if inference_rule_latex == inference_rule_dict["latex"]:
                print("INVALID INPUT: inference rule with that latex already exists")
                # TODO: a notice should be provided to the user

                print("[TRACE] func: app/to_edit_inference_rule end " + trace_id)
                return redirect(url_for("to_add_inference_rule"))

        print("status: No conflicting name or latex detected")

        # https://neo4j.com/docs/python-manual/current/session-api/
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            session.write_transaction(
                neo4j_query.add_inference_rule,
                inference_rule_id=inference_rule_id,
                inference_rule_name=inference_rule_name,
                inference_rule_latex=inference_rule_latex,
                number_of_inputs=number_of_inputs,
                number_of_feeds=number_of_feeds,
                number_of_outputs=number_of_outputs,
                author_name_latex=author_name_latex,
            )

    list_of_derivation_dicts_that_use_this_inference_rule_id = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts_that_use_this_inference_rule_id = (
            session.read_transaction(
                neo4j_query.derivations_that_use_inference_rule,
                inference_rule_id,
            )
        )
    # list_of_derivation_dicts_that_use_this_inference_rule_id = list(
    #     set(list_of_derivations_that_use_this_inference_rule_id)
    # )

    # get properties for inference rule
    inference_rule_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        inference_rule_dict = session.read_transaction(
            neo4j_query.node_properties, "inference_rule", inference_rule_id
        )

    print("inference_rule_dict", inference_rule_dict)

    print("[TRACE] func: app/to_edit_inference_rule end " + trace_id)
    return render_template(
        "inference_rule_edit.html",
        query_time_dict=query_time_dict,
        form=web_form,
        inference_rule_dict=inference_rule_dict,
        list_of_derivation_dicts_that_use_this_inference_rule_id=list_of_derivation_dicts_that_use_this_inference_rule_id,
    )
    # once done editing, go back to list
    # return redirect(url_for("to_list_inference_rules"))


# @app.route("/delete_inference_rule/<inference_rule_id>", methods=["GET", "POST"])
# def to_delete_inference_rule(inference_rule_id: str):
#     """
#     >>> to_delete_inference_rule()
#     """
#     print("[TRACE] func: app/to_delete_inference_rule")
#
#     # get properties for inference rule
#     with graphDB_Driver.session() as session:
#         inference_rule_dict = session.read_transaction(
#             neo4j_query.node_properties, "inference_rule", inference_rule_id
#         )
#     print("inference_rule_dict", inference_rule_dict)
#
#     return render_template(
#         "inference_rule_delete.html", inference_rule_dict=inference_rule_dict
#     )
#     # once done creating new, go back to list
#     # return redirect(url_for("to_list_inference_rules"))


# @app.route("/delete_symbol/<symbol_id>", methods=["GET", "POST"])
# def to_delete_symbol(symbol_id: str):
#     """ """
#     print("[TRACE] func: app/to_delete_symbol")
#
#     return render_template("symbol_delete.html")
#     # once done creating new, go back to list
#     # return redirect(url_for("to_list_symbols"))


# @app.route("/delete_operation/<operation_id>", methods=["GET", "POST"])
# def to_delete_operation(operation_id: str):
#     """ """
#     print("[TRACE] func: app/to_delete_operation")
#
#     return render_template("operation_delete.html")
#     # once done creating new, go back to list
#     # return redirect(url_for("to_list_operations"))


@app.route("/query", methods=["GET", "POST"])
def to_query() -> str:
    """
    page for submitting Cypher queries
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_query start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    web_form = CypherQueryForm(request.form)

    # When the page is reached directly for the first time
    # the method is GET
    print("request.method=", request.method)

    query = None

    # query via URL keyword
    query_str = request.args.get("cypher", None)
    if query_str:
        print("query via URL:", query_str)
        query = query_str

    # query via web form
    elif request.method == "POST" and web_form.validate():
        query = str(web_form.query.data).strip()
        print("query via web form:", query)

    print("query=", query)

    list_of_records = ["nothing returned from Neo4j"]
    if query:
        try:
            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                list_of_records = session.read_transaction(
                    neo4j_query.user_query, query
                )
                query_time_dict["to_query: user_query"] = time.time() - query_start_time
        except neo4j.exceptions.ClientError:
            list_of_records = ["WRITE OPERATIONS NOT ALLOWED (3)"]
        except neo4j.exceptions.TransactionError:
            list_of_records = ["probably tried a write Cypher query (TransactionError)"]
    # else:
    #     print("[TRACE] func: app/to_query end " + trace_id)
    #     raise Exception("Shouldn't get here")
    if query:
        # render with links to API reference
        query = query.replace(
            "RETURN",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/return/">RETURN</a>',
        )
        query = query.replace(
            "MATCH",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/match/">MATCH</a>',
        )
        query = query.replace(
            "MERGE",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/merge/">MERGE</a>',
        )
        query = query.replace(
            "WITH",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/with/">WITH</a>',
        )
        query = query.replace(
            "WHERE",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/where/">WHERE</a>',
        )
        query = query.replace(
            "DELETE",
            '<a href="https://neo4j.com/docs/cypher-manual/current/clauses/delete/">DELETE</a>',
        )

    derivation_id = ""
    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "derivation"
        )
        query_time_dict["to_query: list_nodes_of_type, derivation"] = (
            time.time() - query_start_time
        )
    print("list_of_derivation_dicts=", list_of_derivation_dicts)
    derivation_id = list_of_derivation_dicts[0]["id"]

    inference_rule_id = ""
    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "inference_rule"
        )
        query_time_dict["to_query: list_nodes_of_type, inference_rule"] = (
            time.time() - query_start_time
        )
    print("list_of_inference_rule_dicts=", list_of_inference_rule_dicts)
    inference_rule_id = list_of_inference_rule_dicts[0]["id"]

    step_id = ""
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "step"
        )
        query_time_dict["to_query: list_nodes_of_type, step"] = (
            time.time() - query_start_time
        )
    print("list_of_step_dicts=", list_of_step_dicts)
    step_id = list_of_step_dicts[0]["id"]

    print("[TRACE] func: app/to_query end " + trace_id)
    return render_template(
        "query.html",
        query_time_dict=query_time_dict,
        form=web_form,
        submitted_query=query,
        list_of_records=list_of_records,
        derivation_id=derivation_id,
        inference_rule_id=inference_rule_id,
        step_id=step_id,
    )


@app.route("/list_operations", methods=["GET", "POST"])
def to_list_operations() -> str:
    """
    >>> to_list_operations()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_list_operations start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_operation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "symbol"
        )
        query_time_dict["to_list_operations: list_nodes_of_type, symbol"] = (
            time.time() - query_start_time
        )
    # filter "list_of_symbol_dicts" down to "list_of_operation_dicts"
    for this_symbol_dict in list_of_symbol_dicts:
        if this_symbol_dict["requires_arguments"]:
            list_of_operation_dicts.append(this_symbol_dict)
    print("list_of_operation_dicts", list_of_operation_dicts)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_operation_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_operation_dicts
    )

    print("[TRACE] func: app/to_list_operations end " + trace_id)
    return render_template(
        "symbol_list_operations.html",
        query_time_dict=query_time_dict,
        list_of_operation_dicts=list_of_operation_dicts,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
    )


@app.route("/list_symbols", methods=["GET", "POST"])
def to_list_symbols() -> str:
    """
    >>> to_list_symbols()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_list_symbols start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    (
        query_time_dict,
        list_of_symbol_dicts,
        list_of_operation_dicts,
        list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts,
    ) = compute.split_symbol_categories(graphDB_Driver, query_time_dict)

    (
        dict_of_expressions_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_expressions_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )
    (
        dict_of_derivations_that_use_symbol,
        query_time_dict,
    ) = compute.get_dict_of_derivations_that_use_symbol(
        graphDB_Driver, query_time_dict, list_of_symbol_dicts
    )

    print("[TRACE] func: app/to_list_symbols end " + trace_id)
    return render_template(
        "symbol_list.html",
        query_time_dict=query_time_dict,
        list_of_symbol_dicts=list_of_symbol_dicts,
        list_of_operation_dicts=list_of_operation_dicts,
        list_of_dimension0_symbol_dicts=list_of_dimension0_symbol_dicts,
        list_of_dimension1_symbol_dicts=list_of_dimension1_symbol_dicts,
        list_of_dimension2ormore_symbol_dicts=list_of_dimension2ormore_symbol_dicts,
        dict_of_expressions_that_use_symbol=dict_of_expressions_that_use_symbol,
        dict_of_derivations_that_use_symbol=dict_of_derivations_that_use_symbol,
    )


@app.route("/list_expressions", methods=["GET", "POST"])
def to_list_expressions() -> str:
    """
    >>> to_list_expressions()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_list_expressions start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "expression"
        )

    print("list_of_expression_dicts", list_of_expression_dicts)

    symbols_per_expression, query_time_dict = compute.symbols_per_expression(
        graphDB_Driver, query_time_dict, list_of_expression_dicts
    )

    dict_of_all_symbol_dicts, query_time_dict = compute.get_dict_of_symbol_dicts(
        graphDB_Driver, query_time_dict
    )
    # dict_of_all_operation_dicts = compute.get_dict_of_operation_dicts(graphDB_Driver)

    print("[TRACE] func: app/to_list_expressions end " + trace_id)
    return render_template(
        "expression_list.html",
        query_time_dict=query_time_dict,
        list_of_expression_dicts=list_of_expression_dicts,
        symbols_per_expression=symbols_per_expression,
        # operations_per_expression=operations_per_expression,
        dict_of_all_symbol_dicts=dict_of_all_symbol_dicts,
        # dict_of_all_operation_dicts=dict_of_all_operation_dicts,
    )


@app.route("/list_derivations", methods=["GET", "POST"])
def to_list_derivations() -> str:
    """
    this page is a gateway for the task "which existing derivation to edit?"

    >>> to_list_derivations()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_list_derivations start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    # The following is irrelevant since the page doesn't submit anything back to the server
    # if request.method == "POST":
    #     print("request = ", request)
    #     print("request.form = ", request.form)
    #     # TODO: this derivation_id should come from request.form; I just don't know the field yet
    #     derivation_id = "5389624"
    #
    #     print("[TRACE] func: app/to_list_derivations end " + trace_id)
    #     return redirect(url_for(to_review_derivation, derivation_id))

    # https://neo4j.com/docs/python-manual/current/session-api/
    list_of_derivation_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "derivation"
        )

    print("    list_of_derivation_dicts = ", list_of_derivation_dicts)

    number_of_steps_per_derivation = {}
    for derivation_dict in list_of_derivation_dicts:
        print("derivation_dict", derivation_dict)

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_steps = session.read_transaction(
                neo4j_query.steps_in_this_derivation, derivation_dict["id"]
            )
        number_of_steps_per_derivation[derivation_dict["id"]] = len(list_of_steps)

    print("    number_of_steps_per_derivation = ", number_of_steps_per_derivation)

    # TODO: convert derivation_dict['abstract_latex'] to HTML using pandoc

    print("[TRACE] func: app/to_list_derivations end " + trace_id)
    return render_template(
        "derivation_list.html",
        query_time_dict=query_time_dict,
        list_of_derivation_dicts=list_of_derivation_dicts,
        number_of_steps_per_derivation=number_of_steps_per_derivation,
    )


@app.route("/list_inference_rules")
def to_list_inference_rules() -> str:
    """
    >>> to_show_all_inference_rules()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_list_inference_rules start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.list_nodes_of_type, "inference_rule"
        )

    dict_of_derivations_used_per_inference_rule = (
        compute.get_dict_of_derivations_used_per_inference_rule(
            graphDB_Driver, list_of_inference_rule_dicts
        )
    )

    print("inference rule list:")
    for inference_rule_dict in list_of_inference_rule_dicts:
        print(inference_rule_dict)

    print("[TRACE] func: app/to_list_inference_rules end " + trace_id)
    return render_template(
        "inference_rule_list.html",
        query_time_dict=query_time_dict,
        list_of_inference_rule_dicts=list_of_inference_rule_dicts,
        dict_of_derivations_used_per_inference_rule=dict_of_derivations_used_per_inference_rule,
    )


@app.route("/delete_all")
def to_delete_graph_content() -> str:
    """
    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    https://neo4j.com/developer/kb/large-delete-transaction-best-practices-in-neo4j/
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_delete_graph_content start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        str_to_print = session.write_transaction(
            neo4j_query.delete_all_nodes_and_relationships
        )

    print("[TRACE] func: app/to_delete_graph_content end " + trace_id)
    return redirect(url_for("main"))


@app.route("/export_to_json")
def to_export_json() -> str:
    """
    TODO: export "graph to JSON" as file via web interface
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_export_json start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        res = session.read_transaction(neo4j_query.apoc_export_json, "pdg.json")

    print("res=", res)
    # <Record file='all.json' source='database: nodes(4), rels(0)' format='json' nodes=4 relationships=0 properties=16 time=123 rows=4 batchSize=-1 batches=0 done=True data=None>

    # "dumping_grounds" is a variable set in the docker-compose file using variable NEO4J_dbms_directories_import
    print("[TRACE] func: app/to_export_json end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.json"))


@app.route("/export_to_cypher")
def to_export_cypher() -> str:
    """
    TODO: export "graph to CYPHER" as file via web interface

    # apoc.export.cypherQuery()
    # https://stackoverflow.com/questions/44688194/efficient-importing-of-cypher-statements

    # command line
    # https://neo4j.com/developer/kb/export-sub-graph-to-cypher-and-import/

    # queries:
    # https://stackoverflow.com/a/20894360/1164295
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: app/to_export_cypher start " + trace_id)
    query_time_dict = {}  # type: Dict[str, float]

    with graphDB_Driver.session() as session:
        res = session.read_transaction(neo4j_query.apoc_export_cypher, "pdg.cypher")

    print("res=", str(res))
    # <Record file='all.cypher' batches=1 source='database: nodes(4), rels(0)' format='cypher' nodes=4 relationships=0 properties=16 time=13 rows=4 batchSize=20000>

    print("[TRACE] func: app/to_export_cypher end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.cypher"))


# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
csrf = CSRFProtect()

# https://secure.readthedocs.io/en/latest/frameworks.html#flask
secure_headers = SecureHeaders()


# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
csrf.init_app(app)


# EOF
