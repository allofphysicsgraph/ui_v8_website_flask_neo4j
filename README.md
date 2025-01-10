The Physics Derivation Graph is web server for building, managing, and exploring mathematical derivations in physics (and potentially other fields). Knowledge management software tailored for structured mathematical reasoning.

The Physics Derivation Graph combines a user-friendly interface with rigorous mathematical capabilities. The intended audience includes physicists, mathematicians, and other researchers who need to create, manage, and validate derivations.


The Physics Derivation Graph supports investigation of the following claims:
- Claim: a directed graph exists which describes all of mathematical Physics.
- Claim: the graph representation is machine parsable.

This repo contains a new web interface and a new API and a new backend -- Neo4j property graph. The previous version that is currently used for <https://allofphysics.com/> is <https://github.com/allofphysicsgraph/ui_v7_website_flask_json>

# Status

The website and back-end work. The Docker images are not currently in use for <https://allofphysics.com/>

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

## Project contents
Two containers managed using docker compose: Neo4j (port 7474) and a Flask-based Python web server (port 5000)

## Neo4j for newbies

A graph has "nodes" and "edges". A property graph extends that
data structure to allow "properties" for both the nodes and the edges.

In general, nodes in Neo4j are described using the following jargon:

    :label {key1:'value1', key2:'value2'}

where the key-value pairs are properties. 

"Node labels, relationship types, and properties (the key part) are case sensitive." [citation](https://neo4j.com/docs/getting-started/current/appendix/graphdb-concepts/)

# Goals

[x] Document Derivations. Provide a structured way to represent mathematical derivations by breaking them into steps, expressions, and symbols.
[x] Facilitate Collaboration and Sharing by using open source and publicly accessible information.
[x] Enable programmatic interaction with the data using both a web interface and API.

# Licensing

The content of this repo is covered by the 
[Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)


# Software Requirements

* Docker
* a web browser

## Key features

The Docker images include the software needed for the webserver (Python Flask) and everything else 
* Latex for rendering equations as PNG and PDF
* SymPy for validating steps in derivations
* TODO: Lean
* Graphviz for static visualization of graphs
* d3js for interactive visualizations of graphs

See VERSIONS.md for details

# Contributing

Before submitting code via a pull request, please [open an issue](https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues) (whether to report a bug or ask for a feature) and describe your question or intent.

Python code is formatted using Black. 
