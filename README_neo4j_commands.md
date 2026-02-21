The schema-as-enacted is determined by searching for the string
```
CREATE (
```
in the file `neo4j_query.py`. 

The output of <https://neo4j.com/docs/apoc/current/overview/apoc.meta/apoc.meta.stats/> is, as of 2026-02-21,
```
"propertyKeyCount": 53,
"nodeCount": 2149,
"relCount": 5691,
"relTypeCount": 7,
"labelCount": 12,
"labels": {
    "expression": 632,
    "operation": 40,
    "derivation": 44,
    "symbol": 241,
    "scalar": 227,
    "inference_rule": 94,
    "value_with_units": 20,
    "vector": 14,
    "relation": 10,
    "feed": 356,
    "step": 712,
},
"relTypes": {
    "()-[:HAS_STEP]->()": 712,
    "()-[:HAS_STEP]->(:step)": 712,
    "(:derivation)-[:HAS_STEP]->()": 712,

    "()-[:HAS_SYMBOL]->()": 2493,
    "()-[:HAS_SYMBOL]->(:symbol)": 2493,
    "()-[:HAS_SYMBOL]->(:scalar)": 2430,
    "()-[:HAS_SYMBOL]->(:vector)": 63,
    "(:feed)-[:HAS_SYMBOL]->()": 376,
    "(:expression)-[:HAS_SYMBOL]->()": 2117,

    "(:step)-[:HAS_INFERENCE_RULE]->()": 712,
    "()-[:HAS_INFERENCE_RULE]->(:inference_rule)": 712,
    "()-[:HAS_INFERENCE_RULE]->()": 712,

    "(:step)-[:HAS_INPUT]->()": 732,
    "()-[:HAS_INPUT]->()": 732,
    "()-[:HAS_INPUT]->(:expression)": 732,

    "()-[:HAS_VALUE]->(:value_with_units)": 20,
    "(:scalar)-[:HAS_VALUE]->()": 20,
    "(:symbol)-[:HAS_VALUE]->()": 20,
    "()-[:HAS_VALUE]->()": 20,

    "()-[:HAS_OUTPUT]->()": 667,
    "(:step)-[:HAS_OUTPUT]->()": 667,
    "()-[:HAS_OUTPUT]->(:expression)": 667,

    "()-[:HAS_FEED]->()": 355,
    "(:step)-[:HAS_FEED]->()": 355,
    "()-[:HAS_FEED]->(:feed)": 355,
}
```

https://neo4j.com/docs/api/python-driver/current/api.html#neo4j.Result
keywords:
https://neo4j.com/docs/cypher-manual/current/clauses/match/
https://neo4j.com/docs/cypher-manual/current/clauses/create/
https://neo4j.com/docs/cypher-manual/current/clauses/merge/
https://neo4j.com/docs/cypher-manual/current/clauses/where/
https://neo4j.com/docs/cypher-manual/current/clauses/with/

To get inside a running container,
```bash
docker exec -it `docker ps | grep property_graph_webserver | cut -d' ' -f1` /bin/bash
```

# How to run on the command line inside the docker container:
```python3
import neo4j
from neo4j import GraphDatabase
uri = "bolt://neo4j_docker:7687"
graphDB_Driver = GraphDatabase.driver(uri)

def apoc_help(tx):
    for record in tx.run("CALL apoc.help('text')"):
        print(str(record))

with graphDB_Driver.session() as session:
    session.read_transaction(apoc_export_json)
```

```python3
def create_step(tx):
    """
    works
    """
    tx.run("CREATE (a:step {id:'5'})")
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    step_id="6"
    result = tx.run("CREATE (a:step {id:"+step_id+", name:\"Ben\"})")
    # returns "None" when command is successful and there is no RETURN statement.
    print("result=",result)
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    step_id="6"
    result = tx.run("CREATE (a:step {id:"+step_id+", name:\"Ben\"}) RETURN a.name")
    print("result=",result)
    # result= <neo4j.work.result.Result object at 0x7f99559780d0>
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    step_id="6"
    result = tx.run("CREATE (a:step {id:"+step_id+", name:\"Ben\"}) RETURN a.name")
    print("result=",result.single())
    # result= <Record a.name='Ben'>
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    step_id="6"
    result = tx.run("CREATE (a:step {id:"+step_id+", name:\"Ben\"}) RETURN a.name")
    print("result=",result.value())
    # result= ['Ben']
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    step_id="6"
    for record in tx.run("MATCH (b:step) WHERE b.id="+str(step_id)+" RETURN b"):
        print("record=",record.value())
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    result = tx.run("MATCH (n:derivation) RETURN n")
    print("result=",result.value())
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)

def create_step(tx):
    """
    works
    """
    derivation_id="7412059"
    for record in tx.run("MATCH (b:derivation) WHERE b.id=\""+str(derivation_id)+"\" RETURN b"):
        print("record=",record.value())
    return

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)



def create_step(tx):
    """
    does not work!
    """
    derivation_id="7412059"
    step_id="6"
    result = tx.run("MATCH (a:derivation) "
                    "WHERE a.id=\""+derivation_id+"\" "
                    "WITH (a)"
                    "MATCH (b:step) "
                    "WITH (a,b) "
                    "WHERE b.id=\""+str(step_id)+"\" "
                    "RETURN *")
    print("result=",result.single())

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)



def create_step(tx):
    """
    does not work!
    """
    derivation_id="7412059"
    step_id="6"
    result = tx.run("MATCH (a:derivation),(b:step) "
        "WHERE a.id=\""+derivation_id+"\" AND b.id=\""+str(step_id)+"\" RETURN a,b")
    print("result=",result.single())

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)


def create_step(tx):
    """
    works
    """
    derivation_id="7412059"
    step_id="7703367"
    result = tx.run("MATCH (a:derivation),(b:step) "
        "WHERE a.id=\""+derivation_id+"\" AND b.id=\""+str(step_id)+"\" "
        "MERGE (a)-[r:HAS_STEP]->(b) RETURN r")
    print("result=",result.value())

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)


def create_step(tx):
    """
    works
    """
    derivation_id="7412059"
    step_id="7703367"
    result = tx.run("MATCH (a:derivation),(b:step) "
        "WHERE a.id=\""+derivation_id+"\" AND b.id=\""+str(step_id)+"\" "
        "MERGE (a)-[r:HAS_STEP {aprop:\"1\"}]->(b) RETURN r")
    print("result=",result.value())

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)


def create_step(tx):
    derivation_id="7412059"
    result = tx.run(
        "MATCH (a:derivation) "
        "WHERE a.id=\""+derivation_id+"\" "
        "CREATE (a)-[r:HAS_STEP]->(b:step {prop: \"cool\"})")
    print("result=",result.single())

with graphDB_Driver.session() as session:
    session.write_transaction(create_step)
```
