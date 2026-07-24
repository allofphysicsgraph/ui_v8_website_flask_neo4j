#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

"""
This iteration (v8) of the Physics Derivation Graph is based on a property graph (specifically Neo4j)
with cleaner separation between the MVC and the database.

Previous versions had a "local ID" which is needed when including
more than one derivation in the same Latex document.
For this version, the specific-to-Latex "local ID" (for expression labels)
can be constructed using `md5hash(<derivation_id>_<expression_id>)`.

****************************

Conventions
------------

See also https://allofphysics.com/documentation/conventions

Convention: every call to flash must be either a string or the content must be wrapped in str()

Reason: when content is passed to flash() that cannot be serialized, the Flask error and the website crashes


Convention: every Python function starts with

.. code-block:: bash

    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

and exits with

.. code-block:: bash

    logger.info("[TRACE] start " + trace_id)
    return

Reason: This enables creation of a flamegraph https://www.brendangregg.com/flamegraphs.html

****************************

options for connecting to Neo4j from Python
--------------------------------------------

- native driver
- py2neo
- neomodel

See https://neo4j.com/developer/python/

Python native driver
---------------------

- https://neo4j.com/docs/api/python-driver/current/api.html
- https://pypi.org/project/neo4j/
- https://github.com/neo4j/neo4j-python-driver

demo of a local Flask app connecting to a remote Neo4j server
--------------------------------------------------------------

- https://neo4j.com/developer/python-movie-app/
- https://github.com/neo4j-examples/neo4j-movies-template/blob/master/flask-api/app.py

Tips on using Cypher from Python
---------------------------------

- https://neo4j.com/docs/python-manual/current/cypher-workflow/


"""

import os
import sys
import json
import time
import random
import glob
from pathlib import Path
import urllib.parse
import datetime
import uuid
import xmltodict

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List, Any, Tuple, Union, Optional  # for type hinting

# https://docs.python.org/3/library/re.html
import re

# The type hint for `DecimalField` specifically looks for `decimal.Decimal`.
# Mypy does not automatically assume an int should be promoted to a Decimal in this context.
# Best practice is to initialize `Decimal` using a string (`Decimal("0")`)
# rather than an integer or float to avoid precision issues,
# though `Decimal(0)` would also satisfy mypy in this specific case.
from decimal import Decimal

# https://gist.github.com/ibeex/3257877
from logging.handlers import RotatingFileHandler
import neo4j  # type: ignore

# https://hplgit.github.io/web4sciapps/doc/pub/._web4sa_flask004.html
from flask import (
    abort,
    Flask,
    g,  # request timing; also for login
    redirect,
    render_template,
    current_app,
    make_response,
    request,
    url_for,
    send_from_directory,
    flash,
    jsonify,
    Response,
    session,  # needed to return the user to original page after logging in
)

# since `from flask import escape` wasn't available, use
from markupsafe import escape

# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
from flask_wtf import FlaskForm, CSRFProtect, Form  # type: ignore

# needed to return the user to original page after logging in
from urllib.parse import urlparse, urljoin

# https://github.com/TypeError/secure
import secure  # type: ignore

# https://stackoverflow.com/a/61729817/1164295
from werkzeug.utils import secure_filename
import werkzeug

# removed "Form" from wtforms; see https://stackoverflow.com/a/20577177/1164295
# https://wtforms.readthedocs.io/en/2.3.x/fields/
from wtforms import (
    StringField,  # one-line text input
    SelectField,  # dropdown
    validators,
    FormField,
    IntegerField,
    DecimalField,
    ValidationError,
    RadioField,
    TextAreaField,  # multi-line tex input
    SubmitField,  # when the only input is a "submit" button
    BooleanField,
)  # type: ignore

# from wtforms import PasswordField, FieldList

# https://flask-login.readthedocs.io/en/latest/_modules/flask_login/mixins.html
# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-v-user-logins
# https://en.wikipedia.org/wiki/Mixin
from flask_login import (
    login_required,
    login_user,
    logout_user,
    current_user,
    LoginManager,
    UserMixin,
)  # type: ignore

from flask.typing import ResponseReturnValue

# https://stackoverflow.com/questions/6323860/sibling-package-imports/50193944
# 2025-01-01: BHP commented out the `sys.path.append` and instead used
# `import library.neo4j_query as neo4j_query`
# but that failed because in neo4j_query.py there's an
# `import list_of_valid`
# that gets confused. BHP also tried
# `from ..library import list_of_valid`
# but that results in
# `ValueError: attempted relative import beyond top-level package`
# sys.path.append("library")

from library import neo4j_query
from library import compute
from library import latex_and_sympy
from library import latex
from library import sympy_validate_step
from library import sympy_validate_expression
from library import list_of_valid

# ORDERING: this has to come before the functions that use this type
from library.compute import unique_numeric_id_as_str, query_timing_result_type

# https://docs.python.org/3/howto/logging.html
import logging

# maxBytes=10000 = 10kB
# maxBytes=100000 = 100kB
# maxBytes=1000000 = 1MB
# maxBytes=10000000 = 10MB
log_size = 10000000
# maxBytes=100000000 = 100MB
# https://gist.github.com/ibeex/3257877

# handler_debug = RotatingFileHandler(
#     "flask_critical_and_error_and_warning_and_info_and_debug.log",
#     maxBytes=log_size,
#     backupCount=2,
# )
# handler_debug.setLevel(logging.DEBUG)
handler_info = RotatingFileHandler(
    "logs/flask_critical_and_error_and_warning_and_info.log",
    maxBytes=log_size,
    backupCount=2,
)
handler_info.setLevel(logging.DEBUG)
# handler_warning = RotatingFileHandler(
#     "flask_critical_and_error_and_warning.log",
#     maxBytes=log_size,
#     backupCount=2,
# )
# handler_warning.setLevel(logging.INFO)

# https://docs.python.org/3/howto/logging.html
logging.basicConfig(
    # either (filename + filemode) XOR handlers
    # filename="test.log", # to save entries to file instead of displaying to stderr
    # filemode="w", # https://docs.python.org/dev/library/functions.html#filemodes
    #   handlers=[handler_debug, handler_info, handler_warning],
    handlers=[handler_info],
    # if the severity level is INFO,
    # the logger will handle only INFO, WARNING, ERROR, and CRITICAL messages
    # and will ignore DEBUG messages
    level=logging.DEBUG,
    format="%(asctime)s|%(filename)-13s|%(levelname)-5s|%(lineno)-4d|%(funcName)-20s|%(message)s",  # ,
    # https://stackoverflow.com/questions/6290739/python-logging-use-milliseconds-in-time-format/7517430#7517430
    # datefmt="%m/%d/%Y %I:%M:%S %f %p", # https://strftime.org/
)

logger = logging.getLogger(__name__)

# When a Python file (a module) is imported, the Python interpreter executes every line of code in that file, from top to bottom.
# graphDB_Driver isn't a function
from library.initialize_neo4j import graphDB_Driver

# look at `flask_critical_and_error_and_warning_and_info.log` and you'll see the initialize_neo4j is the first entry

from library import initialize_version_log


from contextlib import contextmanager


@contextmanager
def track_time(time_dict, key):
    start = time.time()
    yield
    time_dict[key] = round(time.time() - start, 3)


################################## BEGIN what was in "initialize_flask.py" ###############################
class Config(object):
    """
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
    """

    SECRET_KEY = os.environ.get("SECRET_KEY")

    if SECRET_KEY is None:
        raise ValueError("No SECRET_KEY set")


# ORDERING: this has to come before using the function wrapper
# ORDERING: this has to be after the class "Config" is specified
web_app = Flask(__name__, static_folder="static")
web_app.config.from_object(
    Config
)  # https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
web_app.config["UPLOAD_FOLDER"] = (
    # the following folder on the host is accessible to both flask and neo4j
    "static/dumping_grounds/"  # https://flask.palletsprojects.com/en/3.0.x/patterns/fileuploads/
)
web_app.config["SEND_FILE_MAX_AGE_DEFAULT"] = (
    0  # https://stackoverflow.com/questions/34066804/disabling-caching-in-flask
)
web_app.config["DEBUG"] = True


# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
csrf = CSRFProtect()

# https://secure.readthedocs.io/en/latest/frameworks.html#flask
secure_headers = secure.Secure()


# https://nickjanetakis.com/blog/fix-missing-csrf-token-issues-with-flask
csrf.init_app(web_app)

################################## END what was in "initialize_flask.py" ###############################


def is_safe_url(target):
    """
    Ensures that a redirect target will lead to the same server.
    Prevents Open Redirect vulnerabilities.

    Gemini 3.1 Pro says this has to be above the login functions
    """
    ref_url = urlparse(request.host_url)
    test_url = urlparse(urljoin(request.host_url, target))
    return test_url.scheme in ("http", "https") and ref_url.netloc == test_url.netloc


################################## BEGIN what was in "pdg_login.py" ###############################

# in support of Google Sign-in
# from https://realpython.com/flask-google-login/
from library.google_auth_sql_db import init_db
from library.google_auth_user_account import User

# https://github.com/googleapis/google-auth-library-python/issues/1069
# https://stackoverflow.com/questions/51006382/no-module-named-requests-when-trying-to-use-google-oauth2-with-docker
# https://pypi.org/project/requests/
import requests

# https://realpython.com/flask-google-login/
# GOOGLE_CLIENT_ID = os.environ.get("GOOGLE_CLIENT_ID", None)
# GOOGLE_CLIENT_SECRET = os.environ.get("GOOGLE_CLIENT_SECRET", None)
GOOGLE_CLIENT_ID = os.environ["GOOGLE_CLIENT_ID"]
GOOGLE_CLIENT_SECRET = os.environ["GOOGLE_CLIENT_SECRET"]
GOOGLE_DISCOVERY_URL = "https://accounts.google.com/.well-known/openid-configuration"

from oauthlib.oauth2 import WebApplicationClient  # type: ignore

# https://flask-login.readthedocs.io/en/latest/#flask_login.LoginManager.user_loader
login_manager = LoginManager()
login_manager.init_app(web_app)

# https://realpython.com/flask-google-login/
# OAuth 2 client setup
client = WebApplicationClient(GOOGLE_CLIENT_ID)

# https://stackoverflow.com/a/24226084/1164295
web_app.config["GOOGLE_LOGIN_REDIRECT_SCHEME"] = "https"


def get_google_provider_cfg():
    """
    https://realpython.com/flask-google-login/
    """
    logger.info("[TRACE] ")
    url_json = requests.get(GOOGLE_DISCOVERY_URL).json()
    logger.debug(url_json)
    return url_json


@login_manager.unauthorized_handler
def unauthorized():
    """
    https://flask-login.readthedocs.io/en/latest/
    >>>
    """
    logger.info("[TRACE]")
    # return redirect(url_for("to_login", referrer="unauthorized"))
    # Tell Flask-Login to append the originally requested page to the login URL as a next query parameter.
    return redirect(url_for("to_login", next=request.url))


@login_manager.user_loader
def load_user(user_id):
    """
    https://flask-login.readthedocs.io/en/latest/
    also https://realpython.com/using-flask-login-for-user-management-with-flask/
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-v-user-logins
    """
    logger.info("[TRACE]")
    logger.debug(user_id)
    # return USERS.get(int(user_id))

    # https://realpython.com/flask-google-login/
    return User.get(user_id)


@web_app.route("/login")
def to_login():
    """
    https://realpython.com/flask-google-login/
    """
    logger.info("[TRACE]")

    next_url = request.args.get("next")
    if next_url:
        session["next_url"] = next_url

    if "db" not in g:
        logger.debug("db not in g")
        init_db()
    else:
        logger.debug("db is in g")

    # Find out what URL to hit for Google login
    google_provider_cfg = get_google_provider_cfg()
    authorization_endpoint = google_provider_cfg["authorization_endpoint"]

    # Use library to construct the request for Google login and provide
    # scopes that let you retrieve user's profile from Google
    request_uri = client.prepare_request_uri(
        authorization_endpoint,
        redirect_uri=request.base_url + "/callback",
        scope=["openid", "email", "profile"],
    )
    return redirect(request_uri)


@web_app.route("/login/callback")
def callback():
    """
    https://realpython.com/flask-google-login/
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # Get authorization code Google sent back to you
    code = request.args.get("code")

    # Find out what URL to hit to get tokens that allow you to ask for
    # things on behalf of a user
    google_provider_cfg = get_google_provider_cfg()
    token_endpoint = google_provider_cfg["token_endpoint"]

    # Prepare and send a request to get tokens
    token_url, headers, body = client.prepare_token_request(
        token_endpoint,
        authorization_response=request.url,
        redirect_url=request.base_url,
        code=code,
    )
    token_response = requests.post(
        token_url,
        headers=headers,
        data=body,
        auth=(GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET),
    )

    # Parse the tokens
    client.parse_request_body_response(json.dumps(token_response.json()))

    # Now that you have tokens (yay) let's find and hit the URL
    # from Google that gives you the user's profile information,
    # including their Google profile image and email
    userinfo_endpoint = google_provider_cfg["userinfo_endpoint"]
    uri, headers, body = client.add_token(userinfo_endpoint)
    userinfo_response = requests.get(uri, headers=headers, data=body)

    # You want to make sure their email is verified.
    # The user authenticated with Google, authorized your
    # app, and now you've verified their email through Google!
    if userinfo_response.json().get("email_verified"):
        unique_id = userinfo_response.json()["sub"]
        users_email = userinfo_response.json()["email"]
        picture = userinfo_response.json()["picture"]
        users_name = userinfo_response.json()["given_name"]
    else:
        return "User email not available or not verified by Google.", 400

    logger.info(users_name)
    logger.info(users_email)
    # Create a user in your db with the information provided
    # by Google
    user = User(id_=unique_id, name=users_name, email=users_email, profile_pic=picture)

    # Doesn't exist? Add it to the database.
    if not User.get(unique_id):
        logger.debug(users_name + " does not appear in database; creating it")
        User.create(unique_id, users_name, users_email, picture)
        logger.debug("created user in database")

    # Begin user session by logging the user in
    login_user(user)

    # logger.debug(str(current_user))
    logger.debug(str(User.get(unique_id)))
    logger.debug(str(current_user.name))
    logger.debug(str(current_user.email))
    flash("logged in")

    # Send user back to homepage
    # return redirect(url_for("to_navigation", referrer="login"))
    # TODO: rather than return the user to navigation, put them back on the original page they came from
    # This seems tricky; https://www.reddit.com/r/flask/comments/67lu0m/flasklogin_why_do_you_have_to_validate_a_next_url/

    # Retrieve 'next' URL from session and remove it
    next_url = session.pop("next_url", None)

    # Validate the url to prevent Open Redirects. If invalid or missing, fallback to navigation
    if not next_url or not is_safe_url(next_url):
        next_url = url_for("to_navigation", referrer="login")

    logger.info("[TRACE] end " + trace_id)
    return redirect(next_url)


@web_app.route("/logout", methods=["GET", "POST"])
@login_required
def to_logout():
    """
    https://flask-login.readthedocs.io/en/latest/#login-example
    >>>
    """
    logger.info("[TRACE] pdg_login/to_logout")
    #        flash("username not available")
    logout_user()
    return redirect(url_for("to_index", referrer="logout"))


################################## END what was in "pdg_login.py" ###############################


@web_app.route("/login-test-user")
def login_test_user():
    # Only allow this route if in testing mode
    if not current_app.config.get("TESTING"):
        return "Unauthorized", 403

    # Simulate what Google Auth callback does
    session["user_id"] = "test-123"
    session["email"] = "test@example.com"
    return "Logged in as test user"


######################## BEGIN importing blueprints (aka routes in other files) ##################

# from pdg_other_routes import other_routes_bp
# web_app.register_blueprint(other_routes_bp)


# the following import has to happen after web_app is configured because pdg_app uses graphDB_Driver
from library.pdg_api import api_bp

web_app.register_blueprint(api_bp)

from library.pdg_api_not_HATEOAS import api_nohateoas_bp

web_app.register_blueprint(api_nohateoas_bp)


######################## END importing blueprints (aka routes in other files) ##################


class IsAscii:
    def __init__(self, message=None):
        self.message = message

    def __call__(self, form, field):
        if field.data and not str(field.data).strip().isascii():
            logger.error(f"Non-ascii {field.name}: {field.data}")

            message = self.message or f"Input must be ASCII only: {escape(field.data)}"
            raise ValidationError(message)


class NoOptionsForm(FlaskForm):
    """
    This is used when the HTML form deviates from using the FlaskForm buttons
    """

    pass


# class DeleteButtonForm(FlaskForm):
#     """
#     not in use currently
#     """
#     delete_button = SubmitField("Delete")


class SpecifyNewDerivationForm(FlaskForm):
    """
    web form for user to provide name of (new) derivation

    https://wtforms.readthedocs.io/en/2.3.x/validators/

    https://wtforms.readthedocs.io/en/2.3.x/fields/

    the validators here need to also be present
    in the HTML, otherwise the form validation fails
    without a clear indicator to the HTML user
    """

    derivation_name_latex = StringField(
        "derivation name (latex)",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=5, max=1000),
        ],
    )
    derivation_reference_latex = StringField(
        "derivation reference (latex)",
        validators=[
            validators.Length(min=0, max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    abstract_latex = StringField(
        "abstract (latex)",
        validators=[
            validators.Length(min=0, max=10000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )


class SpecifyNewInferenceRuleForm(FlaskForm):
    """
    web form for user to provide inference rule

    https://wtforms.readthedocs.io/en/2.3.x/fields/

    https://wtforms.readthedocs.io/en/2.3.x/validators/
    """

    inference_rule_name = StringField(
        label="name (latex)",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=5, max=1000),
        ],
    )
    inference_rule_latex = StringField(
        "latex",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=5, max=10000),
        ],
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

    https://wtforms.readthedocs.io/en/2.3.x/fields/
    """

    note_before_step_latex = StringField(
        label="note before step (latex)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    note_after_step_latex = StringField(
        label="note after step (latex)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )


class SpecifyNewExpressionForm(FlaskForm):
    """
    web form for user to specify expressions used by steps

    https://wtforms.readthedocs.io/en/2.3.x/fields/

    this class is "LatexIO" in v7

    https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/12
    BHP spent most of 2025-01-01 trying to figure out how to
    dynamically populate the dropdown menu for relations (e.g., =, >).
    The tuples for the dropdown cannot be hardcoded; they are set by the user.
    BHP tried adding a new variable, list_of_relation_dropdown_tuples, upon
    initialization of the class, and then set that at call time.
    """

    # def __init__(self, list_of_relation_dropdown_tuples):
    #     self.list_of_relation_dropdown_tuples = list_of_relation_dropdown_tuples

    expression_latex_lhs = StringField(
        label="LaTeX expression LHS",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=1, max=1000),
        ],
    )

    # relation operation: ["=", "\lt", "\leq", "\gt", "\geq"]
    # https://wtforms.readthedocs.io/en/2.3.x/fields/#wtforms.fields.SelectField
    # expression_relation = SelectField(
    #    # "relation", choices=self.list_of_relation_dropdown_tuples
    #    "relation",
    #    # second entry in the tuple is what gets displayed in the dropdown menu
    #    choices=[("numeric ID for equal", "="), ("numeric ID for less than", "<")],
    # )

    expression_latex_rhs = StringField(
        label="LaTeX expression RHS",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=1, max=1000),
        ],
    )

    expression_latex_condition = StringField(
        label="LaTeX expression condition",
        validators=[
            validators.Length(min=0, max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    expression_name_latex = StringField(
        label="name (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    expression_reference_latex = StringField(
        label="reference (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    expression_description_latex = StringField(
        label="description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    submit_form = SubmitField("Submit")


class SpecifyNewFeedForm(FlaskForm):
    """
    web form for user to specify expressions used by steps

    this class is "LatexIO" in v7
    """

    feed_latex = StringField(
        label="LaTeX feed",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=1, max=1000),
        ],
    )


class SpecifyEditFeedForm(FlaskForm):
    """
    web form for user to specify expressions used by steps

    this class is "LatexIO" in v7
    """

    feed_latex = StringField(
        label="LaTeX feed",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=1, max=1000),
        ],
    )

    feed_sympy = StringField(
        label="SymPy feed",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(min=1, max=1000),
        ],
    )

    feed_lean = StringField(
        label="Lean feed",
        validators=[
            validators.Length(min=0, max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )


class SpecifyNewExpressionSympyLeanForm(FlaskForm):
    """
    web form for user to provide SymPy and Lean versions of expression

    https://wtforms.readthedocs.io/en/2.3.x/validators/

    the validators here need to also be present
    in the HTML, otherwise the form validation fails
    without a clear indicator to the HTML user
    """

    sympy_str_lhs = TextAreaField(
        label="SymPy for LHS",
        validators=[
            IsAscii(message="Only ASCII is allowed")
        ],  # validators.InputRequired(), validators.Length(min=5, max=1000)],
    )

    # TODO: relation dropdown

    sympy_str_rhs = TextAreaField(
        label="SymPy for RHS",
        validators=[IsAscii(message="Only ASCII is allowed")],
        # validators=[validators.InputRequired(), validators.Length(min=5, max=1000)],
    )
    lean_str = StringField(
        label="Lean",
        validators=[IsAscii(message="Only ASCII is allowed")],
        # validators=[validators.InputRequired(), validators.Length(min=5, max=10000)],
    )


class SpecifyNewFeedSympyLeanForm(FlaskForm):
    """
    web form for user to provide SymPy and Lean versions of feed

    https://wtforms.readthedocs.io/en/2.3.x/validators/

    the validators here need to also be present
    in the HTML, otherwise the form validation fails
    without a clear indicator to the HTML user
    """

    sympy_str = TextAreaField(
        label="SymPy for feed",
        validators=[IsAscii(message="Only ASCII is allowed")],
        # validators=[validators.InputRequired(), validators.Length(min=5, max=1000)],
    )

    lean_str = StringField(
        label="Lean",
        validators=[IsAscii(message="Only ASCII is allowed")],
        # validators=[validators.InputRequired(), validators.Length(min=5, max=10000)],
    )


class SpecifyNewSymbolScalarForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    scalar_latex = StringField(
        label="LaTeX scalar",
        validators=[
            validators.Length(min=1, max=1000),
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    scalar_name_latex = StringField(
        label="name (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    scalar_description_latex = StringField(
        label="description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    scalar_reference_latex = StringField("reference")

    list_of_scope_tuples = []
    for this_domain in list_of_valid.scalar_scope:
        tup = (this_domain, this_domain)
        list_of_scope_tuples.append(tup)

    scalar_scope = RadioField(
        label="scope",
        choices=list_of_scope_tuples,
        default="real",
        validators=[validators.InputRequired()],
    )

    scalar_variable_or_constant = RadioField(
        label="variable or constant",
        choices=[("variable", "variable"), ("constant", "constant")],
        default="variable",
        validators=[validators.InputRequired()],
    )

    list_of_domain_tuples = []
    for this_domain in list_of_valid.scalar_domain:
        tup = (this_domain, this_domain)
        list_of_domain_tuples.append(tup)

    # domain = input; range = output
    scalar_domain = RadioField(
        label="domain",
        choices=list_of_domain_tuples,
        default="any",
        validators=[validators.InputRequired()],
    )
    dimension_length = IntegerField(
        label="dimension: length",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_time = IntegerField(
        label="dimension: time",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_mass = IntegerField(
        label="dimension: mass",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_temperature = IntegerField(
        label="dimension: temperature",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_electric_charge = IntegerField(
        label="dimension: electric charge",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_amount_of_substance = IntegerField(
        label="dimension: amount of substance",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )
    dimension_luminous_intensity = IntegerField(
        label="dimension: luminous intensity",
        validators=[validators.InputRequired(), validators.NumberRange(min=-5, max=5)],
        default=0,
    )


class SpecifyNewConstantNumberForm(FlaskForm):
    # , validators.Length(min=1, max=100) ?
    number_decimal = DecimalField(
        label="decimal", validators=[validators.InputRequired()], default=Decimal("0")
    )
    number_power = DecimalField(label="power", default=Decimal("0"))


class SpecifyNewSymbolVectorForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    vector_latex = StringField(
        label="LaTeX vector",
        validators=[
            validators.Length(min=1, max=1000),
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    vector_name_latex = StringField(
        label="name (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    vector_description_latex = StringField(
        label="description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    vector_reference_latex = StringField("reference")

    vector_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )

    vector_size = RadioField(
        label="size",
        choices=[("arbitrary", "arbitrary"), ("fixed", "fixed")],
        default="arbitrary",
        validators=[validators.InputRequired()],
    )

    vector_orientation = RadioField(
        label="orientation",
        choices=[
            ("row vector", "row vector"),
            ("column vector", "column vector"),
            ("arbitrary", "arbitrary"),
        ],
        default="arbitrary",
    )

    vector_number_of_entries = IntegerField(
        label="number of entries",
        validators=[validators.NumberRange(min=1, max=20)],
        default=1,
    )


class SpecifyNewSymbolMatrixForm(FlaskForm):
    """
    https://physicsderivationgraph.blogspot.com/2024/05/distinguishing-scalars-vectors-and.html
    """

    matrix_latex = StringField(
        label="LaTeX matrix",
        validators=[
            validators.Length(min=1, max=1000),
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    matrix_name_latex = StringField(
        label="name (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    matrix_description_latex = StringField(
        label="description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    matrix_reference_latex = StringField(
        label="reference", validators=[IsAscii(message="Only ASCII is allowed")]
    )

    matrix_is_composite = BooleanField(
        label="is composite",
        description="check for 'yes'; unchecked for 'no'",
    )

    matrix_size = RadioField(
        label="size",
        choices=[("arbitrary", "arbitrary"), ("fixed", "fixed")],
        default="arbitrary",
        validators=[validators.InputRequired()],
    )

    matrix_number_of_rows = IntegerField(
        label="number of rows",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )
    matrix_number_of_columns = IntegerField(
        label="number of columns",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )


class SpecifyNewSymbolOperationForm(FlaskForm):
    """
    Form for defining a new symbol or mathematical operation.

    This form collects configuration data for new operators, including their
    LaTeX representation, expected number of arguments, and descriptive metadata.

    :ivar operation_latex: The LaTeX markup representing the symbol/operator.
        Must be ASCII, between 1 and 1000 characters, and is required.
    :vartype operation_latex: wtforms.fields.StringField

    :ivar operation_argument_count: The number of arguments the operation takes.
        Must be an integer between 1 and 20. Defaults to 1.
    :vartype operation_argument_count: wtforms.fields.IntegerField

    :ivar operation_name_latex: The name of the operation formatted in LaTeX.
        Must be ASCII, up to 1000 characters, and is required.
    :vartype operation_name_latex: wtforms.fields.StringField

    :ivar operation_description_latex: A LaTeX-formatted description of the operation.
        Must be ASCII and up to 1000 characters. Optional.
    :vartype operation_description_latex: wtforms.fields.StringField

    :ivar operation_reference_latex: An optional LaTeX-formatted reference or
        citation source for the operation.
    :vartype operation_reference_latex: wtforms.fields.StringField
    """

    operation_latex = StringField(
        "LaTeX symbol",
        validators=[
            validators.Length(min=1, max=1000),
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    operation_argument_count = IntegerField(
        label="number of arguments",
        validators=[validators.InputRequired(), validators.NumberRange(min=1, max=20)],
        default=1,
    )

    operation_name_latex = StringField(
        "name (LaTeX)",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(max=1000),
        ],
    )
    operation_description_latex = StringField(
        "description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    operation_reference_latex = StringField("reference (LaTeX)")


class SpecifyNewSymbolRelationForm(FlaskForm):
    """
    A Flask form for specifying a new relation for a symbol.

    This form collects and validates information about a LaTeX symbol relation,
    including its LaTeX representation, name, description, and reference. All text
    fields except the reference require ASCII input.

    :ivar relation_latex: The LaTeX representation of the relation.
        Must be ASCII, required, and between 1 and 1000 characters.
    :type relation_latex: StringField
    :ivar relation_name_latex: The name of the relation in LaTeX format.
        Must be ASCII, required, and up to 1000 characters.
    :type relation_name_latex: StringField
    :ivar relation_description_latex: A LaTeX-formatted description of the relation.
        Must be ASCII and up to 1000 characters.
    :type relation_description_latex: StringField
    :ivar relation_reference_latex: A LaTeX-formatted reference or citation for the relation.
        Optional.
    :type relation_reference_latex: StringField
    """

    relation_latex = StringField(
        "LaTeX symbol",
        validators=[
            validators.Length(min=1, max=1000),
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )

    relation_name_latex = StringField(
        "name (LaTeX)",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
            validators.Length(max=1000),
        ],
    )
    relation_description_latex = StringField(
        "description (LaTeX)",
        validators=[
            validators.Length(max=1000),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )
    relation_reference_latex = StringField("reference (LaTeX)")


class CypherQueryForm(FlaskForm):
    """Web form for submitting a Cypher query to a Neo4j database.

    :ivar query: The Cypher query input field. Must be non-empty and ASCII-only.
    :vartype query: StringField

    """

    # avoid using `Length(min=1)` because it causes validation
    # to fail on empty/unsubmitted forms. `InputRequired` is sufficient.
    query = StringField(
        "Cypher query",
        validators=[
            validators.InputRequired(),
            IsAscii(message="Only ASCII is allowed"),
        ],
    )


@web_app.before_request
def before_request():
    """
    needed for "g.request_time()" to show page load latency timing duration

    https://flask.palletsprojects.com/en/2.3.x/appcontext/

    Note: this function need to be before almost all other functions

    tutorial: https://pythonise.com/series/learning-flask/python-before-after-request

    https://stackoverflow.com/questions/12273889/calculate-execution-time-for-every-page-in-pythons-flask
    actually, https://gist.github.com/lost-theory/4521102

    >>> before_request():
    """
    g.start = time.time()
    g.request_start_time = time.time()
    logger.info("[TRACE] created elapsed_time function")
    elapsed_time = lambda: round(time.time() - g.request_start_time, 3)
    g.request_time = elapsed_time
    return


@web_app.route("/", methods=["GET", "POST"])
@web_app.route("/index", methods=["GET", "POST"])
def to_index():
    """
    placeholder for landing page that provides context before user goes to_navigation
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    query_time_dict = {}  # type: query_timing_result_type
    T_and_f_derivation_ID: unique_numeric_id_as_str = "0000884319"
    all_steps, query_time_dict = compute.get_dict_of_steps_in_derivation(
        graphDB_Driver, T_and_f_derivation_ID, query_time_dict
    )
    if web_app.static_folder is None:
        raise ValueError("no static folder")
    try:
        latex.create_d3js_json(
            T_and_f_derivation_ID, all_steps, web_app.static_folder + "/"
        )
        d3js_json_filename = "generated_" + T_and_f_derivation_ID + ".json"
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err))
        flash("pdg_app/to_index: " + str(type(err).__name__) + ": " + str(err))
        d3js_json_filename = ""

    logger.info("[TRACE] end " + trace_id)
    return render_template("jinja2_pages/index.html", json_for_d3js=d3js_json_filename)


