Start here: https://github.com/allofphysicsgraph/task-tracker/issues/2

DERIVATION.tex is from
https://github.com/allofphysicsgraph/task-tracker/issues/167#issuecomment-4120165817


SYMBOLS.json is from
https://github.com/allofphysicsgraph/task-tracker/issues/168#issuecomment-4120343457

SYMBOLS_matched.json and SYMBOLS_missing.json are from
https://localhost/documentation/llm_workflow?referrer=agentic_llm_documentation#symbol%20comparison
using Gemini 3.7 Flash 'medium'. Input is 50,000 tokens for 4 inputs:
- `SYMBOLS_with_local_ID`: 6k tokens
- `pdg_scalars`: 50k tokens
- `pdg_vectors`: 3k tokens
- `pdg_matrices`: 34 tokens
With output `SYMBOLS_matched.json` the context window as 63k tokens.
DEPRECATED: https://github.com/allofphysicsgraph/task-tracker/issues/174


OPERATIONS.json is from
https://github.com/allofphysicsgraph/task-tracker/issues/172


EXPRESSIONS.json is from 
https://github.com/allofphysicsgraph/task-tracker/issues/170