#!/usr/bin/env python3

"""
has to be in same directory as pdg_app
"""

import os

from flask import Flask
from flask_wtf import CSRFProtect

# https://github.com/TypeError/secure
import secure  # type: ignore


class Config(object):
    """
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iii-web-forms
    """

    SECRET_KEY = os.environ.get("SECRET_KEY")


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