#    return redirect(url_for("to_navigation"))


@web_app.route("/nav_old_NOT_IN_USE", methods=["GET", "POST"])
def to_old_nav():
    """
    TODO: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/175
    """
    return render_template("jinja2_pages/navigation_OLD.html")


@web_app.route("/navigation", methods=["GET", "POST"])
def to_navigation():
    """
    initial page

    file upload: see https://flask.palletsprojects.com/en/3.0.x/patterns/fileuploads/

    >>> to_navigation()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] main start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info("Is user anonymous?")
    logger.info(str(current_user.is_anonymous))  # True or False

    # if current_user.is_anonymous:
    #     pass
    #     #logger.info(current_user) # <flask_login.mixins.AnonymousUserMixin object at 0x7fd47a0c5550>
    # else:
    #     logger.info(current_user.email)

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("to_navigation: request.form = " + str(request.form))

        # check if the post request has the file part
        if "file" not in request.files:
            error_message_for_user = "ERROR: file not in request files"
            logger.error("file not in request files")
            logger.info("[TRACE] end " + trace_id)
            return redirect(request.url)
        file_obj = request.files["file"]

        logger.info("request.files" + str(request.files))
        # if user does not select file, browser also
        # submit an empty part without filename
        if file_obj.filename == "":
            error_message_for_user = "WARN: no selected file"
            logger.info("to_navigation: WARN: no selected file")
            logger.info("[TRACE] end " + trace_id)
            return redirect(request.url)
        if "upload_cypher" in request.form.keys():
            allowed_bool = True
        else:
            logger.info("[TRACE] end " + trace_id)
            raise Exception("unrecognized button")

        if file_obj and allowed_bool:
            if file_obj.filename is None:
                raise ValueError("missing file name")

            logger.info("file_obj.filename=" + str(file_obj.filename))
            filename = secure_filename(file_obj.filename)
            logger.info("to_navigation: filename = " + str(filename))
            path_to_uploaded_file = os.path.join(
                web_app.config["UPLOAD_FOLDER"], filename
            )
            logger.info("path_to_uploaded_file=" + str(path_to_uploaded_file))
            try:
                file_obj.save(path_to_uploaded_file)
            except FileNotFoundError as err:
                error_message_for_user = "ERROR: unable to save file" + str(err)
                logger.error("unable to save file" + str(err))
                return redirect(request.url)

            # shutil.copy(path_to_uploaded_file, "/code/" + path_to_db)

            is_overwrite = request.form.get("overwrite_data")

            if is_overwrite:
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict,
                    "pdg_app/to_list: delete_all_nodes_and_relationships " + trace_id,
                ):

                    str_to_print = session.write_transaction(
                        neo4j_query.delete_all_nodes_and_relationships
                    )

            # <<OPTION 1 FOR READING UPLOADED FILE>>
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/to_navigation " + trace_id
            ):
                filename = os.path.basename(path_to_uploaded_file)

                # Use parameters instead of string concatenation to prevent injection
                result = session.run(
                    "CALL apoc.cypher.runFiles([$path])", path=filename
                )

                # must consume the result to trigger any potential errors
                # .consume() waits for the database to finish and returns metadata
                summary = result.consume()
                # logger.info(str(summary)) # produces a `neo4j.work.summary.ResultSummary` object
                if summary.notifications:
                    for notification in summary.notifications:
                        logger.info(
                            f"[{notification['severity']}] {notification['title']}: {notification['description']}"
                        )

                logger.info(f"Query: {summary.query}")
                logger.info(f"Parameters: {summary.parameters}")

                counters = summary.counters
                logger.info(f"Nodes Created: {counters.nodes_created}")
                logger.info(f"Properties Set: {counters.properties_set}")
                logger.info(f"Relationships Created: {counters.relationships_created}")
                logger.info(f"Labels Added: {counters.labels_added}")

                logger.info(f"Available after: {summary.result_available_after}ms")
                logger.info(f"Consumed after: {summary.result_consumed_after}ms")

                logger.info(f"Server Address: {summary.server.address}")
                # logger.info(f"Server Version: {summary.server.version}")

            # <<OPTION 2 FOR READING UPLOADED FILE>> The following reads the queries line-by-line using Python
            # with open(path_to_uploaded_file, "r") as file_handle:
            #     queries = file_handle.read().split(";")
            #     # TODO: remove lines that start with "CREATE CONSTRAINT ON"
            #     # TODO: remove lines that start with "DROP CONSTRAINT ON"
            #     # TODO: splitting lines on ";" is dangerous since some content can include ";"
            #     # queries = [line.strip() for line in file_handle if not line.startswith(':') and line.strip()]
            #
            # logger.info("queries read from file:")
            # logger.info(str(queries))
            # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):
            #     # query_start_time = time.time()
            #     for query in queries:
            #         if query.strip():
            #             session.run(query)
            #     query_time_dict[
            #         "pdg_app/main: list_nodes_of_type, derivation " + trace_id
            #     ] = round(time.time() - query_start_time, 3)

    # performance TODO: replace the counts below with
    # MATCH (n) RETURN distinct labels(n), count(*)
    # 2026-01-29: Gemini 3 recommends using
    # result = session.run("MATCH (n) RETURN labels(n) as l, count(*) as c")

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/main" + trace_id
    ):

        number_of_derivations = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "derivation"
        )

        number_of_inference_rules = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "inference_rule"
        )

        number_of_expressions = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "expression"
        )

        number_of_scalars = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "scalar"
        )

        number_of_vectors = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "vector"
        )

        number_of_matrices = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "matrix"
        )

        number_of_operations = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "operation"
        )

        number_of_relations = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "relation"
        )

        number_of_feeds = session.read_transaction(
            neo4j_query.get_count_nodes_of_type, "feed"
        )

    logger.info("[TRACE] end " + trace_id)

    # TODO: leverage content from navigation_OLD.html
    return render_template(
        "jinja2_pages/navigation.html",
        title="site map",
        canonical_URL="navigation",
        query_time_dict=query_time_dict,
        number_of_derivations=number_of_derivations,
        number_of_inference_rules=number_of_inference_rules,
        number_of_expressions=number_of_expressions,
        number_of_feeds=number_of_feeds,
        number_of_scalars=number_of_scalars,
        number_of_vectors=number_of_vectors,
        number_of_matrices=number_of_matrices,
        number_of_operations=number_of_operations,
        number_of_relations=number_of_relations,
    )


@web_app.route("/new_derivation", methods=["GET", "POST"])
@login_required
def to_add_derivation() -> ResponseReturnValue:
    """
    create new derivation
    user provides deritivation name and abstract

    WIP:
    http://localhost:5000/new_derivation?derivation_name=asdf123&derivation_abstract=4924858miminginasf
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_new_derivation = SpecifyNewDerivationForm()

    # TODO: check that the name of the derivation doesn't
    #       conflict with existing derivation names

    list_of_derivations = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_add_derivation " + trace_id
    ):

        list_of_derivations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )

        # number_of_steps_per_derivation = {}
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        number_of_steps_per_derivation = session.read_transaction(
            neo4j_query.get_number_of_steps_per_derivation
        )

    # derivation_name_from_URL = None
    # derivation_abstract_from_URL = None
    # # via URL keyword
    # derivation_name_from_URL = str(request.args.get("derivation_name", None))
    # derivation_abstract_from_URL = str(request.args.get("derivation_abstract", None))
    # if derivation_name_from_URL and derivation_abstract_from_URL:
    #     logger.info("derivation_name_from_URL:" + str(derivation_name_from_URL))
    #     logger.info("derivation_abstract_from_URL:" + str(derivation_abstract_from_URL))

    logger.info("request.form=" + str(request.form))
    # request.form= ('derivation_name_latex', 'this is a new derivation'),
    #               ('derivation_reference_latex', ''), ('abstract_latex', 'my summary')])

    logger.info("request.method=" + str(request.method))  # POST

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form =" + str(request.form))
        if "new derivation" in request.form:
            if web_form_new_derivation.validate():
                # this preserves the LaTeX backslashes exactly as the user typed them.
                derivation_name_latex = str(
                    web_form_new_derivation.derivation_name_latex.data
                ).strip()

                # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/84
                # if not derivation_name_latex.isascii():
                #     logger.error(
                #         "Non-ascii derivation_name_latex: " + str(derivation_name_latex)
                #     )
                #     flash(f"Input must be ASCII only:{escape(derivation_name_latex)}")
                #     return redirect(url_for("to_add_derivation"))

                # this preserves the LaTeX backslashes exactly as the user typed them.
                derivation_reference_latex = str(
                    web_form_new_derivation.derivation_reference_latex.data
                ).strip()

                # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/84
                # if not derivation_reference_latex.isascii():
                #     logger.error(
                #         "Non-ascii derivation_reference_latex: "
                #         + str(derivation_reference_latex)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(derivation_reference_latex)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                # this preserves the LaTeX backslashes exactly as the user typed them.
                abstract_latex = str(
                    web_form_new_derivation.abstract_latex.data
                ).strip()

                # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/84
                # if not abstract_latex.isascii():
                #     logger.error("Non-ascii abstract_latex: " + str(abstract_latex))
                #     flash(f"Input must be ASCII only: {escape(abstract_latex)}")
                #     return redirect(url_for("to_add_expression"))

                # 2025-01-04, BHP: the following has been commented out
                # because the safety of string should be applied on writing, not reading
                #
                # derivation_name_latex_SAFE = latex.make_string_safe_for_latex(
                #     derivation_name_latex)

                # if derivation_name_latex_SAFE != derivation_name_latex:
                #     logger.info("   derivation name submitted:" + str(derivation_name_latex))
                #     logger.info("   derivation name altered:" + str(derivation_name_latex_SAFE))
                #     flash("derivation name altered to " + str(derivation_name_latex_SAFE))
                # derivation_name_latex = derivation_name_latex_SAFE

                # abstract_latex_SAFE = latex.make_string_safe_for_latex(abstract_latex)
                # if abstract_latex_SAFE != abstract_latex:
                #     logger.info("   abstract submitted:" + str(abstract_latex))
                #     logger.info("   abstract altered:" + str(abstract_latex))
                #     flash("   abstract altered to " + str(abstract_latex_SAFE))
                # abstract_latex = abstract_latex_SAFE

                # derivation_reference_latex_SAFE = latex.make_string_safe_for_latex(
                #     derivation_reference_latex)

                # if derivation_reference_latex_SAFE != derivation_reference_latex:
                #     logger.info("   reference submitted:" + str(derivation_reference_latex))
                #     logger.info("   reference altered:" + str(derivation_reference_latex))
                #     flash("   reference altered to " + str(derivation_reference_latex_SAFE))
                # derivation_reference_latex = derivation_reference_latex_SAFE

                author_name_latex = compute.encode_user_identifier(current_user.email)

                derivation_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )
                logger.info("to_add_derivation: derivation_id=" + str(derivation_id))

                # as per https://strftime.org/
                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/to_add_derivation " + trace_id
                ):
                    was_created = session.write_transaction(
                        neo4j_query.add_derivation,
                        derivation_id,
                        now_str,
                        derivation_name_latex,
                        abstract_latex,
                        derivation_reference_latex,
                        author_name_latex,
                    )
                if not was_created:
                    flash(
                        "pdg_app/to_add_derivation: a derivation with that name already exists"
                    )
                    logger.error(
                        "pdg_app/to_add_derivation: duplicate derivation name: "
                        + derivation_name_latex
                    )
                    return redirect(url_for("to_add_derivation"))
                logger.info("[TRACE] end " + trace_id)
                return redirect(
                    url_for(
                        "to_add_step_select_inference_rule", derivation_id=derivation_id
                    )
                )

            else:
                flash(
                    "pdg_app/to_add_derivation: " + str(web_form_new_derivation.errors)
                )
                logger.error(str(web_form_new_derivation.errors))
                return redirect(url_for("to_add_derivation"))
        else:
            flash("pdg_app/to_add_derivation: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_add_derivation"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/derivation_create.html",
        title="Create Derivation",
        query_time_dict=query_time_dict,
        form=web_form_new_derivation,
        list_of_derivations=list_of_derivations,
        number_of_steps_per_derivation=number_of_steps_per_derivation,
    )


@web_app.route("/review_derivation/<derivation_id>", methods=["GET", "POST"])
def to_review_derivation(
    derivation_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """
    options from this page:
    * add step to existing derivation
    * delete step from existing derivation
    * edit step in derivation
    * delete derivation

    https://allofphysiscs.com/static/property_graph_schema.png

    >>> to_review_derivation()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_delete = NoOptionsForm()
    web_form_tex_pdf = NoOptionsForm()

    derivation_dict = {}
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_review_derivation " + trace_id
    ):

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

        logger.info("derivation_dict:" + str(derivation_dict))

        if derivation_dict is None:
            flash(
                "pdg_app/to_review_derivation: invalid derivation_id: "
                + str(derivation_id)
            )
            return redirect(url_for("to_list_derivations"))

    all_steps, query_time_dict = compute.get_dict_of_steps_in_derivation(
        graphDB_Driver, derivation_id, query_time_dict
    )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("to_review_derivation: request.form = " + str(request.form))

        if "generate pdf" in request.form:
            logger.info("request.form=" + str(request.form))

            # path_to_pdf = "/code/static/dumping_grounds/"  # should end with slash

            if web_app.static_folder is None:
                raise ValueError("Missing static folder")
            try:
                pdf_filename = latex.create_pdf_for_derivation(
                    all_steps,
                    derivation_dict,
                    web_app.static_folder + "/",
                )
            except Exception as err:
                # logger.error(str(err))
                flash(
                    "pdg_app/to_review_derivation: "
                    + str(type(err).__name__)
                    + str(err)
                )
                logger.error(str(type(err).__name__) + ": " + str(err))
                pdf_filename = "error.pdf"

            logger.info("[TRACE] end " + trace_id)
            return redirect(
                url_for(
                    "static",
                    # filename="dumping_grounds/" + pdf_filename,
                    filename=pdf_filename,
                    referrer="select_from_existing_derivations",
                )
            )

        elif "generate tex" in request.form:
            # request.form = ImmutableMultiDict([('derivation_selected', 'another deriv'), ('submit_button', 'generate_tex')])

            # path_to_tex_file = "/code/static/dumping_grounds/"  # should end with slash

            if web_app.static_folder is None:
                raise ValueError("missing static folder")
            try:
                tex_filename = latex.create_tex_file_for_derivation(
                    all_steps,
                    derivation_dict,
                    web_app.static_folder + "/",
                )
            except Exception as err:
                # logger.error(str(err))
                flash(
                    "pdg_app/to_review_derivation: "
                    + str(type(err).__name__)
                    + str(err)
                )
                logger.error(str(type(err).__name__) + ": " + str(err))
                logger.info("[TRACE] end " + trace_id)
                return redirect(url_for("select_from_existing_derivations"))

            logger.info("[TRACE] end " + trace_id)
            return redirect(
                url_for(
                    "static",
                    # filename="dumping_grounds/" + tex_filename + ".tex",
                    filename=tex_filename + ".tex",
                    referrer="select_from_existing_derivations",
                )
            )

        elif "delete derivation" in request.form:
            # delete derivation (yikes!). Here's how:
            # 1) for each step, delete step node
            # 2) delete derivation node

            # logger.info("list_of_step_dicts (to delete)=" + str(list_of_step_dicts))

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):
                for step_id, everything in all_steps.items():

                    session.write_transaction(neo4j_query.delete_node, step_id, "step")

                # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

                session.write_transaction(
                    neo4j_query.delete_node, derivation_id, "derivation"
                )

            logger.info("[TRACE]  end " + trace_id)
            return redirect(url_for("to_list_derivations"))
        else:
            flash(
                "pdg_app/to_review_derivation: unrecognized button in"
                + str(request.form)
            )
            logger.error("unrecognized button in" + str(request.form))

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        symbols_in_derivation = session.read_transaction(
            neo4j_query.get_symbols_for_derivation, derivation_id
        )

    if web_app.static_folder is None:
        raise ValueError("missing static folder")
    # only create d3js JSON if the HTML page is going to be rendered
    try:
        latex.create_d3js_json(derivation_id, all_steps, web_app.static_folder + "/")
        # if that function fails then there's no JSON file for d3js
    except Exception as err:
        flash(
            "pdg_app/to_review_derivation: " + str(type(err).__name__) + ": " + str(err)
        )
        logger.error(str(type(err).__name__) + ": " + str(err))

    d3js_json_filename = derivation_id + ".json"

    logger.info("d3js_json_filename=" + str(d3js_json_filename))

    # only create graphviz PNG if the HTML page is going to be rendered
    # SVG isn't available yet; see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/14

    if web_app.static_folder is None:
        raise ValueError("missing static folder")
    derivation_name_latex = derivation_dict["name_latex"]
    derivation_graphviz_png_filename = latex.create_derivation_png(
        derivation_id,
        derivation_name_latex,
        all_steps,
        web_app.static_folder + "/",
    )

    logger.info(
        "derivation_graphviz_png_filename=" + str(derivation_graphviz_png_filename)
    )

    # only validate steps if HTML page is going to be rendered
    derivation_step_validity_dict = {}
    for step_id, everything in all_steps.items():
        logger.info("step_id=" + step_id)
        try:
            derivation_step_validity_dict[step_id] = sympy_validate_step.validate_step(
                everything["inference rule dict"],
                everything["list of input dicts"],
                everything["list of feed dicts"],
                everything["list of output dicts"],
            )
        except Exception as err:
            flash(
                "pdg_app/to_review_derivation sympy_validate_step.validate_step: "
                + str(type(err).__name__)
                + " "
                + str(err)
                + " "
                + str(step_id)
            )
            logger.error(str(type(err).__name__) + ": " + str(err))

    canonical_URL = "review_derivation/" + str(derivation_id)
    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/derivation_review.html",
        title="Review Derivation",
        canonical_URL=canonical_URL,
        query_time_dict=query_time_dict,
        derivation_dict=derivation_dict,
        symbols_in_derivation=symbols_in_derivation,
        derivation_graphviz_png_filename=derivation_graphviz_png_filename,
        # derivation_graphviz_svg_filename=derivation_graphviz_svg_filename,
        json_for_d3js=d3js_json_filename,
        derivation_step_validity_dict=derivation_step_validity_dict,
        all_steps=all_steps,
        form_delete=web_form_delete,
        form_tex_pdf=web_form_tex_pdf,
    )


@web_app.route("/select_step/<derivation_id>", methods=["GET", "POST"])
def to_select_step(derivation_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    User wants to delete step or edit step
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # get properties for derivation ID
    derivation_dict = {}
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_select_step " + trace_id
    ):

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

        logger.info("derivation_dict:" + str(derivation_dict))

        if derivation_dict is None:
            flash(
                "pdg_app/to_select_step: invalid derivation_id: " + str(derivation_id)
            )
            return redirect(url_for("to_list_derivations"))

        # list_of_step_dicts = []
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )

    # logger.info("list_of_step_dicts=" + str(list_of_step_dicts))

    # inference_rule_per_step = {}
    # for this_step_dict in list_of_step_dicts:
    #    with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):
    #        neo4j_query.get_inference_rule_connected_to_step_ID,

    #    with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):
    #        neo4j_query.get_step_has_expressions

    all_steps, query_time_dict = compute.get_dict_of_steps_in_derivation(
        graphDB_Driver, derivation_id, query_time_dict
    )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/derivation_select_step.html",
        title="Derivation: Select Step",
        derivation_dict=derivation_dict,
        list_of_step_dicts=list_of_step_dicts,
        all_steps=all_steps,
        query_time_dict=query_time_dict,
    )


@web_app.route("/edit_derivation_metadata/<derivation_id>", methods=["GET", "POST"])
@login_required
def to_edit_derivation_metadata(
    derivation_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_edit_derivation = SpecifyNewDerivationForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

    logger.info("to_edit_derivation_metadata: derivation_dict:" + str(derivation_dict))

    if derivation_dict is None:
        flash(
            "pdg_app/to_edit_derivation_metadata: Derivation ID "
            + str(derivation_id)
            + " does not exist in database"
        )
        return redirect(url_for("to_list_derivations"))

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "edit metadata" in request.form:
            if web_form_edit_derivation.validate():
                # sanitize Latex
                # TODO: notify user if what they submitted has been altered.
                # derivation_name_latex = latex.make_string_safe_for_latex(
                #     str(web_form_edit_derivation.derivation_name_latex.data).strip()
                # )
                # derivation_reference_latex = latex.make_string_safe_for_latex(
                #     str(
                #         web_form_edit_derivation.derivation_reference_latex.data
                #     ).strip()
                # )
                # abstract_latex = latex.make_string_safe_for_latex(
                #     str(web_form_edit_derivation.abstract_latex.data).strip()
                # )

                derivation_name_latex = str(
                    web_form_edit_derivation.derivation_name_latex.data
                ).strip()
                derivation_reference_latex = str(
                    web_form_edit_derivation.derivation_reference_latex.data
                ).strip()

                abstract_latex = str(
                    web_form_edit_derivation.abstract_latex.data
                ).strip()

                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    if abstract_latex != derivation_dict["abstract_latex"]:
                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "derivation",
                            derivation_id,
                            "abstract_latex",
                            abstract_latex,
                        )

                    if derivation_reference_latex != derivation_dict["reference_latex"]:
                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "derivation",
                            derivation_id,
                            "reference_latex",
                            derivation_reference_latex,
                        )

                    if derivation_name_latex != derivation_dict["name_latex"]:
                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "derivation",
                            derivation_id,
                            "name_latex",
                            derivation_name_latex,
                        )

                logger.info("[TRACE] end " + trace_id)
                return redirect(
                    url_for("to_review_derivation", derivation_id=derivation_id)
                )

            else:
                flash(
                    "pdg_app/to_edit_derivation_metadata: "
                    + str(web_form_edit_derivation.errors)
                )
                logger.error(str(web_form_edit_derivation.errors))
                return redirect(url_for("to_edit_derivation_metadata"))
        else:
            flash("pdg_app/to_edit_derivation_metadata: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_edit_derivation_metadata"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/derivation_edit_metadata.html",
        title="Edit derivation metadata",
        query_time_dict=query_time_dict,
        form=web_form_edit_derivation,
        derivation_dict=derivation_dict,
    )


@web_app.route(
    "/new_step_select_inference_rule/<derivation_id>/", methods=["GET", "POST"]
)
@login_required
def to_add_step_select_inference_rule(
    derivation_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """
    add new step to existing derivation

    What inference rule should be used for this step?

    TODO:
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info(
        "to_add_step_select_inference_rule: derivation_id: " + str(derivation_id)
    )

    # list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_add_step_select_inference_rule " + trace_id
    ):

        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.get_inference_rules
        )

        # get properties of this derivation

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

    if derivation_dict is None:
        flash(
            "pdg_app/to_add_step_select_inference_rule: derivation_id not recognized:"
            + str(derivation_id)
        )
        return redirect(url_for("to_list_derivations"))

    logger.info("list_of_inference_rule_dicts=" + str(list_of_inference_rule_dicts))
    logger.info("derivation_dict:" + str(derivation_dict))

    if len(list_of_inference_rule_dicts) == 0:
        redirect(url_for("to_add_inference_rule"))

    # Inference rules have the schema
    # [{'id': '7616707',
    #   'author_name_latex': 'ben',
    #   'name': 'add x to both sides',
    #   'latex': 'ADD _ to BOTH sides'},...]

    # to populate the dropdown menu we need the list of inference rule IDs
    list_of_inference_rule_IDs = []
    for inference_rule_dict in list_of_inference_rule_dicts:
        list_of_inference_rule_IDs.append(inference_rule_dict["id"])

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/new_step_select_inference_rule.html",
        title="Add Step: Select Inference rule",
        query_time_dict=query_time_dict,
        list_of_inference_rule_dicts=list_of_inference_rule_dicts,
        derivation_dict=derivation_dict,
    )
    # # workflow shouldn't reach this condition, but if it does,
    # logger.info("[TRACE] end " + trace_id)
    # raise Exception("How did you reach this?")

    # logger.info("[TRACE] end " + trace_id)
    # return redirect(url_for("to_review_derivation", derivation_id=derivation_id))


