In mathematical physics there a certain words that have specific meanings:
- *Trivial*: The instructor knows the answer and assumes you should too.
- *Obvious*: The instructor has seen the proof before, but can't remember it right now.
- *Non-trivial*: The instructor doesn't know the answer.
- *Left as an exercise to the reader*: The instructor doesn't know how to solve it.

# The Physics Derivation Graph project makes the "trivial" explicit

The Physics Derivation Graph provides a web server for building, managing, and exploring mathematical derivations in physics (and potentially other fields). 
The Physics Derivation Graph is an interface for knowledge management software tailored for structured mathematical reasoning. The intended audience includes physicists, mathematicians, and other researchers who need to create, manage, and validate derivations. For additional documentation see [https://allofphysics.com/documentation/overview](https://allofphysics.com/documentation/overview?referrer=github-allofphysicsgraph-ui_v8_website_flask_neo4j-README)

The questions motivating this project are
1) Is every expression in physics related to all other expressions in physics? 
2) Naively the expected answer is yes, but then how are expressions in physics related?
(I'm using "expression" to include equations and inequalities.)

A claim to validate is that a directed graph exists which describes all of mathematical Physics.

There are a couple consequences of framing mathematical physics expressions as a directed graph:
- This graph-centric approach to expressions does not include geometric aspects of physics. Force diagrams, optics diagrams, electromagnetic diagrams are [not in scope](https://allofphysics.com/documentation/design_choices?referrer=github-allofphysicsgraph-ui_v8_website_flask_neo4j-README#not%20in%20scope).
- [Inference rules](https://allofphysics.com/documentation/user?referrer=github-allofphysicsgraph-ui_v8_website_flask_neo4j-README#inference%20rules) (the things that connect expressions in the form of a derivation step) can be a subject of study.

One could stop the analysis at this point. Or another question might be tempting:<BR>
3) could the analysis be done using a computer?<BR>
A second claim could be evaluated: the graph representation of mathematical physics is machine parsable.

The Physics Derivation Graph is software that supports investigation of how and whether expressions in mathematical physics are related. 

Once a computer is introduced, new questions arise:<BR>
4) Can steps be checked?<BR>
5) How formal can the check be?

Machine-parsable representations of mathematical physics can be checked by a Computer Algebra Systems (CAS). Steps involving an inference rule and two or more expressions could be checked using Lean Theorem Prover.

This repo is an evolution from previous attempts to investigate the above questions. This repo contains a new web interface, new APIs, and a new backend: Neo4j property graph. The previous version that is currently used for <https://allofphysics.com/> is <https://github.com/allofphysicsgraph/ui_v7_website_flask_json>.

# Status

The website and back-end work. Some [APIs](https://allofphysics.com/documentation/api?referrer=github-allofphysicsgraph-ui_v8_website_flask_neo4j-README) are operational. The Docker images in this repo are used for <https://allofphysics.com/>.

# Quickstart

Launching locally will require generating the certificates for https. See `certs/README.md`

Assuming [Docker](https://en.wikipedia.org/wiki/Docker_(software)) is running, to start the containers use
```bash
make container_build
make launch_webserver
```
and then, in a web browser, go to <http://localhost>


Some pages require [Google authentication](https://www.google.com/account/about/sign-in-with-google/). To configure this for running your webserver locally you can either
- edit your Google Auth Platform Clients on <https://console.cloud.google.com/>
or 
- remove the `@login_required` decorator in `pdg_app.py`



Because software is in Docker containers (for reproducibility), the versions of the Docker software you're using matter. The software in this repo has been tested with
* `docker compose version` yields "2.34.0-desktop.1" on a Mac Airbook arm64; "v2.2.1" on a Mac Airbook amd64
* Compose file format 3.6
* `docker --version` yields "Docker version 28.0.4, build b8034c0" on a Mac Airbook arm64; "Docker version 20.10.11" on a Mac Airbook amd64
See <https://docs.docker.com/compose/compose-file/compose-versioning/> for compatibility of versions.

## Project contents

Two containers are managed using [docker compose](https://docs.docker.com/compose/): [Neo4j](https://hub.docker.com/_/neo4j) (port 7474) and a Flask-based Python web server (port 5000).

## Neo4j for newbies

A graph has "nodes" and "edges". A [property graph](https://en.wikipedia.org/wiki/Property_graph) extends that
data structure to allow "properties" for both the nodes and the edges.

In general, nodes in Neo4j are described using the following jargon:

```
:label {key1:'value1', key2:'value2'}
```

where the key-value pairs are properties. 

For examples of queries, see <https://allofphysics.com/query>

Node labels, relationship types, and properties (the key part) are case sensitive. [citation](https://neo4j.com/docs/getting-started/current/appendix/graphdb-concepts/)

# Goals

- [x] Document Derivations. Provide a structured way to represent mathematical derivations by breaking them into steps, expressions, and symbols.
- [x] Facilitate Collaboration and Sharing by using open source and publicly accessible information.
- [x] Enable programmatic interaction with the data using both a web interface and API.
- [x] Demonstrate use of SymPy to validate dimensional consistency of expressions.
- [x] Demonstrate use of SymPy to validate derivation steps.
- [ ] Check a step using Lean Theorem Prover.
- [ ] Validate the claim that all expressions in mathematical physics are related by a finite number of inference rules.
- [ ] Determine what inference rules are necesssary to document all derivations in mathematical physics.

# Licensing

The content of this repo is covered by the 
[Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)


# Software Requirements

Software has been run on Mac and Linux. 
* Docker containers
* `git` version control
* `make` for building software
* a web browser to view HTML pages.

## Key features

The architecture is Neo4j-Flask-Gunicorn-Nginx all inside a Docker container on an Ubuntu VPS that includes UFW.

The Docker images include the software needed for the webserver (Python Flask):
* [Latex](https://en.wikipedia.org/wiki/LaTeX) for rendering equations as PNG and PDF
* [SymPy](https://www.sympy.org/) for validating steps in derivations
* [Lean](https://en.wikipedia.org/wiki/Lean_(proof_assistant)) for Theorm Proving
* [Graphviz](https://graphviz.org/) for static visualization of graphs
* [d3js](https://d3js.org/) for interactive visualizations of graphs

See VERSIONS.md for details.

## Debugging

The `Makefile` contains targets that are relevant for validating modifications:
- `make black_out` checks formatting and syntax
- `make mypy_out` check type hints
- `make pytest_out` runs tests

To enter the container for debugging purposes,
```bash
docker exec -it `docker ps | grep ui_v8_website_flask_neo4j_webserver | cut -d' ' -f1` /bin/bash
```

Stuck? Contact the author for help! (See the bottom of <https://allofphysics.com/> and the "contact" link.)

## Contributing

See CONTRIBUTING.md in this repo for guidance.


# Licensing

Unless otherwise noted, all source code is covered by the [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/)

# Why

The "why" for this project of documenting mathematical physics is merely intellectual curiosity. 
There's [no competition](https://allofphysics.com/documentation/other_projects?referrer=github-allofphysicsgraph-ui_v8_website_flask_neo4j-README), [no leaderboard](https://github.com/allofphysicsgraph/task-tracker/issues/52), and no potential for profit. The author of this project gets to be a dilettante!

# Benefits

- Specifying symbols and operations used in expressions ensures clarity to readers of the author's intent. (No more "what is x?")
- Formalization can reduce the incidence of mistakes in derivations using rigorous mathematical validation.
- There is educational value in explicitly identifying the inference rules and assumptions for a derivation.

#EOF
