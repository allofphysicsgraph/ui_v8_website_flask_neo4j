
# Use of LLMs

## Google

https://aistudio.google.com/usage
https://aistudio.google.com/rate-limit

Is aistudio up? https://aistudio.google.com/status

2026-07-11: Google's API rate limit and the aistudio rate limit may be separate?
https://ai.google.dev/gemini-api/docs/rate-limits

aistudio with Gemini Pro models may be limited to 25 requests per day

Requests Per Day (RPD) which reset at midnight Pacific time.

## Claude from Anthropic

<https://platform.claude.com/usage>

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

implementation agnostic tasks: <https://github.com/orgs/allofphysicsgraph/projects/2>

highlights from ui_v8: <https://github.com/orgs/allofphysicsgraph/projects/4>


The following is unordered

- log file analysis: https://github.com/allofphysicsgraph/task-tracker/issues/41
  - figure out how to distinguish bots from human users
  - for human users, write a script that generates a 

- GOAL: better coverage; see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/138
  - DEPENDS ON enact pytests per function on scripts in `library` to evaluate whether I've unintentionally made breaking changes


- more content - scope
  - DEPENDS ON automate ingest of papers; see https://allofphysics.com/llm_workflow_documentation
    - DEPENDS ON API functionality. Is that complete?
      - DEPENDS ON api auth: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/56
        - DEPENDS ON enact API endpoints: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/141
          - DEPENDS ON move all compute out of pdg_app to support API use https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/69


- CAPABILITY: checking of steps --  inference rules, dimensionality, lean; https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/21


- FEATURE: revise https://allofphysics.com/navigation to have the (old) dependency graph visualization PNG



## Recurring

See also the "recurring" board on https://github.com/orgs/allofphysicsgraph/projects/2 for implementation agnostic recurring tasks.

- pytests failures 
- coverage evaluation; see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/138
- sphinx documentation


Documentation to be refreshed:
- update https://allofphysics.com/documentation/api 
- update https://allofphysics.com/workflow_documentation
