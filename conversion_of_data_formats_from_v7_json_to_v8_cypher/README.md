
2026-01-31: 

# step 1
copied `data.json` from ui_v7's flask folder

# step 2
ran `v7_json_to_cypher.ipynb` to generate
- deriv.cypher
- infrules.cypher
- operators.cypher
- steps.cypher
- symbols.cypher

# step 3
inside a running `ui_v8_flask_webserver` container I ran
```
cd /scratch/conversion_of_data_formats/
python3 v7_json_to_cypher_expressions.py
```
which produced `expr_and_feed.cypher`

(That was necessary to separate from the .ipynb because splitting expressions on `=` requires SymPy.)

# step 4

I'm not clear on how `symbols_scalar_manual._cypher_` and `symbols_vector_manual._cypher_` were generated,
but I manually compared those to the automatically generated `symbols.cypher` from step 2 above.

# step 5

Upload order mattered for reasons unknown to BHP. The problem was that `steps` and `symbols` both have `MATCH` statements, and that seems to overwrite each other. As a hack-fix, I used

```
cat deriv.cypher                  > no_matches.cypher 
cat expr_and_feed.cypher         >> no_matches.cypher
cat infrules.cypher              >> no_matches.cypher
cat operators.cypher             >> no_matches.cypher
cat symbols_vector_manual.cypher >> no_matches.cypher
cat steps.cypher       > match_used.cypher
cat symbols.cypher    >> match_used.cypher
```
Not clear why I had to separate the `MATCH` and non-MATCH commands.

# step 6

From the ui_v8 web interface I downloaded a single file, `pdg.cypher`

All manual edits in the future should be to `pdg.cypher` and the contents of this folder should be irrelevant.


