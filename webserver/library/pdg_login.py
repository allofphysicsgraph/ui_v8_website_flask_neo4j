#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2025
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)
"""

import os
import logging
import random

logger = logging.getLogger(__name__)

from initialize_flask import web_app

# https://hplgit.github.io/web4sciapps/doc/pub/._web4sa_flask004.html
from flask import (
    redirect,
    render_template,
    request,
    url_for,
    flash,
)

# https://flask-login.readthedocs.io/en/latest/_modules/flask_login/mixins.html
# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-v-user-logins
# https://en.wikipedia.org/wiki/Mixin
from flask_login import (
    LoginManager,
    UserMixin,
    login_required,
    login_user,
    logout_user,
    current_user,
)  # type: ignore

# in support of Google Sign-in
# from https://realpython.com/flask-google-login/
from google_auth_sql_db import init_db
from google_auth_user_account import User

# https://realpython.com/flask-google-login/
GOOGLE_CLIENT_ID = os.environ.get("GOOGLE_CLIENT_ID", None)
GOOGLE_CLIENT_SECRET = os.environ.get("GOOGLE_CLIENT_SECRET", None)
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
    logger.info("[TRACE] pdg_login/get_google_provider_cfg")
    url_json = requests.get(GOOGLE_DISCOVERY_URL).json()
    logger.debug(url_json)
    return url_json


@login_manager.unauthorized_handler
def unauthorized():
    """
    https://flask-login.readthedocs.io/en/latest/
    >>>
    """
    logger.info("[TRACE] pdg_login/unauthorized")
    return redirect(url_for("login", referrer="unauthorized"))


@login_manager.user_loader
def load_user(user_id):
    """
    https://flask-login.readthedocs.io/en/latest/
    also https://realpython.com/using-flask-login-for-user-management-with-flask/
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-v-user-logins
    """
    logger.info("[TRACE] pdg_login/load_user")
    logger.debug(user_id)
    # return USERS.get(int(user_id))

    # https://realpython.com/flask-google-login/
    return User.get(user_id)


@web_app.route("/login")
def to_login():
    """
    https://realpython.com/flask-google-login/
    """
    logger.info("[TRACE] pdg_login/to_login")

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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] pdg_login/callback start " + trace_id + "]")
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

    logger.debug(users_name)
    logger.debug(users_email)
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
    logger.debug(str(current_user.name))
    logger.debug(str(current_user.email))
    flash("logged in")

    # Send user back to homepage
    logger.info("[TRACE] pdg_login/callback end " + trace_id + "]")
    return redirect(url_for("navigation", referrer="login"))


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
    return redirect(url_for("index", referrer="logout"))
