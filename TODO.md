# Context

This file aggregates issues and ideas that have not yet made it onto github's issue tracker or moved to documentation.

implementation agnostic tasks: <https://github.com/orgs/allofphysicsgraph/projects/2>

issues from ui_v8: <https://github.com/orgs/allofphysicsgraph/projects/4>

The following is unordered. Most are associated with the web-based workflow.

---

On the page
https://localhost/list_constant_values/0000001370
there should be options to
- delete existing value
- edit existing value

---

Entering sympy for expression is awkward 
--> to try: https://pypi.org/project/latex2sympy2/

---

There was no selection of operations when entering an expression 
--> see `expression_create_symbols_and_operations.html`

---

Larger font for relation dropdown, specifically propto
- `\large` didn't help

see `expression_create.html`

---

Associating expressions with step is awkward - looking through the dropdown is tedious 

---

Figuring out whether the expression (or symbol) already exists is difficult 

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

to verify:
- BUG: SymPy-to-be-edited not displayed in edit_expression

---


Update symbols and operators
https://en.wikipedia.org/wiki/List_of_common_physics_notations

---

Given the existing HTML page for expression entry, I bet Gemini could figure out how to automate the analysis latex by mathjax dynamically rather than the user pushing the button manually to check latex syntax

---

add to other projects

<https://www.facebook.com/AssumptionsOfPhysics>

<https://www.facebook.com/profile.php?id=100066917799608>

---


Lean to C++
https://proofassistants.stackexchange.com/questions/1388/how-to-run-the-main-function-in-lean-4


# Where to start with Lean in PDG 

simple derivations, like the quadratic equation
<https://allofphysics.com/review_derivation/000011/>
or the mass of the Earth
<https://allofphysics.com/review_derivation/527822/>
are "just algebra"

<https://atomslab.github.io/LeanChemicalTheories/adsorption/langmuir_kinetics.html>


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

Document how each inference rule operates on ASTs

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


EOF
