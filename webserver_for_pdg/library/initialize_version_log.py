import sys

# https://docs.python.org/3/library/importlib.html
# for https://docs.python.org/3/library/importlib.metadata.html#module-importlib.metadata
import importlib

from subprocess import PIPE  # https://docs.python.org/3/library/subprocess.html
import subprocess  # https://stackoverflow.com/questions/39187886/what-is-the-difference-between-subprocess-popen-and-subprocess-run/39187984

# https://docs.python.org/3/howto/logging.html
import logging

logger = logging.getLogger(__name__)

proc_timeout = 20

process = subprocess.run(
    ["lsb_release", "-a"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("lake: " + str(stdout))


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
    "sympy "
    + str(importlib.metadata.version("sympy"))
    + " - https://www.sympy.org/en/index.html"
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


process = subprocess.run(
    ["latex", "--version"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("latex: " + str(stdout))

process = subprocess.run(
    ["elan", "--version"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("elan: " + str(stdout))

process = subprocess.run(
    ["lean", "--version"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("lean: " + str(stdout))

process = subprocess.run(
    ["leanc", "--version"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("leanc: " + str(stdout))

process = subprocess.run(
    ["lake", "--version"], stdout=PIPE, stderr=PIPE, timeout=proc_timeout
)
stdout = process.stdout.decode("utf-8")
stderr = process.stderr.decode("utf-8")
logger.info("lake: " + str(stdout))
