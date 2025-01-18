:begin
UNWIND [{id:"111876",
         properties:{name_latex:"LHS of expr 1 equals LHS of expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"LHS of Eq.~\ref{eq:#1} is equal to LHS of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111373",
         properties:{name_latex:"RHS of expr 1 equals RHS of expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"RHS of Eq.~\ref{eq:#1} is equal to RHS of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111981",
         properties:{name_latex:"X cross both sides by",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Take cross product of $#1$ and Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111193",
         properties:{name_latex:"X dot both sides",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Take inner product of $#1$ with Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111900",
         properties:{name_latex:"add X to both sides",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Add $#1$ to both sides of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111761",
         properties:{name_latex:"add expr 1 to expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Add Eq.~\ref{eq:#1} to Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111237",
         properties:{name_latex:"add zero to LHS",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Add zero to LHS of Eq.~\ref{eq:#2}, where $0=#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111723",
         properties:{name_latex:"add zero to RHS",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Add zero to RHS of Eq.~\ref{eq:#2}, where $0=#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111404",
         properties:{name_latex:"apply divergence",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Apply divergence to both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111892",
         properties:{name_latex:"apply function to both sides of expression",
                     number_of_inputs:1,
                     number_of_feeds:2,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"Example: apply sin(x) to 'a = b + c'",
                     TODO_assumptions_latex:"",
                     latex:"Apply function $#1$ with argument $#2$ to Eq.~\ref{eq:#3}; yields Eq.~\ref{eq:#4}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111679",
         properties:{name_latex:"apply gradient to scalar function",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Apply gradient to both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111732",
         properties:{name_latex:"apply operator to bra",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"quantum: Dirac notation",
                     latex:"Apply operator in Eq.~\ref{eq:#1} to bra; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111650",
         properties:{name_latex:"apply operator to ket",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"quantum: Dirac notation",
                     latex:"Apply operator in Eq.~\ref{eq:#1} to ket; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111197",
         properties:{name_latex:"assume N dimensions",
                     number_of_inputs:0,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Assume $#1$ dimensions; decompose vector to be Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111753",
         properties:{name_latex:"both sides cross X",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Take cross product of Eq.~\ref{eq:#2} and $#1$; yields Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111308",
         properties:{name_latex:"both sides dot X",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Take inner product of Eq.~\ref{eq:#2} with $#1$; yields Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111200",
         properties:{name_latex:"boundary condition",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Boundary condition: Eq.~\ref{eq:#2} when Eq.~\ref{eq#1}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111499",
         properties:{name_latex:"boundary condition for expr",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"A boundary condition for Eq.~\ref{eq:#1} is Eq.~\ref{eq:#2}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111230",
         properties:{name_latex:"change five variables in expr",
                     number_of_inputs:1,
                     number_of_feeds:10,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change of variable $#1$ to $#2$ and $#3$ to $#4$ and $#5$ to $#6$ and $#7$ to $#8$ and $#9$ to $#10$ in Eq.~\ref{eq:#11}; yields Eq.~\ref{eq:#12}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111210",
         properties:{name_latex:"change four variables in expr",
                     number_of_inputs:1,
                     number_of_feeds:8,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change of variable $#1$ to $#2$ and $#3$ to $#4$ and $#5$ to $#6$ and $#7$ to $#8$ in Eq.~\ref{eq:#9}; yields Eq.~\ref{eq:#10}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111481",
         properties:{name_latex:"change six variables in expr",
                     number_of_inputs:1,
                     number_of_feeds:12,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change of variable $#1$ to $#2$ and $#3$ to $#4$ and $#5$ to $#6$ and $#7$ to $#8$ and $#9$ to $#10$ and $#11$ to $#12$ in Eq.~\ref{eq:#13}; yields Eq.~\ref{eq:#14}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111120",
         properties:{name_latex:"change three variables in expr",
                     number_of_inputs:1,
                     number_of_feeds:6,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change of variable $#1$ to $#2$ and $#3$ to $#4$ and $#5$ to $#6$ in Eq.~\ref{eq:#7}; yields Eq.~\ref{eq:#8}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111945",
         properties:{name_latex:"change two variables in expr",
                     number_of_inputs:1,
                     number_of_feeds:4,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change variable $#1$ to $#2$ and $#3$ to $#4$ in Eq.~\ref{eq:#5}; yields Eq.~\ref{eq:#6}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111625",
         properties:{name_latex:"change variable X to Y",
                     number_of_inputs:1,
                     number_of_feeds:2,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Change variable $#1$ to $#2$ in Eq.~\ref{eq:#3}; yields Eq.~\ref{eq:#4}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111496",
         properties:{name_latex:"claim LHS equals RHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:0,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Thus we see that LHS of Eq.~\ref{eq:#1} is equal to RHS."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111691",
         properties:{name_latex:"claim expr 1 equals expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:0,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Thus we see that Eq.~\ref{eq:#1} is equivalent to Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111840",
         properties:{name_latex:"combine like terms",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Combine like terms in Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111514",
         properties:{name_latex:"conjugate both sides",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Conjugate both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111508",
         properties:{name_latex:"conjugate function X",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Conjugate $#1$ in Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111576",
         properties:{name_latex:"conjugate transpose both sides",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex valued linear algebra",
                     latex:"Conjugate transpose of both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111304",
         properties:{name_latex:"declare assumption",
                     number_of_inputs:0,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is an assumption."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111701",
         properties:{name_latex:"declare final expr",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:0,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is one of the final equations."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111495",
         properties:{name_latex:"declare guess solution",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"https://en.wikipedia.org/wiki/Ansatz",
                     TODO_assumptions_latex:"",
                     latex:"Judicious choice as a guessed solution to Eq.~\ref{eq:#1} is Eq.~\ref{eq:#2},"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111337",
         properties:{name_latex:"declare identity",
                     number_of_inputs:0,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is an identity."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111896",
         properties:{name_latex:"declare initial expr",
                     number_of_inputs:0,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is an initial equation."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111266",
         properties:{name_latex:"differentiate with respect to",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"differential equations",
                     latex:"Differentiate Eq.~\ref{eq:#2} with respect to $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111345",
         properties:{name_latex:"distribute conjugate to factors",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Distribute conjugate to factors in Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111473",
         properties:{name_latex:"distribute conjugate transpose to factors",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex valued linear algebra",
                     latex:"Distribute conjugate transpose to factors in Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111539",
         properties:{name_latex:"divide both sides by",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Divide both sides of Eq.~\ref{eq:#2} by $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111490",
         properties:{name_latex:"divide expr 1 by expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Divide Eq.~\ref{eq:#1} by Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111604",
         properties:{name_latex:"drop non-dominant term",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Based on the assumption $#1$, drop non-dominant term in Eq.~\ref{#2}; yeilds Eq.~\ref{#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111174",
         properties:{name_latex:"evaluate definite integral",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Evaluate definite integral Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111437",
         properties:{name_latex:"expand LHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Expand the LHS of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111806",
         properties:{name_latex:"expand RHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Expand the RHS of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111425",
         properties:{name_latex:"expand integrand",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Expand integrand of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111752",
         properties:{name_latex:"expand magnitude to conjugate",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Expand $#1$ in Eq.~\ref{eq:#2} with conjugate; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111570",
         properties:{name_latex:"expr 1 is equivalent to expr 2 under the condition",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is equivalent to Eq.~\ref{eq:#2} under the condition in Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111548",
         properties:{name_latex:"expr 1 is true under condition expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Eq.~\ref{eq:#1} is valid when Eq.~\ref{eq:#2} occurs; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111817",
         properties:{name_latex:"factor out X",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Factor $#1$ from Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111914",
         properties:{name_latex:"factor out X from LHS",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Factor $#1$ from the LHS of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111206",
         properties:{name_latex:"factor out X from RHS",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Factor $#1$ from the RHS of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111883",
         properties:{name_latex:"function is even",
                     number_of_inputs:1,
                     number_of_feeds:3,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"$#1$ is even with respect to $#2$, so replace $#1$ with $#3$ in Eq.~\ref{eq:#4}; yields Eq.~\ref{eq:#5}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111673",
         properties:{name_latex:"function is odd",
                     number_of_inputs:1,
                     number_of_feeds:3,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"$#1$ is odd with respect to $#2$, so replace $#1$ with $#3$ in Eq.~\ref{eq:#4}; yields Eq.~\ref{eq:#5}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111598",
         properties:{name_latex:"indefinite integral over",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Indefinite integral of both sides of Eq.~\ref{eq:#2} over $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111915",
         properties:{name_latex:"indefinite integrate LHS over",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Indefinite integral of LHS of Eq.~\ref{eq:#2} over $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111403",
         properties:{name_latex:"indefinite integrate RHS over",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Indefinite integral of RHS of Eq.~\ref{eq:#2} over $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111910",
         properties:{name_latex:"indefinite integration",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Indefinite integral of both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111270",
         properties:{name_latex:"integrate",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"not clear how to specify limits for an arbitrary number of integrals",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Integrate Eq.~ref{eq:#1}; yields Eq.~ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111468",
         properties:{name_latex:"integrate over from to",
                     number_of_inputs:1,
                     number_of_feeds:3,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"multi-variable calculus",
                     latex:"Integrate Eq.~\ref{eq:#4} over $#1$ from lower limit $#2$ to upper limit $#3$; yields Eq.~\ref{eq:#5}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111737",
         properties:{name_latex:"make expr power",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Make Eq.~\ref{eq:#2} the power of $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111588",
         properties:{name_latex:"maximum of expr",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"The maximum of Eq.~\ref{eq:#2} with respect to $#1$ is Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111790",
         properties:{name_latex:"multiply LHS by unity",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Multiply LHS of Eq.~\ref{eq:#2} by 1, which in this case is $#1$; yields Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111853",
         properties:{name_latex:"multiply RHS by unity",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Multiply RHS of Eq.~\ref{eq:#2} by 1, which in this case is $#1$; yields Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111172",
         properties:{name_latex:"multiply both sides by",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Multiply both sides of Eq.~\ref{eq:#2} by $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111485",
         properties:{name_latex:"multiply expr 1 by expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Multiply Eq.~\ref{eq:#1} by Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111413",
         properties:{name_latex:"normalization condition",
                     number_of_inputs:0,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Normalization condition is Eq.~\ref{eq:#1}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111921",
         properties:{name_latex:"partially differentiate with respect to",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"differential equations",
                     latex:"Partially differentiate Eq.~\ref{eq:#2} with respect to $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111529",
         properties:{name_latex:"raise both sides to power",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Raise both sides of Eq.~\ref{eq:#2} to $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111291",
         properties:{name_latex:"replace constant with value",
                     number_of_inputs:1,
                     number_of_feeds:3,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Replace constant $#1$ with value $#2$ and units $#3$ in Eq.~\ref{eq:#4}; yields Eq.~\ref{eq:#5}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111842",
         properties:{name_latex:"replace curl with LeviCevita summation contravariant",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Replace curl in Eq.~\ref{eq:#1} with Levi-Cevita contravariant; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111310",
         properties:{name_latex:"replace scalar with vector",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Replace scalar variables in Eq.~\ref{eq:#1} with equivalent vector variables; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111232",
         properties:{name_latex:"replace summation notation with vector notation",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Replace summation notation in Eq.~\ref{eq:#1} with vector notation; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111628",
         properties:{name_latex:"select imaginary parts",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Select imaginary parts of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111905",
         properties:{name_latex:"select real parts",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"complex values",
                     latex:"Select real parts of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111594",
         properties:{name_latex:"separate three vector components",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:3,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Separate three vector components in Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2} and Eq.~\ref{eq:#3} and Eq.~\ref{eq:#4}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111694",
         properties:{name_latex:"separate two vector components",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:2,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Separate two vector components in Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2} and Eq.~\ref{eq:#3}"}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111251",
         properties:{name_latex:"separate vector into two trigonometric ratios",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:2,
                     author_name_latex:"ben",
                     TODO_notes_latex:"geometry argument in 2D",
                     TODO_assumptions_latex:"",
                     latex:"Separate vector in Eq.~\ref{eq:#2} into components related by angle $#1$; yields Eq.~\ref{eq:#3} and Eq.~\ref{eq:#4}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111965",
         properties:{name_latex:"simplify",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Simplify Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111247",
         properties:{name_latex:"solve for X",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Solve Eq.~\ref{eq:#2} for $#1$; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111614",
         properties:{name_latex:"square root both sides",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:2,
                     author_name_latex:"ben",
                     TODO_notes_latex:"related to raise both sides to power",
                     TODO_assumptions_latex:"",
                     latex:"Take the square root of both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2} and Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111202",
         properties:{name_latex:"substitute LHS of expr 1 into expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} into Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111798",
         properties:{name_latex:"substitute LHS of five expressions into expr",
                     number_of_inputs:6,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} and LHS of Eq.~\ref{eq:#2} and LHS of Eq.~\ref{eq:#3} and LHS of Eq.~\ref{eq:#4} and LHS of Eq.~\ref{eq:#5} into Eq.~\ref{eq:#6}; yields Eq.~\ref{eq:#7}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111966",
         properties:{name_latex:"substitute LHS of four expressions into expr",
                     number_of_inputs:5,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} and LHS of Eq.~\ref{eq:#2} and LHS of Eq.~\ref{eq:#3} and LHS of Eq.~\ref{eq:#4} into Eq.~\ref{eq:#5}; yields Eq.~\ref{eq:#6}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111317",
         properties:{name_latex:"substitute LHS of six expressions into expr",
                     number_of_inputs:7,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} and LHS of Eq.~\ref{eq:#2} and LHS of Eq.~\ref{eq:#3} and LHS of Eq.~\ref{eq:#4} and LHS of Eq.~\ref{eq:#5} and LHS of Eq.~\ref{eq:#6} into Eq.~\ref{eq:#7}; yields Eq.~\ref{eq:#8}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111854",
         properties:{name_latex:"substitute LHS of three expressions into expr",
                     number_of_inputs:4,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} and LHS of Eq.~\ref{eq:#2} and LHS of Eq.~\ref{eq:#3} into Eq.~\ref{eq:#4}; yields Eq.~\ref{eq:#5}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111483",
         properties:{name_latex:"substitute LHS of two expressions into expr",
                     number_of_inputs:3,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute LHS of Eq.~\ref{eq:#1} and LHS of Eq.~\ref{eq:#2} into Eq.~\ref{eq:#3}; yields Eq.~\ref{eq:#4}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111523",
         properties:{name_latex:"substitute RHS of expr 1 into expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Substitute RHS of Eq.~\ref{eq:#1} into Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111575",
         properties:{name_latex:"subtract X from both sides",
                     number_of_inputs:1,
                     number_of_feeds:1,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Subtract $#1$ from both sides of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111160",
         properties:{name_latex:"subtract expr 1 from expr 2",
                     number_of_inputs:2,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"complement of 'add expr X to expr Y'",
                     TODO_assumptions_latex:"",
                     latex:"Subtract Eq.~\ref{eq:#1} from Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111764",
         properties:{name_latex:"sum exponents",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Sum exponents on LHS and RHS of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111294",
         properties:{name_latex:"sum exponents LHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Sum exponents on LHS of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111244",
         properties:{name_latex:"sum exponents RHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Sum exponents on RHS of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111379",
         properties:{name_latex:"swap LHS with RHS",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"",
                     latex:"Swap LHS of Eq.~\ref{eq:#1} with RHS; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"111199",
         properties:{name_latex:"take curl of both sides",
                     number_of_inputs:1,
                     number_of_feeds:0,
                     number_of_outputs:1,
                     author_name_latex:"ben",
                     TODO_notes_latex:"",
                     TODO_assumptions_latex:"linear algebra",
                     latex:"Apply curl to both sides of Eq.~\ref{eq:#1}; yields Eq.~\ref{eq:#2}."}}] AS row
CREATE (n:inference_rule{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