@web_app.route("/edit_expression/<expression_id>", methods=["GET", "POST"])
# @login_required
def to_edit_expression(expression_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    authenticated user can edit expression by
    - alter the Latex of either LHS or RHS
    - alter the relation
    - alter the label
    - delete the expression
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info("expression_id: " + str(expression_id))

    web_form_new_expression = SpecifyNewExpressionForm()
    web_form_expression_sympy = SpecifyNewExpressionSympyLeanForm()
    web_form_no_options = NoOptionsForm()

    expression_dict = {}
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_edit_expression " + trace_id
    ):

        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )

        if expression_dict is None:
            flash(
                "pdg_app/to_edit_expression: expression_id not recognized: "
                + str(expression_id)
            )
            return redirect(url_for("to_list_expressions"))

        derivations_that_use_expression = session.read_transaction(
            neo4j_query.get_derivations_that_use_expression, expression_dict["id"]
        )

    logger.info("expression_dict:" + str(expression_dict))

    if expression_dict is None:
        return (
            "<H1>Expression ID "
            + str(expression_id)
            + " does not exist in database</H1>."
        )

    web_form_new_expression.expression_latex_lhs.data = expression_dict["latex_lhs"]
    web_form_new_expression.expression_latex_rhs.data = expression_dict["latex_rhs"]
    web_form_new_expression.expression_name_latex.data = expression_dict["name_latex"]
    web_form_new_expression.expression_reference_latex.data = expression_dict[
        "reference_latex"
    ]
    web_form_new_expression.expression_description_latex.data = expression_dict[
        "description_latex"
    ]

    web_form_expression_sympy.sympy_str_lhs.data = expression_dict.get("sympy_lhs", "")
    web_form_expression_sympy.sympy_str_rhs.data = expression_dict.get("sympy_rhs", "")
    web_form_expression_sympy.lean_str.data = expression_dict.get("lean_str", "")

    if "sympy_lhs" in expression_dict.keys() and len(expression_dict["sympy_lhs"]) > 0:
        error_msg = latex_and_sympy.create_AST_png_for_latex(
            expression_dict["sympy_lhs"], expression_dict["id"] + "_LHS"
        )
        if len(error_msg) > 0:
            flash("pdg_app/to_edit_expression: " + str(error_msg))
            logger.error(str(error_msg))
    else:
        flash("pdg_app/to_edit_expression: no sympy_lhs to create picture from")

    if "sympy_rhs" in expression_dict.keys() and len(expression_dict["sympy_rhs"]) > 0:
        error_msg = latex_and_sympy.create_AST_png_for_latex(
            expression_dict["sympy_rhs"], expression_dict["id"] + "_RHS"
        )
        if len(error_msg) > 0:
            flash("pdg_app/to_edit_expression: " + str(error_msg))
            logger.error(str(error_msg))
    else:
        flash("pdg_app/to_edit_expression: no sympy_rhs to create picture from")

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        symbols_in_expression = session.read_transaction(
            neo4j_query.get_symbols_for_expression, expression_id
        )

        operations_in_expression = session.read_transaction(
            neo4j_query.get_operations_for_expression, expression_id
        )

    symbols_not_in_expression, query_time_dict = compute.get_symbols_not_in_expression(
        expression_dict, symbols_in_expression, graphDB_Driver, query_time_dict
    )

    operations_not_in_expression, query_time_dict = (
        compute.get_operations_not_in_expression(
            expression_dict, operations_in_expression, graphDB_Driver, query_time_dict
        )
    )
    relations_not_in_expression, query_time_dict = (
        compute.get_relations_not_in_expression(
            expression_dict,
            expression_dict["latex_relation"],
            graphDB_Driver,
            query_time_dict,
        )
    )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "add symbol to expr" in request.form:

            for key, val in request.form.items():
                if "symbol_id_to_connect_to_expression" in key:
                    symbol_id_to_add = str(val)

            logger.info("symbol_id_to_add: " + symbol_id_to_add)

            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.connect_symbol_to_expression,
                    symbol_id_to_add,
                    expression_id,
                )

            return redirect(url_for("to_edit_expression", expression_id=expression_id))

        elif "remove symbol from expr" in request.form:
            logger.info("request.form = " + str(request.form))

            if "symbol_select_id_to_disconnect" in request.form.keys():
                id_to_disconnect = request.form["symbol_select_id_to_disconnect"]

                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    session.write_transaction(
                        neo4j_query.disconnect_symbol_from_expression,
                        id_to_disconnect,
                        expression_id,
                    )

            else:
                flash("pdg_app/to_edit_expression: missing ID selection")

            # flash(
            #     "pdg_app/to_edit_expression: Not enacted 'remove symbol from expr' yet"
            # )
            return redirect(url_for("to_edit_expression", expression_id=expression_id))

        elif "add operation to expr" in request.form:
            logger.info("request.form = " + str(request.form))

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):
                for key, val in request.form.items():
                    if "operation_id_to_connect_to_expression" in key:
                        operation_id = val

                        _ = session.write_transaction(
                            neo4j_query.connect_symbol_to_expression,
                            operation_id,
                            expression_id,
                        )

            return redirect(url_for("to_edit_expression", expression_id=expression_id))

        elif "remove operation from expr" in request.form:
            logger.info("request.form = " + str(request.form))

            # TODO

            flash(
                "pdg_app/to_edit_expression: Not enacted 'remove operation from expr' yet"
            )
            return redirect(url_for("to_edit_expression", expression_id=expression_id))

        elif "update relation in expr" in request.form:
            if web_form_new_expression.validate():
                logger.info("request.form = " + str(request.form))
                # TODO
                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )

            else:  # invalid form submitted
                flash(
                    "pdg_app/to_edit_expression: " + str(web_form_new_expression.errors)
                )
                logger.error(
                    "web_form_new_expression.errors:"
                    + str(web_form_new_expression.errors)
                )
                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )

        elif "edit expression latex" in request.form:
            if web_form_new_expression.validate():
                logger.info("request.form = " + str(request.form))
                expression_latex_lhs = latex.make_string_safe_for_latex(
                    str(web_form_new_expression.expression_latex_lhs.data).strip()
                )
                expression_relation_id = request.form["symbol_relation_id_to_add"]
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    expression_relation = session.read_transaction(
                        neo4j_query.get_relation_latex, expression_relation_id
                    )
                logger.info(str(expression_relation))
                expression_latex_rhs = latex.make_string_safe_for_latex(
                    str(web_form_new_expression.expression_latex_rhs.data).strip()
                )
                expression_latex_condition = latex.make_string_safe_for_latex(
                    str(web_form_new_expression.expression_latex_condition.data).strip()
                )
                expression_name_latex = latex.make_string_safe_for_latex(
                    str(web_form_new_expression.expression_name_latex.data).strip()
                )
                expression_reference_latex = latex.make_string_safe_for_latex(
                    str(web_form_new_expression.expression_reference_latex.data).strip()
                )
                expression_description_latex = latex.make_string_safe_for_latex(
                    str(
                        web_form_new_expression.expression_description_latex.data
                    ).strip()
                )
                logger.info("expression_latex_lhs=" + str(expression_latex_lhs))
                logger.info("expression_latex_rhs=" + str(expression_latex_rhs))
                logger.info(
                    "expression_latex_condition=" + str(expression_latex_condition)
                )
                author_name_latex = compute.encode_user_identifier(current_user.email)

                # Check outcome of transaction edit execution
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    success = session.write_transaction(
                        neo4j_query.edit_expression,
                        expression_id,
                        expression_latex_lhs,
                        expression_relation,
                        expression_latex_rhs,
                        expression_latex_condition,
                        expression_name_latex,
                        expression_description_latex,
                        expression_reference_latex,
                        author_name_latex,
                    )

                if not success:
                    flash(
                        "pdg_app/to_edit_expression: an expression with that LHS/relation/RHS already exists"
                    )
                    logger.error(
                        "pdg_app/to_edit_expression: duplicate expression update blocked: "
                        + expression_latex_lhs
                        + " "
                        + expression_relation
                        + " "
                        + expression_latex_rhs
                    )

                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )
            else:
                flash(
                    "pdg_app/to_edit_expression: " + str(web_form_new_expression.errors)
                )
                logger.error(
                    "web_form_new_expression.errors: "
                    + str(web_form_new_expression.errors)
                )
                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )

        elif "edit expression sympy" in request.form:
            logger.info("request.form = " + str(request.form))
            if web_form_expression_sympy.validate():
                logger.info("request.form = " + str(request.form))

                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "expression",
                        expression_id,
                        "sympy_lhs",
                        request.form["sympy_str_lhs"],
                    )

                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "expression",
                        expression_id,
                        "sympy_rhs",
                        request.form["sympy_str_rhs"],
                    )

                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "expression",
                        expression_id,
                        "lean",
                        request.form["lean_str"],
                    )

                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )

            else:  # invalid form submitted
                flash(
                    "pdg_app/to_edit_expression: "
                    + str(web_form_expression_sympy.errors)
                )
                logger.error(
                    "web_form_new_expression.errors: "
                    + str(web_form_expression_sympy.errors)
                )
                return redirect(
                    url_for("to_edit_expression", expression_id=expression_id)
                )

        elif "delete expression" in request.form:
            logger.info("request.form = " + str(request.form))
            logger.info("request.form.keys()" + str(request.form.keys()))

            logger.info("Deleting expression: " + str(expression_id))
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.delete_node, expression_id, "expression"
                )

            return redirect(url_for("to_list_expressions"))
        else:
            flash("pdg_app/to_edit_expression: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_edit_expression", expression_id=expression_id))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/expression_edit.html",
        title="Edit Expression",
        query_time_dict=query_time_dict,
        expression_dict=expression_dict,
        form_no_options=web_form_no_options,
        form_new_expression=web_form_new_expression,
        form_expression_sympy=web_form_expression_sympy,
        symbols_in_expression=symbols_in_expression,
        symbols_not_in_expression=symbols_not_in_expression,
        operations_in_expression=operations_in_expression,
        operations_not_in_expression=operations_not_in_expression,
        relations_not_in_expression=relations_not_in_expression,
        derivations_that_use_expression=derivations_that_use_expression,
    )


@web_app.route("/edit_feed/<feed_id>", methods=["GET", "POST"])
@login_required
def to_edit_feed(feed_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit feed
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info("feed_id: " + str(feed_id))

    web_form_no_options = NoOptionsForm()
    web_form_edit_feed = SpecifyEditFeedForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_edit_feed " + trace_id
    ):

        feed_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "feed", feed_id
        )

        logger.info("feed_dict:" + str(feed_dict))

        if feed_dict is None:
            flash(
                "pdg_app/to_edit_feed: Feed ID "
                + str(feed_id)
                + " does not exist in database"
            )
            logger.info("Feed ID " + str(feed_id) + " does not exist in database")
            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_list_feeds"))

        # editing the feed includes modifying the symbols present.

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        symbols_in_feed = session.read_transaction(
            neo4j_query.get_symbols_for_feed, feed_id
        )

        logger.info("symbols_in_feed=" + str(symbols_in_feed))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        # list_of_feeds = session.read_transaction(neo4j_query.get_nodes_of_type, "feed")

        list_of_symbols = session.read_transaction(
            neo4j_query.get_nodes_of_type, "symbol"
        )

        list_of_derivations_that_use_feed = session.read_transaction(
            neo4j_query.get_derivations_that_use_feed, feed_id
        )

    symbol_latex_in_feed = []
    symbol_id_in_feed = []
    for this_symbol in symbols_in_feed:
        symbol_id_in_feed.append(this_symbol["id"])
        symbol_latex_in_feed.append(this_symbol["latex"])

    # create new dict of symbols NOT used in feed
    symbols_not_in_feed = []
    for this_symbol in list_of_symbols:
        if this_symbol["id"] not in symbol_id_in_feed:
            if this_symbol["latex"] in feed_dict["latex"]:
                symbols_not_in_feed.append(this_symbol)

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))
        logger.info("request.form.keys()= " + str(request.form.keys()))

        if "delete" in request.form.keys():

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.delete_node,
                    feed_id,
                    "feed",
                )

            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_list_feeds"))
        elif "add symbol" in request.form.keys():

            symbol_id_to_add = str(request.form["symbol_select_id_to_add"])
            logger.info("symbol_id_to_add=" + str(symbol_id_to_add))

            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.connect_symbol_to_feed,
                    symbol_id_to_add,
                    feed_id,
                )

            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_edit_feed", feed_id=feed_id))
        elif "remove symbol" in request.form.keys():

            symbol_id_to_disconnect = str(
                request.form["symbol_select_id_to_disconnect"]
            )
            logger.info("symbol_id_to_disconnect=" + str(symbol_id_to_disconnect))

            # TODO: user was provided all the symbols as an optional disconnect
            # but the function only handles disconnects of specific types (e.g., scalar, vector)
            # FAULT EXPECTED for non-scalar disconnect requests

            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.disconnect_symbol_from_feed,
                    symbol_id_to_disconnect,
                    feed_id,
                )

            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_edit_feed", feed_id=feed_id))
        elif "edit" in request.form.keys():

            if web_form_edit_feed.validate():
                feed_latex = str(web_form_edit_feed.feed_latex.data).strip()
                feed_sympy = str(web_form_edit_feed.feed_sympy.data).strip()
                feed_lean = str(web_form_edit_feed.feed_lean.data).strip()

                logger.info("feed_latex=" + str(feed_latex))
                logger.info("feed_sympy=" + str(feed_sympy))
                logger.info("feed_lean=" + str(feed_lean))

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                author_name_latex = compute.encode_user_identifier(current_user.email)

                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    if feed_dict["latex"] != feed_latex:

                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "feed",
                            feed_id,
                            "latex",
                            feed_latex,
                        )

                    if feed_dict["sympy"] != feed_sympy:

                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "feed",
                            feed_id,
                            "sympy",
                            feed_sympy,
                        )

                    if feed_dict["lean"] != feed_lean:

                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "feed",
                            feed_id,
                            "lean",
                            feed_lean,
                        )

            else:
                flash("pdg_app/to_edit_feed: " + str(web_form_edit_feed.errors))
                logger.error(str(web_form_edit_feed.errors))

            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_edit_feed", feed_id=feed_id))

        else:
            flash("unrecognized form POSTed: " + str(request.form))
            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_edit_feed", feed_id=feed_id))

    # sympy_as_latex_per_feed_id = compute.get_sympy_as_latex_per_feed_id(list_of_feeds)

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/feed_edit.html",
        title="Edit Feed",
        query_time_dict=query_time_dict,
        form_no_options=web_form_no_options,
        form_edit_feed=web_form_edit_feed,
        symbols_in_feed=symbols_in_feed,
        symbols_not_in_feed=symbols_not_in_feed,
        list_of_derivations_that_use_feed=list_of_derivations_that_use_feed,
        # dict_of_symbols_not_in_feed=dict_of_symbols_not_in_feed,
        feed_dict=feed_dict,
        # sympy_as_latex_per_feed_id=sympy_as_latex_per_feed_id,  # Used in _table_of_feeds.html
    )


@web_app.route("/new_expression", methods=["GET", "POST"])
@login_required
def to_add_expression() -> ResponseReturnValue:
    """
    novel expression
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_add_expression = SpecifyNewExpressionForm()

    # Used in _table_of_expressions.html which is referenced in expression_create.html
    list_of_expressions = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_add_expression " + trace_id
    ):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )

        list_of_relations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "relation"
        )

    # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/66
    if len(list_of_relations) == 0:
        flash(
            "pdg_app/to_add_expression: Need to have at least on relation before entering an Expression"
        )
        logger.error("Need to have at least on relation before entering an Expression")
        return redirect(url_for("to_add_relation"))

    # logger.info("list_of_relations=",list_of_relations)

    # `to_add_expression` is the only function in which the following "sort" is used
    # sort list_of_relations such that "=" is in position 0
    sorted_list_of_relations = []  # type: List[dict]
    for this_relation_dict in list_of_relations:
        if this_relation_dict["latex"] == "=":
            sorted_list_of_relations.append(this_relation_dict)

    for this_relation_dict in list_of_relations:
        if this_relation_dict["latex"] != "=":
            sorted_list_of_relations.append(this_relation_dict)
    list_of_relations = sorted_list_of_relations

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new expression" in request.form:
            if web_form_add_expression.validate():
                expression_latex_lhs = str(
                    web_form_add_expression.expression_latex_lhs.data
                ).strip()

                # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/84
                # if not expression_latex_lhs.isascii():
                #     logger.error(
                #         "Non-ascii expression_latex_lhs: " + str(expression_latex_lhs)
                #     )
                #     flash(f"Input must be ASCII only{escape(expression_latex_lhs)}")
                #     return redirect(url_for("to_add_expression"))

                # the web UI dropdown returns the symbol ID (and not Latex string)
                #'symbol_relation_id_to_add', '2222545'
                expression_relation_id = request.form["symbol_relation_id_to_add"]

                logger.info("expression_relation_id: " + expression_relation_id)

                # look up the Latex string. (The other option is to change the schema to expr -> HAS_RELATION -> symbol)
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    expression_relation = session.read_transaction(
                        neo4j_query.get_relation_latex, expression_relation_id
                    )

                logger.info(str(expression_relation))

                expression_latex_rhs = str(
                    web_form_add_expression.expression_latex_rhs.data
                ).strip()

                # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/84
                # if not expression_latex_rhs.isascii():
                #     logger.error(
                #         "Non-ascii expression_latex_rhs: " + str(expression_latex_rhs)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(expression_latex_rhs)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                expression_latex_condition = str(
                    web_form_add_expression.expression_latex_condition.data
                ).strip()
                # if not expression_latex_condition.isascii():
                #     logger.error(
                #         "Non-ascii expression_latex_condition: "
                #         + str(expression_latex_condition)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(expression_latex_condition)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                expression_name_latex = str(
                    web_form_add_expression.expression_name_latex.data
                ).strip()
                # if not expression_name_latex.isascii():
                #     logger.error(
                #         "Non-ascii expression_name_latex: " + str(expression_name_latex)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(expression_name_latex)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                expression_reference_latex = str(
                    web_form_add_expression.expression_reference_latex.data
                ).strip()
                # if not expression_reference_latex.isascii():
                #     logger.error(
                #         "Non-ascii expression_reference_latex: "
                #         + str(expression_reference_latex)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(expression_reference_latex)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                expression_description_latex = str(
                    web_form_add_expression.expression_description_latex.data
                ).strip()
                # if not expression_description_latex.isascii():
                #     logger.error(
                #         "Non-ascii expression_description_latex: "
                #         + str(expression_description_latex)
                #     )
                #     flash(
                #         "pdg_app/to_add_expression: Input must be ASCII only: "
                #         + str(expression_description_latex)
                #     )
                #     logger.info("[TRACE] end " + trace_id)
                #     return redirect(url_for("to_add_expression"))

                logger.info("expression_latex_lhs:" + str(expression_latex_lhs))
                logger.info("expression_latex_rhs:" + str(expression_latex_rhs))
                # TODO: validate that this string is actually Latex before adding to database

                logger.info("expression_name_latex:" + str(expression_name_latex))
                logger.info(
                    "expression_description_latex" + str(expression_description_latex)
                )

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                expression_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    was_created = session.write_transaction(
                        neo4j_query.add_expression,
                        expression_id,
                        expression_name_latex,
                        expression_latex_lhs,
                        expression_relation,
                        expression_latex_rhs,
                        expression_latex_condition,
                        expression_description_latex,
                        expression_reference_latex,
                        now_str,
                        author_name_latex,
                    )
                if not was_created:
                    flash(
                        "pdg_app/to_add_expression: an expression with that LHS/relation/RHS already exists"
                    )
                    logger.error(
                        "pdg_app/to_add_expression: duplicate expression: "
                        + expression_latex_lhs
                        + " "
                        + expression_relation
                        + " "
                        + expression_latex_rhs
                    )
                    return redirect(url_for("to_add_expression"))
                logger.info("[TRACE] end " + trace_id)
                return redirect(
                    url_for(
                        "to_add_symbols_and_operations_for_expression",
                        expression_id=expression_id,
                    )
                )
            else:
                flash(
                    "pdg_app/to_add_expression: " + str(web_form_add_expression.errors)
                )
                logger.error(str(web_form_add_expression.errors))
                return redirect(url_for("to_add_expression"))
        else:
            flash("pdg_app/to_add_expression: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_add_expression"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/expression_create.html",
        title="Create Expression",
        query_time_dict=query_time_dict,
        form=web_form_add_expression,
        list_of_relations=list_of_relations,  # Used in expression_create.html
        list_of_expressions=list_of_expressions,  # Used in _table_of_expressions_mini.html which is referenced in expression_create.html
    )


@web_app.route("/new_feed", methods=["GET", "POST"])
@login_required
def to_add_feed() -> ResponseReturnValue:
    """
    novel feed
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_add_feed = SpecifyNewFeedForm()
    web_form_no_options = NoOptionsForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_add_feed " + trace_id
    ):

        list_of_feeds = session.read_transaction(neo4j_query.get_nodes_of_type, "feed")

        list_of_symbols = session.read_transaction(
            neo4j_query.get_nodes_of_type, "symbol"
        )

        dict_of_derivations_that_use_feed = session.read_transaction(
            neo4j_query.get_derivations_for_every_feed
        )

    # TODO: investigate the relevance of this
    sympy_as_latex_per_feed_id = compute.get_sympy_as_latex_per_feed_id(list_of_feeds)

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new multi-symbol or numeric" in request.form.keys():
            if web_form_add_feed.validate():
                feed_latex = str(web_form_add_feed.feed_latex.data).strip()
                logger.info("feed_latex:" + str(feed_latex))

                # TODO: validate that this string is actually Latex before adding to database

                # determine whether input is numeric
                try:
                    float(feed_latex)
                    is_numeric = True
                except ValueError:
                    is_numeric = False

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                feed_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.add_feed,
                        feed_id,
                        feed_latex,
                        now_str,
                        author_name_latex,
                    )

                logger.info("[TRACE] end " + trace_id)
                if is_numeric:
                    return redirect(url_for("to_list_feeds"))
                else:
                    return redirect(
                        url_for(
                            "to_add_symbols_and_operations_for_feed",
                            feed_id=feed_id,
                        )
                    )

            else:
                flash("pdg_app/to_add_feed: " + str(web_form_add_feed.errors))
                logger.error(str(web_form_add_feed.errors))
                return redirect(url_for("to_add_feed"))

        elif "promote existing" in request.form.keys():
            nominated_symbol_id = request.form["symbol_select_id_to_add"]
            logger.info("nominated_symbol_id=" + str(nominated_symbol_id))

            feed_id, query_time_dict = compute.generate_random_id(
                graphDB_Driver, query_time_dict
            )

            # as per https://strftime.org/
            # %f = Microsecond as a decimal number, zero-padded on the left.
            now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

            author_name_latex = compute.encode_user_identifier(current_user.email)

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                # get the symbol key-value pairs so we can later populate the feed

                symbol_dict = session.read_transaction(
                    neo4j_query.get_node_properties_from_id,
                    "symbol",
                    nominated_symbol_id,
                )

                logger.info("symbol_dict=" + str(symbol_dict))

                # use the symbol key-value pair to populate feed

                session.write_transaction(
                    neo4j_query.add_feed,
                    feed_id,
                    symbol_dict["latex"],
                    now_str,
                    author_name_latex,
                )

                symbol_as_sympy = "Symbol('pdg" + symbol_dict["id"] + "')"

                # use the symbol key-value pair to populate feed

                list_of_inference_rule_dicts = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "feed",
                    feed_id,
                    "sympy",
                    symbol_as_sympy,
                )

                symbol_as_lean = ""  # TODO; as of 2026-03-03 BHP isn't clear what this representation is supposed to be

                # use the symbol key-value pair to populate feed

                list_of_inference_rule_dicts = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "feed",
                    feed_id,
                    "lean",
                    symbol_as_lean,
                )

            return redirect(url_for("to_list_feeds"))

        else:
            flash(
                "pdg_app/to_add_feed: unrecognized form in POST: "
                + str(request.form.keys())
            )
            logger.error(str(request.form.keys()))
            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_add_feed"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/feed_create.html",
        title="Create Feed",
        query_time_dict=query_time_dict,
        form_new_feed=web_form_add_feed,
        form_no_options=web_form_no_options,
        list_of_symbols=list_of_symbols,  # feed_create.html (for the dropdown of promoting a symbol to feed)
        list_of_feeds=list_of_feeds,
        sympy_as_latex_per_feed_id=sympy_as_latex_per_feed_id,
        dict_of_derivations_that_use_feed=dict_of_derivations_that_use_feed,  # _table_of_feeds.html
    )


