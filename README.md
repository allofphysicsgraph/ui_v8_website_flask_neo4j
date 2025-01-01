This repo contains a new web UI (still using flask) and a new backend -- Neo4j. The previous version that is currently used for <https://allofphysics.com/> is <https://github.com/allofphysicsgraph/ui_v7_website_flask_json>

# Status

The website and back-end work locally.

# Quickstart

To start the containers, run
```bash
make up
```
and then, in a web browser, go to <http://localhost:5000>


Because software is in Docker containers (for reproducibility), the versions of the Docker software you're using matter. The software in this repo has been tested with
* `docker compose version` yields "v2.2.1"
* Compose file format 3.6
* `docker --version` yeilds "Docker Engine release 20.10.11"
See <https://docs.docker.com/compose/compose-file/compose-versioning/> for compatibility of versions.

# Project contents
Two containers: Neo4j (port 7474) and a flask web server (port 5000)

# Neo4j for newbies

A graph has "nodes" and "edges". A property graph extends that
data structure to allow "properties" for both the nodes and the edges.

Nodes and edges in Neo4j are described using the following jargon:

    :label {key1:'value1', key2:'value2'}

where the key-value pairs are properties. The schema is effectively the labels and keys for edges and nodes.

"Node labels, relationship types, and properties (the key part) are case sensitive." (citation)[https://neo4j.com/docs/getting-started/current/appendix/graphdb-concepts/]

# Licensing


[Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)


# Software Requirements

* Docker
* a web browser

# Contributing

Before submitting code via a pull request, please open an issue (feature or bug) and describe your question or intent.

Python code is formatted using Black.
