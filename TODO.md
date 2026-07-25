
---

Schema specification for LLM inputs should be in the static folder so that it can be referenced by both the blog page and the script that checks the consistency of the JSON files

---

Once the expressions have been identified with PDG ID, mechanically update the latex derivation before working on steps and inference rules

---

Joining the symbols, operations, and expressions is mechanical, so a Python script can
1) validate the schema of each file
2) execute neo4j to add the data to the database

---

Enact a review web page where the user is presented a random similarity question. For example, a latex expression and a sympy expression. Another example would be a lot of tech expression and a symbol. The user then provides a vote as to whether these are likely matched or mismatched.
The vote tally could then be recorded as a property for the edge

added a blog post exploring this

---

On the page
https://localhost/list_constant_values/0000001370
there should be options to
- delete existing value
- edit existing value

---

Entering sympy for expression is awkward 
--> to try: https://pypi.org/project/latex2sympy2/

On the Sympy-for-expression page it would be helpful to have a live conversion box where I put in a simplified latex and get back the Sympy version 

--> Create an API endpoint facilitate this

https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/134

---

When returning the list of potential variables in an expression, use the list of variables in the derivation to check those boxes by default

https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/135

---

There was no selection of operations when entering an expression 
--> see `expression_create_symbols_and_operations.html`

---

Larger font for relation dropdown, specifically propto
- `\large` didn't help

see `expression_create.html`

---

Associating expressions with step is awkward - looking through the dropdown is tedious 
--> Need a fuzzy search: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/18

---

Figuring out whether the expression (or symbol) already exists is difficult 
--> Need a fuzzy search: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/18

Once the latex has the list of variables and symbols and operations and expressions, the next step is to discover whether those already exist in the databaseIn a typical latex document each expression only appears once
Need to figure out whether those unique list of expressions are already in the database
- Generate a list (JSON?) of the symbols that could be then checked against the list of symbols in a lot of document. Don't compare every symbol from PDG; use fuzzy search to reduce the list.
- Generate a list (JSON?) of the expressions to be matched against the table. Don't compare every expression from PDG; use fuzzy search to reduce the list.
- Generate a list (JSON?) of the inference rules to be compared against the HTML table produced from the latex

The comparison can be piecewise - for each symbol, and for each expression

---

Getting from a detailed latex document to step input is awkward 
- Does "Latex to HTML table" help? See https://localhost/from_llm

SHO - https://github.com/allofphysicsgraph/task-tracker/issues/2


https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/133

---

pytest for logged in pages

---

\propto means dimensional consistency does not apply 
example: 
F \propto m

--- 

In derivation review show condition for expressions

--- 

Add note that kepler third law is observation 

---

Delete the manual `trace_id` and `query_time_dict`; replace it with Flask's `@app.before_request` and `g` object.

---

in `sympy_validate_expression/dimensional_consistency`
there's an `eval` to eliminate

---

Playwright tests: https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/107

---

to verify:
- BUG: SymPy-to-be-edited not displayed in edit_expression

---


Update symbols and operators
https://en.wikipedia.org/wiki/List_of_common_physics_notations

---

Prompt:
What inconsistencies are there? Bad coding implementation, or naming conventions, or design flaws for example.

---

Given the existing HTML page for expression entry, I bet Gemini could figure out how to automate the live analysis of mathjax output rather than pushing the button manually

---

validates lean capability using T, f
https://github.com/allofphysicsgraph/task-tracker/issues/105

In the lean repo, do I have examples of multiply both sides by and divide both sides by?

A significant use case is supplemental material for any paper that includes equations. There are two sub cases 
- Documenting the derivations within the paper such that the supplemental material is self-contained 
- The second sub case is indicating the relation between the equations used in this paper and equations used in any other paper

---

email alerts - https://github.com/allofphysicsgraph/task-tracker/issues/137

---

add column for status on other projects for categories like active, idle, unavailable

---

Move content out of "todo.md"

---

(manually) eliminate all errors on webpages
https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues?q=is%3Aissue%20state%3Aopen%20type%3ABug