@web_app.route("/edit_node/<node_id>", methods=["GET", "POST"])
@login_required
def to_edit_node(node_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit any node -- actually redirect to respective subcategory

    >>> to_edit_node()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    dict_of_symbol_id_and_type, query_time_dict = (
        compute.get_dict_of_node_type_for_every_id(graphDB_Driver, query_time_dict)
    )
    logger.info("dict_of_symbol_id_and_type=" + str(dict_of_symbol_id_and_type))

    if dict_of_symbol_id_and_type[node_id] == "derivation":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_review_derivation", derivation_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "step":
        # which derivation is this step in?
        logger.info("node_id=" + str(node_id))
        with graphDB_Driver.session() as session, track_time(
            query_time_dict, "pdg_app/ " + trace_id
        ):

            derivation_id = session.read_transaction(
                neo4j_query.get_derivation_id_from_step_id, node_id
            )

        logger.info("[TRACE] end " + trace_id)
        return redirect(
            url_for("to_edit_step", derivation_id=derivation_id, step_id=node_id)
        )
    elif dict_of_symbol_id_and_type[node_id] == "inference_rule":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_inference_rule", inference_rule_id=node_id))

    elif dict_of_symbol_id_and_type[node_id] == "expression":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_expression", expression_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "feed":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_feed", feed_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "operation":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_operation", operation_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "relation":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_relation", relation_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "scalar":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_scalar", scalar_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "vector":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_vector", vector_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "matrix":
        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_edit_matrix", matrix_id=node_id))
    elif dict_of_symbol_id_and_type[node_id] == "value_with_units":
        logger.info("[TRACE] end " + trace_id)
        return redirect(
            url_for("to_edit_constant_value_and_units", value_with_units_id=node_id)
        )
    else:
        logger.error("shouldn't reach here")
        raise Exception("ERROR: shouldn't reach here 9942892424")

    raise Exception("ERROR: shouldn't reach here 01948138481")
    return


@web_app.route("/edit_operation/<operation_id>", methods=["GET", "POST"])
@login_required
def to_edit_operation(operation_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit operation
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    logger.info("operation_id: " + str(operation_id))

    web_form_edit_operation = SpecifyNewSymbolOperationForm()
    web_form_no_options = NoOptionsForm()

    # get properties of this operation
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        operation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "operation", operation_id
        )

        if operation_dict is None:
            flash(
                "pdg_app/to_edit_operation: operation ID "
                + str(operation_id)
                + " does not exist in database."
            )
            return redirect(url_for("to_list_operations"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_expressions_that_use_symbol, operation_id
        )

        #     + operation_id
        #     + " "

    logger.info("request.method =" + str(request.method))

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "add symbol to expr" in request.form:
            if web_form_edit_operation.validate():
                operation_latex = str(
                    web_form_edit_operation.operation_latex.data
                ).strip()
                operation_name_latex = str(
                    web_form_edit_operation.operation_name_latex.data
                ).strip()
                operation_description_latex = str(
                    web_form_edit_operation.operation_description_latex.data
                ).strip()
                operation_reference_latex = str(
                    web_form_edit_operation.operation_reference_latex.data
                ).strip()
                operation_number_of_arguments = int(
                    web_form_edit_operation.operation_argument_count.data
                )

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.add_operation_symbol,
                        operation_id,
                        operation_name_latex,
                        operation_latex,
                        operation_description_latex,
                        operation_reference_latex,
                        operation_number_of_arguments,
                        now_str,
                        author_name_latex,
                    )
                return redirect(url_for("to_list_operations"))
            else:
                flash(
                    "pdg_app/to_edit_operation: " + str(web_form_edit_operation.errors)
                )
                logger.error(str(web_form_edit_operation.errors))
                return redirect(url_for("to_edit_operation"))
        elif "remove symbol from expr" in request.form:
            # TODO
            flash("pdg_app/to_edit_operation: NOT YET ENACTED")
            logger.error("NOT YET ENACTED")
            return redirect(url_for("to_edit_operation"))
        else:
            flash("pdg_app/to_edit_operation: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_edit_operation"))

    # logger.info("operation_dict:", operation_dict)

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_operation_edit.html",
        title="Edit Operation",
        query_time_dict=query_time_dict,
        form_edit_operation=web_form_edit_operation,
        form_no_options=web_form_no_options,
        operation_dict=operation_dict,
        list_of_expressions=list_of_expressions,
    )


@web_app.route("/edit_relation/<relation_id>", methods=["GET", "POST"])
@login_required
def to_edit_relation(relation_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit relation
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    logger.info("relation_id: " + str(relation_id))

    web_form_no_options = NoOptionsForm()
    web_form_new_symbol = SpecifyNewSymbolRelationForm()

    # get properties of this relation
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        relation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "relation", relation_id
        )

        if relation_dict is None:
            flash(
                "pdg_app/to_edit_relation: Relation ID "
                + str(relation_id)
                + " does not exist in database."
            )
            return redirect(url_for("to_list_relations"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_expressions_that_use_symbol, relation_id
        )

    logger.info("request.method =" + str(request.method))
    logger.info("request.form = " + str(request.form))

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))
        if "edit relation" in request.form:
            if web_form_new_symbol.validate():
                relation_latex = str(web_form_new_symbol.relation_latex.data).strip()
                relation_name_latex = str(
                    web_form_new_symbol.relation_name_latex.data
                ).strip()
                relation_description_latex = str(
                    web_form_new_symbol.relation_description_latex.data
                ).strip()
                relation_reference_latex = str(
                    web_form_new_symbol.relation_reference_latex.data
                ).strip()

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

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

                return redirect(url_for("to_list_relations"))

            else:
                flash("pdg_app/to_edit_relation: " + str(web_form_new_symbol.errors))
                logger.error(str(web_form_new_symbol.errors))
                return redirect(url_for("to_edit_relation", relation_id=relation_id))
        else:
            flash("pdg_app/to_edit_relation: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_edit_relation", relation_id=relation_id))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_relation_edit.html",
        title="Edit Relation",
        query_time_dict=query_time_dict,
        form_new_symbol=web_form_new_symbol,
        form_no_options=web_form_no_options,
        relation_dict=relation_dict,
        list_of_expressions=list_of_expressions,
    )


@web_app.route("/edit_scalar/<scalar_id>", methods=["GET", "POST"])
@login_required
def to_edit_scalar(scalar_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit symbol:
    - change the Latex
    - change name
    - change description
    - change reference

    >>> to_edit_scalar()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    logger.info("scalar_id: " + str(scalar_id))

    web_form_symbol_properties = SpecifyNewSymbolScalarForm()
    web_form_no_options = NoOptionsForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", scalar_id
        )

        logger.info("scalar_dict:" + str(scalar_dict))

        if scalar_dict is None:
            flash(
                "pdg_app/to_edit_scalar: Scalar ID "
                + str(scalar_id)
                + " does not exist in database."
            )
            return redirect(url_for("to_list_scalars"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_expressions_that_use_symbol, scalar_id
        )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "edit scalar" in request.form:
            if web_form_symbol_properties.validate():
                symbol_latex = str(
                    web_form_symbol_properties.scalar_latex.data
                ).strip()  # .replace("\\","\\\\")
                symbol_name_latex = str(
                    web_form_symbol_properties.scalar_name_latex.data
                ).strip()
                symbol_description_latex = str(
                    web_form_symbol_properties.scalar_description_latex.data
                ).strip()
                symbol_reference_latex = str(
                    web_form_symbol_properties.scalar_reference_latex.data
                ).strip()

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # TODO: Neo4j inside loop causes high latency
                # instead of changing every property,
                # only change the properties that are different from symbol_dict
                for symbol_property, symbol_property_value in scalar_dict.items():

                    logger.info("symbol_property=" + str(symbol_property))
                    logger.info("symbol_property_value=" + str(symbol_property_value))

                    flash("pdg_app/to_edit_scalar: NOT ENACTED YET 942492482324")
                    logger.error("NOT ENACTED YET 942492482324")
                    # TODO: check which properties are different
                    with graphDB_Driver.session() as session, track_time(
                        query_time_dict, "pdg_app/ " + trace_id
                    ):

                        session.write_transaction(
                            neo4j_query.edit_node_property,
                            "scalar",  # Neo4j node type
                            scalar_id,
                            "dimension_length",  # property to edit
                            5,  # new value
                        )

                return redirect(url_for("to_edit_scalar", scalar_id=scalar_id))
            else:
                flash(
                    "pdg_app/to_edit_scalar: " + str(web_form_symbol_properties.errors)
                )
                logger.error(str(web_form_symbol_properties.errors))
        elif "delete scalar" in request.form:
            flash("pdg_app/to_edit_scalar: NOT YET ENACTED")
            # TODO: update the respective fields for this symbol

            # TODO: delete symbol

            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_list_scalars"))
        else:
            flash("pdg_app/to_edit_scalar: unrecognized button")
            logger.error("unrecognized button")

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_edit.html",
        title="Edit Scalar",
        query_time_dict=query_time_dict,
        form_symbol_properties=web_form_symbol_properties,
        form_no_options=web_form_no_options,
        scalar_dict=scalar_dict,
        list_of_expressions=list_of_expressions,
    )


@web_app.route("/edit_vector/<vector_id>", methods=["GET", "POST"])
@login_required
def to_edit_vector(vector_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit vector

    >>> to_edit_vector()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type
    logger.info("vector_id: " + str(vector_id))

    web_form_vector_properties = SpecifyNewSymbolVectorForm()
    web_form_no_options = NoOptionsForm()

    flash("pdg_app/to_edit_vector: NOT ENACTED YET 13942942392")
    logger.error("NOT ENACTED YET 13942942392")
    # TODO

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        vector_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "vector", vector_id
        )

        logger.info("vector_dict:" + str(vector_dict))

        if vector_dict is None:
            flash(
                "pdg_app/to_edit_vector: Vector ID "
                + str(vector_id)
                + " does not exist in database."
            )
            return redirect(url_for("to_list_vectors"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_expressions_that_use_symbol, vector_id
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_vector_edit.html",
        title="Edit Vector",
        query_time_dict=query_time_dict,
        form_vector_properties=web_form_vector_properties,
        form_no_options=web_form_no_options,
        vector_dict=vector_dict,
        list_of_expressions=list_of_expressions,
    )


@web_app.route("/edit_matrix/<matrix_id>", methods=["GET", "POST"])
@login_required
def to_edit_matrix(matrix_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    edit matrix

    >>> to_edit_matrix()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info("matrix_id: " + str(matrix_id))

    web_form_matrix_properties = SpecifyNewSymbolMatrixForm()
    web_form_no_options = NoOptionsForm()

    flash("pdg_app/to_edit_matrix: NOT ENACTED YET 94294111111")
    logger.error("NOT ENACTED YET 94294111111")
    # TODO

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        matrix_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "matrix", matrix_id
        )

        logger.info("matrix_dict:" + str(matrix_dict))

        if matrix_dict is None:
            flash(
                "pdg_app/to_edit_matrix: Matrix ID "
                + str(matrix_id)
                + " does not exist in database."
            )
            return redirect(url_for("to_list_matrices"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_expressions_that_use_symbol, matrix_id
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_matrix_edit.html",
        title="Edit Matrix",
        query_time_dict=query_time_dict,
        form_matrix_properties=web_form_matrix_properties,
        form_no_options=web_form_no_options,
        matrix_dict=matrix_dict,
        list_of_expressions=list_of_expressions,
    )


@web_app.route(
    "/new_symbol_scalar_constant_value_and_units/<scalar_id>/", methods=["GET", "POST"]
)
@login_required
def to_add_value_and_units(scalar_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_constant_properties = SpecifyNewConstantNumberForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_scalars = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )

        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", scalar_id
        )

        if scalar_dict is None:
            flash("pdg_app/to_add_value_and_units: scalar_id not found")
            return redirect(url_for("to_navigation"))

        dict_of_expressions_that_use_scalar = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        dict_of_derivations_that_use_scalar = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new value and dimension" in request.form:
            if web_form_constant_properties.validate():

                if web_form_constant_properties.number_decimal.data is None:
                    raise ValueError("undefined number_decimal")
                if web_form_constant_properties.number_power.data is None:
                    raise ValueError("undefined number_power")

                number_decimal = float(web_form_constant_properties.number_decimal.data)
                number_power = float(web_form_constant_properties.number_power.data)

                dict_of_units = {}  # type: Dict[str,str]
                if "mass_select_unit" in request.form.keys():
                    dict_of_units["dimension_mass_unit"] = request.form[
                        "mass_select_unit"
                    ]
                if "time_select_unit" in request.form.keys():
                    dict_of_units["dimension_time_unit"] = request.form[
                        "time_select_unit"
                    ]
                if "length_select_unit" in request.form.keys():
                    dict_of_units["dimension_length_unit"] = request.form[
                        "length_select_unit"
                    ]
                if "temperature_select_unit" in request.form.keys():
                    dict_of_units["dimension_temperature_unit"] = request.form[
                        "temperature_select_unit"
                    ]
                if "electric_charge_select_unit" in request.form.keys():
                    dict_of_units["dimension_electric_charge_unit"] = request.form[
                        "electric_charge_select_unit"
                    ]
                if "amount_of_substance_select_unit" in request.form.keys():
                    dict_of_units["dimension_amount_of_substance_unit"] = request.form[
                        "amount_of_substance_select_unit"
                    ]
                if "luminous_intensity_select_unit" in request.form.keys():
                    dict_of_units["dimension_luminous_intensity_unit"] = request.form[
                        "luminous_intensity_select_unit"
                    ]

                value_with_units_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.add_constant_value_with_units,
                        scalar_id,
                        value_with_units_id,
                        number_decimal,
                        number_power,
                        dict_of_units,
                        now_str,
                        author_name_latex,
                    )

                logger.info("[TRACE] end " + trace_id)
                return redirect(url_for("to_list_scalars"))

            else:
                flash(
                    "pdg_app/to_add_value_and_units: "
                    + str(web_form_constant_properties.errors)
                )
                logger.error(str(web_form_constant_properties.errors))
        else:
            flash("pdg_app/to_add_value_and_units: unrecognized button")
            logger.error("unrecognized button")

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_constant_values_create.html",
        title="Add Value and Units",
        query_time_dict=query_time_dict,
        form_constant_properties=web_form_constant_properties,
        scalar_dict=scalar_dict,
        dict_of_expressions_that_use_scalar=dict_of_expressions_that_use_scalar,
        dict_of_derivations_that_use_scalar=dict_of_derivations_that_use_scalar,
        list_of_scalars=list_of_scalars,
        list_of_dimension_mass_units=list_of_valid.dimension_mass_units,
        list_of_dimension_time_units=list_of_valid.dimension_time_units,
        list_of_dimension_length_units=list_of_valid.dimension_length_units,
        list_of_dimension_temperature_units=list_of_valid.dimension_temperature_units,
        list_of_dimension_electric_charge_units=list_of_valid.dimension_electric_charge_units,
        list_of_dimension_amount_of_substance_units=list_of_valid.dimension_amount_of_substance_units,
        list_of_dimension_luminous_intensity_units=list_of_valid.dimension_luminous_intensity_units,
    )


@web_app.route("/new_symbol_scalar", methods=["GET", "POST"])
@login_required
def to_add_symbol_scalar() -> ResponseReturnValue:
    """
    novel scalar symbol
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_scalar_properties = SpecifyNewSymbolScalarForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))
        if "new scalar" in request.form:
            if web_form_scalar_properties.validate():
                scalar_latex = str(web_form_scalar_properties.scalar_latex.data).strip()
                scalar_name_latex = str(
                    web_form_scalar_properties.scalar_name_latex.data
                ).strip()
                scalar_description_latex = str(
                    web_form_scalar_properties.scalar_description_latex.data
                ).strip()
                scalar_reference_latex = str(
                    web_form_scalar_properties.scalar_reference_latex.data
                ).strip()

                logger.info("scalar_latex:" + str(scalar_latex))
                logger.info("scalar_name_latex:" + str(scalar_name_latex))
                logger.info("scalar_description_latex" + str(scalar_description_latex))

                scalar_scope = web_form_scalar_properties.scalar_scope.data
                scalar_variable_or_constant = (
                    web_form_scalar_properties.scalar_variable_or_constant.data
                )
                scalar_domain = web_form_scalar_properties.scalar_domain.data
                dimension_length = web_form_scalar_properties.dimension_length.data
                dimension_time = web_form_scalar_properties.dimension_time.data
                dimension_mass = web_form_scalar_properties.dimension_mass.data
                dimension_temperature = (
                    web_form_scalar_properties.dimension_temperature.data
                )
                dimension_electric_charge = (
                    web_form_scalar_properties.dimension_electric_charge.data
                )
                dimension_amount_of_substance = (
                    web_form_scalar_properties.dimension_amount_of_substance.data
                )
                dimension_luminous_intensity = (
                    web_form_scalar_properties.dimension_luminous_intensity.data
                )

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                scalar_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

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

                if scalar_variable_or_constant == "constant":
                    return redirect(
                        url_for("to_add_value_and_units", scalar_id=scalar_id)
                    )
                return redirect(url_for("to_list_scalars"))

            else:
                flash(
                    "pdg_app/to_add_symbol_scalar: "
                    + str(web_form_scalar_properties.errors)
                )
                logger.error(str(web_form_scalar_properties.errors))

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_scalars = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )

        logger.info("list_of_scalars =" + str(list_of_scalars))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_scalar = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_scalar = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    # dict_of_derivations_that_use_scalar = {}  # type: Dict[str,list]
    # for (
    #     scalar_id,
    #     list_of_derivations,
    # ) in dict_of_derivations_that_use_scalar.items():
    #     list_of_derivation_names = []

    #     for this_derivation_dict in list_of_derivations:
    #         if this_derivation_dict["name_latex"] in list_of_derivation_names:
    #             pass
    #         else:
    #             list_of_derivation_names.append(this_derivation_dict)
    #     dict_of_derivations_that_use_scalar[scalar_id] = list_of_derivation_names
    # derivations_that_use_scalar = dict_of_derivations_that_use_scalar

    logger.info("[trace] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_create.html",
        title="Create Scalar",
        query_time_dict=query_time_dict,
        form_scalar_properties=web_form_scalar_properties,
        list_of_scalars=list_of_scalars,
        dict_of_expressions_that_use_scalar=dict_of_expressions_that_use_scalar,
        dict_of_derivations_that_use_scalar=dict_of_derivations_that_use_scalar,
    )


@web_app.route("/new_symbol_vector", methods=["GET", "POST"])
@login_required
def to_add_symbol_vector() -> ResponseReturnValue:
    """
    novel vector
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_vector_properties = SpecifyNewSymbolVectorForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_vectors = session.read_transaction(
            neo4j_query.get_nodes_of_type, "vector"
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_vector = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_vector = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new vector" in request.form:
            if web_form_vector_properties.validate():
                vector_latex = str(web_form_vector_properties.vector_latex.data).strip()
                vector_name_latex = str(
                    web_form_vector_properties.vector_name_latex.data
                ).strip()
                vector_description_latex = str(
                    web_form_vector_properties.vector_description_latex.data
                ).strip()
                vector_reference_latex = str(
                    web_form_vector_properties.vector_reference_latex.data
                ).strip()
                vector_is_composite = (
                    web_form_vector_properties.vector_is_composite.data
                )

                vector_size = str(web_form_vector_properties.vector_size.data).strip()
                vector_orientation = str(
                    web_form_vector_properties.vector_orientation.data
                ).strip()

                logger.info("vector_latex:" + str(vector_latex))
                logger.info("vector_name_latex:" + str(vector_name_latex))
                logger.info("vector_description_latex" + str(vector_description_latex))

                vector_number_of_entries = str(
                    web_form_vector_properties.vector_number_of_entries.data
                ).strip()

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                vector_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.add_vector_symbol,
                        vector_id,
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
                return redirect(url_for("to_list_vectors"))

            else:
                flash(
                    "pdg_app/to_add_symbol_vector: "
                    + str(web_form_vector_properties.errors)
                )
                logger.error(str(web_form_vector_properties.errors))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_vector_create.html",
        title="Create Vector",
        query_time_dict=query_time_dict,
        form_vector_properties=web_form_vector_properties,
        dict_of_expressions_that_use_vector=dict_of_expressions_that_use_vector,
        dict_of_derivations_that_use_vector=dict_of_derivations_that_use_vector,
        list_of_vectors=list_of_vectors,
    )


