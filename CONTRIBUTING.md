
# Contributing to the _Physics Derivation Graph_

Thanks for your interest in improving the project!

To contribute, you can 
 * open a <a href="https://github.com/allofphysicsgraph/proofofconcept/issues/new?assignees=&labels=&template=bug_report.md&title=">bug report</a>
 * open a <a href="https://github.com/allofphysicsgraph/proofofconcept/issues/new?assignees=&labels=&template=feature_request.md&title=">feature request</a>
 * suggest other projects that are similar or relevant by <a href="http://allofphysics.com/faq?referrer=CONTRIBUTING#contact">contacting the developer</a>
 * [modify the code](https://github.com/allofphysicsgraph/proofofconcept/fork) and create alternative implementations
 * ask a question that is not posted on [the FAQ](https://allofphysicsgraph.github.io/proofofconcept/site/faq.html)
 * create a new UI that leverages the existing APIs

Before submitting code via a pull request, please [open an issue](https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues) (whether to report a bug or ask for a feature) and describe your question or intent.

# Developers

See the [developer guide](https://allofphysics.com/documentation/developer?referrer=CONTRIBUTING.md). 

Development is done in [Docker containers](https://en.wikipedia.org/wiki/Docker_(software)). Changes to the code should be evaluated in a Docker container. Novel architecture suggestions should run in a container.  If you can create a minimal <code>Dockerfile</code> and <code>Makefile</code> that shows what your demo does, then I can reliably recreate the demo.

# Skills relevant for Contributors

The Physics Derivation graph relies on a lot of different technologies: git, HTML, Javascript, Jinja2, Flask, Python, [SymPy](https://www.sympy.org/), Docker, Nginx, [Lean](https://en.wikipedia.org/wiki/Lean_(proof_assistant)), Neo4j. To contribute changes requires awareness of how each of these interact, in addition to having college-level familiarity with Physics and Math.

# Agents, AI, LLMs

See AGENTS.md

# Logistics

Having multiple developers working on independent (but coordinated)
aspects would be beneficial, both because the primary author doesn't have the capacity to
explore all avenues and because the primary author doesn't have adequate skills in all areas.
Leveraging what each person is good at and interested in would
yield the most benefit. For example, if you work on SymPy grammar or
formal proofs or graph display or graph search, all of those provide
value the primary author wouldn't otherwise invest in.

Coordinating with another developer on core aspects of the code
base might incur more work and cognitive load that would be
beneficial. The primary author be happy if someone forks the code and rewrites
everything. The primary author is wary of integrating small and medium refactoring
because there's likely to be a big gap in terms of both skill and how
each person thinks about the composition of core functions and
workflow.

# Design Philosophy for the Physics Derivation Graph

* Everything in containers (specifically Docker) to enable portability and isolation.
* calls to Neo4j should be isolated to `neo4j_query.py` 
* Minimal reliance on external dependencies. Because this project should be durable, and because the primary author doesn't want to have to constantly be updating this project to keep it working, more investment in initial implementation is reasonable even at the risk of a bug or lacking a feature in another library. 
* Easy to read the source code for the project. This project may not be completed (ever), so if it is to be durable the PDG will be read by other people.
* Open source. Others should be able to leverage this investment. 
* Free (no cost to users). Minimize the barrier to entry and make the work accessible to the largest audience.
* No advertising. The primary author doesn't have a need for money to be generated and is willing to pay website hosting costs and domain registration costs.
* Limit tracking of users. There is currently no need to determine user behavior beyond what appears in weblogs. Logging in to add/modify/delete content is relevant to address potential vandalism. 
* No profit generation. The primary author doesn't have a need to make money from this effort. 
* Long-term durability of the code and website. No browser-specific hacks. Minimize reliance on version-specific features
* Implement the code and website at a level below the maintainer's competency. 

# Current Blockers that could benefit from attention

* UI design, workflow: adding new content is a tedious process even before the content is ready to enter into the database
* UI design, workflow: the website UI is a laborious process for adding content to the database
* identifying which derivations are most relevant to invest in is tough
* how to check math that SymPy doesn't support
* high barrier to entry: domain expertise in Physics and Math is relevant, as is knowledge of Latex. 
* design flaw: The relation between the visual representation (Latex) and Computer Algebra System (Sympy) is manual and unchecked
* how relevant is the CAS compared to the visual representation? If a step is wrong but the derivation's outcome is correct, what's the impact?
* irrelevance of graph visualizations for individual derivations and the complete graph and simplifications of the complete graph

* what threshold of content is necessary for usefulness to various audiences? (Students, researchers, lay people)
* A lot of MathJax on a webpage makes pages slower to render; https://github.com/allofphysicsgraph/proofofconcept/issues/173
