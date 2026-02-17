
to verify:
- BUG: SymPy-to-be-edited not displayed in edit_expression

---

Goal is to enter a novel derivation
e.g., https://github.com/allofphysicsgraph/task-tracker/issues/162 (F=ma)

What's preventing me from entering a derivation right now?

bug categories:
1) no page should trigger a gunicorn error (which prevent rendering HTML)
2) pages that do render HTML should not have errors (including flash messages)
   - BUG verified 2026-02-16 11:50: on page https://localhost/review_derivation/387954 the validation reports "list index out of range"
   - no derivation has all steps valid. There are many errors in the step validation for most derivations

3) pages that claim a feature but do not enact that feature (e.g., editing a variable or expression or step or infrule or derivation)
4) pages that lack a necessary feature for the workflow (e.g., editing)
   - verified 2026-02-16 11:18 need for missing feature: https://localhost/new_symbol_vector is missing dimensions (length, time, mass)
   - New function in compute: List of all non-operation symbols. Used by new feed when promoting existing symbol

---

Update symbols and operators
https://en.wikipedia.org/wiki/List_of_common_physics_notations

---

Submit neo4j query Python file to Gemini for a code review of suggestions and criticism

Same for the API file

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
<https://allofphysiscs.com/review_derivation/000011/>
or the mass of the Earth
<https://allofphysiscs.com/review_derivation/527822/>
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