@web_app.route("/new_symbol_matrix", methods=["GET", "POST"])
@login_required
def to_add_symbol_matrix() -> ResponseReturnValue:
    """
    novel matrix
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_matrix_properties = SpecifyNewSymbolMatrixForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_matrices = session.read_transaction(
            neo4j_query.get_nodes_of_type, "matrix"
        )

        logger.info("list_of_matrices=" + str(list_of_matrices))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_matrix = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_matrix = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new matrix" in request.form:
            if web_form_matrix_properties.validate():
                matrix_latex = str(web_form_matrix_properties.matrix_latex.data).strip()
                matrix_name_latex = str(
                    web_form_matrix_properties.matrix_name_latex.data
                ).strip()
                matrix_description_latex = str(
                    web_form_matrix_properties.matrix_description_latex.data
                ).strip()
                matrix_reference_latex = str(
                    web_form_matrix_properties.matrix_reference_latex.data
                ).strip()

                matrix_is_composite = (
                    web_form_matrix_properties.matrix_is_composite.data
                )

                matrix_size = str(web_form_matrix_properties.matrix_size.data).strip()

                logger.info("matrix_latex:" + str(matrix_latex))
                logger.info("matrix_name_latex:" + str(matrix_name_latex))
                logger.info("matrix_description_latex" + str(matrix_description_latex))

                matrix_number_of_rows = str(
                    web_form_matrix_properties.matrix_number_of_rows.data
                ).strip()
                matrix_number_of_columns = str(
                    web_form_matrix_properties.matrix_number_of_columns.data
                ).strip()

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                matrix_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.add_matrix_symbol,
                        matrix_id,
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
                return redirect(url_for("to_list_matrices"))

            else:
                flash(
                    "pdg_app/to_add_symbol_matrix: "
                    + str(web_form_matrix_properties.errors)
                )
                logger.error(str(web_form_matrix_properties.errors))
        else:
            flash("pdg_app/to_add_symbol_matrix: unrecognized button")
            logger.error("unrecognized button")

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_matrix_create.html",
        title="Create Matrix",
        query_time_dict=query_time_dict,
        form_matrix_properties=web_form_matrix_properties,
        list_of_matrices=list_of_matrices,
        dict_of_expressions_that_use_matrix=dict_of_expressions_that_use_matrix,
        dict_of_derivations_that_use_matrix=dict_of_derivations_that_use_matrix,
    )


@web_app.route("/new_symbol", methods=["GET", "POST"])
def to_add_symbol() -> ResponseReturnValue:
    """
    novel symbol
    """
    return render_template(
        "jinja2_pages/user_workflow/symbol_create_pick_type.html",
        canonical_URL="new_symbol",
    )


@web_app.route("/new_operation", methods=["GET", "POST"])
@login_required
def to_add_operation() -> ResponseReturnValue:
    """
    novel operation
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_add_operation = SpecifyNewSymbolOperationForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new operation" in request.form:
            if web_form_add_operation.validate():

                operation_latex = str(
                    web_form_add_operation.operation_latex.data
                ).strip()
                operation_name_latex = str(
                    web_form_add_operation.operation_name_latex.data
                ).strip()
                operation_description_latex = str(
                    web_form_add_operation.operation_description_latex.data
                ).strip()
                operation_reference_latex = str(
                    web_form_add_operation.operation_reference_latex.data
                ).strip()
                operation_argument_count = int(
                    web_form_add_operation.operation_argument_count.data or -1
                )

                logger.info("operation_latex:" + str(operation_latex))
                logger.info("operation_name_latex:" + str(operation_name_latex))
                logger.info(
                    "operation_description_latex" + str(operation_description_latex)
                )
                logger.info("operation_argument_count" + str(operation_argument_count))

                author_name_latex = compute.encode_user_identifier(current_user.email)

                operation_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

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
                    logger.info("[TRACE] end " + trace_id)

                return redirect(url_for("to_list_operations"))
            else:
                flash("pdg_app/to_add_operation: " + str(web_form_add_operation.errors))
                logger.error(str(web_form_add_operation.errors))
                return redirect(url_for("to_add_operation"))

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_operations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "operation"
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_operation = session.read_transaction(
            neo4j_query.get_expressions_for_every_operation
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_operation = session.read_transaction(
            neo4j_query.get_derivations_for_every_operation
        )

    logger.info("[trace] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_operation_create.html",
        title="Create Operation",
        query_time_dict=query_time_dict,
        form_operation_properties=web_form_add_operation,
        list_of_operations=list_of_operations,
        dict_of_expressions_that_use_operation=dict_of_expressions_that_use_operation,
        dict_of_derivations_that_use_operation=dict_of_derivations_that_use_operation,
    )


@web_app.route("/new_relation", methods=["GET", "POST"])
@login_required
def to_add_relation() -> ResponseReturnValue:
    """
    novel relation
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_add_relation = SpecifyNewSymbolRelationForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))
        if "new relation" in request.form:
            if web_form_add_relation.validate():

                relation_latex = str(web_form_add_relation.relation_latex.data).strip()
                relation_name_latex = str(
                    web_form_add_relation.relation_name_latex.data
                ).strip()
                relation_description_latex = str(
                    web_form_add_relation.relation_description_latex.data
                ).strip()
                relation_reference_latex = str(
                    web_form_add_relation.relation_reference_latex.data
                ).strip()
                relation_argument_count = 2

                logger.info("relation_latex:" + str(relation_latex))
                logger.info("relation_name_latex:" + str(relation_name_latex))
                logger.info(
                    "relation_description_latex" + str(relation_description_latex)
                )
                logger.info("relation_argument_count" + str(relation_argument_count))

                author_name_latex = compute.encode_user_identifier(current_user.email)

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                relation_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

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
                logger.info("[trace] end " + trace_id)
                return redirect(url_for("to_list_relations"))

            else:
                flash("pdg_app/to_add_relation: " + str(web_form_add_relation.errors))
                logger.error(str(web_form_add_relation.errors))
                return redirect(url_for("to_add_relation"))

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_relations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "relation"
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_relation = session.read_transaction(
            neo4j_query.get_expressions_for_every_relation
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_relation = session.read_transaction(
            neo4j_query.get_derivations_for_every_relation
        )

    logger.info("[trace] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_relation_create.html",
        title="Create Relation",
        query_time_dict=query_time_dict,
        form_relation_properties=web_form_add_relation,
        list_of_relations=list_of_relations,
        dict_of_expressions_that_use_relation=dict_of_expressions_that_use_relation,
        dict_of_derivations_that_use_relation=dict_of_derivations_that_use_relation,
    )


@web_app.route(
    "/new_step_expressions/<derivation_id>/<inference_rule_id>", methods=["GET", "POST"]
)
def to_add_step_select_expressions(
    derivation_id: unique_numeric_id_as_str, inference_rule_id: unique_numeric_id_as_str
) -> ResponseReturnValue:
    """
    derivation_id is the numeric ID of the derivation being edited

    inference_rule_id is the numeric ID of the inference rule being used for this step

    here we assume all expressions already exist
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    logger.info("derivation_id:" + str(derivation_id))
    logger.info("inference_rule_id:" + str(inference_rule_id))

    web_form_new_step = SpecifyNewStepForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "new step" in request.form:
            if web_form_new_step.validate():

                note_before_step_latex = str(
                    web_form_new_step.note_before_step_latex.data
                ).strip()
                note_after_step_latex = str(
                    web_form_new_step.note_after_step_latex.data
                ).strip()

                # there's an arbitrary number of input, feed, and output expressions to add
                list_of_input_expression_IDs = []
                list_of_feed_expression_IDs = []
                list_of_output_expression_IDs = []
                for k, v in request.form.items():
                    logger.info("k=" + str(k) + "v=" + str(v))
                    if "input" in k:  # field name is what matters here
                        logger.info("input adding" + str(v))
                        list_of_input_expression_IDs.append(str(v))
                    if "feed" in k:  # field name is what matters here
                        logger.info("feed adding" + str(v))
                        list_of_feed_expression_IDs.append(str(v))
                    if "output" in k:  # field name is what matters here
                        logger.info("out adding" + str(v))
                        list_of_output_expression_IDs.append(str(v))

                author_name_latex = compute.encode_user_identifier(current_user.email)

                step_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )
                logger.info("generated step_id=" + str(step_id))

                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                try:
                    assert (
                        (len(list_of_input_expression_IDs) > 0)
                        or (len(list_of_feed_expression_IDs) > 0)
                        or (len(list_of_output_expression_IDs) > 0)
                    )
                except AssertionError as err:
                    flash("pdg_app/to_add_step_select_expressions: " + str(err))
                    logger.error(str(err))
                    return redirect(
                        url_for(
                            "to_add_step_select_expressions",
                            derivation_id=derivation_id,
                            inference_rule_id=inference_rule_id,
                        )
                    )

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    step_result = session.write_transaction(
                        neo4j_query.connect_step_to_derivation,
                        step_id,
                        derivation_id,
                        inference_rule_id,
                        None,
                        now_str,
                        note_before_step_latex,
                        note_after_step_latex,
                        author_name_latex,
                    )
                    if step_result is None:
                        flash(
                            "pdg_app/to_add_step_select_expressions: derivation or inference rule no longer exists"
                        )
                        logger.error(
                            "pdg_app/to_add_step_select_expressions: connect_step_to_derivation found missing derivation_id or inference_rule_id"
                        )
                        return redirect(
                            url_for(
                                "to_add_step_select_expressions",
                                derivation_id=derivation_id,
                                inference_rule_id=inference_rule_id,
                            )
                        )
                    session.write_transaction(
                        neo4j_query.connect_expressions_to_step,
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

            else:
                flash(
                    "pdg_app/to_add_step_select_expressions: "
                    + str(web_form_new_step.errors)
                )
                logger.error(str(web_form_new_step.errors))
                return redirect(url_for("to_add_step_select_expressions"))

    # get list of expressions
    list_of_expressions = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )

        logger.info("list_of_expressions= " + str(list_of_expressions))

        list_of_feeds = session.read_transaction(
            neo4j_query.get_feeds_not_connected_to_any_step
        )

        # list_of_feeds = session.read_transaction(neo4j_query.get_nodes_of_type, "feed")

    logger.info("list_of_feeds=" + str(list_of_feeds))

    list_of_expression_IDs = []
    for expression_dict in list_of_expressions:
        list_of_expression_IDs.append(expression_dict["id"])

    list_of_feed_IDs = []
    for feed_dict in list_of_feeds:
        list_of_feed_IDs.append(feed_dict["id"])

    dict_of_expression_dicts = {}
    for expression_dict in list_of_expressions:
        dict_of_expression_dicts[expression_dict["id"]] = expression_dict

    dict_of_feed_dicts = {}
    for feed_dict in list_of_feeds:
        dict_of_feed_dicts[feed_dict["id"]] = feed_dict

    # get properties for derivation
    derivation_dict = {}
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

        if derivation_dict is None:
            flash("pdg_app/to_add_step_select_expressions: derivation_id not found")
            return redirect(url_for("to_list_derivations"))

        logger.info("derivation_dict is " + str(derivation_dict))

        # inference_rule_dict = {}
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        inference_rule_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "inference_rule", inference_rule_id
        )

        if inference_rule_dict is None:
            flash("pdg_app/to_add_step_select_expressions: inference_rule_id not found")
            return redirect(url_for("to_list_inference_rules"))

    logger.info("inference_rule_dict is " + str(inference_rule_dict))

    canonical_URL = (
        "new_step_expressions/" + str(derivation_id) + "/" + str(inference_rule_id)
    )
    # first visit to this page
    logger.info("[trace] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/new_step_select_expressions_for_inference_rule.html",
        title="Add Step: Select Expressions",
        canonical_URL=canonical_URL,
        query_time_dict=query_time_dict,
        form_new_step=web_form_new_step,
        list_of_expression_IDs=list_of_expression_IDs,
        list_of_feed_IDs=list_of_feed_IDs,
        dict_of_expression_dicts=dict_of_expression_dicts,
        dict_of_feed_dicts=dict_of_feed_dicts,
        inference_rule_dict=inference_rule_dict,
        derivation_dict=derivation_dict,
    )


@web_app.route(
    "/symbols_and_operations_for_expression/<expression_id>",
    methods=["GET", "POST"],
)
def to_add_symbols_and_operations_for_expression(
    expression_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    r"""
    expression_id is the numeric ID of the expression

    This action comes immediately after the Latex expression is provided.

    Although Latex-to-SymPy could be performed after the Latex is provided,
    sometimes the symbols used in the latex inhibit conversion to Latex.
    For example,
    r_{\rm Earth} = 6
    """

    # the "r" prepended to the docstring to make a raw string. This tells Python
    # to treat backslashes as literal characters and prevents \r from being parsed as a carriage return by Sphinx

    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_no_options = NoOptionsForm()

    # TODO:
    # query_time_dict, derivations_per_symbol = compute.derivations_per_symbol(potential_symbols_found_in_Latex_expression)
    derivation_per_symbol_id = {}

    # The checkboxes are determined dynamically,
    # so I don't see how a class-based form could be used.
    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        # there are four possible choices for the user:
        # - no symbols were matched (see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/67)
        #   - and the user wants to continue to SymPy and Lean anyways
        #   - and the user wants to skip entering SymPy and Lean
        # - there were symbols matched
        #   - and the user wants to enter SymPy and Lean
        #   - and the user wants to skip entering SymPy and Lean (see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/68)
        if request.form["submit_button"] == "continue to SymPy and Lean input anyways":
            return redirect(
                url_for(
                    "to_add_sympy_and_lean_for_expression",
                    expression_id=expression_id,
                )
            )
        elif (
            request.form["submit_button"]
            == "continue anyways; also skip SymPy and Lean"
        ):
            return redirect(url_for("to_list_expressions", _anchor=f"{expression_id}"))
        elif (
            request.form["submit_button"]
            == "update expression and enter SymPy and Lean"
        ):
            next_page_enter_SymPy_and_Lean = True
        elif (
            request.form["submit_button"]
            == "update expression; skip entering SymPy and Lean"
        ):
            next_page_enter_SymPy_and_Lean = False

        else:
            raise Exception(
                "Unrecognized value string from button on https://localhost/symbols_and_operations_for_expression/<expression_id>"
            )

        list_of_symbol_IDs_in_expression = []  # type: List[str]

        with graphDB_Driver.session() as session, track_time(
            query_time_dict, "pdg_app/ " + trace_id
        ):
            for ke, symbol_id in request.form.items():
                if "symbol_id_to_connect_to_expression" in ke:

                    _ = session.write_transaction(
                        neo4j_query.connect_symbol_to_expression,
                        symbol_id,
                        expression_id,
                    )

        if next_page_enter_SymPy_and_Lean:
            logger.info("[TRACE] end " + trace_id)
            return redirect(
                url_for(
                    "to_add_sympy_and_lean_for_expression",
                    expression_id=expression_id,
                )
            )
        else:
            logger.info("[TRACE] end " + trace_id)
            return redirect(url_for("to_list_expressions", _anchor=f"{expression_id}"))

    # get the Latex for this expression_id
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )

        logger.info("expression_dict=" + str(expression_dict))

    if expression_dict is None:
        flash(
            "pdg_app/to_add_symbols_and_operations_for_expression: expression_id not found"
        )
        return redirect(url_for("to_list_expressions"))

    query_time_dict, potential_symbols_found_in_Latex_expression = (
        compute.guess_symbols_from_latex(
            graphDB_Driver, query_time_dict, expression_dict
        )
    )

    query_time_dict, potential_operations_found_in_Latex_expression = (
        compute.guess_operations_from_latex(
            graphDB_Driver, query_time_dict, expression_dict
        )
    )

    canonical_URL = "symbols_and_operations_for_expression/" + str(expression_id)
    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/expression_create_symbols_and_operations.html",
        title="Create Expression: Add Symbols",
        canonical_URL=canonical_URL,
        query_time_dict=query_time_dict,
        form_no_options=web_form_no_options,
        expression_dict=expression_dict,
        derivation_per_symbol_id=derivation_per_symbol_id,
        potential_symbols_found_in_Latex_expression=potential_symbols_found_in_Latex_expression,
    )


@web_app.route(
    "/sympy_and_lean_for_expression/<expression_id>",
    methods=["GET", "POST"],
)
def to_add_sympy_and_lean_for_expression(
    expression_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """
    add sympy and lean for expression_id
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_new_expression_sympy = SpecifyNewExpressionSympyLeanForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        sympy_str_lhs = str(web_form_new_expression_sympy.sympy_str_lhs.data).strip()
        sympy_str_rhs = str(web_form_new_expression_sympy.sympy_str_rhs.data).strip()
        lean_str = str(web_form_new_expression_sympy.lean_str.data).strip()

        logger.info("submitted sympy_str_lhs = " + str(sympy_str_lhs))
        logger.info("submitted sympy_str_rhs = " + str(sympy_str_rhs))

        # if expression_dict["latex_relation"] == "=":
        #     sympy_str_combined = "Eq(" + sympy_str_lhs + "," + sympy_str_rhs + ")"
        # else:
        #     logger.info(str(expression_dict["latex_relation"]))
        #     raise Exception("to_add_sympy_and_lean_for_expression: unknown relation")

        try:
            # CAVEAT: sympy_str must use single quotes (') since neo4j query uses (")
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                list_of_inference_rule_dicts = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "expression",
                    expression_id,
                    "sympy_lhs",
                    sympy_str_lhs,
                )

                # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

                list_of_inference_rule_dicts = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "expression",
                    expression_id,
                    "sympy_rhs",
                    sympy_str_rhs,
                )

                # # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

                # list_of_inference_rule_dicts = session.write_transaction(
                #     neo4j_query.edit_node_property,
                #     "expression",
                #     expression_id,
                #     "sympy",  # BUG
                #     sympy_str_combined,

                # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

                list_of_inference_rule_dicts = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "expression",
                    expression_id,
                    "lean",
                    lean_str,
                )

        except neo4j.exceptions.CypherSyntaxError as err:
            flash("pdg_app/to_add_sympy_and_lean_for_expression ERROR: " + str(err))
            logger.error(str(err))
            return redirect(
                url_for(
                    "to_add_sympy_and_lean_for_expression",
                    expression_id=expression_id,
                )
            )

        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_list_expressions"))

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )

    if expression_dict is None:
        flash("pdg_app/to_add_sympy_and_lean_for_expression: expression_id not found")
        return redirect(url_for("to_list_expressions"))

    logger.info("expression_dict=" + str(expression_dict))

    # TODO
    query_time_dict, revised_expr_lhs, revised_expr_rhs = (
        compute.guess_sympy_from_expression(
            graphDB_Driver, query_time_dict, expression_dict
        )
    )

    # set the default text
    # web_form_new_expression_sympy.sympy_str_lhs.data = revised_expr_lhs_with_str
    # web_form_new_expression_sympy.sympy_str_rhs.data = revised_expr_rhs_with_str

    symbol_id_dict = {"latex symbol": "symbol ID"}

    canonical_URL = "sympy_and_lean_for_expression/" + str(expression_id)
    return render_template(
        "jinja2_pages/user_workflow/expression_create_sympy_and_lean.html",
        title="Create SymPy and Lean for new expression",
        canonical_URL=canonical_URL,
        query_time_dict=query_time_dict,
        # sympy_expr_lhs=sympy_expr_lhs,
        # sympy_expr_rhs=sympy_expr_rhs,
        revised_expr_lhs=revised_expr_lhs,
        revised_expr_rhs=revised_expr_rhs,
        symbol_id_dict=symbol_id_dict,
        form_new_expression_sympy=web_form_new_expression_sympy,
        expression_dict=expression_dict,
    )


@web_app.route(
    "/symbols_and_operations_for_feed/<feed_id>",
    methods=["GET", "POST"],
)
def to_add_symbols_and_operations_for_feed(
    feed_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    r"""
    feed_id is the numeric ID of the expression

    This step comes immediately after the Latex expression is provided.

    Although Latex-to-SymPy could be performed after the Latex is provided,
    sometimes the symbols used in the latex inhibit conversion to Latex.
    For example,
    r_{\rm Earth} = 6
    """

    # the "r" prepended to the docstring to make a raw string. This tells Python
    # to treat backslashes as literal characters and prevents \r from being parsed as a carriage return by Sphinx

    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_no_options = NoOptionsForm()
    web_form_new_feed = SpecifyNewFeedForm()

    # get the Latex for this expression_id
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        feed_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "feed", feed_id
        )

        logger.info("symbols_and_operations_for_feed: feed_dict=" + str(feed_dict))

        if feed_dict is None:
            flash("pdg_app/to_add_symbols_and_operations_for_feed: feed_id not found")
            return redirect(url_for("to_list_feeds"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "symbol"
        )

    # list_of_symbol_dicts, query_time_dict = compute.get_list_of_all_symbol_dicts(
    #     graphDB_Driver, query_time_dict
    # )
    # logger.info(
    #     "symbols_and_operations_for_feed: list_of_symbols" + str(list_of_symbol_dicts)
    # )

    # The naive option would be to return to the user the complete list of
    # symbols and then ask the user to select relevant symbols.
    #
    # There are multiple tactics to enact that are more clever:
    #   * given a Latex expression, use SymPy to identify possible symbols.
    #   and, separately
    #   * given a Latex expression, and given all existing symbols, return a list of matching symbols
    #
    # The first tactic is likely to result in an undercount,
    # the second tactic will result in an overcount.
    #
    # I'll use keyword SYMBOL_SEARCH_SYMPY for the first tactic and
    #  SYMBOL_SEARCH_LATEX for the second tactic.
    # Order doesn't matter for the two tactics since they are independent.

    # SYMBOL_SEARCH_SYMPY
    cleaned_latex_str = compute.remove_latex_presention_markings(feed_dict["latex"])
    logger.info("cleaned_latex_str=" + str(cleaned_latex_str))
    sympy_expr = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
        cleaned_latex_str
    )
    logger.info("sympy_expr=" + str(sympy_expr))

    list_of_sympy_symbols_from_expr = (
        latex_and_sympy.list_of_sympy_symbols_in_sympy_expression(sympy_expr)
    )

    # TODO: this is missing relation operators like "="
    logger.info(
        "list_of_sympy_symbols_from_expr=" + str(list_of_sympy_symbols_from_expr)
    )

    # do any of the list_of_sympy_symbols_from_expr
    # show up in list_of_symbol_dicts?
    list_of_potential_matching_symbols_from_sympy = []
    for this_symbol_dict in list_of_symbol_dicts:
        logger.info("this_symbol_dict=" + str(this_symbol_dict))
        for this_symbol_from_sympy in list_of_sympy_symbols_from_expr:
            logger.info(str(this_symbol_from_sympy))
            if this_symbol_dict["latex"] == str(this_symbol_from_sympy):
                list_of_potential_matching_symbols_from_sympy.append(
                    this_symbol_dict["id"]
                )
    logger.info(
        "list_of_potential_matching_symbols_from_sympy="
        + str(list_of_potential_matching_symbols_from_sympy)
    )

    # SYMBOL_SEARCH_LATEX
    # given a Latex expression, and given all existing symbols,
    # sort existing symbol_latex by length,
    # then search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"
    # TODO: matching the symbol "a" just because the Latex string contains "\frac" is a false positive.

    list_of_symbol_latex = []  # type: List[str]
    dict_of_symbol_dicts = {}
    for this_symbol_dict in list_of_symbol_dicts:
        dict_of_symbol_dicts[this_symbol_dict["id"]] = this_symbol_dict
        # list_of_symbol_latex.append(this_symbol_dict["latex"])

    # https://stackoverflow.com/a/2587419/1164295
    # list_of_symbol_latex.sort(key=len)

    # # https://stackoverflow.com/a/73050/1164295
    # list_of_symbol_dicts_sorted_by_latex = sorted(
    #     list_of_symbol_dicts, key=lambda d: d["latex"]
    # )

    # logger.info("list_of_symbol_dicts_sorted_by_latex=", list_of_symbol_dicts_sorted_by_latex)

    # SYMBOL_SEARCH_LATEX, continued
    # TODO: search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"

    potential_symbols_found_in_Latex_feed = []  # type: List[str]

    for this_symbol_dict in list_of_symbol_dicts:
        if this_symbol_dict["latex"] in feed_dict["latex"]:
            potential_symbols_found_in_Latex_feed.append(this_symbol_dict)

    # The checkboxes are determined dynamically,
    # so I don't see how a class-based form could be used.
    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        list_of_symbol_IDs_in_expression = []  # type: List[str]

        with graphDB_Driver.session() as session, track_time(
            query_time_dict, "pdg_app/ " + trace_id
        ):
            for ke, symbol_id in request.form.items():
                # logger.info("key=", ke)
                # logger.info("value=", val)
                if "symbol_id_to_connect_to_expression" in ke:

                    list_of_inference_rule_dicts = session.write_transaction(
                        neo4j_query.connect_symbol_to_feed,
                        symbol_id,
                        feed_id,
                    )

        logger.info("[trace] end " + trace_id)
        return redirect(
            url_for(
                "to_add_sympy_and_lean_for_feed",
                feed_id=feed_id,
            )
        )

    logger.info("[TRACE] end " + trace_id)

    canonical_URL = "symbols_and_operations_for_feed/" + str(feed_id)
    return render_template(
        "jinja2_pages/user_workflow/feed_create_symbols_and_operations.html",
        title="Create Feed: Add Symbols",
        canonical_URL=canonical_URL,
        query_time_dict=query_time_dict,
        form_no_options=web_form_no_options,
        form_new_feed=web_form_new_feed,
        feed_dict=feed_dict,
        list_of_potential_matching_symbols_from_sympy=list_of_potential_matching_symbols_from_sympy,
        potential_symbols_found_in_Latex_feed=potential_symbols_found_in_Latex_feed,
        list_of_symbol_dicts=list_of_symbol_dicts,
    )


@web_app.route(
    "/sympy_and_latex_for_feed/<feed_id>",
    methods=["GET", "POST"],
)
def to_add_sympy_and_lean_for_feed(
    feed_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """
    derivation_id is the numeric ID of the derivation being edited
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_new_feed_sympy = SpecifyNewFeedSympyLeanForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        feed_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "feed", feed_id
        )

    if feed_dict is None:
        flash("pdg_app/to_add_sympy_and_lean_for_feed: feed_id not found")
        return redirect(url_for("to_list_feeds"))

    logger.info("feed_dict=" + str(feed_dict))

    # provide a guess for the SymPy based on the Latex provided

    cleaned_latex_str = compute.remove_latex_presention_markings(feed_dict["latex"])
    logger.info("cleaned_latex_str=" + str(cleaned_latex_str))
    sympy_expr = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
        cleaned_latex_str
    )
    logger.info("sympy_expr=" + str(sympy_expr))

    # TODO: rewrite
    symbol_id_dict = {"latex symbol": "symbol ID"}
    revised_expr = sympy_validate_expression.convert_sympy_expr_to_pdg_symbols(
        sympy_expr, symbol_id_dict
    )

    logger.info("revised_expr=" + str(revised_expr))

    revised_feed_with_str = re.sub(
        r"(pdg\d\d\d\d\d\d\d)", r"Symbol('\1')", str(revised_expr)
    )

    # revised_feed_with_str = re.sub(r"^Eq", "sympy.Eq", revised_feed_with_str)

    logger.info("revised_feed_with_str=" + str(revised_feed_with_str))

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        sympy_str = str(web_form_new_feed_sympy.sympy_str.data).strip()
        lean_str = str(web_form_new_feed_sympy.lean_str.data).strip()

        logger.info("submitted sympy_str=" + str(sympy_str))

        try:
            # CAVEAT: sympy_str must use single quotes (') since neo4j query uses (")
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                _ = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "feed",
                    feed_id,
                    "sympy",
                    sympy_str,
                )

                # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

                _ = session.write_transaction(
                    neo4j_query.edit_node_property,
                    "feed",
                    feed_id,
                    "lean",
                    lean_str,
                )

        except neo4j.exceptions.CypherSyntaxError as err:
            flash("pdg_app/to_add_sympy_and_lean_for_feed ERROR:" + str(err))
            logger.error(str(err))
            logger.info("[TRACE] end " + trace_id)
            return redirect(
                url_for(
                    "to_add_symbols_and_operations_for_feed",
                    feed_id=feed_id,
                )
            )

        logger.info("[TRACE] end " + trace_id)
        return redirect(url_for("to_list_feeds"))

    web_form_new_feed_sympy.sympy_str.data = revised_feed_with_str
    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/feed_create_sympy_and_lean.html",
        title="Create Feed: Add SymPy and Lean",
        query_time_dict=query_time_dict,
        sympy_expr=sympy_expr,
        revised_expr=revised_expr,
        revised_feed_with_str=revised_feed_with_str,
        symbol_id_dict=symbol_id_dict,
        form_new_feed_sympy=web_form_new_feed_sympy,
        feed_dict=feed_dict,
    )