Use selenium to automate opening all pages from site map

---

add to other projects

<https://www.facebook.com/AssumptionsOfPhysics>

<https://www.facebook.com/profile.php?id=100066917799608>

---


Lean to C++
https://proofassistants.stackexchange.com/questions/1388/how-to-run-the-main-function-in-lean-4

# Lean education resources 

<https://leanprover.github.io/lean4/doc/dev/index.html>
https://leanprover.github.io/lean4/doc/setup.html
https://leanprover-community.github.io/install/project.html

https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency

https://lovettsoftware.com/NaturalNumbers/Tactics.lean.html
https://lovettsoftware.com/NaturalNumbers/TutorialWorld/Level2.lean.html


# Where to start with Lean in PDG 

simple derivations, like the quadratic equation
<https://allofphysics.com/review_derivation/000011/>
or the mass of the Earth
<https://allofphysics.com/review_derivation/527822/>
are "just algebra"

<https://atomslab.github.io/LeanChemicalTheories/adsorption/langmuir_kinetics.html>


---

=== cypher ===
https://graphaware.com/neo4j/2014/07/31/cypher-merge-explained.html

---

In 2018 Mathematica added inference rules
https://reference.wolfram.com/language/ref/ApplySides.html
https://reference.wolfram.com/language/guide/FormulaManipulation.html
https://reference.wolfram.com/language/guide/ManipulatingEquations.html

Maybe the Mathematica team was inspired by Physics Derivation Graph?

---

[PDG] math example project
<https://news.columbia.edu/news/stacks-project-johan-dejong>
<https://www.math.columbia.edu/~dejong/wordpress/?p=4573>
<https://stacks.math.columbia.edu/>
<https://news.ycombinator.com/item?id=30222302>

<https://milan.cvitkovic.net/writing/market_failures_in_science/>
<https://markusstrasser.org/p/bcd8bded-7136-4bb4-8f97-e8a3a7b6d926/>
<https://markusstrasser.org/companies-knowledge-discovery/>

---

[PDG] kwarc notes
slack-like channel for chat:https://mattermost.kwarc.info/kwarc/channels/sigmathling
is linked from https://sigmathling.kwarc.info/seminar/

Mailing list
https://lists.informatik.uni-erlangen.de/mailman/listinfo/sigmathling

---

Document how each inference rule operates on ASTs

---

[graph query]
Are there tuples or triples of inference rules that imply a larger inference rule?

---

A Mathematical Approach to Ontology Authoring and Documentation
https://link.springer.com/chapter/10.1007/978-3-642-02614-0_31

Ontologies and languages for representing mathematical knowledge on the Semantic Web
https://dl.acm.org/doi/10.5555/2590215.2590217

Mathematical Ontological Browser - NOMAT
https://www.revistaespacios.com/a17v38n50/a17v38n50p27.pdf

Ontologies and Languages for Representing Mathematical Knowledge on the Semantic Web
https://www.researchgate.net/publication/216796984_Ontologies_and_Languages_for_Representing_Mathematical_Knowledge_on_the_Semantic_Web

---

possible collaboration for PDG on graph viz
https://news.ycombinator.com/item?id=22177942

---

http://bl.ocks.org/norrs/2883411
http://stackoverflow.com/questions/10899725/d3-force-directed-graph-with-drag-and-drop-support-to-make-selected-node-positio

https://jgraph.github.io/mxgraph/javascript/
https://jgraph.github.io/mxgraph/javascript/examples/grapheditor/www/index.html

http://biarri.com/adventures-with-javascript-graphing-libraries/

---

to support: binomials

<https://www.cs.cmu.edu/~adamchik/21-127/lectures/binomials_print.pdf>
<https://en.wikipedia.org/wiki/Binomial_coefficient>
<https://mathworld.wolfram.com/BinomialCoefficient.html>

TODO: find a derivation that leverages binomials

---

what errors does PDG address?

Here's a list
<https://math.vanderbilt.edu/schectex/commerrs/>
<https://news.ycombinator.com/item?id=25135418>

---


EOF
