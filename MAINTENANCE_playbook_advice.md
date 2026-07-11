
# Use of LLMs

https://aistudio.google.com/usage
https://aistudio.google.com/rate-limit

Is aistudio up? https://aistudio.google.com/status

2026-07-11: Google's API rate limit and the aistudio rate limit may be separate?
https://ai.google.dev/gemini-api/docs/rate-limits

aistudio with Gemini Pro models may be limited to 25 requests per day

Requests Per Day (RPD) which reset at midnight Pacific time.

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


There's also a script for comparing PDG CSV dumps: 
`allofphysicsgraph/ui_v8_website_flask_neo4j/webserver_for_pdg/static/compare_pdg_CSV.py`


# backlog, aka opportunities

implementation agnostic tasks: https://github.com/orgs/allofphysicsgraph/projects/2

highlights from ui_v8: <https://github.com/orgs/allofphysicsgraph/projects/4>


The following is unordered


coverage to track what gets runcoverage of tests

Move `allofphysicsgraph/ui_v8_website_flask_neo4j/documentation_manual/design_decisions.log` to 
`allofphysicsgraph/ui_v8_website_flask_neo4j/webserver_for_pdg/templates/jinja2_pages/documentation_of_design_choices.html`

- more content - scope
   - DEPENDS ON automate ingest of papers; see https://allofphysics.com/llm_workflow_documentation
      - DEPENDS ON API functionality. Is that complete?


- checking of steps --  inference rules, dimensionality, lean; https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/21


- revise https://allofphysics.com/navigation to have the dependency graph visualization

- generate sphinx documentation: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/tree/gh-pages/documentation_generated_sphinx


- review https://github.com/orgs/allofphysicsgraph/projects/4


## Recurring

See also the "recurring" board on https://github.com/orgs/allofphysicsgraph/projects/2 for implementation agnostic recurring tasks.

- pytests failures 
- coverage


Documentation:
- update https://allofphysics.com/documentation/api 
- update https://allofphysics.com/workflow_documentation