@web_app.route("/new_inference_rule", methods=["GET", "POST"])
@login_required
def to_add_inference_rule() -> ResponseReturnValue:
    """
    create inference rule
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_new_infrule = SpecifyNewInferenceRuleForm()

    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )

    dict_of_derivations_used_per_inference_rule, query_time_dict = (
        compute.get_dict_of_derivations_used_per_inference_rule(
            graphDB_Driver, query_time_dict, list_of_inference_rule_dicts
        )
    )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form=" + str(request.form))

        if "new infrule" in request.form:

            if web_form_new_infrule.validate():
                logger.info("request.form = " + str(request.form))

                inference_rule_name = str(
                    web_form_new_infrule.inference_rule_name.data
                ).strip()
                logger.info("inference_rule_name: " + str(inference_rule_name))

                inference_rule_latex = str(
                    web_form_new_infrule.inference_rule_latex.data
                ).strip()
                number_of_inputs = int(
                    str(
                        web_form_new_infrule.inference_rule_number_of_inputs.data
                    ).strip()
                )
                number_of_feeds = int(
                    str(
                        web_form_new_infrule.inference_rule_number_of_feeds.data
                    ).strip()
                )
                number_of_outputs = int(
                    str(
                        web_form_new_infrule.inference_rule_number_of_outputs.data
                    ).strip()
                )
                author_name_latex = compute.encode_user_identifier(current_user.email)

                infrule_exists, message, query_time_dict = (
                    compute.check_whether_inference_rule_exists(
                        graphDB_Driver,
                        query_time_dict,
                        inference_rule_name,
                        inference_rule_latex,
                    )
                )
                if infrule_exists:
                    flash("pdg_app/to_add_inference_rule: " + message)
                    return redirect(url_for("to_add_inference_rule"))

                logger.info("status: No conflicting name or latex detected")

                inference_rule_id, query_time_dict = compute.generate_random_id(
                    graphDB_Driver, query_time_dict
                )
                logger.info("new inference_rule_id: " + str(inference_rule_id))

                try:
                    assert (
                        (int(number_of_inputs) > 0)
                        or (int(number_of_feeds) > 0)
                        or (int(number_of_outputs) > 0)
                    )
                    assert int(number_of_inputs) >= 0
                    assert int(number_of_feeds) >= 0
                    assert int(number_of_outputs) >= 0
                except AssertionError as err:
                    # TODO: getting assertion error wipes whatever the user provided. That's bad.
                    flash(
                        "pdg_app/to_add_inference_rule Assertion error regarding number of inputs,feeds,outputs; try again. "
                        + str(err)
                    )
                    logger.error(str(err))
                    return redirect(url_for("to_add_inference_rule"))

                # as per https://strftime.org/
                # %f = Microsecond as a decimal number, zero-padded on the left.
                now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):
                    was_created = session.write_transaction(
                        neo4j_query.add_inference_rule,
                        inference_rule_id=inference_rule_id,
                        inference_rule_name=inference_rule_name,
                        inference_rule_latex=inference_rule_latex,
                        number_of_inputs=number_of_inputs,
                        number_of_feeds=number_of_feeds,
                        number_of_outputs=number_of_outputs,
                        now_str=now_str,
                        author_name_latex=author_name_latex,
                    )
                if not was_created:
                    flash(
                        "pdg_app/to_add_inference_rule: an inference rule with that name already exists"
                    )
                    logger.error(
                        "pdg_app/to_add_inference_rule: duplicate inference rule name: "
                        + inference_rule_name
                    )
                    return redirect(url_for("to_add_inference_rule"))
                logger.info("[TRACE] end " + trace_id)
                return redirect(url_for("to_list_inference_rules"))
            else:
                flash(
                    "pdg_app/to_add_inference_rule: " + str(web_form_new_infrule.errors)
                )
                logger.error(str(web_form_new_infrule.errors))
        else:
            flash("pdg_app/to_add_inference_rule: unrecognized button")
            logger.error("unrecognized button")

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/inference_rule_create.html",
        title="Create Inference Rule",
        query_time_dict=query_time_dict,
        form=web_form_new_infrule,
        list_of_inference_rule_dicts=list_of_inference_rule_dicts,
        dict_of_derivations_used_per_inference_rule=dict_of_derivations_used_per_inference_rule,
    )


@web_app.route("/edit_step/<derivation_id>/<step_id>", methods=["GET", "POST"])
@login_required
def to_edit_step(
    derivation_id: unique_numeric_id_as_str, step_id: unique_numeric_id_as_str
) -> ResponseReturnValue:
    """
    to figure out which feeds could be swapped in I was
    - determining which feeds were not used
    - getting expressions used by this step
    - matching latex strings between feeds and expressions
    However, an easier search is "feeds not connected to steps"

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    web_form_edit_step = SpecifyNewStepForm()
    web_form_swap_input_expressions = NoOptionsForm()
    web_form_swap_feeds = NoOptionsForm()
    web_form_swap_output_expressions = NoOptionsForm()
    web_form_swap_input_indices = NoOptionsForm()
    web_form_swap_feed_indices = NoOptionsForm()
    web_form_swap_output_indices = NoOptionsForm()
    web_form_delete = NoOptionsForm()
    web_form_swap_index = NoOptionsForm()

    # TODO: Verify that derivation_id exists
    # TODO: verify that step_id exists
    # TODO: verify that step_id is associated with Derivation_id

    # I could just retrieve the specific step, but getting all the steps
    # allows me to also figure out the sequence numbers that are in use.
    # list all steps in this derivation
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )

        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "derivation", derivation_id
        )

    if derivation_dict is None:
        flash("pdg_app/to_edit_step: derivation_id not found")
        return redirect(url_for("to_list_derivations"))

    # this loop does two things:
    #  - gets the relevant step_dict that matches the user-provided ID
    #  and
    #  - gets the list of sequence indicies

    step_dict = None

    list_of_sequence_values = []  # type: List[str]
    for each_step_dict in list_of_step_dicts:
        list_of_sequence_values.append(each_step_dict["sequence_index"])
        if each_step_dict["id"] == step_id:
            step_dict = each_step_dict
            # break

    if step_dict is None:
        flash("pdg_app/to_edit_step: step not found")
        return redirect(url_for("to_review_derivation", derivation_id=derivation_id))

    list_of_sequence_values.sort()
    logger.info("step_dict=" + str(step_dict))
    logger.info("list_of_sequence_values= " + str(list_of_sequence_values))

    sequence_swap_list = compute.get_placement_options(
        list_of_sequence_values, step_dict["sequence_index"]
    )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info("request.form = " + str(request.form))

        if "replace input expression" in request.form:
            logger.info("replacing input expr in step " + step_id)

            old_input_id = request.form["input_expression_used_field_name"]
            new_input_id = request.form["input_expression_replacement_field_name"]

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.edit_step_input,
                    step_id,
                    old_input_id,
                    new_input_id,
                )

            return redirect(
                url_for("to_review_derivation", derivation_id=derivation_id)
            )

        elif "replace output expression" in request.form:
            logger.info("replacing output expr in step " + step_id)

            old_output_id = request.form["output_expression_used_field_name"]
            new_output_id = request.form["output_expression_replacement_field_name"]

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.edit_step_output,
                    step_id,
                    old_output_id,
                    new_output_id,
                )

            return redirect(
                url_for("to_review_derivation", derivation_id=derivation_id)
            )

        elif "replace feed" in request.form:
            logger.info("replacing feed in step " + step_id)

            old_feed_id = request.form["feed_used_field_name"]
            new_feed_id = request.form["feed_replacement_field_name"]

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.edit_step_feed,
                    step_id,
                    old_feed_id,
                    new_feed_id,
                )

            return redirect(
                url_for("to_review_derivation", derivation_id=derivation_id)
            )
            # return redirect(
            #     url_for("to_edit_step", derivation_id=derivation_id, step_id=step_id)

        elif "reorder indices of step" in request.form:
            logger.info("reorder indices for " + step_id)

            option_index = request.form["sequence_field_name"]
            logger.info("option_index=" + str(option_index))

            option_int = int(option_index)

            # Find where the element currently is
            current_idx = list_of_sequence_values.index(step_dict["sequence_index"])

            # Create a list without the selected element
            # (Matches the 'others' list logic from the previous step)
            new_list = [
                x for i, x in enumerate(list_of_sequence_values) if i != current_idx
            ]

            # Calculate the target insertion index
            # If the user picked an option that appeared BEFORE the original spot,
            # the index matches. If they picked an option AFTER, we add 1
            # to account for the slot we skipped in the dropdown.
            if option_int < current_idx:
                target_idx = option_int
            else:
                target_idx = option_int + 1

            # Insert the element at the new position
            new_list.insert(target_idx, step_dict["sequence_index"])

            logger.info("new_list=" + str(new_list))

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):
                for index, old_value in enumerate(list_of_sequence_values):
                    if new_list[index] != old_value:
                        session.write_transaction(
                            neo4j_query.edit_step_sequence_index,
                            derivation_id,
                            step_dict["id"],
                            new_list[index],
                        )

                        return redirect(
                            url_for("to_review_derivation", derivation_id=derivation_id)
                        )

        elif "reorder indices of input expressions" in request.form:
            logger.info("reorder indices of input expressions")
            option_index = request.form["sequence_field_name"]

        elif "reorder indices of feeds" in request.form:
            logger.info("reorder indices of feeds")
        elif "reorder indices of output expressions" in request.form:
            logger.info("reorder indices of output expressions")

        elif "edit" in request.form:
            if web_form_edit_step.validate():
                logger.info("editing step " + step_id)
                note_before_step_latex = str(
                    web_form_edit_step.note_before_step_latex.data
                ).strip()
                note_after_step_latex = str(
                    web_form_edit_step.note_after_step_latex.data
                ).strip()

                logger.info("note_before_step_latex " + str(note_before_step_latex))
                logger.info("note_after_step_latex " + str(note_after_step_latex))

                # TODO: deprecate this "edit_step_notes" and replace with edit_node_properties
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.edit_step_notes,
                        step_id,
                        note_before_step_latex,
                        note_after_step_latex,
                    )

            else:
                flash("pdg_app/to_edit_step: " + str(web_form_edit_step.errors))
                logger.error(str(web_form_edit_step.errors))

            return redirect(
                url_for("to_edit_step", derivation_id=derivation_id, step_id=step_id)
            )

        elif "delete" in request.form:
            logger.info("deleting step " + step_id)

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(neo4j_query.delete_node, step_id, "step")

            return redirect(
                url_for("to_review_derivation", derivation_id=derivation_id)
            )

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_feeds_used_in_step = session.read_transaction(
            neo4j_query.get_feeds_used_in_step, step_id
        )

        list_of_feeds_not_connected_to_any_step = session.read_transaction(
            neo4j_query.get_feeds_not_connected_to_any_step
        )

        list_of_input_expressions_used_in_step = session.read_transaction(
            neo4j_query.get_list_of_input_expressions_used_in_step, step_id
        )

        list_of_expressions_with_symbols_used_in_derivation = session.read_transaction(
            neo4j_query.get_list_of_expressions_with_symbols_used_in_derivation,
            derivation_id,
        )

        list_of_output_expressions_used_in_step = session.read_transaction(
            neo4j_query.get_list_of_output_expressions_used_in_step, step_id
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/step_edit.html",
        title="Edit Step",
        query_time_dict=query_time_dict,
        form_edit_step=web_form_edit_step,
        form_swap_input_expressions=web_form_swap_input_expressions,
        form_swap_feeds=web_form_swap_feeds,
        form_swap_output_expressions=web_form_swap_output_expressions,
        form_swap_input_indices=web_form_swap_input_indices,
        form_swap_feed_indices=web_form_swap_feed_indices,
        form_swap_output_indices=web_form_swap_output_indices,
        form_delete=web_form_delete,
        form_swap_index=web_form_swap_index,
        step_dict=step_dict,
        derivation_dict=derivation_dict,
        sequence_swap_list=sequence_swap_list,
        list_of_input_expressions_used_in_step=list_of_input_expressions_used_in_step,
        list_of_expressions_with_symbols_used_in_derivation=list_of_expressions_with_symbols_used_in_derivation,
        list_of_feeds_used_in_step=list_of_feeds_used_in_step,
        list_of_feeds_not_connected_to_any_step=list_of_feeds_not_connected_to_any_step,
        list_of_output_expressions_used_in_step=list_of_output_expressions_used_in_step,
    )


@web_app.route("/edit_inference_rule/<inference_rule_id>", methods=["GET", "POST"])
@login_required
def to_edit_inference_rule(
    inference_rule_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # TODO: verify that inference_rule_id exists before editing

    web_form_edit = SpecifyNewInferenceRuleForm()
    web_form_delete = NoOptionsForm()

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        inference_rule_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "inference_rule", inference_rule_id
        )

        if inference_rule_dict is None:
            flash("pdg_app/to_edit_inference_rule: inference_rule_id not found")
            return redirect(url_for("to_list_inference_rules"))

        logger.info(
            "to_edit_inference_rule inference_rule_dict " + str(inference_rule_dict)
        )

        list_of_derivations_that_use_this_inference_rule_id = session.read_transaction(
            neo4j_query.get_derivations_that_use_inference_rule,
            inference_rule_id,
        )

        if len(list_of_derivations_that_use_this_inference_rule_id) > 0:
            flash(
                "pdg_app/to_edit_inference_rule: inference rule "
                + inference_rule_id
                + " is in use and thus cannot be edited"
            )
            return redirect(
                url_for("to_list_inference_rules", _anchor=inference_rule_id)
            )

    # This will keep the last dictionary encountered for each ID.
    list_of_derivations_that_use_this_inference_rule_id = list(
        {
            v["id"]: v for v in list_of_derivations_that_use_this_inference_rule_id
        }.values()
    )

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        logger.info(" request.form = " + str(request.form))

        if "delete infrule" in request.form:
            logger.info("delete inf rule")

            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                session.write_transaction(
                    neo4j_query.delete_node, inference_rule_id, "inference_rule"
                )

            return redirect(url_for("to_list_inference_rules"))

        elif "update infrule" in request.form:
            if web_form_edit.validate():

                inference_rule_name = str(
                    web_form_edit.inference_rule_name.data
                ).strip()
                inference_rule_latex = str(
                    web_form_edit.inference_rule_latex.data
                ).strip()
                logger.info(
                    "to_edit_inference_rule: inference_rule_latex="
                    + str(inference_rule_latex)
                )
                number_of_inputs = int(
                    str(web_form_edit.inference_rule_number_of_inputs.data).strip()
                )
                number_of_feeds = int(
                    str(web_form_edit.inference_rule_number_of_feeds.data).strip()
                )
                number_of_outputs = int(
                    str(web_form_edit.inference_rule_number_of_outputs.data).strip()
                )
                author_name_latex = compute.encode_user_identifier(current_user.email)
                try:
                    assert number_of_inputs >= 0
                    assert number_of_feeds >= 0
                    assert number_of_outputs >= 0
                    assert (
                        number_of_inputs > 0
                        or number_of_feeds > 0
                        or number_of_outputs > 0
                    )
                except AssertionError as err:
                    flash(
                        "pdg_app/to_edit_inference_rule Assertion error regarding number of inputs,feeds,outputs; try again. "
                        + str(err)
                    )
                    logger.error(str(err))
                    return redirect(
                        url_for(
                            "to_edit_inference_rule",
                            inference_rule_id=inference_rule_id,
                        )
                    )
                list_of_inference_rule_dicts = []
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    list_of_inference_rule_dicts = session.read_transaction(
                        neo4j_query.get_nodes_of_type, "inference_rule"
                    )
                for other_inference_rule_dict in list_of_inference_rule_dicts:
                    if other_inference_rule_dict["id"] == inference_rule_id:
                        continue
                    logger.info(
                        "pdg_app/to_edit_inference_rule other_inference_rule_dict="
                        + str(other_inference_rule_dict)
                    )
                    if inference_rule_name == other_inference_rule_dict["name_latex"]:
                        logger.error(
                            "INVALID INPUT: inference rule with that name already exists"
                        )
                        flash(
                            "pdg_app/to_edit_inference_rule INVALID INPUT: inference rule with that name already exists"
                        )

                        logger.info("[TRACE] end " + trace_id)
                        return redirect(
                            url_for(
                                "to_edit_inference_rule",
                                inference_rule_id=inference_rule_id,
                            )
                        )
                    if inference_rule_latex == other_inference_rule_dict["latex"]:
                        logger.error(
                            "INVALID INPUT: inference rule with that latex already exists"
                        )
                        # TODO: a notice should be provided to the user
                        flash(
                            "pdg_app/to_edit_inference_ruleINVALID INPUT: inference rule with that latex already exists"
                        )

                        logger.info("[TRACE] end " + trace_id)
                        return redirect(
                            url_for(
                                "to_edit_inference_rule",
                                inference_rule_id=inference_rule_id,
                            )
                        )
                logger.info(
                    "to_edit_inference_rule status: No conflicting name or latex detected"
                )
                # add_inference_rule is now a strict create guarded by an atomic dup-check on
                # name_latex, so it can no longer double as an update for an existing node
                # (a self-edit with an unchanged name would be rejected as a duplicate, and a
                # changed name would create a stray second node with a duplicate id). Editing an
                # existing inference_rule is done field-by-field with edit_node_property instead,
                # the same pattern used for editing derivations/expressions/feeds elsewhere in
                # this file. created_datetime is intentionally left untouched.

                # https://neo4j.com/docs/python-manual/current/session-api/
                with graphDB_Driver.session() as session, track_time(
                    query_time_dict, "pdg_app/ " + trace_id
                ):

                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "name_latex",
                        inference_rule_name,
                    )
                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "latex",
                        inference_rule_latex,
                    )
                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "number_of_inputs",
                        number_of_inputs,
                    )
                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "number_of_feeds",
                        number_of_feeds,
                    )
                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "number_of_outputs",
                        number_of_outputs,
                    )
                    session.write_transaction(
                        neo4j_query.edit_node_property,
                        "inference_rule",
                        inference_rule_id,
                        "author_name_latex",
                        author_name_latex,
                    )

            else:
                flash("pdg_app/to_edit_inference_rule: " + str(web_form_edit.errors))
                logger.error(str(web_form_edit.errors))
                return redirect(url_for("to_edit_inference_rule"))
        else:
            flash("pdg_app/to_edit_inference_rule: unrecognized button")
            logger.error("unrecognized button")
            return redirect(url_for("to_edit_inference_rule"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/inference_rule_edit.html",
        title="Edit Inference Rule",
        query_time_dict=query_time_dict,
        form_edit=web_form_edit,
        form_delete=web_form_delete,
        inference_rule_dict=inference_rule_dict,
        list_of_derivations_that_use_this_inference_rule_id=list_of_derivations_that_use_this_inference_rule_id,
    )
    # once done editing, go back to list
    # return redirect(url_for("to_list_inference_rules"))


@web_app.route("/query", methods=["GET", "POST"])
def to_query() -> ResponseReturnValue:
    """
    page for submitting Cypher queries

    possibly clean the URL using https://stackoverflow.com/a/26619855/1164295

    Gemini 3.1 Pro says
    Malicious users can cause Denial of Service (DoS) via Cartesian products,
    or bypass application logic to scrape the entire database.

    Embedding Jinja2 expansions into the string passed to the web page doesn't work in either a case where you have safe or unsafe pipe
    The pipe safe situation means the string is interpreted as is with no alterations,
    When there is no pipe then the string is converted to HTML safe text
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    list_of_records_with_hyperlinks = ["nothing returned from Neo4j"]  # type: List[str]

    query = ""

    # When the page is reached directly for the first time the method is GET
    # When the form button is clicked the method is POST
    logger.info("request.method=" + str(request.method))

    web_form_cypher = CypherQueryForm()

    if request.method == "POST":
        if not current_user.is_authenticated:
            abort(403)  # Forbidden

        if "query submitted" in request.form:
            if web_form_cypher.validate():
                query = str(web_form_cypher.query.data).strip()
                logger.info("form valid; query via web form: " + str(query))
            else:
                flash("pdg_app/to_query: " + str(web_form_cypher.errors))
                logger.error(str(web_form_cypher.errors))
    elif request.method == "GET":  # query via URL keyword, or new page load
        query_str = request.args.get("cypher", None)
        if query_str:
            logger.info("query via URL: " + str(query_str))
            query = query_str
    else:
        logger.error("unrecognized method: " + str(request.method))
        return redirect(url_for("to_query"))

    logger.info("query=" + str(query))

    if query:
        list_of_records = []  # type: List[str]
        try:
            # https://neo4j.com/docs/python-manual/current/session-api/
            with graphDB_Driver.session() as session, track_time(
                query_time_dict, "pdg_app/ " + trace_id
            ):

                list_of_records = session.read_transaction(
                    neo4j_query.user_query, query
                )

            # logger.info("list_of_records=" + str(list_of_records))
        except neo4j.exceptions.ClientError:
            list_of_records = ["WRITE OPERATIONS NOT ALLOWED (3)"]
        except neo4j.exceptions.TransactionError:
            list_of_records = ["probably tried a write Cypher query (TransactionError)"]

        # convert list of strings to strings-with-html
        # We can't use jinja2 to process the content (because then links would not work)
        # so we have to "safe" the strings before adding links
        for this_record in list_of_records:
            # logger.info("this_record=", this_record)
            # 'relation' --> <a href="{{url_for('to_list_relations')}}">'relation'</a>
            revised_record = this_record

            # because we want to use "| safe" in jinja, we have to do the HTML-safening ourselves
            revised_record = revised_record.replace("<", "&lt;")
            revised_record = revised_record.replace(">", "&gt;")
            revised_record = revised_record.replace("'", "&#39;")
            revised_record = revised_record.replace('"', "&#34;")

            # lesson learned: embedding jinja2 links for processing by flask
            # doesn't work, regardless of "| safe" or not.
            # revised_record = re.sub(
            #     r"frozenset\({'feed'\)",
            #     r"frozenset\({'<a href=\"{{ url_for\('to_list_feeds'\) }}\">feed</a>'\)",
            #     revised_record,

            # revised_record = re.sub(
            #     r"'id': '(\d\d\d\d\d\d\d)'",
            #     r"'id': '<a href='\{\{ url_for('to_edit_node', node_id='\1' \}\}'>\1</a>'",
            #     revised_record,

            # using relative paths is not flask-like, but it works
            revised_record = revised_record.replace(
                "&#39;derivation&#39;",
                '&#39;<a href="list_derivations">derivation</a>&#39;',
            )
            # revised_record = revised_record.replace(
            #     "&#39;step&#39;",
            #     '&#39;<a href="list_steps">step</a>&#39;',

            revised_record = revised_record.replace(
                "&#39;feed&#39;",
                '&#39;<a href="list_feeds">feed</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;expression&#39;",
                '&#39;<a href="list_expressions">expression</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;inference_rule&#39;",
                '&#39;<a href="list_inference_rules">inference_rule</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;scalar&#39;",
                '&#39;<a href="list_scalars">scalar</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;operation&#39;",
                '&#39;<a href="list_operations">operation</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;relation&#39;",
                '&#39;<a href="list_relations">relation</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;vector&#39;",
                '&#39;<a href="list_vectors">vector</a>&#39;',
            )
            revised_record = revised_record.replace(
                "&#39;matrix&#39;",
                '&#39;<a href="list_matrices">matrix</a>&#39;',
            )
            # there is no "value_with_units" list,
            # so no page to hyperlink to

            # anywhere an "id"-like string is found, hyperlink to "edit_node"
            # Since the page is a relative link, I don't need to specify the domain
            revised_record = re.sub(
                r"&#39;(\d\d\d\d\d\d\d)&#39;",
                r"&#39;<a href='edit_node/\1'>\1</a>&#39;",
                revised_record,
            )
            # sympy strings have "pdg" prefix
            revised_record = re.sub(
                r"&#39;pdg(\d\d\d\d\d\d\d)&#39;",
                r"&#39;<a href='edit_node/\1'>pdg\1</a>&#39;",
                revised_record,
            )

            # logger.info("revised_record=", revised_record)

            if list_of_records_with_hyperlinks[0] == "nothing returned from Neo4j":
                list_of_records_with_hyperlinks = [revised_record]
            else:
                list_of_records_with_hyperlinks.append(revised_record)

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

    # get a valid derivation ID for the demos
    derivation_id = ""
    list_of_derivations = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_derivations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "derivation"
        )

    # logger.info("list_of_derivations=", list_of_derivations)
    if len(list_of_derivations) > 0:
        derivation_id = list_of_derivations[0]["id"]
    else:
        derivation_id = "THEREARENODERIVATIONS"

    inference_rule_id = ""
    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )

    # logger.info("list_of_inference_rule_dicts=", list_of_inference_rule_dicts)
    if len(list_of_inference_rule_dicts) > 0:
        inference_rule_id = list_of_inference_rule_dicts[0]["id"]
    else:
        inference_rule_id = "THEREARENOINFERENCERULES"

    step_id = ""
    list_of_step_dicts = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "step"
        )

    # logger.info("list_of_step_dicts=", list_of_step_dicts)
    if len(list_of_step_dicts) > 0:
        step_id = list_of_step_dicts[0]["id"]
    else:
        step_id = "THEREARENOSTEPS"

    # logger.info(
    #     "list_of_records_with_hyperlinks=" + str(list_of_records_with_hyperlinks)
    # )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/query.html",
        title="Query",
        query_time_dict=query_time_dict,
        form=web_form_cypher,
        submitted_query=query,
        list_of_records=list_of_records_with_hyperlinks,
        derivation_id=derivation_id,
        inference_rule_id=inference_rule_id,
        step_id=step_id,
    )


@web_app.route("/list_feeds", methods=["GET", "POST"])
def to_list_feeds() -> ResponseReturnValue:
    """
    >>> to_list_feeds()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    list_of_feeds = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_feeds = session.read_transaction(neo4j_query.get_nodes_of_type, "feed")

        logger.info("list_of_operations " + str(list_of_feeds))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_feed = session.read_transaction(
            neo4j_query.get_derivations_for_every_feed
        )

        logger.info(
            "derivations_that_use_feed=" + str(dict_of_derivations_that_use_feed)
        )

        list_of_feed_IDs = []
        for this_feed in list_of_feeds:
            list_of_feed_IDs.append(this_feed["id"])

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        symbols_per_feed_id = session.read_transaction(
            neo4j_query.get_symbols_for_every_feed,
            list_of_feed_IDs,
        )

    sympy_as_latex_per_feed_id = compute.get_sympy_as_latex_per_feed_id(list_of_feeds)

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/feed_list.html",
        title="Feeds list",
        query_time_dict=query_time_dict,
        list_of_feeds=list_of_feeds,  # _table_of_feeds.html
        sympy_as_latex_per_feed_id=sympy_as_latex_per_feed_id,  # _table_of_feeds.html
        symbols_per_feed_id=symbols_per_feed_id,
        # dict_of_all_symbol_dicts=dict_of_all_symbol_dicts,
        dict_of_derivations_that_use_feed=dict_of_derivations_that_use_feed,
    )


