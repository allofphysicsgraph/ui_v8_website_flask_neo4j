This git repository is the source code files used run a website. The website is launched used docker compose. There are three containers: nginx, neo4j, and flask. The flask container has both a web interface and provides an API. The web interface displays content from the neo4j database. The nodes and edges in the property graph database are aspects of mathematical derivations.

The node types in the graph include derivation, step, expression, symbol, operation, relation. Symbols can be scalar or vector or matrix. Examples of operations include integration, addition, multiplication, sine, cosine. Examples of relations include equals, not equal to, proportional to, greater than, greater than or equal to, less than, less than or equal to.

The purpose of the web interface is to display content from the graph and also serve as a way to constrain users to put in content such that the schema is adhered to.
