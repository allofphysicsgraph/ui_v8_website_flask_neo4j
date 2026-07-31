#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import time
import logging
import os
from typing import Any

# for the exceptions
import neo4j  # type: ignore[import-untyped]
from neo4j import GraphDatabase

from . import neo4j_query
from .tracing import trace_execution, trace_id_var

logger = logging.getLogger(__name__)

# Database Credentials
# "bolt" vs "neo4j" https://community.neo4j.com/t/different-between-neo4j-and-bolt/18498
# userName        = "neo4j"
# password        = "test"


# Instead of executing the connection loop and constraint creation
# immediately upon module import, wrap it inside a getter function (get_graphdb_driver).
# This ensures that the connection code is only triggered the first
# time a database session is actually requested.


# Private module-level cache for the driver instance
_driver = None


@trace_execution
def get_graphdb_driver() -> Any:
    """
    Lazily initializes and returns the Neo4j GraphDatabase driver.
    Blocks and retries until Neo4j is available on first access.
    """
    global _driver
    if _driver is None:
        uri = os.environ.get("NEO4J_URI", "bolt://neo4j_docker:7687")
        neo4j_available = False

        while not neo4j_available:
            logger.info("[TRACE] attempting to connect to Neo4j...")
            try:
                candidate_driver = GraphDatabase.driver(uri)

                # Test connection and apply unique ID constraint on startup/first connection
                with candidate_driver.session() as session:
                    session.write_transaction(neo4j_query.constrain_unique_id)

                _driver = candidate_driver
                neo4j_available = True
                logger.info(
                    "[TRACE] successfully connected to Neo4j and verified constraints."
                )

            except (
                neo4j.exceptions.ServiceError,
                neo4j.exceptions.ClientError,
                ValueError,
            ) as er:
                logger.info(f"Neo4j not ready (waiting 5 seconds): {er}")
                time.sleep(5)

    return _driver


# EOF
