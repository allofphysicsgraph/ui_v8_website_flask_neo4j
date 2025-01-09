import time

import neo4j
from neo4j import GraphDatabase

import neo4j_query

import logging

logger = logging.getLogger(__name__)

# Database Credentials
# "bolt" vs "neo4j" https://community.neo4j.com/t/different-between-neo4j-and-bolt/18498
uri = "bolt://neo4j_docker:7687"
# userName        = "neo4j"
# password        = "test"


# ORDERING: must come after constrain_id_to_be_unique
# Connect to the neo4j database server
neo4j_available = False
while not neo4j_available:
    logger.info("TRACE: started while loop")
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
