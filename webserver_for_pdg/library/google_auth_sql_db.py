#!/usr/bin/env python3

# from https://realpython.com/flask-google-login/

"""
This module contains a set of SQL read/write functions needed for the Google Login capability
"""

# http://flask.pocoo.org/docs/1.0/tutorial/database/
import sqlite3

import click
from flask import current_app, g
from flask.cli import with_appcontext
import logging
from typing import Optional, Any
from .tracing import trace_execution, trace_id_var

logger = logging.getLogger(__name__)


@trace_execution
def get_db() -> sqlite3.Connection:
    # logger.info("[TRACE] google_auth_sql_db/get_db")
    if "db" not in g:
        g.db = sqlite3.connect("users_sqlite.db", detect_types=sqlite3.PARSE_DECLTYPES)
        g.db.row_factory = sqlite3.Row

    return g.db


@trace_execution
def close_db(e: Optional[BaseException] = None) -> None:
    # logger.info("[TRACE] google_auth_sql_db/close_db]")

    db = g.pop("db", None)

    if db is not None:
        db.close()


@trace_execution
def init_db() -> None:
    # logger.info("[TRACE] google_auth_sql_db/init_db")
    db = get_db()

    with current_app.open_resource("schema.sql") as f:
        try:
            db.executescript(f.read().decode("utf8"))
        except Exception as err:
            logger.error("sql_db.py init_db error with schema.sql:" + str(err))

    logger.debug("ran schema.sql")


@click.command("init-db")
@with_appcontext
@trace_execution
def init_db_command() -> None:
    """Clear the existing data and create new tables."""
    # logger.info("[TRACE] google_auth_sql_db/init_db_command")
    init_db()


#    click.echo("Initialized the database.")


@trace_execution
def init_app(app: Any) -> None:
    # logger.info("[TRACE] google_auth_sql_db/init_app")
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)


# EOF
