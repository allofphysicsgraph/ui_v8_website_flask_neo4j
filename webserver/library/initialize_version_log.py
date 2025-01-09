import sys

import importlib

import logging

logger = logging.getLogger(__name__)


logger.info("python" + str(sys.version))
logger.info(
    "neo4j "
    + str(importlib.metadata.version("neo4j"))
    + " - https://pypi.org/project/neo4j/"
)
logger.info(
    "flask "
    + str(importlib.metadata.version("flask"))
    + " - https://flask.palletsprojects.com/en/3.0.x/"
)
logger.info(
    "secure "
    + str(importlib.metadata.version("secure"))
    + " - https://pypi.org/project/secure/"
)
logger.info(
    "wtforms "
    + str(importlib.metadata.version("wtforms"))
    + " - https://wtforms.readthedocs.io/en/3.1.x/"
)
logger.info(
    "werkzeug "
    + str(importlib.metadata.version("werkzeug"))
    + " - https://werkzeug.palletsprojects.com/en/3.0.x/"
)
logger.info(
    "flask_wtf "
    + str(importlib.metadata.version("flask_wtf"))
    + " - https://flask-wtf.readthedocs.io/en/1.2.x/"
)