@web_app.route("/list_operations", methods=["GET", "POST"])
def to_list_operations() -> ResponseReturnValue:
    """
    >>> to_list_operations()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    list_of_operations = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_operations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "operation"
        )

        if len(list_of_operations) == 0:
            return redirect(url_for("to_add_operation"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_operation = session.read_transaction(
            neo4j_query.get_expressions_for_every_operation
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_operation = session.read_transaction(
            neo4j_query.get_derivations_for_every_operation
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_operation_list.html",
        title="Operation list",
        query_time_dict=query_time_dict,
        list_of_operations=list_of_operations,
        dict_of_expressions_that_use_operation=dict_of_expressions_that_use_operation,
        dict_of_derivations_that_use_operation=dict_of_derivations_that_use_operation,
    )


@web_app.route("/list_relations", methods=["GET", "POST"])
def to_list_relations() -> ResponseReturnValue:
    """
    >>> to_list_relations()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    list_of_relations = []  # type: List[dict]
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_relations = session.read_transaction(
            neo4j_query.get_nodes_of_type, "relation"
        )

        logger.info("list_of_relations: " + str(list_of_relations))
        # no relations exist, so create one
        if len(list_of_relations) == 0:
            return redirect(url_for("to_add_relation"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_relation = session.read_transaction(
            neo4j_query.get_expressions_for_every_relation
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_relation = session.read_transaction(
            neo4j_query.get_derivations_for_every_relation
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_relation_list.html",
        title="Relation list",
        query_time_dict=query_time_dict,
        list_of_relations=list_of_relations,
        dict_of_expressions_that_use_relation=dict_of_expressions_that_use_relation,
        dict_of_derivations_that_use_relation=dict_of_derivations_that_use_relation,
    )


@web_app.route("/list_constant_values/<scalar_id>", methods=["GET", "POST"])
def to_list_constant_values(scalar_id: unique_numeric_id_as_str) -> ResponseReturnValue:
    """
    >>> to_list_constant_values()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_value_dicts = session.read_transaction(
            neo4j_query.get_values_for_constant, scalar_id
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", scalar_id
        )

    if scalar_dict is None:
        flash("pdg_app/to_list_constant_values: scalar_id not found")
        return redirect(url_for("to_navigation"))

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_constant_values_list.html",
        title="Constants list",
        query_time_dict=query_time_dict,
        list_of_value_dicts=list_of_value_dicts,
        scalar_dict=scalar_dict,
    )


@web_app.route(
    "/edit_constant_value_and_units/<value_and_units_id>", methods=["GET", "POST"]
)
def to_edit_constant_value_and_units(
    value_and_units_id: unique_numeric_id_as_str,
) -> ResponseReturnValue:
    """
    edit value and units for a constant

    >>> to_edit_constant_value_and_units()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        value_and_units_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id,
            "value_with_units",
            value_and_units_id,
        )

        if value_and_units_dict is None:
            flash(
                "pdg_app/to_edit_constant_value_and_units: value_and_units ID "
                + str(value_and_units_id)
                + " does not exist in database</H1>."
            )
            return redirect(url_for("to_navigation"))

        # which scalar has this value?
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        scalar_id = session.read_transaction(
            neo4j_query.get_scalar_id_that_has_value_and_units_id, value_and_units_id
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        scalar_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "scalar", scalar_id
        )

        # to compare with other existing values:
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        list_of_value_dicts = session.read_transaction(
            neo4j_query.get_values_for_constant, scalar_id
        )

    logger.info("[TRACE] start " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_constant_values_edit.html",
        title="Edit Constants",
        query_time_dict=query_time_dict,
        value_and_units_dict=value_and_units_dict,
        list_of_value_dicts=list_of_value_dicts,
        scalar_dict=scalar_dict,
    )


@web_app.route("/list_scalars", methods=["GET", "POST"])
def to_list_scalars() -> ResponseReturnValue:
    """
    a table

    >>> to_list_scalars()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_scalars = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )

        # logger.info("to_list_scalars: list_of_scalars=" + str(list_of_scalars))

        if len(list_of_scalars) == 0:
            return redirect(url_for("to_add_symbol_scalar"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_scalar = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_scalar = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

        # derivations_that_use_scalar = {}  # type: Dict[str,list]
        # for this_scalar_dict in list_of_scalars:
        #     with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):
        #
        #         list_of_derivations = session.read_transaction(
        #             neo4j_query.get_list_of_derivations_that_use_symbol_id_by_category,
        #             this_scalar_dict["id"],
        #             "scalar",
        #         )
        #         query_time_dict[
        #             "pdg_app/to_list_scalars: get_list_of_derivations_that_use_symbol_id_by_category scalar"
        #             + trace_id
        #         ] = round(time.time() - query_start_time, 3)

        # This will keep the last dictionary encountered for each ID.
        # list_of_derivations = list(
        #     {v["id"]: v for v in list_of_derivations}.values()

        # derivations_that_use_scalar[this_scalar_dict["id"]] = (
        #     list_of_derivations

    for (
        scalar_id,
        list_of_derivations,
    ) in dict_of_derivations_that_use_scalar.items():
        list_of_derivation_names = []

        for this_derivation_dict in list_of_derivations:
            if this_derivation_dict["name_latex"] in list_of_derivation_names:
                pass
            else:
                list_of_derivation_names.append(this_derivation_dict)
        dict_of_derivations_that_use_scalar[scalar_id] = list_of_derivation_names
    derivations_that_use_scalar = dict_of_derivations_that_use_scalar

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_scalar_list.html",
        title="Scalar list",
        query_time_dict=query_time_dict,
        list_of_scalars=list_of_scalars,
        dict_of_expressions_that_use_scalar=dict_of_expressions_that_use_scalar,
        dict_of_derivations_that_use_scalar=dict_of_derivations_that_use_scalar,
    )


@web_app.route("/list_vectors", methods=["GET", "POST"])
def to_list_vectors() -> ResponseReturnValue:
    """
    >>> to_list_vectors()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/ " + trace_id
    ):

        list_of_vectors = session.read_transaction(
            neo4j_query.get_nodes_of_type, "vector"
        )

        logger.info("list_of_vectors: " + str(list_of_vectors))

        if len(list_of_vectors) == 0:
            return redirect(url_for("to_add_symbol_vector"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_vector = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_vector = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_vector_list.html",
        title="Vector list",
        query_time_dict=query_time_dict,
        list_of_vectors=list_of_vectors,
        dict_of_expressions_that_use_vector=dict_of_expressions_that_use_vector,
        dict_of_derivations_that_use_vector=dict_of_derivations_that_use_vector,
    )


@web_app.route("/list_matrices", methods=["GET", "POST"])
def to_list_matrices() -> ResponseReturnValue:
    """
    >>> to_list_matrices()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_list_matrices " + trace_id
    ):

        list_of_matrices = session.read_transaction(
            neo4j_query.get_nodes_of_type, "matrix"
        )

        if len(list_of_matrices) == 0:
            return redirect(url_for("to_add_symbol_matrix"))

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_expressions_that_use_matrix = session.read_transaction(
            neo4j_query.get_expressions_for_every_symbol
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_matrix = session.read_transaction(
            neo4j_query.get_derivations_for_every_symbol
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/symbol_matrix_list.html",
        title="Matrix list",
        query_time_dict=query_time_dict,
        list_of_matrices=list_of_matrices,
        dict_of_expressions_that_use_matrix=dict_of_expressions_that_use_matrix,
        dict_of_derivations_that_use_matrix=dict_of_derivations_that_use_matrix,
    )


@web_app.route(
    "/list_expressions/", methods=["GET", "POST"]
)  # this is here so that if someone tries to edit an expression without specifying the ID they get to the list of expressions
@web_app.route("/list_expressions", methods=["GET", "POST"])
def to_list_expressions() -> ResponseReturnValue:
    """
    >>> to_list_expressions()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    query_time_dict = {}  # type: query_timing_result_type

    list_of_expressions = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_list_expressions " + trace_id
    ):

        list_of_expressions = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )

        logger.info("list_of_expressions = " + str(list_of_expressions))

        if len(list_of_expressions) == 0:
            return redirect(url_for("to_add_expression"))

        list_of_expression_IDs = []  # type: List[str]
        for this_expression_dict in list_of_expressions:
            list_of_expression_IDs.append(this_expression_dict["id"])

        symbols_per_expression_id = session.read_transaction(
            neo4j_query.get_symbols_for_every_expression,
            list_of_expression_IDs,
        )

        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        dict_of_derivations_that_use_expression = session.read_transaction(
            neo4j_query.get_derivations_for_every_expression
        )

    # try:
    dimensional_consistency_per_expression_id, query_time_dict = (
        compute.get_dimensional_consistency_for_every_expression(
            graphDB_Driver, query_time_dict
        )
    )
    # except Exception as err:
    #     flash("ERROR in to_list_expressions: " + str(err))
    #     logger.error(str(type(err).__name__) + ": " + str(err))
    #     dimensional_consistency_per_expression_id = {}

    # logger.info(
    #     "dimensional_consistency_per_expression_id="
    #     + str(dimensional_consistency_per_expression_id)
    # )

    # try:
    list_of_expressions = compute.get_sympy_as_latex_per_expr_id(list_of_expressions)
    # except Exception as err:
    #     flash("ERROR in to_list_expressions: " + str(err))
    #     logger.error(str(type(err).__name__) + ": " + str(err))
    #     list_of_expressions = []

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/expression_list.html",
        title="Expression list",
        query_time_dict=query_time_dict,
        list_of_expressions=list_of_expressions,
        symbols_per_expression_id=symbols_per_expression_id,
        dict_of_derivations_that_use_expression=dict_of_derivations_that_use_expression,
        dimensional_consistency_per_expression_id=dimensional_consistency_per_expression_id,  # Used in _table_of_expressions.html which is referenced in expression_list.html
    )


@web_app.route(
    "/edit_derivation_metadata", methods=["GET", "POST"]
)  # this is here so that if someone tries to edit metadata without specifying the ID they are directed to the list of derivations
@web_app.route("/list_derivations", methods=["GET", "POST"])
def to_list_derivations() -> ResponseReturnValue:
    """
    this page is a gateway for the task "which existing derivation to edit?"

    >>> to_list_derivations()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # The following is irrelevant since the page doesn't submit anything back to the server
    # if request.method == "POST":
    #     logger.info("request = ", request)
    #     logger.info("request.form = ", request.form)
    #     # TODO: this derivation_id should come from request.form; I just don't know the field yet
    #     derivation_id = "5389624"
    #
    #     logger.info("[TRACE] end " + trace_id)
    #     return redirect(url_for(to_review_derivation, derivation_id))

    # https://neo4j.com/docs/python-manual/current/session-api/
    list_of_derivations = []
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_list_derivations " + trace_id
    ):

        list_of_derivations = session.read_transaction(neo4j_query.get_derivations)

        # logger.info("    list_of_derivations = " + str(list_of_derivations))

        if len(list_of_derivations) == 0:
            return redirect(url_for("to_add_derivation"))

        # number_of_steps_per_derivation = {}
        # with graphDB_Driver.session() as session, track_time(query_time_dict, "pdg_app/ " + trace_id):

        number_of_steps_per_derivation = session.read_transaction(
            neo4j_query.get_number_of_steps_per_derivation
        )

    # TODO: convert derivation_dict['abstract_latex'] to HTML using pandoc

    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/derivation_list.html",
        title="Derivation list",
        query_time_dict=query_time_dict,
        list_of_derivations=list_of_derivations,
        number_of_steps_per_derivation=number_of_steps_per_derivation,
    )


@web_app.route("/list_inference_rules")
def to_list_inference_rules() -> ResponseReturnValue:
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # OLD, DEPRECATED: get list of inference rules from Neo4j
    # with graphDB_Driver.session() as session, track_time(
    #     query_time_dict, "pdg_app/to_list_inference_rules" + trace_id
    # ):

    #     list_of_inference_rules = session.read_transaction(
    #         neo4j_query.get_nodes_of_type, "inference_rule"
    #     )

    # New: get inference rules and derivations from Neo4j
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_list_inference_rules" + trace_id
    ):
        rows = session.read_transaction(
            neo4j_query.get_inference_rules_with_derivations
        )

    list_of_inference_rules = [row["inference_rule"] for row in rows]
    dict_of_derivations_used_per_inference_rule = {
        row["inference_rule"]["id"]: row["derivations"] for row in rows
    }

    logger.info("inference rule list:")
    for inference_rule_dict in list_of_inference_rules:
        logger.info("to_list_inference_rules " + str(inference_rule_dict))
    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/user_workflow/inference_rule_list.html",
        title="Inference rule list",
        query_time_dict=query_time_dict,
        list_of_inference_rules=list_of_inference_rules,
        dict_of_derivations_used_per_inference_rule=dict_of_derivations_used_per_inference_rule,
    )


@web_app.route("/delete_all")
@login_required
def to_delete_graph_content() -> ResponseReturnValue:
    """
    https://neo4j.com/docs/cypher-manual/current/clauses/delete/
    https://neo4j.com/developer/kb/large-delete-transaction-best-practices-in-neo4j/
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_delete_graph_content " + trace_id
    ):

        str_to_print = session.write_transaction(
            neo4j_query.delete_all_nodes_and_relationships
        )

    logger.info("[TRACE] end " + trace_id)
    return redirect(url_for("to_navigation"))


@web_app.route("/export_to_json")
def to_export_json() -> ResponseReturnValue:
    """
    Produces JSON Lines (.jsonl) rather than JSON (JavaScript Object Notation)

    Standard JSON is a single, often large, array or object,
    while JSON Lines is a text format where each line is a valid, independent JSON object.

    https://github.com/neo4j/apoc
    https://neo4j.com/labs/apoc/4.1/installation/

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_export_json " + trace_id
    ):

        res = session.read_transaction(neo4j_query.apoc_export_json, "pdg.jsonl")

    logger.info("to_export_json res=" + str(res))
    # <Record file='all.json' source='database: nodes(4), rels(0)' format='json' nodes=4 relationships=0 properties=16 time=123 rows=4 batchSize=-1 batches=0 done=True data=None>

    # "dumping_grounds" is a variable set in the docker-compose file using variable NEO4J_dbms_directories_import
    logger.info("[TRACE] end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.jsonl"))


@web_app.route("/export_metadata_schema")
def to_export_metadata_schema():
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_export_metadata_schema " + trace_id
    ):

        res = session.read_transaction(neo4j_query.apoc_metdata_schema)

    # logger.info("res=" + str(res))

    # for k, v in res.items():
    #     logger.info(str(k) + ":" + str(v))

    json_string = json.dumps(res["stats"], indent=2)

    logger.info("[TRACE] end " + trace_id)
    return Response(json_string, mimetype="application/json")

    # alternative:
    # return f"<pre>{json_string}</pre>"

    # alternative: return a file:
    # return Response(
    #     json_string,
    #     mimetype='application/json',
    #     headers={'Content-Disposition': 'attachment;filename=stats.json'}
    # )


@web_app.route("/export_to_csv")
def to_export_csv() -> ResponseReturnValue:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_export_csv " + trace_id
    ):

        res = session.read_transaction(neo4j_query.apoc_export_csv, "pdg.csv")

    logger.info("res=" + str(res))

    logger.info("[TRACE] end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.csv"))


@web_app.route("/export_to_graphml")
def to_export_graphml() -> ResponseReturnValue:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_export_graphml " + trace_id
    ):

        res = session.read_transaction(neo4j_query.apoc_export_graphml, "pdg.graphml")

    logger.info("res=" + str(res))

    logger.info("[TRACE] end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.graphml"))


@web_app.route("/export_to_cypher")
def to_export_cypher() -> ResponseReturnValue:
    """

    # apoc.export.cypherQuery()
    # https://stackoverflow.com/questions/44688194/efficient-importing-of-cypher-statements

    # command line
    # https://neo4j.com/developer/kb/export-sub-graph-to-cypher-and-import/

    # queries:
    # https://stackoverflow.com/a/20894360/1164295
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/to_export_cypher " + trace_id
    ):

        res = session.read_transaction(neo4j_query.apoc_export_cypher, "pdg.cypher")

    logger.info("res=" + str(res))
    # <Record file='all.cypher' batches=1 source='database: nodes(4), rels(0)' format='cypher' nodes=4 relationships=0 properties=16 time=13 rows=4 batchSize=20000>

    logger.info("[TRACE] end " + trace_id)
    return redirect(url_for("static", filename="dumping_grounds/pdg.cypher"))


###########################################################################

# a sequential exploration of using the API to produce interactive content


@web_app.route("/api_json_to_console")
def to_api_json_console() -> ResponseReturnValue:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_json_to_console.html")


@web_app.route("/api_json_to_page")
def to_api_json_page() -> ResponseReturnValue:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_json_to_page.html")


@web_app.route("/api_display_png")
def to_api_display_png() -> ResponseReturnValue:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_display_png.html")


@web_app.route("/api_png_dynamic")
def to_api_png_dynamic() -> ResponseReturnValue:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_png_as_user_types.html")


@web_app.route("/api_png_dynamic_multiple")
def to_api_png_dynamic_multiple_input() -> ResponseReturnValue:
    """
    HTML page created with help from Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template("js_with_api/api_png_as_user_types_multiple_inputs.html")


###########################################################################


@web_app.route("/api_documentation")
@web_app.route("/documentation/api")
def to_api_documentation() -> ResponseReturnValue:
    """
    HTML page generated by Google's Gemini 2.0 LLM (free!) 2025-01-xx
    """
    return render_template(
        "jinja2_pages/documentation_of_api.html", title="API Documentation"
    )


@web_app.route("/workflow_documentation")
def to_workflow_documenation() -> ResponseReturnValue:
    """
    HTML page that was initially generated by Google's Gemini 2.0 LLM (free!) 2025-01-xx

    Update on 2026-02-01 used
    ```
    $ cat pdg_app.py | grep "^@web_app\.route\|^def" -A1 > routes_and_defs.log
    ```
    """
    return render_template(
        "jinja2_pages/documentation_of_webpage_routes.html",
        title="Webpage documentation",
    )


@web_app.route("/llm_workflow_documentation")
def to_llm_workflow_documenation() -> ResponseReturnValue:
    """ """

    with open("library/schema_for_llm_symbols.json", "r") as file_handle:
        schema_for_llm_symbols = json.load(file_handle)

    pretty_schema_for_llm_symbols = json.dumps(schema_for_llm_symbols, indent=2)

    with open("library/schema_for_llm_symbol_matches.json", "r") as file_handle:
        schema_for_llm_symbol_matches = json.load(file_handle)

    pretty_schema_for_llm_symbol_matches = json.dumps(
        schema_for_llm_symbol_matches, indent=2
    )

    with open("library/schema_for_llm_symbol_missing.json", "r") as file_handle:
        schema_for_llm_symbol_missing = json.load(file_handle)

    pretty_schema_for_llm_symbol_missing = json.dumps(
        schema_for_llm_symbol_missing, indent=2
    )

    with open("library/schema_for_llm_operations.json", "r") as file_handle:
        schema_for_llm_operations = json.load(file_handle)

    pretty_schema_for_llm_operations = json.dumps(schema_for_llm_operations, indent=2)

    with open("library/schema_for_llm_operation_matches.json", "r") as file_handle:
        schema_for_llm_operation_matches = json.load(file_handle)

    pretty_schema_for_llm_operation_matches = json.dumps(
        schema_for_llm_operation_matches, indent=2
    )

    with open("library/schema_for_llm_operations_missing.json", "r") as file_handle:
        schema_for_llm_operations_missing = json.load(file_handle)

    pretty_schema_for_llm_operations_missing = json.dumps(
        schema_for_llm_operations_missing, indent=2
    )

    with open("library/schema_for_llm_expressions.json", "r") as file_handle:
        schema_for_llm_expressions = json.load(file_handle)

    pretty_schema_for_llm_expressions = json.dumps(schema_for_llm_expressions, indent=2)

    with open("library/schema_for_llm_expression_matches.json", "r") as file_handle:
        schema_for_llm_expression_matches = json.load(file_handle)

    pretty_schema_for_llm_expression_matches = json.dumps(
        schema_for_llm_expression_matches, indent=2
    )

    with open("library/schema_for_llm_steps.json", "r") as file_handle:
        schema_for_llm_steps = json.load(file_handle)

    pretty_schema_for_llm_steps = json.dumps(schema_for_llm_steps, indent=2)

    return render_template(
        "jinja2_pages/documentation_of_LLM_workflow.html",
        schema_for_llm_symbols=pretty_schema_for_llm_symbols,
        schema_for_llm_symbol_matches=pretty_schema_for_llm_symbol_matches,
        schema_for_llm_symbol_missing=pretty_schema_for_llm_symbol_missing,
        schema_for_llm_operations=pretty_schema_for_llm_operations,
        schema_for_llm_operation_matches=pretty_schema_for_llm_operation_matches,
        schema_for_llm_operations_missing=pretty_schema_for_llm_operations_missing,
        schema_for_llm_expressions=pretty_schema_for_llm_expressions,
        schema_for_llm_expression_matches=pretty_schema_for_llm_expression_matches,
        schema_for_llm_steps=pretty_schema_for_llm_steps,
        title="LLM Workflow documentation",
    )


###########################################################################


@web_app.route("/rss.xml")
def to_rss():
    """
    TODO: also publish updates to derivations (not just blog posts)

    TODO: validate https://allofphysics.com/rss.xml using  https://validator.w3.org/feed/

    See https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/43
    """
    logger.info("[TRACE]")

    base_dir = Path("templates/blog_manual")
    list_of_files = base_dir.rglob("*.html")

    list_of_dictionaries = []

    for file_path in list_of_files:
        # Get the path relative to 'templates/blog_manual' (e.g., '2026/07/file.html')
        relative_path = file_path.relative_to(base_dir)
        parts = relative_path.parts

        # Ensure the path has the expected depth: year, month, filename
        if len(parts) >= 3:
            year, month, filename = parts[0], parts[1], parts[2]

            # The title is the filename without the .html extension
            title = file_path.stem

            # URL-encode the filename to make sure spaces/special characters are valid in a URL
            safe_filename = urllib.parse.quote(filename)
            link = f"https://allofphysics.com/blog/{year}/{month}/{safe_filename}"

            list_of_dictionaries.append({"title": title, "link": link})

    # Pass the generated list directly to the Jinja template
    response = make_response(
        render_template(
            "jinja2_pages/rss.xml", list_of_dictionaries=list_of_dictionaries
        )
    )
    response.headers["Content-Type"] = "application/rss+xml"
    return response


###########################################################################


@web_app.route("/profile", methods=["GET", "POST"])
@login_required
def my_profile():
    """
    https://github.com/allofphysicsgraph/task-tracker/issues/124
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    query_time_dict = {}  # type: query_timing_result_type

    author = current_user.email

    author_hash = compute.encode_user_identifier(current_user.email)

    with graphDB_Driver.session() as session, track_time(
        query_time_dict, "pdg_app/my_profile " + trace_id
    ):

        (
            list_of_dates,
            number_of_contributions,
            list_of_derivations,
            list_of_expressions,
            list_of_infrules,
            list_of_symbols,
            list_of_operations,
            list_of_relations,
        ) = session.read_transaction(neo4j_query.get_user_stats, author_hash)

    # logger.info("len(list_of_dates)= " + str(len(list_of_dates)))

    try:
        earliest_date = min(list_of_dates)
    except Exception as err:
        earliest_date = None
        flash("pdg_app/my_profile: " + str(err))
        logger.error(str(err))

    try:
        latest_date = max(list_of_dates)
    except Exception as err:
        earliest_date = None
        flash("pdg_app/my_profile: " + str(err))
        logger.error(str(err))

    return render_template(
        "jinja2_pages/profile.html",
        user_name=author,
        user_hash=author_hash,
        number_of_contributions=number_of_contributions,
        latest_date=latest_date,
        earliest_date=earliest_date,
        list_of_derivations=list_of_derivations,
        list_of_expressions=list_of_expressions,
        list_of_infrules=list_of_infrules,
        list_of_symbols=list_of_symbols,
        list_of_operations=list_of_operations,
        list_of_relations=list_of_relations,
        title="Profile for " + author,
    )


