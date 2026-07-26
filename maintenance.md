
# Use of LLMs

## Google

https://aistudio.google.com/usage
https://aistudio.google.com/rate-limit

Is aistudio up? https://aistudio.google.com/status

2026-07-11: Google's API rate limit and the aistudio rate limit may be separate?
https://ai.google.dev/gemini-api/docs/rate-limits

aistudio with Gemini Pro models may be limited to 25 requests per day

Requests Per Day (RPD) which reset at midnight Pacific time.

## Google's Antigravity CLI 

```
cd bhpayne/google-antigravity-in-container
make
cd ../../allofphysicsgraph/ui_v8_website_flask_neo4j
docker run -it --rm -v `pwd`:/scratch -w /scratch/ antigravity_agent:latest-arm64 /bin/bash
/root/.local/bin/agy
```

7 day reset window. (Chunk tasks into small parts so that termination isn't as disruptive!)

## Claude from Anthropic

<https://platform.claude.com/usage>

## token count in Gemini per file as of 2026-07-23

after removing comments,
- pdg_app.py: 59k
- pdg_api.py: 40k
- sympy_validate_step.py: 35k
- neo4j_query.py: 18k
- compute.py: 10k
- latex.py: 10k
- sympy_validate_expression.py: 2k
- latex_and_sympy.py: 1.3k
- list_of_valid.py: 0.4k

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






## Recurring

See also the "recurring" board on https://github.com/orgs/allofphysicsgraph/projects/2 for implementation agnostic recurring tasks.

- pytests failures 
  - docstring tests
  - `make pytest_out_py`
  - `make pytest_out_web`
- coverage evaluation; see https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/138
- sphinx documentation
- `make mypy_out`


Documentation to be refreshed:
- update https://allofphysics.com/documentation/api 
- update https://allofphysics.com/workflow_documentation



