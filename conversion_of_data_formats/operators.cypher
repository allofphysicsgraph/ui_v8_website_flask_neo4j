:begin
UNWIND [{id:"2222558",
         properties:{name_latex:"addition",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\addition[2]{ #1 + #2}'],
                     latex:"+"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222578",
         properties:{name_latex:"cosine",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\cosine[1]{\\cos #1}'],
                     latex:"\cos"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222622",
         properties:{name_latex:"cross product",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['vector'],
                     TODO_latex_macro_list:['\\times[2]{ #1 \\times #2}'],
                     latex:"\times"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222448",
         properties:{name_latex:"curl",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\curl[1]{ \\nabla \\times #1}'],
                     latex:"\vec{\nabla} \times"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222293",
         properties:{name_latex:"definite integral",
                     reference_latex:"",
                     argument_count:4,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\integralDefinite[4]{ \\int_{#1}^{#2} #3 #4}'],
                     latex:"\int"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222361",
         properties:{name_latex:"divergence",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\nabla[1]{ \\nabla \\cdot #1}'],
                     latex:"\vec{\nabla} \cdot"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222960",
         properties:{name_latex:"division",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\divisionOneLine[2]{ #1 / #2}', '\\divisionFrac[2]{ \\frac{#1}{#2}'],
                     latex:"/"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222302",
         properties:{name_latex:"dot product",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['vector'],
                     TODO_latex_macro_list:['\\dotproduct[2]{ #1 \\dot #2}'],
                     latex:"\dot"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222867",
         properties:{name_latex:"element-wise addition",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['vector', 'matrix'],
                     TODO_latex_macro_list:['\\elementwiseAddition[2]{ #1 + #2}'],
                     latex:"+"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222187",
         properties:{name_latex:"equals",
                     reference_latex:"",
                     author_name_latex:"ben",
                     description_latex:"LHS = RHS",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\equals[2]{ #1 = #2}'],
                     latex:"="}}] AS row
CREATE (n:relation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222177",
         properties:{name_latex:"function",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['list'],
                     TODO_latex_macro_list:['\\function[1]{ f #1}'],
                     latex:"f"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222306",
         properties:{name_latex:"gradient",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\nabla[1]{ \\nabla #1}'],
                     latex:"\vec{\nabla}"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222573",
         properties:{name_latex:"indefinite intergral",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\integralIndefinite[2]{ \\int #1 #2}'],
                     latex:"\int"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222171",
         properties:{name_latex:"multiplication",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\multiplication[2]{ #1 #2}'],
                     latex:"*"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222762",
         properties:{name_latex:"sine",
                     reference_latex:"",
                     argument_count:1,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\sine[1]{ \\sin #1}'],
                     latex:"\sin"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222657",
         properties:{name_latex:"spatial vector differential",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real'],
                     TODO_latex_macro_list:['\\spatialVectorDifferential[1]{ \\vec{ \\nabla} #1}'],
                     latex:"\vec{\nabla}"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222747",
         properties:{name_latex:"subtraction",
                     reference_latex:"",
                     argument_count:2,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\subtraction[2]{ #1 - #2}'],
                     latex:"-"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2222348",
         properties:{name_latex:"summation",
                     reference_latex:"",
                     argument_count:4,
                     author_name_latex:"ben",
                     description_latex:"",
                     TODO_scope:['real', 'vector', 'matrix', 'complex'],
                     TODO_latex_macro_list:['\\summation[4]{ \\sum_{#1}^{#2} #3}'],
                     latex:"\sum"}}] AS row
CREATE (n:operation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
