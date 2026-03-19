#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import time
import logging

import neo4j  # for the exceptions
from neo4j import GraphDatabase

from . import neo4j_query

logger = logging.getLogger(__name__)

# Database Credentials
# "bolt" vs "neo4j" https://community.neo4j.com/t/different-between-neo4j-and-bolt/18498
uri = "bolt://neo4j_docker:7687"
# userName        = "neo4j"
# password        = "test"


# Connect to the neo4j database server
neo4j_available = False
while not neo4j_available:
    logger.info("[TRACE] started while loop")
    try:
        graphDB_Driver = GraphDatabase.driver(uri)
        neo4j_available = True
        time.sleep(1)
    except ValueError:
        logger.info("waiting 5 seconds for neo4j connection")
        time.sleep(5)

try:
    with graphDB_Driver.session() as session:
        # NO TIMING NEEDED HERE
        session.write_transaction(neo4j_query.constrain_unique_id)

except neo4j.exceptions.ClientError as er:
    logger.info("Neo4j exception: " + str(er))

# EOF