###########################################################################


# user shouldn't go directly to this page; the purpose of this route is to get to Google
@web_app.route("/search", methods=["GET", "POST"])
def search_redirect_to_google():
    """
    rather than search local content, rely on Google's index

    This search only works via webform since the value is grabbed from form value "search"
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    logger.info(
        "request.url: " + str(request.url)
    )  # https://stackoverflow.com/a/46176337/1164295

    # Here's what the URL should look like:
    # request.url: http://localhost/search?q=hello

    if len(request.form.keys()) > 0:
        logger.info("request.form =" + str(request.form))
        logger.info("request.form.keys() =" + str(request.form.keys()))

        return redirect(
            "https://www.google.com/search?&q=site%3Aallofphysics.com+"
            + str(request.form.get("search"))
        )
    elif len(request.args.keys()) > 0:

        # request.args are embedded in the URL
        logger.info("request.args=" + str(request.args))
        # request.args=ImmutableMultiDict([('hello', 'bye')])

        logger.info("search term is " + str(request.args.get("q")))

        return redirect(
            "https://www.google.com/search?&q=site%3Aallofphysics.com+"
            + str(request.args.get("q"))
        )

    else:
        logger.info(
            "invalid use; URL should be something like http://localhost/search?q=hello "
        )
        return redirect(url_for("to_navigation"))

    return redirect(url_for("to_navigation"))


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
    if web_app.static_folder is None:
        logger.error("static folder does not seem to be set!")
        abort(404)
    return send_from_directory(web_app.static_folder, request.path[1:])


###########################################################################


@web_app.route("/static_dir/", methods=["GET", "POST"])
def static_dir():
    """
    "static_dir" is a directory listing

    This route is not intended to be linked to
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # https://stackoverflow.com/a/3207973/1164295
    # get a list of all filenames located inside a folder while ignoring subfolders
    static_path = web_app.static_folder if web_app.static_folder else "static"
    _, _, filenames = next(os.walk(static_path))
    filenames.sort()
    logger.info("[TRACE] end " + trace_id)
    return render_template(
        "jinja2_pages/static_dir.html",
        list_of_files=filenames,
        folder_name=static_path,
        title="directory listing",
    )


###########################################################################


@web_app.route("/documentation/evaluation_of_LLM_prompts", methods=["GET", "POST"])
def to_evaluation_of_LLM_prompts():
    """ """
    logger.info("[TRACE] to_evaluation_of_LLM_prompts")
    return render_template("jinja2_pages/documentation_evaluation_of_LLM_prompts.html")


###########################################################################


@web_app.route("/documentation", methods=["GET", "POST"])
@web_app.route("/documentation/", methods=["GET", "POST"])
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


@web_app.route("/documentation/student", methods=["GET", "POST"])
def to_student_documentation():
    """
    a static page with documentation aimed at students
    """
    logger.info("[TRACE] to_student_documentation ")
    return render_template(
        "jinja2_pages/documentation_for_student.html",
        title="Documentation for Students",
    )


@web_app.route("/documentation/instructor", methods=["GET", "POST"])
def to_instructor_documentation():
    """
    a static page with documentation aimed at instructors
    """
    logger.info("[TRACE] to_instructor_documentation ")
    return render_template(
        "jinja2_pages/documentation_for_instructor.html",
        title="Documentation for instructors",
    )


@web_app.route("/documentation/researcher", methods=["GET", "POST"])
def to_researcher_documentation():
    """
    a static page with documentation aimed at researchers
    """
    logger.info("[TRACE] to_researcher_documentation ")
    return render_template(
        "jinja2_pages/documentation_for_researcher.html",
        title="Documentation for researchers",
    )


@web_app.route(
    "/user_documentation", methods=["GET", "POST"]
)  # backwards compatibility with previous versions of the site
@web_app.route("/documentation/user", methods=["GET", "POST"])  # preferred
def to_user_documentation():
    """
    a static page with documentation aimed at users (not developers)

    >>> user_documentation()
    """
    logger.info("[TRACE] to_user_documentation ")
    return render_template(
        "jinja2_pages/documentation_for_user.html", title="User Documentation"
    )


@web_app.route(
    "/developer_documentation", methods=["GET", "POST"]
)  # backwards compatibility with previous versions of the site
@web_app.route("/documentation/developer", methods=["GET", "POST"])  # preferred
def to_developer_documentation():
    """
    a static page aimed at people interested in contributed code changes

    >>> developer_documentation()
    """
    logger.info("[TRACE] to_developer_documentation")
    return render_template(
        "jinja2_pages/documentation_for_developer.html", title="Developer Documentation"
    )


@web_app.route("/conventions_documentation", methods=["GET", "POST"])
@web_app.route("/documentation/conventions", methods=["GET", "POST"])
def to_conventions_documentation():
    """
    a static page aimed at people interested in understanding
    design decisions

    >>> to_conventions_documentation()
    """
    logger.info("[TRACE] to_conventions_documentation")
    return render_template(
        "jinja2_pages/documentation_of_conventions.html",
        title="Conventions Documentation",
    )


@web_app.route("/design_documentation", methods=["GET", "POST"])
@web_app.route("/documentation/design_choices", methods=["GET", "POST"])
def to_design_documentation():
    """
    a static page aimed at people interested in understanding
    design decisions

    >>> design_documentation()
    """
    logger.info("[TRACE] to_design_documentation")
    return render_template(
        "jinja2_pages/documentation_of_design_choices.html",
        title="Design Decisions Documentation",
    )


@web_app.route("/documentation/dimensionality", methods=["GET"])
def to_document_dimensionality():
    """ """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_dimensionality.html", title="Dimensionality"
    )


@web_app.route("/documentation/goals_roadmap", methods=["GET"])
def to_document_goals_roadmap():
    """ """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_goals_roadmap.html",
        title="Goals and Roadmap for Physics Derivation Graph",
    )


@web_app.route("/documentation/hilberts_sixth_problem", methods=["GET"])
def to_document_hilbert_sixth():
    """ """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_hilberts_sixth_problem.html",
        title="Hilbert's Sixth Problem and the Physics Derivation Graph",
    )


@web_app.route("/faq", methods=["GET", "POST"])
@web_app.route("/documentation/faq", methods=["GET", "POST"])
def to_faq():
    """
    "frequently asked questions" is a static page

    >>> faq()
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_faq.html", title="Frequently Asked Questions"
    )


@web_app.route("/other_projects", methods=["GET", "POST"])
@web_app.route("/documentation/other_projects", methods=["GET", "POST"])
def to_other_projects():
    """
    "other projects" is a static page

    >>> other_projects()
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_other_projects.html", title="Other projects"
    )


@web_app.route("/shorten", methods=["GET", "POST"])
@login_required
def to_shorten():
    """
    user provides a URL to be shortened and gets back a lookup for the shortened URL
    """
    logger.info("[TRACE] ")

    if not request.args:
        return (
            "<H1>Shorten a URL</H1>\n"
            + '<P>For example, <a href="/shorten?url=https://google.com">allofphysics.com/shorten?url=https://google.com</a>\n'
        )

    user_url = request.args.get("url", "").lower()
    logger.info("user_url: " + user_url)

    # as per https://strftime.org/
    # %f = Microsecond as a decimal number, zero-padded on the left.
    now_str = str(datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f"))

    user_id = compute.encode_user_identifier(current_user.email)

    lookup = compute.add_url_to_shortened_list(now_str, user_id, user_url)

    return (
        '<H1><a href="/expand/'
        + lookup
        + '">allofphysics.com/expand/'
        + lookup
        + "</a></H1>"
    )


@web_app.route("/expand/<lookup>", methods=["GET", "POST"])
def to_expand(lookup: str):
    """
    take the shortened URL and redirects the user to the expanded URL
    """
    logger.info("[TRACE] ")

    status, url = compute.get_url_from_shortened_list(lookup)

    return redirect(url)


@web_app.route("/expand/", methods=["GET", "POST"])
@web_app.route("/expand", methods=["GET", "POST"])
def to_expand_instructions():
    logger.info("[TRACE] ")
    return (
        "<H1>Need a lookup to expand</H1>"
        + '<P>For example, <a href="/shorten?url=https://google.com">allofphysics.com/shorten?url=https://google.com</a>\n'
    )


@web_app.route("/arxiv_scraper", methods=["GET", "POST"])
def scrape_arxiv():
    """
    allofphysics.com/arxiv_scraper?title=state

    """
    logger.info("[TRACE] ")

    ARXIV_URL = "https://export.arxiv.org/rss/quant-ph"

    if not request.args:
        return (
            '<P>Search <a href="'
            + ARXIV_URL
            + '">'
            + ARXIV_URL
            + "</a>"
            + " by title, author, description\n"
            + '<P>For example, <a href="/arxiv_scraper?title=state">allofphysics.com/arxiv_scraper?title=state</a>\n'
            + '<P>Or <a href="/arxiv_scraper?title=state&author=bob">allofphysics.com/arxiv_scraper?title=state&author=bob</a>'
        )

    user_query_title = request.args.get("title", "").lower()
    logger.info("user_query_title: " + user_query_title)
    if len(user_query_title) > 0:
        user_query_title_list = user_query_title.split(",")
        logger.info(str(user_query_title_list))
    else:
        user_query_title_list = None

    user_query_description = request.args.get("description", "").lower()
    logger.info("user_query_description: " + user_query_description)
    if len(user_query_description) > 0:
        user_query_description_list = user_query_description.split(",")
        logger.info(str(user_query_description_list))
    else:
        user_query_description_list = None

    user_query_author = request.args.get("author", "").lower()
    logger.info("user_query_author: " + user_query_author)
    if len(user_query_author) > 0:
        user_query_author_list = user_query_author.split(",")
        logger.info(str(user_query_author_list))
    else:
        user_query_author_list = None

    def _format_match_message(entry: Dict[str, Any], reason: str) -> str:
        """Formats a consistent message for a found match."""
        return (
            "<P>"
            + reason
            + ": <B>"
            + entry.get("title", "?? no title ??")
            + "</B>\n<BR>"
            + str(entry.get("dc:creator"))
            + '<BR>\n<a href="'
            + str(entry.get("link", "link not found"))
            + '">'
            + str(entry.get("link", "link not found"))
            + "</a>\n"
        )

    def find_arxiv_matches(
        rss_entries: List[Dict[str, Any]],  # each entry is an arxiv post
        user_provided_title_keywords_list: Optional[List[str]],
        user_provided_description_keywords_list: Optional[List[str]],
        user_provided_author_list: Optional[List[str]],
    ) -> List[str]:
        """
        Finds matches in arXiv entries based on a set of keyword and author rules.

        """
        results = []

        # entries is outermost loop so that a match is only identified once
        for entry in rss_entries:
            reason = ""

            rss_title_to_search = entry["title"].lower()

            logger.info(
                "user_provided_title_keywords_list: "
                + str(user_provided_title_keywords_list)
            )
            if user_provided_title_keywords_list:
                for users_title_keyword in user_provided_title_keywords_list:
                    if users_title_keyword in rss_title_to_search:
                        reason += users_title_keyword + " (title) AND "

            rss_description_to_search = entry["description"].lower()

            logger.info(
                "user_provided_description_keywords_list: "
                + str(user_provided_description_keywords_list)
            )
            if user_provided_description_keywords_list:
                for (
                    users_description_keyword
                ) in user_provided_description_keywords_list:
                    if users_description_keyword in rss_description_to_search:
                        reason += users_description_keyword + " (description) AND "

            rss_authors_to_search = entry["dc:creator"].lower()

            logger.info("user_provided_author_list: " + str(user_provided_author_list))
            if user_provided_author_list:
                for users_author in user_provided_author_list:
                    if users_author in rss_authors_to_search:
                        reason += users_author + " (author) AND "

            if len(reason) > 3:  # not empty, so there are 1 or more matches
                reason_without_trailing_AND = reason[:-5]
                number_ANDs = reason_without_trailing_AND.count("AND")
                reason_with_count = (
                    str(number_ANDs + 1) + "x: " + reason_without_trailing_AND
                )
            else:
                reason_with_count = "0:"

            results.append(_format_match_message(entry, reason_with_count))

        return results

    def get_arxiv_rss(ARXIV_URL: str):
        """
        Main function to fetch arXiv data and generate a report of interesting papers.
        """

        # Fetch the RSS feed and parses it into a list of paper entries.
        try:
            r = requests.get(ARXIV_URL)
            r.raise_for_status()  # Raises an exception for bad status codes (4xx or 5xx)
            rss_as_dict = xmltodict.parse(r.text)
            # logger.info("rss_as_dict")
            # logger.info(str(rss_as_dict))
            arxiv_entries = (
                rss_as_dict.get("rss", {}).get("channel", {}).get("item", [])
            )
            # logger.info("arxiv_entries")
            # logger.info(str(arxiv_entries))
        except requests.exceptions.RequestException as err:
            logger.error(f"Error fetching data from {ARXIV_URL}: {err}")
            arxiv_entries = []
        except Exception as err:
            logger.error(f"Error parsing XML: {err}")
            arxiv_entries = []

        if not arxiv_entries:
            return "Could not retrieve or parse arXiv feed."

        return arxiv_entries

    arxiv_entries = get_arxiv_rss(ARXIV_URL)

    results = find_arxiv_matches(
        arxiv_entries,
        user_query_title_list,
        user_query_description_list,
        user_query_author_list,
    )

    results.sort(reverse=True)  # highest count to lowest

    return "".join(results)


@web_app.route("/documentation/common_errors_in_college_math", methods=["GET", "POST"])
def common_errors_in_college_math():
    """
    From https://math.vanderbilt.edu/schectex/commerrs/
    """
    logger.info("[TRACE] ")
    return render_template(
        "webpage_snapshots/common_errors_in_college_math.html",
        title="Errors",
    )
    # return send_from_directory(
    #     web_app.static_folder + "/webpage_snapshots/",
    #     "common_errors_in_college_math.html",
    # )
    # TODO: elsewhere in this file I've hardcoded to "/code/static" which breaks the abstraction


@web_app.route("/literature_review", methods=["GET", "POST"])
@web_app.route("/documentation/literature_review", methods=["GET", "POST"])
def to_literature_review():
    """
    "literature_review" is a static page

    >>> literature_review()
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/documentation_literature_review.html", title="Literature Review"
    )


###########################################################################


@web_app.route(
    "/documentation/comparison_of_design_options/cas", methods=["GET", "POST"]
)
def to_comparison_of_design_options_cas():
    """
    a static page
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/comparison_of_design_options_cas.html",
        title="Comparison of Design Options: Computer Algebra System (CAS)",
    )


@web_app.route(
    "/documentation/comparison_of_design_options/graph_drawing", methods=["GET", "POST"]
)
def to_comparison_of_design_options_graph_drawing():
    """
    a static page
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/comparison_of_design_options_graph_drawing.html",
        title="Comparison of Design Options: Graph Drawing",
    )


@web_app.route(
    "/documentation/comparison_of_design_options/proofs",
    methods=["GET", "POST"],
)
def to_comparison_of_design_options_proofs():
    """
    a static page
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/comparison_of_design_options_proofs.html",
        title="Comparison of Design Options: Proofs",
    )


@web_app.route(
    "/documentation/comparison_of_design_options/syntax",
    methods=["GET", "POST"],
)
def to_comparison_of_design_options_syntax():
    """
    a static page
    """
    logger.info("[TRACE] ")
    return render_template(
        "jinja2_pages/comparison_of_design_options_syntax.html",
        title="Comparison of Design Options: Syntax",
    )


@web_app.route(
    "/documentation/comparison_of_design_options/database",
    methods=["GET", "POST"],
)
def to_comparison_of_design_options_database():
    """
    a static page
    """
    logger.info("[TRACE] ")
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
    logger.info("[TRACE] to_list_named_expressions")
    return render_template(
        "jinja2_pages/named_expressions_list.html", title="central expressions"
    )


@web_app.route("/survey_of_named_expressions", methods=["GET", "POST"])
def to_survey_of_named_expressions():
    """
    This is a static page; content that hasn't been integrated into the PDG

    >>> to_survey_of_named_expressions()
    """
    logger.info("[TRACE] to_survey_of_named_expressions")
    return render_template(
        "jinja2_pages/named_expressions_survey.html", title="central expressions"
    )


###########################################################################


@web_app.route("/from_llm", methods=["GET"])
def to_llm_page():
    logger.info("[TRACE] ")
    return render_template("from_LLM/SHO_from_Gemini_3_flash.html")


###########################################################################


@web_app.route("/blog", methods=["GET"])
@web_app.route("/blog/", methods=["GET"])
@web_app.route("/blog/page", methods=["GET"])
@web_app.route("/blog/page/", methods=["GET"])
def to_blog_list():
    """ """
    logger.info("[TRACE] ")
    # logger.info(str(os.getcwd())) # /code

    base_dir = Path("templates/blog_manual")
    # logger.info(str(glob.glob("templates/blog_manual/**/**/*.html")))
    # return render_template(
    #     "blog_from_blogger/blog_list.html", title="Blog for Physics Derivation Graph"
    # )
    # Recursively find all .html files in `templates/blog_manual/`
    list_of_files = base_dir.rglob("*.html")

    list_of_formated_links = []
    for file_path in list_of_files:
        # Get parts relative to 'templates/blog_manual' (e.g., ('2026', '07', 'filename.html'))
        relative_parts = file_path.relative_to(base_dir).parts

        # Ensure the structure matches YYYY/MM/title.html
        if len(relative_parts) == 3:
            yyyy, mm, filename = relative_parts

            # Check that the subfolders are numeric years and months
            if yyyy.isdigit() and mm.isdigit():
                title = file_path.stem  # Extract filename without the .html extension

                list_of_formated_links.append({"YYYY": yyyy, "MM": mm, "title": title})

    # Sort: Year (descending), Month (descending), Title (ascending)
    list_of_formated_links.sort(
        key=lambda x: (-int(x["YYYY"]), -int(x["MM"]), x["title"])
    )

    return render_template(
        "blog_from_blogger/blog_list.html",
        title="Blog for Physics Derivation Graph",
        blog_links=list_of_formated_links,
    )


@web_app.route("/blog/<YYYY>/<MM>/<blog_title>", methods=["GET"])
def to_blog(YYYY: str, MM: str, blog_title: str):
    """
    exported pages from blogger.com's https://physicsderivationgraph.blogspot.com/

    blog()
    """
    logger.info("[TRACE] ")
    return render_template(
        "blog_from_blogger/" + YYYY + "/" + MM + "/" + blog_title, title=blog_title
    )


# @web_app.route("/blog/page", methods=["GET"])
# @web_app.route("/blog/page/", methods=["GET"])
# def to_blog_manual():
#     return render_template("blog_manual/index.html")


@web_app.route("/blog/page/<YYYY>/<MM>/<blog_title>", methods=["GET"])
def to_blog_manual_page(YYYY: str, MM: str, blog_title: str):
    """
    manually-crafted pages
    """
    return render_template(
        "blog_manual/" + YYYY + "/" + MM + "/" + blog_title + ".html", title=blog_title
    )


###########################################################################


@web_app.route("/clickable_layers", methods=["GET", "POST"])
def to_clickable_layers():
    """ """
    logger.info("[TRACE] clickable_layers")
    return render_template(
        "jinja2_pages/clickable_layers.html", title="clickable_layers"
    )


###########################################################################


@web_app.route("/api_hal_explorer")
def to_api_explorer():
    """
    Renders the custom HAL API Explorer page.
    This page requests 'application/hal+json' endpoints
    and lets you navigate the API visually.
    """
    return render_template("jinja2_pages/api_HATEOAS_explorer.html")


###########################################################################


@web_app.route("/class_notes", methods=["GET", "POST"])
def to_class_notes_overview():
    """
    class notes from school
    """
    logger.info("[TRACE] class_notes]")
    return render_template("class_notes/overview.html", title="class notes overview")


@web_app.route("/class_notes/<which_class>", methods=["GET", "POST"])
def to_class_notes_subpage(which_class: str):
    """
    class notes from school
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + "] ")

    if which_class == "overview":
        logger.info("URL is overview")
        logger.info("[TRACE] end " + trace_id)
        return render_template("class_notes/overview.html", title="overview")
    elif which_class == "math402_mathematical_physics_hale":
        logger.info("URL is 402")
        logger.info("[TRACE] end " + trace_id)
        return render_template(
            "class_notes/math402_mathematical_physics_hale.html", title="Math 402"
        )

    logger.info("[TRACE] end " + trace_id)
    return render_template("class_notes_overview.html", title="class notes overview")


###########################################################################


@web_app.route("/spectrum_of_precision", methods=["GET", "POST"])
@web_app.route("/spectrum_of_precision/overview", methods=["GET", "POST"])
def to_spectrum_of_precision():
    """
    exploration of layering formalization
    """
    return render_template(
        "jinja2_pages/layers_overview.html", title="Spectrum of Precision: Overview"
    )


@web_app.route("/spectrum_of_precision/<which_layer>", methods=["GET", "POST"])
def to_spectrum_of_precision_layer(which_layer):
    """
    exploration of layering formalization
    """
    page_title = "Spectrum of Precision for Formal Mathematical Physics Content"
    if which_layer == "overview":
        return render_template("jinja2_pages/layers_overview.html", title=page_title)
    elif which_layer == "lecture":
        return render_template(
            "jinja2_pages/layers_lecture_video.html", title=page_title
        )
    elif which_layer == "handwritten":
        return render_template(
            "jinja2_pages/layers_handwritten_notes.html", title=page_title
        )
    elif which_layer == "latex":
        return render_template(
            "jinja2_pages/layers_document_without_decorations.html", title=page_title
        )
    elif which_layer == "tag_sections":
        return render_template(
            "jinja2_pages/layers_section_document_structure.html", title=page_title
        )
    elif which_layer == "tag_words":
        return render_template(
            "jinja2_pages/layers_words_named_entity_recognition.html", title=page_title
        )
    elif which_layer == "tag_expressions":
        return render_template("jinja2_pages/layers_contentML.html", title=page_title)
    elif which_layer == "tag_all":
        return render_template(
            "jinja2_pages/layers_sections_words_contentML.html", title=page_title
        )
    elif which_layer == "variables":
        return render_template(
            "jinja2_pages/layers_concepts_to_variables.html", title=page_title
        )
    elif which_layer == "all_steps":
        return render_template("jinja2_pages/layers_all_steps.html", title=page_title)
    elif which_layer == "pdg":
        return render_template(
            "jinja2_pages/layers_derivation_graph.html", title=page_title
        )
    elif which_layer == "CAS_validation":
        return render_template(
            "jinja2_pages/layers_validate_steps.html", title=page_title
        )
    elif which_layer == "numeric_id":
        return render_template(
            "jinja2_pages/layers_replace_variables_with_numeric_id.html",
            title=page_title,
        )
    elif which_layer == "dimensional_validation":
        return render_template(
            "jinja2_pages/layers_dimensional_validation.html", title=page_title
        )
    elif which_layer == "proof":
        return render_template(
            "jinja2_pages/layers_proof_of_inference_rule.html", title=page_title
        )
    else:
        flash(
            "pdg_app/to_spectrum_of_precision_layer: unrecognized argument: "
            + which_layer
        )
        logger.error("unrecognized argument: " + which_layer)
        return render_template("jinja2_pages/layers_overview.html", title=page_title)
    return render_template("jinja2_pages/layers_overview.html", title=page_title)


###########################################################################

###########################################################################


# EOF
