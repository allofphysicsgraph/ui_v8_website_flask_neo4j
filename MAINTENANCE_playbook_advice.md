

# multiple databases 

There are three different copies of the database:

- the file in version control, `ui_v8_website_flask_neo4j/webserver_for_pdg/static/pdg.cypher`
- the Neo4j content on `localhost`
- the Neo4j content on the live website (<https://allofphysics.com/navigation>) on the VPS

Those can be out-of-sync. The authoritative version is the `pdg.cypher` file in version control, but new derivations generate content into the Neo4j database and must be manually saved to the file in version control.

Once the current content is exported to `pdg.cypher`, that same file must be uploaded to both Neo4j instances.

The 'done' state for synchronization of databases is
- the latest content is in version control in `pdg.cypher'
and
- the `pdg.cypher` in version control is uploaded to the Neo4j database for localhost and the live website.


# database comparisons

The `pdg.cypher` content must be sorted prior to comparison.