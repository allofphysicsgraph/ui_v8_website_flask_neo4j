This git repository is the source code files used run a website. The website is launched used docker compose. There are three containers: nginx, neo4j, and flask. The flask container has both a web interface and provides an API. The web interface displays content from the neo4j database. The nodes and edges in the property graph database are aspects of mathematical derivations.

The node types in the graph include derivation, step, expression, symbol, operation, relation. Symbols can be scalar or vector or matrix. Examples of operations include integration, addition, multiplication, sine, cosine. Examples of relations include equals, not equal to, proportional to, greater than, greater than or equal to, less than, less than or equal to.

The purpose of the web interface is to display content from the graph and also serve as a way to constrain users to put in content such that the schema is adhered to.


To launch the webserver, in the directory `ui_v8_website_flask_neo4j` use
```
make launch_webserver COMPOSE_FLAGS=--detach
```

To end the webserver, in the directory `ui_v8_website_flask_neo4j` use
```
make down
```

To test the Python, in the directory `ui_v8_website_flask_neo4j` use
```
make pytest_out
```
which should be the same as 
```
docker exec --workdir /scratch/tests_of_webpage/playwright/ -it `docker ps | grep flask-webserver | cut -d' ' -f1` pytest
```

If the `docker compose` is active then the website can be accessed from the command line using
```
curl --insecure https://localhost
```

The HATEOAS (Hypermedia As The Engine Of Application State) API is accessible using
```
curl --insecure https://localhost/api/
```

Server logs are useful for debugging. See
```
/home/pdg/ui_v8_website_flask_neo4j/logs
```


Design decisions are documented in 
`ui_v8_website_flask_neo4j/webserver_for_pdg/templates/jinja2_pages/documentation_of_design_choices.html` 
which is rendered as https://allofphysics.com/documentation/design_choices