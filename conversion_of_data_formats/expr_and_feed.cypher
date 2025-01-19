:begin
UNWIND [{id:"0000040490",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0009139'), Integer(2))", 
                     latex:"a^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0000999900",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))", 
                     latex:"b/(2 a)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001030901",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"cos(Symbol('pdg0001464'))", 
                     latex:"\cos(x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001111111",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(sin(Symbol('pdg0001464')), Integer(2))", 
                     latex:"(\sin(x))^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001209482",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0003141'))", 
                     latex:"2 \pi"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001304952",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001054')", 
                     latex:"\hbar"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001334112",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002523')", 
                     latex:"W"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001921933",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0004621'))", 
                     latex:"2 i"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002239424",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002338514",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002097')", 
                     latex:"\vec{p}_{2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002342425",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0005156'), Integer(-1)), Symbol('pdg0005156'))", 
                     latex:"m/m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002393922",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002424922",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009139')", 
                     latex:"a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002436656",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0001054'), Symbol('pdg0004621'))", 
                     latex:"i \hbar"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002449291",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))", 
                     latex:"b/(2 a)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002838490",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))", 
                     latex:"b/(2 a)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002919191",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"sin(Mul(Integer(-1), Symbol('pdg0001464')))", 
                     latex:"\sin(-x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002929944",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Integer(2), Integer(-1))", 
                     latex:"1/2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002940021",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0003141'))", 
                     latex:"2 \pi"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003232242",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003413423",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"cos(Mul(Integer(-1), Symbol('pdg0001464')))", 
                     latex:"\cos(-x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003747849",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(-1)", 
                     latex:"-1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003838111",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003919391",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003949052",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(-1), Symbol('pdg0001464'))", 
                     latex:"-x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003949921",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001054')", 
                     latex:"\hbar"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003954314",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009199')", 
                     latex:"dx"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003981813",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(-1), sin(Symbol('pdg0001464')))", 
                     latex:"-\sin(x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004089571",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0001464'))", 
                     latex:"2 x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004264724",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001452')", 
                     latex:"y"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004307451",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2))", 
                     latex:"(b/(2 a))^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004582412",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004829194",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004831494",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009139')", 
                     latex:"a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004849392",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004858592",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003410')", 
                     latex:"h"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004934845",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004948585",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009139')", 
                     latex:"a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005395034",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002427')*Bra('pdg0004679')*Ket('pdg0002090')", 
                     latex:"a_{\alpha} \langle \psi_{\alpha} | \psi_{\beta} \rangle"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005626421",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005749291",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006235')", 
                     latex:"f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005938585",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Mul(Integer(-1), Pow(Symbol('pdg0001054'), Integer(2))), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1)))", 
                     latex:"\frac{-\hbar^2}{2m}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006466214",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(sin(Symbol('pdg0001464')), Integer(2))", 
                     latex:"(\sin(x))^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006544644",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006563727",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006644853",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))", 
                     latex:"c/a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006656532",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002718')", 
                     latex:"e"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007471778",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Pow(sin(Symbol('pdg0001464')), Integer(2)))", 
                     latex:"2(\sin(x))^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007563791",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004621')", 
                     latex:"i"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007636749",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007894942",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(sin(Symbol('pdg0001464')), Integer(2))", 
                     latex:"(\sin(x))^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008837284",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009491')", 
                     latex:"T"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008842811",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"cos(Mul(Integer(2), Symbol('pdg0001464')))", 
                     latex:"\cos(2 x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009458842",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Function('pdg0009489')(Symbol('pdg0001464'))", 
                     latex:"\psi(x)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009484724",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))", 
                     latex:"\frac{n \pi}{W}x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009485857",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Mul(Integer(2), Pow(Symbol('pdg0002523'), Integer(-1))), Pow(Symbol('pdg0009139'), Integer(2)))", 
                     latex:"a^2\frac{2}{W}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009485858",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))", 
                     latex:"\frac{2n\pi}{W}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009492929",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0004221'), Symbol('pdg0005177'))", 
                     latex:"v du"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009587738",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009489')", 
                     latex:"\psi"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009877781",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001452')", 
                     latex:"y"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0203024440",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"1",
                     latex_rhs:"\int_0^W a \sin\left(\frac{n \pi}{W} x\right) \psi(x)^* dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(1), Integral(Mul(Symbol('pdg0009139'), Mul(conjugate(Function('pdg0009489')(Symbol('pdg0001464'))), sin(Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))), Tuple(Symbol('pdg0001464'), Integer(0), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0404050504",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\lambda",
                     latex_rhs:"\frac{v}{f}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001115'), Mul(Pow(Symbol('pdg0004201'), Integer(-1)), Symbol('pdg0001357')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0439492440",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/evaluating-definite-integrals-for.html",
                     latex_lhs:"\frac{1}{a^2}",
                     latex_rhs:"\frac{1}{2}W - \frac{1}{2}\left. \frac{W}{2n\pi}\sin\left(\frac{2n\pi}{W} x\right) \right|_0^W",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009139'), Integer(2)), Integer(-1)), Add(Mul(Integer(-1), Rational(1, 2), Symbol('pdg0002523'), Mul(Rational(1, 2), Pow(Symbol('pdg0001592'), Integer(-1)), Pow(Symbol('pdg0003141'), Integer(-1))), sin(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))), Mul(Pow(Integer(2), Integer(-1)), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0934990943",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k",
                     latex_rhs:"\frac{2 \pi}{v T}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005321'), Mul(Mul(Integer(2), Symbol('pdg0003141')), Pow(Mul(Symbol('pdg0009491'), Symbol('pdg0001357')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0948572140",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int \cos(a x) dx",
                     latex_rhs:"\frac{1}{a}\sin(a x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(cos(Mul(Symbol('pdg0009139'), Symbol('pdg0001464'))), Tuple(Symbol('pdg0009199'))), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), sin(Mul(Symbol('pdg0009139'), Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1010393913",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://docs.sympy.org/latest/modules/stats.html",
                     latex_lhs:"\langle \psi| \hat{A}^+ |\psi \rangle",
                     latex_rhs:"\langle a \rangle^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Bra('pdg0004065')*Dagger(Operator('pdg0005598'))*Ket('pdg0009329'),conjugate(E(Symbol('pdg0009139'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1010393944",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\langle\psi_{\alpha}| a_{\beta} |\psi_{\beta} \rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'),(Bra('pdg0004679')*Symbol('pdg0007752')*Ket('pdg0002090')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1010923823",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k W",
                     latex_rhs:"n \pi",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002523'), Symbol('pdg0005321')), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1020010291",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"a \sin(k W)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0002523'), Symbol('pdg0005321')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1020394900",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"p",
                     latex_rhs:"h/\lambda",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001134'), Mul(Symbol('pdg0004413'), Pow(Symbol('pdg0001115'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1020394902",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"h f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Symbol('pdg0004201'), Symbol('pdg0004413')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1020854560",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"(A + B)(A + B)^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Mul(Add(Symbol('pdg0004453'), Symbol('pdg0004698')), conjugate(Add(Symbol('pdg0004453'), Symbol('pdg0004698')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1025759423",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001452')", 
                     latex:"y"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1029039903",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"p",
                     latex_rhs:"m v",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001134'), Mul(Symbol('pdg0005156'), Symbol('pdg0001357')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1029039904",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"p^2",
                     latex_rhs:"m^2 v^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001134'), Integer(2)), Mul(Pow(Symbol('pdg0005156'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1036530438",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002798')", 
                     latex:"d_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1038566242",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sinh x",
                     latex_rhs:"\frac{\exp(x) - \exp(-x)}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sinh(Symbol('pdg0001464')), Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1085150613",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"definition of heat capacity at constant volume",
                     latex_lhs:"C_V",
                     latex_rhs:"\left(\frac{\partial U}{\partial T}\right)_V",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006682'), Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007343'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1087417579",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"- \frac{1}{2} g t_f^2 + v_0 t_f \sin(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), sin(Symbol('pdg0001575')))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0002467'), Integer(2)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1092872200",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001955')", 
                     latex:"KE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1100332145",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006458')", 
                     latex:"R"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1114820451",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm by\ system}",
                     latex_rhs:"\Delta KE",
                     latex_condition:"",
                     name_latex:"Work is change in energy",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006191'), Symbol('pdg0005734'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1128605625",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}^2\ x + \tanh^2(x)",
                     latex_rhs:"\frac{4}{\left(\exp(x)+\exp(-x)\right)^2} + \frac{\left(\exp(x)-\exp(-x)\right)^2}{\left(\exp(x)+\exp(-x)\right)^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sech(Symbol('pdg0001464')), Integer(2)), Pow(tanh(Symbol('pdg0001464')), Integer(2))), Add(Mul(Pow(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464'))), Integer(2)), Pow(Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(2)), Integer(-1))), Mul(Integer(4), Pow(Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1132941271",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_{\rm Earth}",
                     latex_rhs:"\frac{(9.80665 m/s^2) (6.3781*10^6 m)^2}{6.67430*10^{-11}m^3 kg^{-1} s^{-2}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0005458')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1143343287",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"G \frac{m_{\rm Earth}}{r_{\rm Earth}}",
                     latex_rhs:"\frac{1}{2} v_{\rm escape}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Symbol('pdg0003236'), Integer(-1)))), Mul(Pow(Integer(2), Integer(-1)), Pow(Symbol('pdg0008656'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1158485859",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{-\hbar^2}{2m} \nabla^2",
                     latex_rhs:"{\cal H}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Mul(Mul(Integer(-1), Pow(Symbol('pdg0001054'), Integer(2))), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1)))), Symbol('calH'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1166310428",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0 dt",
                     latex_rhs:"d v_x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(0), Symbol('pdg0004711')), Symbol('pdg0005005'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1172039918",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm coherent}",
                     latex_rhs:"4 |A|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008251'), Mul(Integer(4), Pow(Abs(Symbol('pdg0004453')), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1190768176",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{-nRT}{V} \left( \frac{ \partial }{\partial P}\left(\frac{1}{P}\right) \right)_T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Mul(Mul(Pow(Symbol('pdg0007586'), Integer(-1)), Mul(Integer(-1), Mul(Symbol('pdg0002834'), Mul(Symbol('pdg0008179'), Symbol('pdg0007343'))))), Derivative(Pow(Symbol('pdg0008134'), Integer(-1)), Tuple(Symbol('pdg0008134'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1191796961",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{2} g t_f",
                     latex_rhs:"v_0 \sin(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Symbol('pdg0002467'))), Mul(Symbol('pdg0005153'), sin(Symbol('pdg0001575'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1193980495",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1201689765",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"describes a spherical wavefront for an observer in a moving frame of reference",
                     latex_lhs:"x'^2 + y'^2 + z'^2",
                     latex_rhs:"c^2 t'^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0004306'), Integer(2)), Add(Pow(Symbol('pdg0005456'), Integer(2)), Pow(Symbol('pdg0001888'), Integer(2)))), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0004989'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1202310110",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{a^2}",
                     latex_rhs:"\int_0^W \frac{1}{2} dx - \frac{1}{2} \int_0^W \cos\left(2\frac{n \pi}{W}x\right) dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009139'), Integer(2)), Integer(-1)), Integral(Add(Mul(Pow(Integer(2), Integer(-1)), Symbol('pdg0009199')), Mul(Integer(-1), Rational(1, 2), Integral(cos(Mul(Integer(2), Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))), Tuple(Symbol('pdg0004037'), Integer(0), Symbol('pdg0002523'))))), Tuple(Symbol('pdg0004037'), Integer(0), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1202312210",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{a^2}",
                     latex_rhs:"\frac{1}{2}W - \frac{1}{2} \int_0^W \cos\left(2\frac{n \pi}{W}x\right) dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009139'), Integer(2)), Integer(-1)), Add(Mul(Pow(Integer(2), Integer(-1)), Symbol('pdg0002523')), Mul(Integer(-1), Rational(1, 2), Integral(cos(Mul(Integer(2), Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))), Tuple(Symbol('pdg0004037'), Integer(0), Symbol('pdg0002523'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1203938249",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_{\beta} \langle \psi_{\alpha} | \psi_{\beta} \rangle",
                     latex_rhs:"a_{\alpha} \langle \psi_{\alpha} | \psi_{\beta} \rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007752')*Bra('pdg0004679')*Ket('pdg0002090'),Symbol('pdg0007752')*Bra('pdg0004679')*Ket('pdg0002090'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1238593037",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004567')", 
                     latex:"c"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1248277773",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x)",
                     latex_rhs:"1 - 2 (\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Mul(Integer(2), Symbol('pdg0001464'))), Add(Integer(1), Mul(Integer(-1), Integer(2), Pow(sin(Symbol('pdg0001464')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1258245373",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004931')", 
                     latex:"E"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1259826355",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"(v - a t) t + \frac{1}{2} a t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Add(Mul(Symbol('pdg0001467'), Add(Mul(Integer(-1), Symbol('pdg0009140'), Symbol('pdg0001467')), Symbol('pdg0001357'))), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0009140'), Pow(Symbol('pdg0001467'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1265150401",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{2 v_0 + a t}{2} t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Symbol('pdg0001467'), Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Symbol('pdg0009140'), Symbol('pdg0001467')), Mul(Integer(2), Symbol('pdg0005153'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1268845856",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004940')", 
                     latex:"[A_{\rm adsorption}]"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1277713901",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001943')", 
                     latex:"d"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1292735067",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{gravitational}",
                     latex_rhs:"G \frac{m_1 m_2}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1293913110",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"b",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Symbol('pdg0001939'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1293923844",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\lambda",
                     latex_rhs:"v T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001115'), Mul(Symbol('pdg0009491'), Symbol('pdg0001357')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1306360899",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"v_{0, x} t + x_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Add(Mul(Symbol('pdg0001467'), Symbol('pdg0002958')), Symbol('pdg0001572')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1310571337",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\theta_{\rm refracted}",
                     latex_rhs:"90^{\circ} - \theta_{\rm Brewster}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004928')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1311403394",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{1}{V} \frac{nR}{P} \left( \frac{\partial T}{\partial T} \right)_P",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004686'), Mul(Pow(Symbol('pdg0007586'), Integer(-1)), Mul(Mul(Pow(Symbol('pdg0008134'), Integer(-1)), Mul(Symbol('pdg0008179'), Symbol('pdg0002834'))), Derivative(Symbol('pdg0007343'), Tuple(Symbol('pdg0007343'), Integer(1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1314464131",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \frac{\partial \vec{H}}{\partial t}",
                     latex_rhs:"\epsilon_0 \frac{\partial^2 \vec{E}}{\partial t^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001467')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1314864131",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{H}",
                     latex_rhs:"\epsilon_0 \frac{\partial }{\partial t}\vec{E}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cross(Symbol('nabla'), Symbol('pdg0002069')),Mul(Symbol('pdg0007940'),Derivative(Symbol('pdg0004326'), Tuple(Symbol('pdg0001467'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1323602089",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003978')", 
                     latex:"I_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1330874553",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm escape}",
                     latex_rhs:"\sqrt{2 G \frac{m_{\rm Earth}}{r_{\rm Earth}}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008656'), Mul(Pow(Integer(2), Rational(1, 2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005458'), Pow(Symbol('pdg0003236'), Integer(-1))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1333474099",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001687')", 
                     latex:"F_{\rm centripetal}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1357848476",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"A",
                     latex_rhs:"|A| \exp(i \theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004453'), Mul(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001575'))), Abs(Symbol('pdg0004453'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1377431959",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006458')", 
                     latex:"R"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1395858355",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\langle \psi_{\alpha}| a_{\alpha} |\psi_{\beta}\rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'), Bra('pdg0004679')*Symbol('pdg0002427')*Ket('pdg0002090'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1405465835",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y",
                     latex_rhs:"- \frac{1}{2} g t^2 + v_{0, y} t + y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005647'), Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0001467'), Symbol('pdg0009107')), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0001467'), Integer(2))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1413137236",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005022')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1439089569",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002958')", 
                     latex:"v_{0, x}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1451839362",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1457415749",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{R_{\rm total}}",
                     latex_rhs:"\frac{1}{R_1} + \frac{1}{R_2}",
                     latex_condition:"",
                     name_latex:"total resistance for two resistors in parallel",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001908'), Integer(-1)), Add(Pow(Symbol('pdg0003461'), Integer(-1)), Pow(Symbol('pdg0008697'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1484794622",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003461')", 
                     latex:"R_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1511199318",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003192')", 
                     latex:"Z"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1512581563",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1525861537",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"|A|^2 + |B|^2 + A B^* + B A^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004453'))), Add(Mul(Symbol('pdg0004453'), conjugate(Symbol('pdg0004698'))), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1528310784",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma",
                     latex_rhs:"\frac{1}{\sqrt{1-\frac{v^2}{c^2}}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001790'), Pow(Pow(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0004567'), Integer(-2)), Pow(Symbol('pdg0001357'), Integer(2)))), Rational(1, 2)), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1541916015",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\theta",
                     latex_rhs:"\frac{\pi}{4}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001575'), Mul(Pow(Integer(4), Integer(-1)), Symbol('pdg0003141')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1552869972",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003852')", 
                     latex:"x_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1556389363",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:" the bonding energy in condensed phases is given by the Rydberg energy on the order of several e",
                     latex_lhs:"E_{\rm Rydberg}",
                     latex_rhs:"\frac{ m_e e^4 }{ 32 \pi^2 \epsilon_0^2 \hbar^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009838'), Mul(Pow(Mul(Integer(32), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Pow(Symbol('pdg0007940'), Integer(2)), Pow(Symbol('pdg0001054'), Integer(2))))), Integer(-1)), Mul(Pow(Symbol('pdg0001999'), Integer(4)), Symbol('pdg0002515'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1559688463",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\frac{T_{\rm geostationary\ orbit}^2 G m_{\rm Earth}}{4 \pi^2}\right)^{1/3}",
                     latex_rhs:"r_{\rm geostationary\ orbit}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Mul(Pow(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Integer(-1)), Mul(Pow(Symbol('pdg0005595'), Integer(2)), Mul(Symbol('pdg0006277'), Symbol('pdg0005458')))), Pow(Integer(3), Integer(-1))), Symbol('pdg0007110'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1571582377",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Symbol('k'), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1))))", 
                     latex:"F_{gravitational} \propto \frac{1}{r^2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1586866563",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left( \gamma^2 - c^2 \gamma^2 \left( \frac{1-\gamma^2}{\gamma^2} \right)^2 \frac{1}{v^2} \right) x^2 + y^2 + z^2 + \left( -\gamma^2 2 x v t - c^2 \gamma^2 2 t \left( \frac{1-\gamma^2}{\gamma^2} \right) \frac{x}{v} \right)",
                     latex_rhs:"t^2 \left( c^2 \gamma^2 - \gamma^2 v^2 \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Add(Pow(Symbol('pdg0006728'), Integer(2)), Add(Mul(Pow(Symbol('pdg0004037'), Integer(2)), Add(Mul(Integer(-1), Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(-2)), Mul(Pow(Symbol('pdg0001790'), Integer(-4)), Pow(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Integer(2)))), Pow(Symbol('pdg0001790'), Integer(2)))), Pow(Symbol('pdg0005647'), Integer(2)))), Add(Mul(Integer(-1), Integer(2), Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(-1)), Symbol('pdg0004037'), Mul(Symbol('pdg0001467'),Mul(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Pow(Pow(Symbol('pdg0001790'), Integer(2)), Integer(-1))))), Mul(Integer(-1), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Integer(2), Mul(Symbol('pdg0004037'), Mul(Symbol('pdg0001467'), Symbol('pdg0001357')))))))), Mul(Pow(Symbol('pdg0001467'), Integer(2)), Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2))), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1590774089",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"dW",
                     latex_rhs:"F dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009398'), Mul(Symbol('pdg0004202'), Symbol('pdg0009199')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1608399874",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008721')", 
                     latex:"V_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1614343171",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004711')", 
                     latex:"dt"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1616666229",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008909')", 
                     latex:"v_{\rm final}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1635147226",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004851')", 
                     latex:"m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1636453295",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{ \nabla} \times \vec{E}",
                     latex_rhs:"- \nabla^2 \vec{E}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cross(Symbol('nabla'),cross(Symbol('nabla'),Symbol('pdg0004326'))),Mul(Integer(-1), Mul(Symbol('pdg0004326'), Pow(Symbol('nabla'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1638282134",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{\rm before}",
                     latex_rhs:"\vec{p}_{\rm after}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001302'), Symbol('pdg0005493'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1639827492",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"- c^2 \frac{(1-\gamma^2)}{v^2 \gamma^2}",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2))), Integer(-1)), Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2))))))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1648958381",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 \psi \left( \vec{r},t \right)",
                     latex_rhs:"\frac{i}{\hbar} \vec{p} \cdot \left( \vec{ \nabla} \psi( \vec{r},t) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Function('pdg0002046')(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1650441634",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"define coordinate system such that initial height is at origin",
                     latex_lhs:"y_0",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001469'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1676472948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"v_x - v_{0, x}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Mul(Integer(-1), Symbol('pdg0002958')), Symbol('pdg0005505')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1702349646",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g dt",
                     latex_rhs:"d v_y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Symbol('dt'), Symbol('pdg0001649'))), Symbol('pdg0005674'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1716984328",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))", 
                     latex:"i x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1742775076",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003192')", 
                     latex:"Z"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1772416655",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{E_2 - E_1}{t}",
                     latex_rhs:"v F - F v",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0005579')), Symbol('pdg0004550'))), Add(Mul(Integer(-1), Symbol('pdg0004202'), Symbol('pdg0001357')), Mul(Symbol('pdg0004202'), Symbol('pdg0001357'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1772973171",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\frac{k}{m} x",
                     latex_rhs:"-A \omega^2 \cos(\omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Symbol('x'), Mul(Symbol('k'), Pow(Symbol('pdg0005156'), Integer(-1))))), Mul(Integer(-1), Mul(Symbol('A'), Mul(Pow(Symbol('pdg0002321'), Integer(2)), cos(Mul(Symbol('pdg0002321'), Symbol('pdg0009491')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1784114349",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sqrt{\frac{k}{m}}",
                     latex_rhs:"\omega",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Mul(Symbol('pdg0001356'), Pow(Symbol('pdg0005156'), Integer(-1))), Rational(1, 2)), Symbol('pdg0002321'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1809909100",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{E_2 - E_1}{t}",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0005579')), Symbol('pdg0004550'))), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1811867899",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"\frac{d_1+d_2}{d_1+d_2} d_2 4 \pi^2 \frac{r^2}{G m_1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Mul(Symbol('pdg0002798'), Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Pow(Symbol('pdg0002530'), Integer(2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005022')), Integer(-1)))))), Mul(Pow(Add(Symbol('pdg0007652'), Symbol('pdg0002798')), Integer(-1)), Add(Symbol('pdg0007652'), Symbol('pdg0002798')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1815398659",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"U",
                     latex_rhs:"Q + W",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005786'), Add(Symbol('pdg0009432'), Symbol('pdg0001088')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1819663717",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_x",
                     latex_rhs:"\frac{d}{dt} v_x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007159'), Derivative(Symbol('pdg0005505'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1823570358",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003034')", 
                     latex:"C"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1840080113",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"object is not moving at $x=\infty$",
                     latex_lhs:"KE_2",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001552'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1848400430",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('F'), Mul(Symbol('pdg0005156'), Symbol('propto')))", 
                     latex:"F \propto m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1857710291",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"a \sin(n \pi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1858578388",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 E( \vec{r})\exp(i \omega t)",
                     latex_rhs:"- \omega^2 \mu_0 \epsilon_0 E( \vec{r})\exp(i \omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))), Mul(Integer(-1), Mul(Pow(Symbol('pdg0002321'), Integer(2)), Mul(Symbol('pdg0006197'), Mul(Symbol('pdg0007940'), Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467'))))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1858772113",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k",
                     latex_rhs:"\frac{n \pi}{W}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005321'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1888494137",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\sqrt{\frac{k}{m}}",
                     latex_rhs:"\omega",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Pow(Mul(Symbol('pdg0001356'), Pow(Symbol('pdg0005156'), Integer(-1))), Rational(1, 2))), Symbol('pdg0002321'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1894894315",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003192')", 
                     latex:"Z"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1916173354",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\gamma^2 v^2 + c^2 \gamma^2",
                     latex_rhs:"c^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2))), Mul(Integer(-1), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2))))), Pow(Symbol('pdg0004567'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1928085940",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"Z^*",
                     latex_rhs:"|Z| \exp( -i \theta )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0003192')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1931103031",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{k}{m}",
                     latex_rhs:"\omega^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0001356'), Pow(Symbol('pdg0005156'), Integer(-1))), Pow(Symbol('pdg0002321'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1934748140",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int |\psi(x)|^2 dx",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Pow(Abs(Function('pdg0009489')(Symbol('pdg0001464'))), Integer(2)), Tuple(Symbol('pdg0009199'))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1935543849",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma^2 x^2 - \gamma^2 2 x v t + \gamma^2 v^2 t^2 + y^2 + z^2",
                     latex_rhs:"c^2 \gamma^2 \left(\frac{1-\gamma^2}{\gamma^2}\right)\frac{x^2}{\gamma^2} + c^2 \gamma^2 2 t \left(\frac{1-\gamma^2}{\gamma^2}\right)\frac{x}{\gamma} + c^2 \gamma^2 t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0006728'), Integer(2)), Add(Pow(Symbol('pdg0005647'), Integer(2)), Add(Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Pow(Symbol('pdg0001467'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))), Add(Mul(Integer(-1), Integer(2), Pow(Symbol('pdg0001790'), Integer(2)), Symbol('pdg0001467'), Symbol('pdg0001357'), Symbol('pdg0004037')), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0004037'), Integer(2))))))), Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001467'), Integer(2)))), Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Integer(2), Mul(Mul(Pow(Symbol('pdg0001790'), Integer(-1)), Symbol('pdg0004037')), Mul(Symbol('pdg0001467'),Mul(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Pow(Pow(Symbol('pdg0001790'), Integer(2)), Integer(-1)))))))), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Mul(Pow(Symbol('pdg0004037'), Integer(2)), Pow(Pow(Symbol('pdg0001790'), Integer(2)), Integer(-1))), Mul(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Pow(Pow(Symbol('pdg0001790'), Integer(2)), Integer(-1)))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1945487024",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0009067'), Symbol('pdg0009046'))", 
                     latex:"p_A [S]"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1963253044",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x} dt",
                     latex_rhs:"dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004711'), Symbol('pdg0002958')), Symbol('pdg0009199'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1967582749",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t",
                     latex_rhs:"\frac{v - v_0}{a}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001467'), Mul(Pow(Symbol('pdg0009140'), Integer(-1)), Add(Symbol('pdg0001357'), Mul(Integer(-1), Symbol('pdg0005153')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1974334644",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{x (1 - \gamma^2 )}{\gamma v} + \frac{\gamma^2 v t}{\gamma v}",
                     latex_rhs:"t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Pow(Mul(Symbol('pdg0001790'), Symbol('pdg0001357')), Integer(-1)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Symbol('pdg0001467'), Symbol('pdg0001357')))), Mul(Pow(Mul(Symbol('pdg0001790'), Symbol('pdg0001357')), Integer(-1)), Function('pdg0004037')(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2))))))), Symbol('pdg0004989'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1977955751",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g",
                     latex_rhs:"\frac{d}{dt} v_y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Symbol('pdg0001649')), Derivative(Symbol('pdg0009107'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"1994296484",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm satellite}^2",
                     latex_rhs:"G \frac{m_{\rm Earth}}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0004082'), Integer(2)), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Symbol('pdg0002530'), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2005061870",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v(r)",
                     latex_rhs:"\sqrt{\frac{2 G m_2}{r}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0001357')(Symbol('pdg0002530')), Pow(Mul(Integer(2), Symbol('pdg0006277'), Symbol('pdg0004851'), Pow(Symbol('pdg0002530'), Integer(-1))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2016063530",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2029293929",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 E( \vec{r})\exp(i \omega t)",
                     latex_rhs:"\mu_0 \epsilon_0 \frac{\partial^2}{\partial t^2} E( \vec{r})\exp(i \omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))), Mul(Symbol('pdg0006197'), Mul(Symbol('pdg0007940'), Mul(Mul(Pow(Symbol('partial'), Integer(2)), Pow(Mul(Symbol('partial'), Pow(Symbol('pdg0001467'), Integer(2))), Integer(-1))), Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2042298788",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"-G \frac{m_{\rm Earth} m}{r_{\rm Earth}} + \frac{1}{2} m v_{\rm escape}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0003236'), Integer(-1)), Mul(Symbol('pdg0005156'), Symbol('pdg0005458'))))), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0008656'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2051901211",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{V}{R_1}",
                     latex_rhs:"I_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0008697'), Integer(-1)), Symbol('pdg0006599')), Symbol('pdg0003978'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2061086175",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"-G m_1 m_2 \left(\frac{-1}{r} - \frac{-1}{\infty}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Function('pdg0004851')(Mul(Integer(-1), Pow(Symbol('pdg0002530'), Integer(-1))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2064205392",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004453')", 
                     latex:"A"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2076171250",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\gamma^2 2 x v t - c^2 \gamma^2 2 t \left( \frac{1-\gamma^2}{\gamma^2} \right) \frac{x}{v}",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001790')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2081689540",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2086924031",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"- \frac{1}{2} g t_f + v_0 \sin(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Mul(Symbol('pdg0005153'), sin(Symbol('pdg0001575'))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Symbol('pdg0002467'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2091584724",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007557')", 
                     latex:"g_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2096918413",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\gamma ( \gamma x - \gamma v t + v t' )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Function('pdg0001790')(Add(Mul(Symbol('pdg0004989'), Symbol('pdg0001357')), Add(Mul(Integer(-1), Symbol('pdg0001790'), Symbol('pdg0001467'), Symbol('pdg0001357')), Mul(Symbol('pdg0001790'), Symbol('pdg0004037'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2103023049",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(x)",
                     latex_rhs:"\frac{1}{2i}\left(\exp(i x)-\exp(-i x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Symbol('pdg0001464')), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2113211456",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"f",
                     latex_rhs:"1/T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004201'), Pow(Symbol('pdg0009491'), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2114570475",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003569')", 
                     latex:"m_{\rm satellite}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2114909846",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\theta_A",
                     latex_rhs:"\frac{[A_{\rm adsorption}]}{[S_0]}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001791'), Mul(Symbol('pdg0004940'), Pow(Symbol('pdg0003037'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2121790783",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tanh^2(x)",
                     latex_rhs:"\frac{ \left(\exp(x)-\exp(-x)\right)^2}{\left(\exp(x)+\exp(-x)\right)^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(tanh(Symbol('pdg0001464')), Integer(2)), Mul(Pow(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464'))), Integer(2)), Pow(Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2123139121",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\exp(-i x)",
                     latex_rhs:"-\cos(x)+i \sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), Mul(Integer(-1), cos(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2131616531",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T f",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0009491'), Symbol('pdg0004201')), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2135482543",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2148049269",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\frac{k}{m} A \cos(\omega t)",
                     latex_rhs:"-A \omega^2 \cos(\omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Mul(Symbol('A'), cos(Mul(Symbol('pdg0002321'), Symbol('pdg0009491')))), Mul(Symbol('k'), Pow(Symbol('pdg0005156'), Integer(-1))))), Mul(Integer(-1), Mul(Symbol('A'), Mul(Pow(Symbol('pdg0002321'), Integer(2)), cos(Mul(Symbol('pdg0002321'), Symbol('pdg0009491')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2168306601",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"[S_0]",
                     latex_rhs:"\left(\frac{k_{\rm desorption}}{k_{\rm adsorption}} \frac{1}{p_A} + 1\right)[A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003037'), Mul(Symbol('pdg0004940'), Add(Integer(1), Mul(Pow(Symbol('pdg0009046'), Integer(-1)), Mul(Pow(Symbol('pdg0006850'), Integer(-1)), Symbol('pdg0008379'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2186083170",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{KE_2 - KE_1}{t}",
                     latex_rhs:"v F",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Symbol('pdg0004202'), Symbol('pdg0001357')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2217103163",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{m_1 d_1}{d_2}",
                     latex_rhs:"m_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0002798'), Integer(-1)), Mul(Symbol('pdg0007652'), Symbol('pdg0005022'))), Symbol('pdg0004851'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2226340358",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0001790'), Symbol('pdg0001357'))", 
                     latex:"\gamma v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2232825726",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007557')", 
                     latex:"g_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2236639474",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(A + B)(A + B)^*",
                     latex_rhs:"|A + B|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Add(Symbol('pdg0004453'), Symbol('pdg0004698')), Add(Symbol('pdg0004453'), Symbol('pdg0004698'))), Pow(Abs(Add(Symbol('pdg0004453'), Symbol('pdg0004698'))), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2242144313",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009140')", 
                     latex:"a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2257410739",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\frac{\partial U}{\partial T}\right)_p",
                     latex_rhs:"C_V \left(\frac{\partial T}{\partial T}\right)_p + \pi_T V \alpha",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007343'), Integer(1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2258485859",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\cal H} \psi \left( \vec{r},t \right)",
                     latex_rhs:"i \hbar \frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006799'), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0001054'), Derivative(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Tuple(Symbol('pdg0001467'), Integer(1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2267521164",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"object goes to $\infty$ away from gravitational source",
                     latex_lhs:"PE_2",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008849'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2271186630",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V",
                     latex_rhs:"I_{\rm total} R_{\rm total}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006599'), Mul(Symbol('pdg0009647'), Symbol('pdg0001908')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2293352649",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))", 
                     latex:"\theta - \phi"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2297105551",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"v_0 \frac{2 v_0 \sin(\theta)}{g} \cos(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Symbol('pdg0005153'), Mul(Mul(Pow(Symbol('pdg0001649'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0005153'), sin(Symbol('pdg0001575'))))), cos(Symbol('pdg0001575')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2308660627",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"G \frac{m_{\rm Earth}}{r_{\rm Earth}^2}",
                     latex_rhs:"g_{\rm Earth}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Pow(Symbol('pdg0003236'), Integer(2)), Integer(-1)))), Symbol('pdg0007557'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2334518266",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m a",
                     latex_rhs:"-k x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0009140'), Symbol('pdg0005156')), Mul(Integer(-1), Mul(Symbol('pdg0001356'), Symbol('pdg0004037'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2344320475",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004550')", 
                     latex:"E_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2346150725",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2346952973",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2366691988",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int 0 dt",
                     latex_rhs:"\int d v_x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Integer(0), Tuple(Symbol('pdg0001467'))), Integral(Integer(1), Tuple(Symbol('pdg0005005'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2378095808",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x_f",
                     latex_rhs:"x_0 + d",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003652'), Add(Symbol('pdg0001943'), Symbol('pdg0001572')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2394240499",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"a_{\beta} \langle \psi_{\alpha} | \psi_{\beta} \rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'),Symbol('pdg0007752')*Bra('pdg0004679')*Ket('pdg0002090'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2394853829",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(-i x)",
                     latex_rhs:"\cos(-x)+i \sin(-x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(Mul(Symbol('pdg0004621'), sin(Mul(Integer(-1), Symbol('pdg0001464')))), cos(Mul(Integer(-1), Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2394935831",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"( a_{\beta} - a_{\alpha} ) \langle \psi_{\alpha} | \psi_{\beta} \rangle",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0007752'), Mul(Integer(-1), Symbol('pdg0002427')))*Bra('pdg0004679')*Ket('pdg0002090'),Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2394935835",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\langle\psi| \hat{A} |\psi \rangle \right)^+",
                     latex_rhs:"\left(\langle a \rangle\right)^+",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004065')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2395958385",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 \psi \left( \vec{r},t \right)",
                     latex_rhs:"\frac{-p^2}{\hbar} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Integer(-1), Pow(Symbol('pdg0001134'), Integer(2)))), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2396787389",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003236')", 
                     latex:"r_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2397692197",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0005854'), Integer(3))", 
                     latex:"a^3"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2403773761",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2404934990",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle x^2\rangle -2\langle x \rangle\langle x \rangle+\langle x \rangle^2",
                     latex_rhs:"\langle x^2 \rangle-\langle x \rangle^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2405307372",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(2 x)",
                     latex_rhs:"2 \sin(x) \cos(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Mul(Integer(2), Symbol('pdg0001464'))), Mul(Integer(2), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2417941373",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"- c^2 \gamma^2 \frac{(1-\gamma^2)^2}{v^2 \gamma^4}",
                     latex_rhs:"1 - \gamma^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Pow(Mul(Pow(Symbol('pdg0001790'), Integer(4)), Pow(Symbol('pdg0001357'), Integer(2))), Integer(-1)), Pow(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Integer(2)))))), Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2431507955",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"PE_2",
                     latex_rhs:"-F x_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008849'), Mul(Integer(-1), Mul(Symbol('pdg0004202'), Symbol('pdg0005467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2461349007",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"- \frac{1}{2} g t^2 + v_{0, y} t + y_0",
                     latex_rhs:"y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0001467'), Symbol('pdg0009431')), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0001467'), Integer(2))))))), Symbol('pdg0005647'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2472653783",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{1}{T}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004686'), Pow(Symbol('pdg0007343'), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2484824786",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F",
                     latex_rhs:"m g",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0001649'), Symbol('pdg0005156')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2494533900",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle x^2\rangle -\langle x \rangle^2",
                     latex_rhs:"\langle x^2 \rangle-\langle x \rangle^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2501591100",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i \pi) + 1",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0003141'))), Integer(1)), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2503972039",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"KE_{\rm escape} + PE_{\rm Earth\ surface}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Symbol('pdg0005332'), Symbol('pdg0006431')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2510804451",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Pow(Symbol('pdg0001649'), Integer(-1)))", 
                     latex:"2/g"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2519058903",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(2 \theta)",
                     latex_rhs:"2 \sin(\theta) \cos(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Mul(Integer(2), Symbol('pdg0001575'))), Mul(Integer(2), Mul(sin(Symbol('pdg0001575')), cos(Symbol('pdg0001575')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2542420160",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"c^2 \gamma^2 - v^2 \gamma^2",
                     latex_rhs:"c^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2))), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))), Pow(Symbol('pdg0004567'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2575937347",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"n_1 \sin( \theta_{\rm Brewster} )",
                     latex_rhs:"n_2 \sin( \theta_{\rm refracted} )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002941'), sin(Symbol('pdg0004928'))), Mul(Symbol('pdg0001958'), sin(Symbol('pdg0002243'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2613006036",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{PV}{T}",
                     latex_rhs:"nR",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0007343'), Integer(-1)), Mul(Symbol('pdg0008134'), Symbol('pdg0007586'))), Mul(Symbol('pdg0008179'), Symbol('pdg0002834')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2617541067",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\frac{T_{\rm orbit}^2 G m_{\rm Earth}}{4 \pi^2}\right)^{1/3}",
                     latex_rhs:"r",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Mul(Pow(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Integer(-1)), Mul(Pow(Symbol('pdg0008762'), Integer(2)), Mul(Symbol('pdg0006277'), Symbol('pdg0005458')))), Pow(Integer(3), Integer(-1))), Symbol('pdg0002530'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2648958382",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\nabla^2 \psi \left( \vec{r},t \right)",
                     latex_rhs:"\frac{i}{\hbar} \vec{p} \cdot \left( \frac{i}{\hbar} \vec{p} \psi( \vec{r},t) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001054')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2660368546",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2674546234",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2685587762",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0006277'), Integer(-1)), Pow(Symbol('pdg0003236'), Integer(2)))", 
                     latex:"\frac{r_{\rm Earth}^2}{G}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2698469612",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006599')", 
                     latex:"V"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2700934933",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 \cos(x)",
                     latex_rhs:"\left( \exp(i (\theta - \phi)) + \exp(-i (\theta - \phi)) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), cos(Symbol('pdg0001464'))), Add(exp(Mul(Integer(-1), Symbol('pdg0004621'),(Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))))), exp(Mul(Symbol('pdg0004621'),(Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2715678478",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I R_{\rm total}",
                     latex_rhs:"I R_1 + I R_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004501'), Symbol('pdg0001908')), Add(Mul(Symbol('pdg0004501'), Symbol('pdg0008697')), Mul(Symbol('pdg0004501'), Symbol('pdg0003461'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2719691582",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"in a loop",
                     latex_lhs:"|A|",
                     latex_rhs:"|B|",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Abs(Symbol('pdg0004453')), Abs(Symbol('pdg0004698')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2741489181",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_y",
                     latex_rhs:"-g",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007055'), Mul(Integer(-1), Symbol('pdg0001649')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2750380042",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm escape}",
                     latex_rhs:"-\sqrt{2 G \frac{m_{\rm Earth}}{r_{\rm Earth}}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008656'), Mul(Integer(-1), Mul(Pow(Integer(2), Rational(1, 2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005458'), Pow(Symbol('pdg0003236'), Integer(-1))), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2754264786",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2762326680",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh^2 x - \sinh^2 x",
                     latex_rhs:"\frac{1}{4}\left( \exp(2x)+1+1+\exp(-2x) - \left(\exp(2x)-1-1+\exp(-2x)\right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(sinh(Symbol('pdg0001464')), Integer(2))), Pow(cosh(Symbol('pdg0001464')), Integer(2))), Mul(Pow(Integer(4), Integer(-1)), Add(Add(Add(Integer(2), Mul(Integer(-1), exp(Mul(Integer(2), Symbol('pdg0001464'))))), Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Integer(2), Symbol('pdg0001464')))))), Add(Add(Add(exp(Mul(Integer(2), Symbol('pdg0001464'))), Integer(1)), Integer(1)), exp(Mul(Integer(-1), Mul(Integer(2), Symbol('pdg0001464'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2764966428",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004851')", 
                     latex:"m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2768857871",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{\sin( \theta_{\rm Brewster} )}{\cos( \theta_{\rm Brewster} )}",
                     latex_rhs:"\frac{n_2}{n_1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(sin(Symbol('pdg0004928')), Pow(cos(Symbol('pdg0004928')), Integer(-1))), Mul(Pow(Symbol('pdg0002941'), Integer(-1)), Symbol('pdg0001958')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2770069250",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{E_2 - E_1}{t}",
                     latex_rhs:"\frac{(KE_2 - KE_1)}{t} + \frac{(PE_2 - PE_1)}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0005579')), Symbol('pdg0004550'))), Add(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0004093')), Symbol('pdg0008849')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2773628333",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003509')", 
                     latex:"\theta_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2809345867",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{V}{R_{\rm total}}",
                     latex_rhs:"I_{\rm total}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001908'), Integer(-1)), Symbol('pdg0006599')), Symbol('pdg0009647'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2848934890",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle a \rangle^*",
                     latex_rhs:"\langle a \rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0009139')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2857430695",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a",
                     latex_rhs:"\frac{v_2 - v_1}{t}",
                     latex_condition:"",
                     name_latex:"acceleration",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009140'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0002473')), Symbol('pdg0004770'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2858549874",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"- \frac{1}{2} g t^2 + v_{0, y} t",
                     latex_rhs:"y - y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0001467'), Symbol('pdg0009431')), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0001467'), Integer(2)))))), Add(Symbol('pdg0005647'), Mul(Integer(-1), Symbol('pdg0001469'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2867848403",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004501')", 
                     latex:"I"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2883079365",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm Schwarzschild} c^2",
                     latex_rhs:"2 G m",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Symbol('pdg0004518')), Mul(Integer(2), Mul(Symbol('pdg0006277'), Symbol('pdg0005156'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2897612567",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\alpha c \sqrt{ \frac{m_e}{A m_p} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Mul(Symbol('pdg0001370'), Mul(Symbol('pdg0004567'), Pow(Mul(Symbol('pdg0002515'), Mul(Pow(Symbol('pdg0003285'), Integer(-1)), Pow(Symbol('pdg0005916'), Integer(-1)))), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2902772962",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tanh(x)",
                     latex_rhs:"\frac{\frac{1}{2}\left( \exp(x)-\exp(-x) \right)}{\cosh(x)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tanh(Symbol('pdg0001464')), Mul(Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464')))), Pow(cosh(Symbol('pdg0001464')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2906548078",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"\frac{r}{d_1+d_2} d_2 4 \pi^2 \frac{r^2}{G m_1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Mul(Symbol('pdg0002798'), Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Pow(Symbol('pdg0002530'), Integer(2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005022')), Integer(-1)))))), Mul(Symbol('pdg0002530'), Pow(Add(Symbol('pdg0007652'), Symbol('pdg0002798')), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2907404069",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm by\ system}",
                     latex_rhs:"W_{\rm to\ system}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006191'), Symbol('pdg0009372'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2924222857",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm initial}",
                     latex_rhs:"v(r=\infty)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001934'), Symbol('pdg0001357'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2944838499",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)",
                     latex_rhs:"a \sin(\frac{n \pi}{W} x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0001464')), Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2957211007",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(meter, Integer(3)), Pow(second, Integer(-2)))", 
                     latex:"m^3 kg^{-1} s^{-2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2977457786",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 G \frac{m_{\rm Earth}}{r_{\rm Earth}}",
                     latex_rhs:"v_{\rm escape}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Symbol('pdg0003236'), Integer(-1))))), Pow(Symbol('pdg0008656'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2983053062",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\gamma (x' + v t')",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Mul(Symbol('pdg0001790'), Add(Mul(Symbol('pdg0004989'), Symbol('pdg0001357')), Symbol('pdg0005456'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2998709778",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm initial}",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001934'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"2999795755",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"c^2 \gamma^2",
                     latex_rhs:"v^2 \gamma^2 + c^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2))), Add(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3004158505",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{T^2}{r} F_{gravitational}",
                     latex_rhs:"\left( \frac{4 \pi^2 m r}{T^2} \right)\frac{T^2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002867'), Mul(Pow(Symbol('pdg0008762'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(-1)))), Mul(Mul(Pow(Symbol('pdg0008762'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(-1))), Mul(Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Symbol('pdg0005156'), Symbol('pdg0002530')))), Pow(Pow(Symbol('pdg0008762'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3031116098",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003461')", 
                     latex:"R_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3041762466",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004621')", 
                     latex:"i"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3046191961",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm Earth\ orbit}",
                     latex_rhs:"\frac{C_{\rm Earth\ orbit}}{t_{\rm Earth\ orbit}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007427'), Mul(Symbol('pdg0001534'), Pow(Symbol('pdg0005344'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3060393541",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm incoherent}",
                     latex_rhs:"2|A|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002435'), Mul(Integer(2), Pow(Abs(Symbol('pdg0004453')), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3061811650",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"n_1 \sin( \theta_{\rm Brewster} )",
                     latex_rhs:"n_2 \cos( \theta_{\rm Brewster} )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002941'), sin(Symbol('pdg0004928'))), Mul(Symbol('pdg0001958'), cos(Symbol('pdg0004928'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3080027960",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm Earth\ orbit}",
                     latex_rhs:"\frac{2 \pi r_{\rm Earth\ orbit}}{t_{\rm Earth\ orbit}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007427'), Mul(Pow(Symbol('pdg0005344'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0006081')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3085575328",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"|A|^2 + |B|^2 + |A| |B| \exp(i (\theta - \phi)) + |A| |B| \exp(-i (\theta - \phi))",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2))), Mul(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'),Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))))), Abs(Mul(Symbol('pdg0004453'), Mul(Symbol('pdg0004698'), Abs(Add(Mul(exp(Mul(Symbol('pdg0004621'),Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575')))), Abs(Symbol('pdg0004698'))), Abs(Symbol('pdg0004453'))))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3088463019",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004851')", 
                     latex:"m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3105350101",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002473')", 
                     latex:"v_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3121234211",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{k}{2\pi}",
                     latex_rhs:"\lambda",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0005321'), Pow(Mul(Integer(2), Symbol('pdg0003141')), Integer(-1))), Symbol('pdg0001115'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3121234212",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"p",
                     latex_rhs:"\frac{h k}{2\pi}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001134'), Mul(Pow(Mul(Integer(2), Symbol('pdg0003141')), Integer(-1)), Mul(Symbol('pdg0004413'), Symbol('pdg0005321'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3121513111",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k",
                     latex_rhs:"\frac{2 \pi}{\lambda}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005321'), Mul(Pow(Symbol('pdg0001115'), Integer(-1)), Mul(Integer(2), Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3131111133",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T",
                     latex_rhs:"1 / f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009491'), Pow(Symbol('pdg0004201'), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3131211131",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\omega",
                     latex_rhs:"2 \pi f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002321'), Mul(Integer(2), Mul(Symbol('pdg0004201'), Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3132131132",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\omega",
                     latex_rhs:"\frac{2\pi}{T}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002321'), Mul(Pow(Symbol('pdg0009491'), Integer(-1)), Mul(Integer(2), Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3147472131",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{\omega}{2 \pi}",
                     latex_rhs:"f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002321'), Pow(Mul(Integer(2), Symbol('pdg0003141')), Integer(-1))), Symbol('pdg0004201'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3166466250",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005022')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3169580383",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"acceleration is the change in speed over a duration",
                     latex_lhs:"\vec{a}",
                     latex_rhs:"\frac{d\vec{v}}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002423'), Derivative(Symbol('pdg0006373'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3176662571",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"applicable to any satellite orbit",
                     latex_lhs:"F_{\rm centripetal}",
                     latex_rhs:"F_{\rm gravity}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Symbol('pdg0001687'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3182633789",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma^2 - c^2 \gamma^2 \frac{(1-\gamma^2)^2}{v^2 \gamma^4}",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(-4)), Pow(Symbol('pdg0001357'), Integer(-2))), Pow(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Integer(2))), Pow(Symbol('pdg0001790'), Integer(2))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3182907803",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001572')", 
                     latex:"x_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3183197515",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002473')", 
                     latex:"v_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3214170322",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v(r=\infty)",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001357')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3219318145",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(365)", 
                     latex:"\frac{365 {\rm days}}{1 {\rm year}} \frac{24 {\rm hours}}{1 {\rm day}} \frac{60 {\rm minutes}}{1 {\rm hour}} \frac{60 {\rm seconds}}{1 {\rm minute}}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3236313290",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001943')", 
                     latex:"d"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3246378279",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3253234559",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\frac{v_2^2 - v_1^2}{2 a}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Mul(Pow(Mul(Integer(2), Symbol('pdg0009140')), Integer(-1)), Add(Mul(Integer(-1), Pow(Symbol('pdg0002473'), Integer(2))), Pow(Symbol('pdg0004770'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3268645065",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3270039798",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3273630811",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3274176452",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001934')", 
                     latex:"v_{\rm initial}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3274926090",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t",
                     latex_rhs:"\frac{x - x_0}{v_{0, x}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001467'), Mul(Pow(Symbol('pdg0002958'), Integer(-1)), Add(Symbol('pdg0004037'), Mul(Integer(-1), Symbol('pdg0001572')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3285732911",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(\cos(x))^2",
                     latex_rhs:"1-(\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(cos(Symbol('pdg0001464')), Integer(2)), Add(Integer(1), Mul(Integer(-1), Pow(sin(Symbol('pdg0001464')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3291685884",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\frac{ m_e e^4 }{ 32 \pi^2 \epsilon_0^2 \hbar^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002241'), Mul(Pow(Mul(Integer(32), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Pow(Symbol('pdg0007940'), Integer(2)), Pow(Symbol('pdg0001054'), Integer(2))))), Integer(-1)), Mul(Pow(Symbol('pdg0001999'), Integer(4)), Symbol('pdg0002515'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3331824625",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i \pi)",
                     latex_rhs:"-1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0003141'))), Integer(-1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3342155559",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3350802342",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004121')", 
                     latex:"KE_{\rm initial}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3350830826",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"Z Z^*",
                     latex_rhs:"|Z|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0003192')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3353418803",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3360172339",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"KE_2 - KE_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3364286646",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_{\rm Earth}",
                     latex_rhs:"5.972*10^{24} kg",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005458'), Mul(Float('5.97200', precision=53), Mul(Pow(Integer(10), Integer(24)), Symbol('kg'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3366703541",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"acceleration is the average change in speed over a duration",
                     latex_lhs:"a",
                     latex_rhs:"\frac{v - v_0}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009140'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Symbol('pdg0001357'), Mul(Integer(-1), Symbol('pdg0005153')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3398368564",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004202')", 
                     latex:"F"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3411994811",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm average}",
                     latex_rhs:"\frac{d}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006709'), Mul(Symbol('pdg0001943'), Pow(Symbol('pdg0001467'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3412946408",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))", 
                     latex:"v^2 \gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3417126140",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tan( \theta_{\rm Brewster} )",
                     latex_rhs:"\frac{ n_2 }{ n_1 }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tan(Symbol('pdg0004928')), Mul(Pow(Symbol('pdg0002941'), Integer(-1)), Symbol('pdg0001958')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3426941928",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\gamma ( \gamma (x - v t) + v t' )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Mul(Symbol('pdg0001790'), Add(Mul(Symbol('pdg0004989'), Symbol('pdg0001357')), Mul(Symbol('pdg0001790'), Add(Mul(Integer(-1), Symbol('pdg0001467'), Symbol('pdg0001357')), Symbol('pdg0004037'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3433441359",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006599')", 
                     latex:"V"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3448601530",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0009491'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(-1)))", 
                     latex:"\frac{T^2}{r}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3462972452",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"v_0 + a t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Add(Mul(Symbol('pdg0009140'), Symbol('pdg0001467')), Symbol('pdg0005153')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3464107376",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"definition of expansion coefficient",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{1}{V} \left( \frac{\partial V}{\partial T} \right)_p",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004686'), Mul(Pow(Symbol('pdg0007586'), Integer(-1)), Derivative(Symbol('pdg0007586'), Tuple(Symbol('pdg0007343'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3470587782",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(x) \cos(x)",
                     latex_rhs:"\frac{1}{2i}\left(\exp(i x)-\exp(-i x) \right) \frac{1}{2}\left(\exp(i x)+\exp(-i x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464'))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Mul(Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3472836147",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm Earth\ orbit}",
                     latex_rhs:"1.496\ 10^8 {\rm km}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006081'),Float('1.496', precision=53))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3485125659",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x_f",
                     latex_rhs:"v_0 t_f \cos(\theta) + x_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003652'), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), cos(Symbol('pdg0001575')))), Symbol('pdg0001572')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3485475729",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 E( \vec{r})",
                     latex_rhs:"- \frac{\omega^2}{c^2} E( \vec{r})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Function('pdg0006238')(Symbol('pdg0009472'))), Mul(Integer(-1), Mul(Mul(Pow(Symbol('pdg0002321'), Integer(2)), Pow(Pow(Symbol('pdg0004567'), Integer(2)), Integer(-1))), Function('pdg0006238')(Symbol('pdg0009472')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3486213448",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003569')", 
                     latex:"m_{\rm satellite}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3488423948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k_{\rm adsorption} p_A [S]",
                     latex_rhs:"k_{\rm desorption} [A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006850'), Mul(Symbol('pdg0009067'), Symbol('pdg0009046'))), Mul(Symbol('pdg0004940'), Symbol('pdg0008379')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3495403335",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3497828859",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V",
                     latex_rhs:"\frac{n R T}{P}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007586'), Mul(Pow(Symbol('pdg0008134'), Integer(-1)), Mul(Symbol('pdg0002834'), Mul(Symbol('pdg0008179'), Symbol('pdg0007343')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3507029294",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k_{\rm adsorption} p_A [S]",
                     latex_rhs:"r_{\rm desorption}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006850'), Mul(Symbol('pdg0009067'), Symbol('pdg0009046'))), Symbol('pdg0001966'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3512166162",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"F x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Mul(Symbol('pdg0004202'), Symbol('pdg0004037')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3531380618",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Function('pdg0001357')(Symbol('pdg0002530'))", 
                     latex:"v(r)"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3547519267",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"assumes equally probable microstates",
                     latex_lhs:"S",
                     latex_rhs:"k_{\rm Boltzmann} \ln \Omega",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001394'), Mul(Symbol('pdg0001157'), log(Symbol('pdg0003434'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3566149658",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"\int_{\infty}^r \frac{-G m_1 m_2}{x^2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Integral(Mul(Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Symbol('pdg0004851')))), Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1))), Tuple(Symbol('pdg0004037'), oo, Symbol('pdg0002530'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3585845894",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle \left(x-\langle x \rangle\right)^2 \rangle",
                     latex_rhs:"\langle x^2 \rangle-\langle x \rangle^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3591237106",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{E_2 - E_1}{t}",
                     latex_rhs:"\frac{(KE_2 - KE_1)}{t} - F v",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pg5579')), Symbol('pdg0004550'))), Add(Mul(Integer(-1), Symbol('pdg0004202'), Symbol('pdg0001357')), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3594626260",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002867')", 
                     latex:"F_{\rm gravity}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3599953931",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"[S_0]",
                     latex_rhs:"[S] + [A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003037'), Add(Symbol('pdg0004940'), Symbol('pdg0009067')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3605073197",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{-nRT}{V} \left( \frac{-1}{P^2}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Mul(Mul(Pow(Symbol('pdg0007586'), Integer(-1)), Mul(Integer(-1), Mul(Symbol('pdg0002834'), Mul(Symbol('pdg0008179'), Symbol('pdg0007343'))))), Mul(Integer(-1), Pow(Pow(Symbol('pdg0008134'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3607070319",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{v_0^2}{g} \sin\left(2 \frac{\pi}{4}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Mul(Pow(Symbol('pdg0001649'), Integer(-1)), Pow(Symbol('pdg0005153'), Integer(2))), sin(Mul(Integer(2), Mul(Pow(Integer(4), Integer(-1)), Symbol('pdg0003141'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3614055652",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{2 \pi r}{T_{\rm orbit}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Pow(Symbol('pdg0008762'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3634715785",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3649797559",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{\rm centripetal}",
                     latex_rhs:"m_2 d_2 \omega^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001687'), Mul(Symbol('pdg0004851'), Mul(Symbol('pdg0002798'), Pow(Symbol('pdg0002321'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3650370389",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{T^2}{r} F_{gravitational}",
                     latex_rhs:"4 \pi^2 m",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002867'), Mul(Pow(Symbol('pdg0008762'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(-1)))), Mul(Integer(4), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0003141'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3650814381",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0002867'), Mul(Symbol('propto'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))", 
                     latex:"F_{gravitational} \propto \frac{m_1 m_2}{r^2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3652511721",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3660957533",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(x)",
                     latex_rhs:"\frac{1}{2} \left( \exp(i (\theta - \phi)) + \exp(-i (\theta - \phi)) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Symbol('pdg0001464')), Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'),Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))))), exp(Mul(Symbol('pdg0004621'),(Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3663007361",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3676159007",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x} \int dt",
                     latex_rhs:"\int dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002958'), Integral(Integer(1), Tuple(Symbol('pdg0001467')))), Integral(Integer(1), Tuple(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3685779219",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0006235'), Rational(1, 2)), Mul(Integer(2), Symbol('approx')))", 
                     latex:"\sqrt{f} \approx 2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3722461713",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3723096423",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Float('6.3780999999999999', precision=53), Pow(Integer(10), Integer(6)))", 
                     latex:"6.3781*10^6"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3731774096",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004929')", 
                     latex:"KE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3736177473",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm adsorption}",
                     latex_rhs:"k_{\rm adsorption} p_A [S]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006687'), Mul(Symbol('pdg0006850'), Mul(Symbol('pdg0009067'), Symbol('pdg0009046'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3749492596",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004931')", 
                     latex:"E"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3781109867",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"\frac{r^3 4 \pi^2}{(d_1+d_2)  \frac{m_1}{d_2}G}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Mul(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Pow(Symbol('pdg0002530'), Integer(3))), Pow(Mul(Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0002798'), Integer(-1)), Symbol('pdg0005022'))), Add(Symbol('pdg0007652'), Symbol('pdg0002798'))), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3806977900",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E_2 - E_1",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Symbol('pdg0005579')), Symbol('pdg0004550')), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3809726424",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004930')", 
                     latex:"PE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3829492824",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{2}\left(\exp(i x)+\exp(-i x) \right)",
                     latex_rhs:"\cos(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), cos(Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3846041519",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"PE_{\rm Earth\ surface}",
                     latex_rhs:"-G \frac{m_{\rm Earth} m}{r_{\rm Earth}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006431'), Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0003236'), Integer(-1)), Mul(Symbol('pdg0005156'), Symbol('pdg0005458'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3846345263",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008762')", 
                     latex:"T_{\rm orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3868998312",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}^2\ x",
                     latex_rhs:"\frac{4}{\left(\exp(x)+\exp(-x)\right)^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(sech(Symbol('pdg0001464')), Integer(2)), Mul(Integer(4), Pow(Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3876446703",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3896798826",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_2 d_2 \omega^2",
                     latex_rhs:"G \frac{m_1 m_2}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004851'), Mul(Symbol('pdg0002798'), Pow(Symbol('pdg0002321'), Integer(2)))), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3906710072",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"G \frac{m_{\rm Earth}}{r}",
                     latex_rhs:"\frac{4 \pi^2 r^2}{T_{\rm orbit}^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Symbol('pdg0002530'), Integer(-1)))), Mul(Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(2)))), Pow(Pow(Symbol('pdg0008762'), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3911081515",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(-1)", 
                     latex:"-1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3920616792",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"this applies for geostationary orbits",
                     latex_lhs:"T_{\rm geostationary orbit}",
                     latex_rhs:"24\ {\rm hours}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0005595')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3921072591",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3924948349",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_{\beta} \langle \psi_{\alpha} | \psi_{\beta} \rangle - a_{\alpha} \langle \psi_{\alpha} | \psi_{\beta} \rangle",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0007752')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3935058307",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{ \frac{m_e}{m} \frac{e^4}{32 \pi^2 \epsilon_0^2 \hbar^2} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Pow(Mul(Pow(Symbol('pdg0001999'), Integer(4)), Pow(Symbol('pdg0009863'), Integer(-1)), Symbol('pdg0002515'), Mul(Rational(1, 32), Pow(Symbol('pdg0007940'), Integer(-2)), Pow(Symbol('pdg0001054'), Integer(-2)), Pow(Symbol('pdg0003141'), Integer(-2)))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3939572542",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005340')", 
                     latex:"KE_{\rm final}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3942849294",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i x)-\exp(-i x)",
                     latex_rhs:"2 i \sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Mul(Integer(2), Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3943939590",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"a_{\alpha} \langle \psi_{\alpha}| \psi_{\beta}\rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0002427')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3947269979",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{ \nabla} \times \vec{E}",
                     latex_rhs:"-\mu_0 \epsilon_0 \frac{\partial^2 \vec{E}}{\partial t^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001467')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948571256",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_rhs:"\frac{-i}{\hbar}E \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Tuple(Symbol('pdg0001467'), Integer(1))), Mul(Mul(Symbol('pdg0006238'), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Integer(-1), Symbol('pdg0004621')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948574224",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi( \vec{r},t)",
                     latex_rhs:"\psi_0 \exp\left(i\left( \vec{k}\cdot\vec{r} - \omega t \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Mul(Symbol('pdg0008330'), Function('pdg0002718')(Function('pdg0004621')(Add(dot(Symbol('pdg0005321'), Symbol('pdg0009472')), Mul(Integer(-1), Symbol('pdg0002321'), Symbol('pdg0001467')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948574226",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi( \vec{r},t)",
                     latex_rhs:"\psi_0 \exp\left(i\left(\frac{ \vec{p}\cdot\vec{r}}{\hbar} - \omega t \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Mul(Symbol('pdg0008330'), Function('pdg0002718')(Function('pdg0004621')(Add(Mul(Integer(-1), Symbol('pdg0002321'), Symbol('pdg0001467')), Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Symbol('pdg0001134'), Symbol('pdg0009472'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948574228",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi( \vec{r},t)",
                     latex_rhs:"\psi_0 \exp\left(i\left(\frac{ \vec{p}\cdot\vec{r}}{\hbar} - \frac{E t}{\hbar}  \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Mul(Symbol('pdg0008330'), Function('pdg0002718')(Function('pdg0004621')(Add(Mul(Integer(-1), Symbol('pdg0006238'), Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0001467')), Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Symbol('pdg0001134'), Symbol('pdg0009472'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948574230",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi( \vec{r},t)",
                     latex_rhs:"\psi_0 \exp\left(\frac{i}{\hbar}\left( \vec{p}\cdot\vec{r} - E t \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Mul(Symbol('pdg0008330'), Function('pdg0002718')(Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Add(Mul(Integer(-1), Symbol('pdg0006238'), Symbol('pdg0001467')), Mul(Symbol('pdg0001134'), Symbol('pdg0009472')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3948574233",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_rhs:"\psi_0 \frac{\partial}{\partial t}\exp\left(i\left(\frac{ \vec{p}\cdot\vec{r}}{\hbar} - \frac{E t}{\hbar}  \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Tuple(Symbol('pdg0001467'), Integer(1))), Mul(Symbol('pdg0008330'), Derivative(Function('pdg0002718')(Function('pdg0004621')(Add(Mul(Integer(-1), Symbol('pdg0006238'), Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0001467')), Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Symbol('pdg0001134'), Symbol('pdg0009472')))))), Tuple(Symbol('pdg0001467'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3951205425",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{\rm after}",
                     latex_rhs:"\vec{p}_{1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005493'), Symbol('pdg0006029'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"3967985562",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4057686137",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003034')", 
                     latex:"C"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4072200527",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{m_{\rm satellite} v_{\rm satellite}^2}{r}",
                     latex_rhs:"G \frac{m_{\rm Earth} m_{\rm satellite}}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Symbol('pdg0003569'), Pow(Symbol('pdg0004082'), Integer(2)))), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005458'), Symbol('pdg0003569')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4075539836",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"A A^*",
                     latex_rhs:"|A|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004453'), conjugate(Symbol('pdg0004453'))), Pow(Abs(Symbol('pdg0004453')), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4087145886",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Ohm%27s_law",
                     latex_lhs:"V",
                     latex_rhs:"I R",
                     latex_condition:"",
                     name_latex:"Ohm's law",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006599'), Mul(Symbol('pdg0004501'), Symbol('pdg0006458')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4107032818",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E_{\rm Rydberg}",
                     latex_rhs:"E",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009838'), Symbol('pdg0002241'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4128500715",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V",
                     latex_rhs:"I_1 R_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006599'), Mul(Symbol('pdg0003978'), Symbol('pdg0008697')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4139999399",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x - \gamma^2 x",
                     latex_rhs:"- \gamma^2 v t + \gamma v t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)), Symbol('pdg0004037')), Symbol('pdg0004037')), Add(Mul(Integer(-1), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Symbol('pdg0001467'), Symbol('pdg0001357')))), Mul(Symbol('pdg0001790'), Mul(Symbol('pdg0004989'), Symbol('pdg0001357')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4147101187",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004929')", 
                     latex:"KE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4147472132",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\frac{h \omega}{2 \pi}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Pow(Mul(Integer(2), Symbol('pdg0003141')), Integer(-1)), Mul(Symbol('pdg0004413'), Symbol('pdg0002321'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4153613253",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4158986868",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_x \hat{x} + a_y \hat{y}",
                     latex_rhs:"\frac{d\vec{v}}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001467')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4162188238",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002467')", 
                     latex:"t_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4166155526",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}\ x",
                     latex_rhs:"\frac{2}{\exp(x)+\exp(-x)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sech(Symbol('pdg0001464')), Mul(Integer(2), Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4167526462",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009431')", 
                     latex:"v_{0, y}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4180845508",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm Earth\ orbit}",
                     latex_rhs:"29.8 \frac{{\rm km}}{{\rm sec}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007427'), Float('29.8', precision=53))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4182362050",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"Z \in \mathbb{C}",
                     latex_lhs:"Z",
                     latex_rhs:"|Z| \exp( i \theta )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003192'), Mul(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001575'))), Abs(Symbol('pdg0003192'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4188580242",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"\frac{r^3 4 \pi^2}{\left(m_1+\left(\frac{m_1}{d_2}d_1\right)\right)G}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Pow(Mul(Symbol('pdg0006277'), Add(Mul(Symbol('pdg0007652'), Mul(Pow(Symbol('pdg0002798'), Integer(-1)), Symbol('pdg0005022'))), Symbol('pdg0005022'))), Integer(-1)), Mul(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Pow(Symbol('pdg0002530'), Integer(3)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4188639044",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4192519596",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"B",
                     latex_rhs:"|B| \exp(i \phi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004698'), Mul(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0008586'))), Abs(Symbol('pdg0004698'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4202292449",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006081')", 
                     latex:"r_{\rm Earth\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4213426349",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005579')", 
                     latex:"E_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4218009993",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4245712581",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{2 \pi r}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4264859781",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('F'), Mul(Symbol('pdg0005022'), Symbol('propto')))", 
                     latex:"F \propto m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4267808354",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{gravitational}",
                     latex_rhs:"m \frac{v^2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Symbol('pdg0005156'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4268085801",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x_0 + d",
                     latex_rhs:"v_0 t_f \cos(\theta) + x_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001943'), Symbol('pdg0001572')), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), cos(Symbol('pdg0001575')))), Symbol('pdg0001572')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4270680309",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{KE_2 - KE_1}{t}",
                     latex_rhs:"\frac{1}{2} m \frac{\left( v_2^2 - v_1^2 \right)}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Pow(Symbol('pdg0002473'), Integer(2))), Pow(Symbol('pdg0004770'), Integer(2)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4275004561",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"c^2",
                     latex_rhs:"2 G \frac{m}{r_{\rm Schwarzschild}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Integer(2), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0004518'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4287102261",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"describes a spherical wavefront",
                     latex_lhs:"x^2 + y^2 + z^2",
                     latex_rhs:"c^2 t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0006728'), Integer(2)), Add(Pow(Symbol('pdg0004037'), Integer(2)), Pow(Symbol('pdg0005647'), Integer(2)))), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001467'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4298359835",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\frac{1}{2}m v^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4298359845",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\frac{1}{2m}m^2 v^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1)), Mul(Pow(Symbol('pdg0005156'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4298359851",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\frac{p^2}{2m}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Pow(Symbol('pdg0001134'), Integer(2)), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4301729661",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"[S_0]",
                     latex_rhs:"\frac{[A_{\rm adsorption}]}{\left( \frac{k_{\rm adsorption}}{k_{\rm desorption}} \right) p_A} + [A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003037'), Add(Symbol('pdg0004940'), Mul(Symbol('pdg0004940'), Pow(Mul(Symbol('pdg0009046'), Mul(Symbol('pdg0006850'), Pow(Symbol('pdg0008379'), Integer(-1)))), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4303372136",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E_1",
                     latex_rhs:"KE_1 + PE_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005579'), Add(Symbol('pdg0001955'), Symbol('pdg0004093')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4319470443",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004770')", 
                     latex:"v_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4319544433",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Integer(3), Integer(-1))", 
                     latex:"1/3"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4341171256",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"i \hbar \frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_rhs:"\frac{p^2}{2 m} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0001054'), Derivative(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Tuple(Symbol('pdg0001467'), Integer(1))))), Mul(Mul(Pow(Symbol('pdg0001134'), Integer(2)), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4348571256",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_rhs:"\frac{-i}{\hbar}\frac{p^2}{2 m} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')), Tuple(Symbol('pdg0001467'), Integer(1))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Mul(Integer(-1), Symbol('pdg0004621'))), Mul(Mul(Pow(Symbol('pdg0001134'), Integer(2)), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4370074654",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t",
                     latex_rhs:"t_f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001467'), Symbol('pdg0002467'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4393258808",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{\rm centripetal}",
                     latex_rhs:"m r \omega^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001687'), Mul(Symbol('pdg0005156'), Mul(Pow(Symbol('pdg0002321'), Integer(2)), Symbol('pdg0002530'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4393670960",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"\frac{G m_1 m_2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Symbol('pdg0004851')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4394958389",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla}\cdot \left( \vec{ \nabla} \psi( \vec{r},t) \right)",
                     latex_rhs:"\frac{i}{\hbar} \vec{ \nabla}\cdot\left( \vec{p} \psi( \vec{r},t) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('nabla').dot(Symbol('nabla')( Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Symbol('nabla')(Mul(Symbol('pdg0002046'), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4428528271",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Hooke%27s_law",
                     latex_lhs:"F_{\rm{spring}}",
                     latex_rhs:"-k x",
                     latex_condition:"",
                     name_latex:"Hooke's law",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004183'), Mul(Integer(-1), Mul(Symbol('pdg0001356'), Symbol('pdg0004037'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4437214608",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003192')", 
                     latex:"Z"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4447113478",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int dW",
                     latex_rhs:"G m_1 m_2 \int_{ r_{\rm Earth} }^{\infty} \frac{1}{x^2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Integer(1), Tuple(Symbol('pdg0006789'))), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Mul(Symbol('pdg0004851'), Integral(Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1)), Tuple(Symbol('pdg0004037'), Symbol('pdg0003236'), Symbol('infty')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4470433702",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005344')", 
                     latex:"t_{\rm Earth\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4490788873",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('F'), Mul(Symbol('pdg0004851'), Symbol('propto')))", 
                     latex:"F \propto m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4501377629",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tan( \theta_{\rm Brewster} )",
                     latex_rhs:"\frac{ \sin( \theta_{\rm Brewster} )}{\cos( \theta_{\rm Brewster} )}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tan(Symbol('pdg0004928')), Mul(sin(Symbol('pdg0004928')), Pow(cos(Symbol('pdg0004928')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4504256452",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"B^*",
                     latex_rhs:"|B| \exp(-i \phi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(conjugate(Symbol('pdg0004698')), Mul(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0008586')))), Abs(Symbol('pdg0004698'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4522137851",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008849')", 
                     latex:"PE_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4560648264",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{ \frac{K + (4/3) G}{\rho} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Pow(Mul(Pow(Symbol('pdg0003935'), Integer(-1)), Add(Mul(Mul(Integer(4), Pow(Integer(3), Integer(-1))), Symbol('pdg0003033')), Symbol('pdg0001466'))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4580545876",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"v t - a t^2 + \frac{1}{2} a t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Add(Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0009140'), Pow(Symbol('pdg0001467'), Integer(2)))), Add(Mul(Integer(-1), Symbol('pdg0009140'), Pow(Symbol('pdg0001467'), Integer(2))), Mul(Symbol('pdg0001467'), Symbol('pdg0001357')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4583868070",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004698')", 
                     latex:"B"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4585828572",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\epsilon_0 \mu_0",
                     latex_rhs:"\frac{1}{c^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0007940'), Symbol('pdg0006197')), Pow(Pow(Symbol('pdg0004567'), Integer(2)), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4585932229",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(x)",
                     latex_rhs:"\frac{1}{2}\left(\exp(i x)+\exp(-i x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Symbol('pdg0001464')), Mul(Pow(Integer(2), Integer(-1)), Add(Mul(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4587046017",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004929'))", 
                     latex:"KE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4593428198",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm Earth\ orbit}",
                     latex_rhs:"\frac{2 \pi r_{\rm Earth\ orbit}}{3.16\ 10^7 {\rm seconds}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007427'), Mul(Pow(Float('3.1600000000000001', precision=53), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0006081')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4598294821",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(2 i x)",
                     latex_rhs:"(\cos(x))^2+2i\cos(x)\sin(x)-(\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(2), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(Add(Mul(Integer(2), Mul(Symbol('pdg0004621'), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464'))))), Pow(cos(Symbol('pdg0001464')), Integer(2))), Mul(Integer(-1), Pow(sin(Symbol('pdg0001464')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4627284246",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{\rm centripetal}",
                     latex_rhs:"\frac{m_{\rm satellite} v_{\rm satellite}^2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001687'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Symbol('pdg0003569'), Pow(Symbol('pdg0004082'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4638429483",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(2 i x)",
                     latex_rhs:"(\cos(x)+ i \sin(x))(\cos(x)+ i \sin(x))",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(2), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Mul(Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464'))), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4648451961",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_2^2 - v_1^2",
                     latex_rhs:"(v_2 + v_1)(v_2 - v_1)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(Symbol('pdg0002473'), Integer(2))), Pow(Symbol('pdg0004770'), Integer(2))), Mul(Add(Mul(Integer(-1), Symbol('pdg0002473')), Symbol('pdg0004770')), Add(Symbol('pdg0002473'), Symbol('pdg0004770'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4651061153",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004851')", 
                     latex:"m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4662369843",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x'",
                     latex_rhs:"\gamma (x - v t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005456'), Mul(Symbol('pdg0001790'),Add(Mul(Integer(-1), Symbol('pdg0001467'), Symbol('pdg0001357')), Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4669290568",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"PE_1",
                     latex_rhs:"-F x_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004093'), Mul(Integer(-1), Mul(Symbol('pdg0004202'), Symbol('pdg0003852'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4689334676",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\theta_A",
                     latex_rhs:"\frac{K_{\rm equilibrium}\ p_A}{1+K_{\rm equilibrium}\ p_A}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001791'), Mul(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Pow(Add(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Integer(1)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4742644828",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i x)+\exp(-i x)",
                     latex_rhs:"2 \cos(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Mul(Integer(2), cos(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4748157455",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a t",
                     latex_rhs:"v - v_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0009140'), Symbol('pdg0001467')), Add(Symbol('pdg0001357'), Mul(Integer(-1), Symbol('pdg0005153'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4755369593",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005467')", 
                     latex:"x_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4778077984",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t_f",
                     latex_rhs:"\frac{2 v_0 \sin(\theta)}{g}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002467'), Mul(Pow(Symbol('pdg0001649'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0005153'), sin(Symbol('pdg0001575'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4784793837",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{KE_2 - KE_1}{t}",
                     latex_rhs:"m v a",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Symbol('pdg0005156'), Mul(Symbol('pdg0009140'), Symbol('pdg0001357'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4798787814",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a t + v_0",
                     latex_rhs:"v",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0009140'), Symbol('pdg0001467')), Symbol('pdg0005153')), Symbol('pdg0001357'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4800170179",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F",
                     latex_rhs:"m g_{\rm Earth}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0007557'), Symbol('pdg0005156')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4805233006",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"i \sin(i x)",
                     latex_rhs:"\frac{1}{2}\left(\exp(x) - \exp(-x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004621'), sin(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4811121942",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"\frac{1}{2} m v_2^2 - \frac{1}{2} m v_1^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Add(Mul(Integer(-1), Rational(1, 2), Symbol('pdg0005156'), Pow(Symbol('pdg0002473'), Integer(2))), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0004770'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4820320578",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{gravitational}",
                     latex_rhs:"F_{centripetal}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Symbol('pdg0001687'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4827492911",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x)+(\sin(x))^2",
                     latex_rhs:"1 - (\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sin(Symbol('pdg0001464')), Integer(2)), cos(Mul(Integer(2), Symbol('pdg0001464')))), Add(Integer(1), Mul(Integer(-1), Pow(sin(Symbol('pdg0001464')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4829590294",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002467')", 
                     latex:"t_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4830221561",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}^2\ x + \tanh^2(x)",
                     latex_rhs:"\frac{4+\left(\exp(2x)-1-1+\exp(-2x)\right)}{\left(\exp(x)+\exp(-x)\right)^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sech(Symbol('pdg0001464')), Integer(2)), Pow(tanh(Symbol('pdg0001464')), Integer(2))), Mul(Add(Add(Add(Add(exp(Mul(Integer(2), Symbol('pdg0001464'))), Integer(-1)), Integer(-1)), exp(Mul(Integer(-1), Mul(Integer(2), Symbol('pdg0001464'))))), Integer(4)), Pow(Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4830480629",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4838429483",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(2 i x)",
                     latex_rhs:"\cos(2 x)+i \sin(2 x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(2), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(Mul(Symbol('pdg0004621'), sin(Mul(Integer(2), Symbol('pdg0001464')))), cos(Mul(Integer(2), Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4843995999",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{2 i}\left(\exp(i x)-\exp(-i x) \right)",
                     latex_rhs:"\sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), sin(Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4857472413",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"1",
                     latex_rhs:"\int \psi(x)\psi(x)^* dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0009199')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4857475848",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{a^2}",
                     latex_rhs:"\frac{W}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009139'), Integer(2)), Integer(-1)), Mul(Pow(Integer(2), Integer(-1)), Symbol('pdg0002523')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4858693811",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{T_{\rm orbit}^2 G m_{\rm Earth}}{4 \pi^2}",
                     latex_rhs:"r^3",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Integer(-1)), Mul(Pow(Symbol('pdg0008762'), Integer(2)), Mul(Symbol('pdg0006277'), Symbol('pdg0005458')))), Pow(Symbol('pdg0002530'), Integer(3)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4866160902",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{V}{R_{\rm total}}",
                     latex_rhs:"\frac{V}{R_1} + \frac{V}{R_2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001908'), Integer(-1)), Symbol('pdg0006599')), Add(Mul(Pow(Symbol('pdg0003461'), Integer(-1)), Symbol('pdg0006599')), Mul(Pow(Symbol('pdg0008697'), Integer(-1)), Symbol('pdg0006599'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4872163189",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tanh(x)",
                     latex_rhs:"\frac{\sinh(x)}{\cosh(x)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tanh(Symbol('pdg0001464')), Mul(sinh(Symbol('pdg0001464')), Pow(cosh(Symbol('pdg0001464')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4872970974",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{PE_2 - PE_1}{t}",
                     latex_rhs:"-F v",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0004093')), Symbol('pdg0008849'))), Mul(Integer(-1), Mul(Symbol('pdg0004202'), Symbol('pdg0001357'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4878728014",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(i x)",
                     latex_rhs:"\frac{1}{2i}\left(\exp(-x) - \exp(x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), Mul(Integer(-1), exp(Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4901237716",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(1)", 
                     latex:"1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4923339482",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"i x",
                     latex_rhs:"\log(y)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')), log(Symbol('pdg0001452'), Integer(10)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4928007622",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_1",
                     latex_rhs:"\frac{1}{2} m v_1^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001955'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0002473'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4928239482",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\log(y)",
                     latex_rhs:"i x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(log(Symbol('pdg0001452'), Integer(10)), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4935235303",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4938429482",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(-i x)",
                     latex_rhs:"\cos(x)+i \sin(-x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(Mul(Symbol('pdg0004621'), sin(Mul(Integer(-1), Symbol('pdg0001464')))), cos(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4938429483",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i x)",
                     latex_rhs:"\cos(x)+i \sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4938429484",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(-i x)",
                     latex_rhs:"\cos(x)-i \sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(Mul(Integer(-1), Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4939880586",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V_{\rm total}",
                     latex_rhs:"I R_{\rm total}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004691'), Mul(Symbol('pdg0004501'), Symbol('pdg0001908')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4943571230",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \psi( \vec{r},t)",
                     latex_rhs:"\frac{i}{\hbar} \vec{p} \psi_0 \exp\left(\frac{i}{\hbar}\left( \vec{p}\cdot\vec{r} - E t \right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('nabla')(Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Mul(Symbol('pdg0002046'), Mul(Symbol('pdg0008330'), exp(Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Add(Mul(Integer(-1), Symbol('pdg0006238'), Symbol('pdg0001467')), Mul(Symbol('pdg0002046'), Symbol('pdg0009472')))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4947831649",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{2} m_1 v_{\rm final}^2",
                     latex_rhs:"W_{\rm to\ system}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005022'), Pow(Symbol('pdg0008909'), Integer(2)))), Symbol('pdg0009372'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4948763856",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 a d + v_0^2",
                     latex_rhs:"v^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(2), Mul(Symbol('pdg0009140'), Symbol('pdg0001943'))), Pow(Symbol('pdg0005153'), Integer(2))), Pow(Symbol('pdg0001357'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4948934890",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle \psi| \hat{A} |\psi \rangle",
                     latex_rhs:"\langle a \rangle^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004065')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4949359835",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle x^2\rangle -2\langle x^2 \rangle+\langle x \rangle^2",
                     latex_rhs:"\langle x^2 \rangle-\langle x \rangle^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4961662865",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4968680693",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tan( x )",
                     latex_rhs:"\frac{ \sin( x )}{\cos( x )}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tan(Symbol('pdg0001464')), Mul(sin(Symbol('pdg0001464')), Pow(cos(Symbol('pdg0001464')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"4985825552",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\nabla^2 E( \vec{r})\exp(i \omega t)",
                     latex_rhs:"i \omega \mu_0 \epsilon_0 \frac{\partial}{\partial t} E( \vec{r})\exp(i \omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))), Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Mul(Symbol('pdg0006197'), Mul(Symbol('pdg0007940'), Derivative(Mul(Function('pdg0006238')(Symbol('pdg0009472')), exp(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467'))))), Tuple(Symbol('pdg0001467'), Integer(1))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5002539602",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"dU",
                     latex_rhs:"C_V dT + \pi_T dV",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('dU'), Add(Mul(Symbol('pdg0006682'), Symbol('dT')), Mul(Symbol('dV'), Symbol('pdg0005480'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5011888122",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004770')", 
                     latex:"v_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5021965469",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004929')", 
                     latex:"KE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5050429607",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0003236'), Integer(-1)), Mul(Symbol('pdg0005156'), Symbol('pdg0005458'))))", 
                     latex:"G \frac{m_{\rm Earth} m}{r_{\rm Earth}}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5074423401",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007586')", 
                     latex:"V"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5075406409",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004930')", 
                     latex:"PE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5085809757",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{k_{\rm adsorption}}{k_{\rm desorption}}",
                     latex_rhs:"\frac{[A_{\rm adsorption}]}{p_A [S]}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006850'), Pow(Symbol('pdg0008379'), Integer(-1))), Mul(Symbol('pdg0004940'), Pow(Mul(Symbol('pdg0009067'), Symbol('pdg0009046')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5089196493",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004202')", 
                     latex:"F"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5125940051",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"|A|^2 + B B^* + A B^* + B A^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004453'))), Add(Mul(Symbol('pdg0004453'), conjugate(Symbol('pdg0004698'))), Add(Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004698'))), Pow(Abs(Symbol('pdg0004453')), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5128670694",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_1 d_1",
                     latex_rhs:"m_2 d_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0007652'), Symbol('pdg0005022')), Mul(Symbol('pdg0002798'), Symbol('pdg0004851')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5136652623",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"KE + PE",
                     latex_condition:"",
                     name_latex:"mechanical energy is the sum of the potential plus kinetic energies",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Add(Symbol('pdg0004929'), Symbol('pdg0004930')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5144263777",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v^2",
                     latex_rhs:"v_0^2 + 2 a \left( v_0 t +\frac{1}{2} a t^2 \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001357')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5148266645",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t'",
                     latex_rhs:"\frac{\gamma x (1 - \gamma^2 )}{\gamma^2 v} + \gamma t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001790')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5177311762",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{2 \pi r}{T}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Pow(Symbol('pdg0008762'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5181421075",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008697')", 
                     latex:"R_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5194141542",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003652')", 
                     latex:"x_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5208737840",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005595')", 
                     latex:"T_{\rm geostationary\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5239755033",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002473')", 
                     latex:"v_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5258419993",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008697')", 
                     latex:"R_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5284610349",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0001790'), Integer(2))", 
                     latex:"\gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5323719091",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"i \sinh x",
                     latex_rhs:"\frac{1}{2i} \left( \exp(-x) - \exp(x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004621'), sinh(Symbol('pdg0001464'))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), Mul(Integer(-1), exp(Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5345738321",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Newton%27s_laws_of_motion#Newton's_second_law",
                     latex_lhs:"F",
                     latex_rhs:"m a",
                     latex_condition:"",
                     name_latex:"Newton's second law of motion",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0009140'), Symbol('pdg0005156')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5349669879",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\tanh(x)",
                     latex_rhs:"\frac{ \exp(x)-\exp(-x)}{\exp(x)+\exp(-x)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(tanh(Symbol('pdg0001464')), Mul(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464'))), Pow(Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5349866551",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{v}",
                     latex_rhs:"v_x \hat{x} + v_y \hat{y}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006373'), Add(Mul(Symbol('pdg0008339'), Symbol('pdg0005505')), Mul(Symbol('pdg0001700'), Symbol('pdg0009107'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5353282496",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{v_0^2}{g}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Pow(Symbol('pdg0001649'), Integer(-1)), Pow(Symbol('pdg0005153'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5359471792",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0003569'), Pow(Symbol('pdg0002530'), Integer(-1)))", 
                     latex:"\frac{m_{\rm satellite}}{r}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5373931751",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t",
                     latex_rhs:"t_f",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001467'), Symbol('pdg0002467'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5379546684",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y_f",
                     latex_rhs:"- \frac{1}{2} g t_f^2 + v_0 t_f \sin(\theta) + y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007092'), Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), sin(Symbol('pdg0001575')))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0002467'), Integer(2))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5398681502",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5398681503",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5404822208",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm escape}",
                     latex_rhs:"\sqrt{2 G \frac{m}{r}}",
                     latex_condition:"",
                     name_latex:"escape velocity",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008656'), Mul(Pow(Integer(2), Rational(1, 2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005156'), Pow(Symbol('pdg0002530'), Integer(-1))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5415824175",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x(t)",
                     latex_rhs:"A \cos(\omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('x')(Symbol('pdg0001467')), Mul(Symbol('pdg0009885'), cos(Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5426308937",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{d}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Symbol('pdg0001943'), Pow(Symbol('pdg0001467'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5426418187",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004940')", 
                     latex:"[A_{\rm adsorption}]"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5438722682",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"v_0 t \cos(\theta) + x_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0001467'), cos(Symbol('pdg0001575')))), Symbol('pdg0001572')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5453995431",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"atan(Symbol('pdg0001464'))", 
                     latex:"\arctan{ x }"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5463275819",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004856')", 
                     latex:"I_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5514556106",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E_2 - E_1",
                     latex_rhs:"(KE_2 - KE_1) + (PE_2 - PE_1)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Symbol('pdg0005579')), Symbol('pdg0004550')), Add(Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352')), Add(Mul(Integer(-1), Symbol('pdg0004093')), Symbol('pdg0008849'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5516739892",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(-1)", 
                     latex:"-1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5530148480",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{1}-\vec{p}_{2}",
                     latex_rhs:"\vec{p}_{electron}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0006029'), Mul(Integer(-1), Symbol('pdg0002097'))), Symbol('pdg0004299'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5542390646",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0009140'))", 
                     latex:"2 a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5542528160",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int dW",
                     latex_rhs:"F \int_0^x dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Integer(1), Tuple(Symbol('pdg0006789'))), Mul(Symbol('pdg0004202'), Integral(Integer(1), Tuple(Symbol('pdg0004037'), Integer(0), Symbol('pdg0004037')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5563580265",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{\rm gravity}",
                     latex_rhs:"G \frac{m_{\rm Earth} m_{\rm satellite}}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005458'), Symbol('pdg0003569')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5585739998",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004501')", 
                     latex:"I"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5586102077",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r",
                     latex_rhs:"d_1 + d_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002530'), Add(Symbol('pdg0007652'), Symbol('pdg0002798')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5591692598",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001955')", 
                     latex:"KE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5596822289",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"-G m_1 m_2 \left(\left.\frac{-1}{x}\right|^r_{\infty}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Symbol('pdg0004851')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5611024898",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{1}{2 a} (v^2 - v_0^2)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Pow(Mul(Integer(2), Symbol('pdg0009140')), Integer(-1)), Add(Pow(Symbol('pdg0001357'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0005153'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5620558729",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005153')", 
                     latex:"v_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5623794884",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Add(Symbol('pdg0004453'), Symbol('pdg0004698'))", 
                     latex:"A + B"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5632428182",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"cos(Symbol('pdg0004928'))", 
                     latex:"\cos( \theta_{\rm Brewster} )"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5634116660",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"definition of internal pressure at constant temperature",
                     latex_lhs:"\pi_T",
                     latex_rhs:"\left(\frac{\partial U}{\partial V}\right)_T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005480'), Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007586'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5646314683",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m",
                     latex_rhs:"A m_p",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009863'), Mul(Symbol('pdg0003285'), Symbol('pdg0005916')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5658865948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"\frac{r^3 4 \pi^2}{(m_1+m_2)G}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Pow(Mul(Symbol('pdg0006277'), Add(Symbol('pdg0005022'), Symbol('pdg0004851'))), Integer(-1)), Mul(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Pow(Symbol('pdg0002530'), Integer(3)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5667870149",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001575')", 
                     latex:"\theta"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5669500954",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2)))", 
                     latex:"v^2 \gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5684907106",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Mul(Symbol('pdg0002798'), Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2)))), Integer(-1))", 
                     latex:"\frac{1}{d_2 4 \pi^2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5693047217",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm final}",
                     latex_rhs:"-\sqrt{\frac{2 G m_2}{r}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008909'), Mul(Integer(-1), Pow(Mul(Integer(2), Symbol('pdg0006277'), Symbol('pdg0004851'), Pow(Symbol('pdg0002530'), Integer(-1))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5727578862",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d^2}{dx^2} \psi(x)",
                     latex_rhs:"-k^2 \psi(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0009199')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5732331610",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"2022-03-25 BHP: Conversion between Latex and Sympy is incomplete",
                     latex_lhs:"W",
                     latex_rhs:"G m_1 m_2 \left( \frac{1}{x} \bigg\rvert_{ r_{\rm Earth} }^{\infty} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0006277')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5733146966",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_2 - KE_1",
                     latex_rhs:"\frac{1}{2} m \left(v_2^2 - v_1^2\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352')), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'),Add(Mul(Integer(-1), Pow(Symbol('pdg0002473'), Integer(2))), Pow(Symbol('pdg0004770'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5733721198",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{1}{2} (v + v_0) \left( \frac{v - v_0}{a} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Pow(Integer(2), Integer(-1)), Mul(Mul(Pow(Symbol('pdg0009140'), Integer(-1)), Add(Symbol('pdg0001357'), Mul(Integer(-1), Symbol('pdg0005153')))), Add(Symbol('pdg0001357'), Symbol('pdg0005153')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5763749235",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-c^2 + c^2 \gamma^2",
                     latex_rhs:"v^2 \gamma^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Symbol('pdg0001790'), Integer(2))), Mul(Integer(-1), Pow(Symbol('pdg0004567'), Integer(2)))), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Symbol('pdg0001357'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5770088141",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5775658332",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5778176146",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5779256336",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm by\ system}",
                     latex_rhs:"KE_{\rm final} - KE_{\rm initial}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006191'), Add(Symbol('pdg0005340'), Mul(Integer(-1), Symbol('pdg0004121'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5781435087",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001649')", 
                     latex:"g"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5781981178",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Difference_of_two_squares",
                     latex_lhs:"x^2 - y^2",
                     latex_rhs:"(x+y)(x-y)",
                     latex_condition:"",
                     name_latex:"difference of squares",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0001452'), Integer(2)))), Mul(Add(Symbol('pdg0001464'), Mul(Integer(-1), Symbol('pdg0001452'))), Add(Symbol('pdg0001464'), Symbol('pdg0001452'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5787469164",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2))))", 
                     latex:"1 - \gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5789289057",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"equation 4 in the PDF",
                     latex_lhs:"v",
                     latex_rhs:"\alpha c \sqrt{ \frac{m_e}{2 m} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Mul(Symbol('pdg0001370'), Mul(Symbol('pdg0004567'), Pow(Mul(Pow(Mul(Integer(2), Symbol('pdg0009863')), Integer(-1)), Symbol('pdg0002515')), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5799753649",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5803210729",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008849')", 
                     latex:"PE_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5832984291",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(\sin(x))^2 + (\cos(x))^2",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sin(Symbol('pdg0001464')), Integer(2)), Pow(cos(Symbol('pdg0001464')), Integer(2))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5838268428",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\alpha c",
                     latex_rhs:"\frac{1}{4 \pi \epsilon_0} \frac{e^2}{\hbar}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0001370'), Symbol('pdg0004567')), Mul(Pow(Mul(Integer(4), Mul(Symbol('pdg0007940'), Symbol('pdg0003141'))), Integer(-1)), Mul(Pow(Symbol('pdg0001999'), Integer(2)), Pow(Symbol('pdg0001054'), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5846177002",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('t')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5846639423",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm final}",
                     latex_rhs:"\sqrt{\frac{2 G m_2}{r}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008909'), Pow(Mul(Integer(2), Symbol('pdg0006277'), Symbol('pdg0004851'), Pow(Symbol('pdg0002530'), Integer(-1))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5850144586",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm by\ system}",
                     latex_rhs:"KE_{\rm final}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006191'), Symbol('pdg0005340'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5857434758",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int a dx",
                     latex_rhs:"a x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Symbol('pdg0009139'), Tuple(Symbol('pdg0001464'))), Mul(Symbol('pdg0009139'), Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5866629429",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}^2\ x + \tanh^2(x)",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sech(Symbol('pdg0001464')), Integer(2)), Pow(tanh(Symbol('pdg0001464')), Integer(2))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5868688585",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/representing-laplace-operator-nabla-in.html",
                     latex_lhs:"\frac{-\hbar^2}{2m} \nabla^2 \psi \left( \vec{r},t \right)",
                     latex_rhs:"\frac{p^2}{2m} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Mul(Integer(-1), Pow(Symbol('pdg0001054'), Integer(2))), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))), Mul(Pow(Symbol('nabla'), Integer(2)), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))), Mul(Mul(Pow(Symbol('pdg0001134'), Integer(2)), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5868731041",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005153')", 
                     latex:"v_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5890617067",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006458')", 
                     latex:"R"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5900595848",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"k",
                     latex_rhs:"\frac{\omega}{v}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005321'), Mul(Symbol('pdg0002321'), Pow(Symbol('pdg0001357'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5902985919",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{F}",
                     latex_rhs:"G \frac{m_1 m_2}{x^2} \hat{x}",
                     latex_condition:"",
                     name_latex:"Newton's law of universal gravitation",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0004037'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5904227750",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5928285821",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + 2 x (b/(2 a)) + (b/(2 a))^2",
                     latex_rhs:"(x + (b/(2 a)))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Integer(2), Mul(Symbol('pdg0001464'),Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))))))), Pow(Add(Symbol('pdg0001464'), Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5928292841",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + (b/a)x + (b/(2 a))^2",
                     latex_rhs:"-c/a + (b/(2 a))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0001939'))))), Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Mul(Integer(-1), Symbol('pdg0004231')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5938459282",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + (b/a)x",
                     latex_rhs:"-c/a",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0001939')))), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Mul(Integer(-1), Symbol('pdg0004231'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5945893986",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d^2 x}{dt^2}",
                     latex_rhs:"-A \omega^2 \cos(\omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Pow(Symbol('d'), Integer(2)), Symbol('x')), Pow(Pow(Symbol('dt'), Integer(2)), Integer(-1))), Mul(Integer(-1), Mul(Symbol('pdg0009885'), Mul(Pow(Symbol('pdg0002321'), Integer(2)), cos(Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5958392859",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + (b/a)x+(c/a)",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0009139')))), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5959282914",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + x(b/a) + (b/(2 a))^2",
                     latex_rhs:"(x+(b/(2 a)))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Add(Pow(Symbol('pdg0001464'), Integer(2)), Mul(Symbol('pdg0001464'),Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0001939'))))), Pow(Add(Symbol('pdg0001464'), Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5960438249",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005579')", 
                     latex:"E_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5962145508",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{nR}{VP}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004686'), Mul(Pow(Mul(Symbol('pdg0008134'), Symbol('pdg0007586')), Integer(-1)), Mul(Symbol('pdg0008179'), Symbol('pdg0002834'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5978756813",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"G m_{\rm Earth} m \left( 0 - \frac{-1}{ r_{\rm Earth}} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Mul(Symbol('pdg0005156'),Pow(Symbol('pdg0003236'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5982958248",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"-\sqrt{(b/(2 a))^2 - (c/a)}-(b/(2 a))",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'), Add(Mul(Integer(-1), Mul(Rational(1, 2), Pow(Symbol('pdg0009139'), Integer(-1))), Symbol('pdg0001939')), Mul(Integer(-1), Pow(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5982958249",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x+(b/(2 a))",
                     latex_rhs:"-\sqrt{(b/(2 a))^2 - (c/a)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001464'), Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))), Mul(Integer(-1), Pow(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"5985371230",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \psi( \vec{r},t)",
                     latex_rhs:"\frac{i}{\hbar} \vec{p} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Symbol('nabla'), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))), Mul(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0004621')), Mul(Symbol('pdg0002046'), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6023986360",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6026694087",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{centripetal}",
                     latex_rhs:"m \frac{v^2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001687'), Mul(Symbol('pdg0005156'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Pow(Symbol('v'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6031385191",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sinh^2 x",
                     latex_rhs:"\left(\frac{\exp(x) - \exp(-x)}{2}\right)\left(\frac{\exp(x) - \exp(-x)}{2}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(sinh(Symbol('pdg0001464')), Integer(2)), Mul(Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464')))), Mul(Pow(Integer(2), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6038673136",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6050070428",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002958')", 
                     latex:"v_{0, x}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6055078815",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"constant pressure",
                     latex_lhs:"\left(\frac{\partial U}{\partial T}\right)_p",
                     latex_rhs:"C_V \left(\frac{\partial T}{\partial T}\right)_p + \pi_T \left( \frac{\partial V}{\partial T} \right)_p",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007343'), Integer(1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6061695358",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V_2",
                     latex_rhs:"I R_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008721'), Mul(Symbol('pdg0004501'), Symbol('pdg0003461')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6083821265",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_0 \cos(\theta)",
                     latex_rhs:"v_{0, x}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0005153'), cos(Symbol('pdg0001575'))), Symbol('pdg0002958'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6091977310",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_{\rm initial}",
                     latex_rhs:"\frac{1}{2} m_1 v_{\rm initial}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004121'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005022'), Pow(Symbol('pdg0001934'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6098638221",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001469')", 
                     latex:"y_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6131764194",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://physicsderivationgraph.blogspot.com/2020/09/evaluating-definite-integrals-for.html",
                     latex_lhs:"W",
                     latex_rhs:"G m_{\rm Earth} m \left( \frac{1}{x^2} \bigg\rvert_{ r_{\rm Earth} }^{\infty} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('W'), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Mul(Symbol('pdg0005156'), Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6134836751",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x}",
                     latex_rhs:"v_x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002958'), Symbol('pdg0005505'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6158970683",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004093')", 
                     latex:"PE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6175547907",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm average}",
                     latex_rhs:"\frac{v + v_0}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006709'), Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0001357'), Symbol('pdg0005153'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6204539227",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g t + v_{0, y}",
                     latex_rhs:"\frac{dy}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Mul(Symbol('pdg0006277'), Symbol('pdg0001467'))), Symbol('pdg0009431')), Derivative(Symbol('pdg0005647'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6238632840",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0008762'), Integer(2)), Symbol('pdg0002530'))", 
                     latex:"r T_{\rm orbit}^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6239815585",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001534')", 
                     latex:"C_{\rm Earth\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6240206408",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm incoherent}",
                     latex_rhs:"|A|^2 + |B|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002435'), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6240546932",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{K_{equilibrium}}",
                     latex_rhs:"\frac{k_{\rm desorption}}{k_{\rm adsorption}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0004933'), Integer(-1)), Mul(Pow(Symbol('pdg0006850'), Integer(-1)), Symbol('pdg0008379')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6259833695",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003285')", 
                     latex:"A"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6268336290",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{gravitational}",
                     latex_rhs:"\frac{m}{r}\left(\frac{2\pi r}{T}\right)^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Pow(Mul(Pow(Symbol('pdg0008762'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530')))), Integer(2)), Mul(Symbol('pdg0004851'), Pow(Symbol('pdg0002530'), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6281834543",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005022')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6296166842",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008134')", 
                     latex:"P"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6306552185",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"(A + B)(A^* + B^*)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Mul(Add(Symbol('pdg0004453'), Symbol('pdg0004698')), Add(conjugate(Symbol('pdg0004453')), conjugate(Symbol('pdg0004698')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6346902704",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(1)", 
                     latex:"1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6348260313",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"C_{\rm Earth\ orbit}",
                     latex_rhs:"2 \pi r_{\rm Earth\ orbit}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001534'), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0006081'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6353701615",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002243')", 
                     latex:"\theta_{\rm refracted}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6383056612",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004929')", 
                     latex:"KE"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6397683463",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V \alpha",
                     latex_rhs:"\left( \frac{\partial V}{\partial T} \right)_p",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0007586'), Symbol('pdg0004686')), Derivative(Symbol('pdg0007586'), Tuple(Symbol('pdg0007343'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6404535647",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh x",
                     latex_rhs:"\frac{\exp(x) + \exp(-x)}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cosh(Symbol('pdg0001464')), Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6408214498",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0004567'), Integer(2))", 
                     latex:"c^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6410818363",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001575')", 
                     latex:"\theta"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6417359412",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005153')", 
                     latex:"v_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6421241247",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"v t - \frac{1}{2} a t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Add(Mul(Integer(-1), Rational(1, 2), Symbol('pdg0009140'), Pow(Symbol('pdg0001467'), Integer(2))), Mul(Symbol('pdg0001467'), Symbol('pdg0001357'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6450985774",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"eq 34-44 on page 819 in \cite{2001_HRW}",
                     latex_lhs:"n_1 \sin( \theta_1 )",
                     latex_rhs:"n_2 \sin( \theta_2 )",
                     latex_condition:"",
                     name_latex:"Law of Refraction",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002941'), sin(Symbol('pdg0003509'))), Mul(Symbol('pdg0001958'), sin(Symbol('pdg0007545'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6457044853",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v - a t",
                     latex_rhs:"v_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Symbol('pdg0009140'), Symbol('pdg0001467')), Symbol('pdg0001357')), Symbol('pdg0005153'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6457999644",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{[S_0]}{[A_{\rm adsorption}]}",
                     latex_rhs:"\frac{1}{K_{\rm equilibrium}} \frac{1}{p_A} + 1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0004940'), Integer(-1)), Symbol('pdg0003037')), Add(Integer(1), Mul(Pow(Symbol('pdg0004933'), Integer(-1)), Pow(Symbol('pdg0009046'), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6463266449",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002467')", 
                     latex:"t_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6498985149",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008656')", 
                     latex:"v_{\rm escape}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6504442697",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{ \frac{K}{\rho} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Pow(Mul(Symbol('K'), Pow(Symbol('pdg0003935'), Integer(-1))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6529120965",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004698')", 
                     latex:"B"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6529793063",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm incoherent}",
                     latex_rhs:"|A|^2 + |A|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002435'), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004453')), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6535639720",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003236')", 
                     latex:"r_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6546594355",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001908')", 
                     latex:"R_{\rm total}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6554292307",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6555185548",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"A^*",
                     latex_rhs:"|A| \exp(-i \theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(conjugate(Symbol('pdg0004453')), Mul(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001575')))), Abs(Symbol('pdg0004453'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6556875579",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{I_{\rm coherent}}{I_{\rm incoherent}}",
                     latex_rhs:"2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0008251'), Pow(Symbol('pdg0002435'), Integer(-1))), Integer(2))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6572039835",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g t + v_{0, y}",
                     latex_rhs:"v_y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Mul(Symbol('pdg0001649'), Symbol('pdg0001467'))), Symbol('pdg0009431')), Symbol('pdg0009107'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6599829782",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008909')", 
                     latex:"v_{\rm final}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6672141531",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004711')", 
                     latex:"dt"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6681646197",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6701855578",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004770')", 
                     latex:"v_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6715248283",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Potential_energy",
                     latex_lhs:"PE",
                     latex_rhs:"-F x",
                     latex_condition:"",
                     name_latex:"potential energy",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004930'), Mul(Integer(-1), Mul(Symbol('pdg0004202'), Symbol('pdg0004037'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6729698807",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005153')", 
                     latex:"v_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6732786762",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6742123016",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{electron}\cdot\vec{p}_{electron}",
                     latex_rhs:"( \vec{p}_{1}\cdot\vec{p}_{1})+( \vec{p}_{2}\cdot\vec{p}_{2})-2( \vec{p}_{1}\cdot\vec{p}_{2})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004299')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6749533119",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004093')", 
                     latex:"PE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6753224061",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm total}",
                     latex_rhs:"I_1 + I_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009647'), Add(Symbol('pdg0003978'), Symbol('pdg0004856')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6774684564",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"for coherent waves",
                     latex_lhs:"\theta",
                     latex_rhs:"\phi",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001575'), Symbol('pdg0008586'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6783009163",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm adsorption}",
                     latex_rhs:"r_{\rm desorption}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006687'), Symbol('pdg0001966'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6785303857",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"C",
                     latex_rhs:"2 \pi r",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003034'), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6800170830",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm Schwarzschild}",
                     latex_rhs:"\frac{2 G m}{c^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004518'), Mul(Mul(Integer(2), Mul(Symbol('pdg0006277'), Symbol('pdg0005156'))), Pow(Pow(Symbol('pdg0004567'), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6829281943",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{\rm centripetal}",
                     latex_rhs:"G \frac{m_1 m_2}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001687'), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6831637424",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin( 90^{\circ} - \theta_{\rm Brewster} )",
                     latex_rhs:"\cos( \theta_{\rm Brewster} )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004928')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6831694380",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a",
                     latex_rhs:"\frac{d^2 x}{dt^2}",
                     latex_condition:"",
                     name_latex:"acceleration",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('a'), Mul(Mul(Pow(Symbol('d'), Integer(2)), Symbol('x')), Pow(Pow(Symbol('dt'), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6838659900",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001352')", 
                     latex:"KE_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6870322215",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_{\rm escape}",
                     latex_rhs:"\frac{1}{2} m v_{\rm escape}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005332'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0008656'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6885625907",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i \pi)",
                     latex_rhs:"-1 + i 0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0003141'))), Add(Mul(Integer(0), Symbol('pdg0004621')), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6892595652",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{2} m_1 v_{\rm final}^2",
                     latex_rhs:"\frac{G m_1 m_2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005022'), Pow(Symbol('pdg0008909'), Integer(2)))), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Symbol('pdg0004851')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6908055431",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x(t)",
                     latex_rhs:"A \cos\left(\frac{k}{m} t\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('x')(Symbol('pdg0001467')), Mul(Symbol('pdg0009885'), cos(Mul(Symbol('pdg0001467'), Mul(Symbol('k'), Pow(Symbol('pdg0005156'), Integer(-1)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6925244346",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{PV}{T} \frac{1}{VP}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004686'), Mul(Pow(Symbol('pdg0007343'), Integer(-1)), Mul(Symbol('pdg0008134'), Symbol('pdg0007586'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6935745841",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Newton%27s_law_of_universal_gravitation#Modern_form",
                     latex_lhs:"F",
                     latex_rhs:"G \frac{m_1 m_2}{x^2}",
                     latex_condition:"",
                     name_latex:"Newton's law of universal gravitation",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6946088325",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{C}{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Symbol('pdg0003034'), Pow(Symbol('pdg0001467'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6955192897",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"r_{\rm desorption}",
                     latex_rhs:"k_{\rm desorption} [A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001966'), Mul(Symbol('pdg0004940'), Symbol('pdg0008379')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6964468708",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001955')", 
                     latex:"KE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6974054946",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Symbol('pdg0002467')))", 
                     latex:"\frac{1}{2} g t_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6976493023",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"6998364753",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm Earth\ orbit}",
                     latex_rhs:"\frac{2 \pi \left( 1.496\ 10^8 {\rm km} \right)}{3.16\ 10^7 {\rm seconds}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007427'), Mul(Pow(Float('3.1600000000000001', precision=53), Integer(-1)), Mul(Integer(2), Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7002609475",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{V}{R_2}",
                     latex_rhs:"I_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0003461'), Integer(-1)), Symbol('pdg0006599')), Symbol('pdg0004856'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7010294143",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T_{\rm orbit}^2 G m_{\rm Earth}",
                     latex_rhs:"4 \pi^2 r^3",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0008762'), Integer(2)), Mul(Symbol('pdg0006277'), Symbol('pdg0005458'))), Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(3)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7011114072",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{(v_0 + a t) + v_0}{2} t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Symbol('pdg0001467'), Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0005153'), Add(Mul(Symbol('pdg0009140'), Symbol('pdg0001467')), Symbol('pdg0005153'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7049769409",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7053449926",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007110')", 
                     latex:"r_{\rm geostationary\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7057864873",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"frame of reference is moving only along x direction",
                     latex_lhs:"y'",
                     latex_rhs:"y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001888'), Symbol('pdg0005647'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7083390553",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7107090465",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"B B^*",
                     latex_rhs:"|B|^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004698'))), Pow(Abs(Symbol('pdg0004698')), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7112613117",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_{\rm Earth}",
                     latex_rhs:"\frac{(9.80665 m/s^2) r_{\rm Earth}^2}{6.67430*10^{-11}m^3 kg^{-1} s^{-2}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0005458')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7112646057",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm final}^2",
                     latex_rhs:"\frac{2 G m_2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0008909'), Integer(2)), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0006277'), Symbol('pdg0004851')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7140470627",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7154592211",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007545')", 
                     latex:"\theta_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7159989263",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))", 
                     latex:"i x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7175416299",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t_{\rm Earth\ orbit}",
                     latex_rhs:"1 {\rm year}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005344'), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7191277455",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006458')", 
                     latex:"R"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7194432406",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004518')", 
                     latex:"r_{\rm Schwarzschild}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7214442790",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7215099603",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v^2",
                     latex_rhs:"v_0^2 + 2 a t v_0 + a^2 t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001357'), Integer(2)), Add(Mul(Pow(Symbol('pdg0009140'), Integer(2)), Pow(Symbol('pdg0001467'), Integer(2))), Add(Mul(Integer(2), Mul(Symbol('pdg0009140'), Mul(Symbol('pdg0001467'), Symbol('pdg0005153')))), Pow(Symbol('pdg0005153'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7217021879",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"R_{\rm total}",
                     latex_rhs:"R_1 + R_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001908'), Add(Symbol('pdg0008697'), Symbol('pdg0003461')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7233558441",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"v_0 t_f \cos(\theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), cos(Symbol('pdg0001575')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7252338326",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_y",
                     latex_rhs:"\frac{dy}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009107'), Derivative(Symbol('pdg0005647'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7263534144",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0004567'), Integer(2))", 
                     latex:"c^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7267155233",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{PE_2 - PE_1}{t}",
                     latex_rhs:"-F \left( \frac{x_2 - x_1}{t} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0004093')), Symbol('pdg0008849'))), Mul(Integer(-1), Mul(Symbol('pdg0004202'),Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0003852')), Symbol('pdg0005467'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7267424860",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{\theta_A}",
                     latex_rhs:"\frac{1+(K_{\rm equilibrium}\ p_A)}{K_{\rm equilibrium}\ p_A}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001791'), Integer(-1)), Mul(Pow(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Integer(-1)), Add(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7321695558",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004928')", 
                     latex:"\theta_{\rm Brewster}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7326066466",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006277')", 
                     latex:"G"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7337056406",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0001790'), Integer(2)), Symbol('pdg0004037'))", 
                     latex:"\gamma^2 x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7354529102",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y",
                     latex_rhs:"- \frac{1}{2} g \left( \frac{x - x_0}{v_{0, x}} \right)^2 + v_{0, y} \frac{x - x_0}{v_{0, x}} + y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005647'), Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0009431'), Mul(Pow(Symbol('pdg0002958'), Integer(-1)), Add(Symbol('pdg0004037'), Mul(Integer(-1), Symbol('pdg0001572'))))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Pow(Mul(Symbol('pdg0001649'),Mul(Pow(Symbol('pdg0002958'), Integer(-1)), Add(Symbol('pdg0004037'), Mul(Integer(-1), Symbol('pdg0001572'))))), Integer(2)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7375348852",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004928')", 
                     latex:"\theta_{\rm Brewster}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7376526845",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(\theta)",
                     latex_rhs:"\frac{v_{0, y}}{v_0}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Symbol('pdg0001575')), Mul(Pow(Symbol('pdg0009431'), Integer(-1)), Symbol('pdg0005153')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7391837535",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(\theta)",
                     latex_rhs:"\frac{v_{0, x}}{v_0}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Symbol('pdg0001575')), Mul(Pow(Symbol('pdg0002958'), Integer(-1)), Symbol('pdg0005153')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7410124465",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001908')", 
                     latex:"R_{\rm total}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7410526982",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Pow(Symbol('pdg0005022'), Integer(-1)))", 
                     latex:"2/m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7445388869",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(-1)", 
                     latex:"-1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7453225570",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7455581657",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x}",
                     latex_rhs:"\frac{dx}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002958'), Derivative(Symbol('pdg0009199'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7466829492",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \cdot \vec{E}",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(dot(Symbol('pdg0006238'), Symbol('nabla')), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7473576008",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"\frac{-1}{A \cos(\omega t)}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7476820482",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003034')", 
                     latex:"C"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7497687256",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006599')", 
                     latex:"V"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7513513483",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma^2 (c^2 - v^2)",
                     latex_rhs:"c^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001790'), Integer(2)), Add(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0001357'), Integer(2))))), Pow(Symbol('pdg0004567'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7517073655",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"[S_0]",
                     latex_rhs:"\left(\frac{1}{K_{\rm equilibrium}} \frac{1}{p_A} + 1\right)[A_{\rm adsorption}]",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003037'), Mul(Symbol('pdg0004940'), Add(Integer(1), Mul(Pow(Symbol('pdg0004933'), Integer(-1)), Pow(Symbol('pdg0009046'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7556442438",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2)))", 
                     latex:"4 \pi^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7560908617",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7564010952",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(-1)", 
                     latex:"-1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7564894985",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int \cos\left(\frac{2n\pi}{W} x\right) dx",
                     latex_rhs:"\frac{W}{2n\pi}\sin\left(\frac{2n\pi}{W} x\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(cos(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))), Tuple(Symbol('pdg0004037'))), Mul(Mul(Symbol('pdg0002523'), Pow(Mul(Integer(2), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))), Integer(-1))), sin(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Integer(2), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7572664728",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x) + 2 (\sin(x))^2",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(2), Pow(sin(Symbol('pdg0004037')), Integer(2))), cos(Mul(Integer(2), Symbol('pdg0004037')))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7573835180",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"the potential energy at the surface of the Earth is equal to the work needed to get it from the center of the Earth to the surface",
                     latex_lhs:"PE_{\rm Earth\ surface}",
                     latex_rhs:"-W",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006431'), Mul(Integer(-1), Symbol('pdg0006789')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575738420",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\sin\left(\frac{n \pi}{W}x\right) \right)^2",
                     latex_rhs:"\frac{1-\cos\left(2\frac{n \pi}{W}x\right)}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(sin(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))), Integer(2)), Mul(Pow(Integer(2), Integer(-1)), Add(Integer(1), Mul(Integer(-1), cos(Mul(Integer(2), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859295",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{ \nabla} \times \vec{E}",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cross(Symbol('pdg0006238'), cross(Symbol('nabla'), Symbol('nabla'))), Function('nabla')(Add(Mul(Integer(-1), Symbol('pdg0006238'), Mul(Symbol('nabla'), Symbol('nabla'))), dot(Symbol('pdg0006238'), Symbol('nabla')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859300",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\epsilon^{i,j,k} \hat{x}_i \nabla_j ( \vec{ \nabla} \times \vec{E} )_k",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001552')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859302",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\epsilon^{i,j,k} \epsilon_{n,j,k} \hat{x}_i \nabla_j \nabla^m E^n",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(LeviCivita(Symbol('pdg0001567'),Symbol('pdg0001552'),Symbol('pdg0009690')), Mul(LeviCivita(Symbol('pdg0001592'),Symbol('pdg0001552'),Symbol('pdg0009690')), Mul(Symbol('pdg0008349'), Mul(Symbol('nabla_{j}'), Mul(Pow(Symbol('pdg0006238'), Symbol('pdg0001592')), Pow(Symbol('nabla'), Symbol('pdg0007930'))))))), Symbol('nabla')(Add(Mul(Integer(-1), Pow(Symbol('nabla'), Integer(2)), Symbol('pdg0004326')), Mul(Symbol('nabla'), Symbol('pdg0004326')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859304",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Covariance_and_contravariance_of_vectors",
                     latex_lhs:"\epsilon^{i,j,k} \epsilon_{n,j,k}",
                     latex_rhs:"\delta^{l}_{\ \ j} \delta^{m}_{\ \ k} - \delta^{l}_{\ \ k} \delta^{m}_{\ \ h}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(LeviCivita(Symbol('pdg0007984'),Symbol('pdg0001552'),Symbol('pdg0009690'), LeviCivita(Symbol('pdg0001592'),Symbol('pdg0001552'),Symbol('pdg0009690')), Add(Mul(KroneckerDelta(Symbol('pdg0008304'),Symbol('pdg0001552')), KroneckerDelta(Symbol('pdg0007930'),Symbol('pdg0009690'))), Mul(Integer(-1), KroneckerDelta(Symbol('pdg0008304'),Symbol('pdg0009690')), KroneckerDelta(Symbol('pdg0007930'),Symbol('h')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859306",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Covariance_and_contravariance_of_vectors",
                     latex_lhs:"\left( \delta^{l}_{\ \ j} \delta^{m}_{\ \ k} - \delta^{l}_{\ \ k} \delta^{m}_{\ \ h} \right) \hat{x}_i \nabla_j \nabla^m E^n",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Symbol('pdg0008349'), Mul(Symbol('nabla_{pdg0001552}'), Mul(Pow(Symbol('pdg0006238'), Symbol('pdg0001592')), Pow(Symbol('nabla'), Symbol('pdg0007930'))))), Add(Mul(KroneckerDelta(Symbol('pdg0008304'),Symbol('pdg0001552')), KroneckerDelta(Symbol('pdg0007930'),Symbol('pdg0009690'))), Mul(Integer(-1), KroneckerDelta(Symbol('pdg0008304'),Symbol('pdg0009690')), KroneckerDelta(Symbol('pdg0007930'),Symbol('h'))))), Symbol('nabla')(Add(Mul(Integer(-1), Pow(Symbol('nabla'), Integer(2)), Symbol('pdg0004326')), Mul(Symbol('nabla'), Symbol('pdg0004326')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859308",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Covariance_and_contravariance_of_vectors",
                     latex_lhs:"\left( \delta^{l}_{\ \ j} \delta^{m}_{\ \ k} \hat{x}_i \nabla_j \nabla^m E^n\right)-\left( \delta^{l}_{\ \ k} \delta^{m}_{\ \ h} \hat{x}_i \nabla_j \nabla^m E^n \right)",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Mul(KroneckerDelta(Symbol('pdg0008304'),Symbol('pdg0001552'), Mul(KroneckerDelta(Symbol('pdg0007930'),Symbol('pdg0009690'), Mul(Symbol('pdg0008349'), Mul(Symbol('nabla_{pdg0001552}'), Mul(Pow(Symbol('pdg0006238'), Symbol('pdg0001592')), Pow(Symbol('nabla'), Symbol('pdg0007930')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859310",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\hat{x}_m \nabla_n \nabla^m E^n - \hat{x}_n \nabla_m \nabla^m E^n",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(Symbol('pdg0006238'), Symbol('pdg0001592')), Symbol('pdg0001434'), Pow(Symbol('nabla'), Symbol('pdg0007930')), Symbol('nabla_{m}')), Mul(Symbol('pdg0002380'), Mul(Symbol('nabla_{n}'), Mul(Pow(Symbol('pdg0006238'), Symbol('pdg0001592')), Pow(Symbol('nabla'), Symbol('pdg0007930')))))), Function('nabla')(Add(Mul(Integer(-1), Pow(Symbol('nabla'), Integer(2)), Symbol('pdg0004326')), Mul(Symbol('nabla'), Symbol('pdg0004326')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7575859312",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_rhs:"\vec{ \nabla}( \vec{ \nabla} \cdot \vec{E} - \nabla^2 \vec{E})",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('nabla')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7587034465",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001575')", 
                     latex:"\theta"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7607271250",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001575')", 
                     latex:"\theta"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7621705408",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"|A|^2 + |B|^2 + |A| |B| \exp(-i \theta) \exp(i \phi) + |A| |B| \exp(i \theta) \exp(-i \phi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Mul(Mul(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0008586')))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001575')))), Abs(Mul(Symbol('pdg0004453'), Mul(Symbol('pdg0004698'), Abs(Add(Mul(Mul(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0008586'))), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001575'))))), Abs(Symbol('pdg0004698'))), Abs(Symbol('pdg0004453')))))))), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7630953440",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Integer(-1)), Mul(Symbol('pdg0004933'), Symbol('pdg0009046')))", 
                     latex:"\frac{K_{\rm equilibrium} p_A}{K_{\rm equilibrium} p_A}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7652131521",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{dx}{dt}",
                     latex_rhs:"-A \omega \sin (\omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Symbol('pdg0004037'), Tuple(Symbol('pdg0001467'), Integer(1))), Mul(Integer(-1), Mul(Symbol('pdg0009885'), Mul(Symbol('pdg0002321'), sin(Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7672365885",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F_{gravitational}",
                     latex_rhs:"\frac{4 \pi^2 m r}{T^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002867'), Mul(Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Symbol('pdg0004851'), Symbol('pdg0002530')))), Pow(Pow(Symbol('pdg0008762'), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7675171493",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V_1",
                     latex_rhs:"I R_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008257'), Mul(Symbol('pdg0004501'), Symbol('pdg0008697')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7676652285",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_2",
                     latex_rhs:"\frac{1}{2} m v_2^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001352'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0004770'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7696214507",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"n_1 \sin( \theta_{\rm Brewster} )",
                     latex_rhs:"n_2 \sin( 90^{\circ} - \theta_{\rm Brewster} )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002941'), sin(Symbol('pdg0004928'))), Mul(Symbol('pdg0001958'), sin(Add(Integer(90), Mul(Integer(-1), Symbol('pdg0004928'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7701249282",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"when A = 1",
                     latex_lhs:"v_u",
                     latex_rhs:"\alpha c \sqrt{ \frac{m_e}{m_p} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004635'), Mul(Symbol('pdg0001370'), Mul(Symbol('pdg0004567'), Pow(Mul(Symbol('pdg0002515'), Pow(Symbol('pdg0005916'), Integer(-1))), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7708501762",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001534')", 
                     latex:"C_{\rm Earth\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7729413831",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_x \hat{x} + a_y \hat{y}",
                     latex_rhs:"\frac{d}{dt} \left(v_x \hat{x} + v_y \hat{y} \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0007159'), Symbol('pdg0008339')), Mul(Symbol('pdg0007055'), Symbol('pdg0001700'))), Derivative(Add(Mul(Symbol('pdg0008339'), Symbol('pdg0005505')), Mul(Symbol('pdg0001700'), Symbol('pdg0009107'))), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7731226616",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"{\rm sech}\ x",
                     latex_rhs:"\frac{1}{\cosh x}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sech( Symbol('pdg0001464')), Pow(cosh(Symbol('pdg0001464')), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7734996511",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"PE_2 - PE_1",
                     latex_rhs:"-F ( x_2 - x_1 )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Symbol('pdg0004093')), Symbol('pdg0008849')), Mul(Integer(-1), Mul(Symbol('pdg0004202'),Add(Mul(Integer(-1), Symbol('pdg0003852')), Symbol('pdg0005467')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7735731560",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh^2 x - \sinh^2 x",
                     latex_rhs:"\frac{1}{4}\left( \exp(2x)+1+1+\exp(-2x) - \left(\exp(2x)-1-1-\exp(-2x)\right) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(sinh(Symbol('pdg0001464')), Integer(2))), Pow(cosh(Symbol('pdg0001464')), Integer(2))), Mul(Pow(Integer(4), Integer(-1)), Add(Add(Add(Integer(2), Mul(Integer(-1), exp(Mul(Integer(2), Symbol('pdg0001464'))))), exp(Mul(Integer(-1), Mul(Integer(2), Symbol('pdg0001464'))))), Add(Add(Add(exp(Mul(Integer(2), Symbol('pdg0001464'))), Integer(1)), Integer(1)), exp(Mul(Integer(-1), Mul(Integer(2), Symbol('pdg0001464'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7735737409",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{KE_2 - KE_1}{t}",
                     latex_rhs:"m v \frac{ v_2 - v_1 }{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Symbol('pdg0005156'), Mul(Symbol('pdg0001357'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0002473')), Symbol('pdg0004770'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7741202861",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\gamma^2 x - \gamma^2 v t + \gamma v t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004037'), Add(Mul(Symbol('pdg0001790'), Mul(Symbol('pdg0004989'), Symbol('pdg0001357'))), Add(Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)), Symbol('pdg0001467'), Symbol('pdg0001357')), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Symbol('pdg0004037')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7743841045",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0001790'), Integer(2))", 
                     latex:"\gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7749253510",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"G \frac{m_{\rm Earth} m }{ r_{\rm Earth}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0003236'), Integer(-1)), Mul(Symbol('pdg0005156'), Symbol('pdg0005458')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7774819339",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006458')", 
                     latex:"R"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7798615279",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009647')", 
                     latex:"I_{\rm total}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7816982139",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Mul(Pow(second, Integer(-1)),meter), Integer(2))", 
                     latex:"m/s^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7819443873",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7826132469",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\left(\frac{\partial U}{\partial T}\right)_p",
                     latex_rhs:"C_V + \pi_T V \alpha",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007343'), Integer(1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7837519722",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{f} \sqrt{\frac{E}{m}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Mul(Pow(Symbol('pdg0006235'), Rational(1, 2)), Pow(Mul(Symbol('pdg0002241'), Pow(Symbol('pdg0009863'), Integer(-1))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7844317489",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004501')", 
                     latex:"I"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7846240076",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_{\rm Earth}",
                     latex_rhs:"\frac{(9.80665 m/s^2) r_{\rm Earth}^2}{G}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005458'), Mul(Pow(Symbol('pdg0006277'), Integer(-1)), Mul(Integer(9), Pow(Symbol('pdg0003236'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7857757625",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002941')", 
                     latex:"n_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7875206161",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E_2",
                     latex_rhs:"KE_2 + PE_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004550'), Add(Symbol('pdg0001352'), Symbol('pdg0008849')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7882872592",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"\int_{\infty}^r \vec{F}\cdot d\vec{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Integral(Dot(Symbol('pdg0006777'), Symbol('pdg0002530')), Tuple(oo, Symbol('pdg0002530'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7905984866",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005022')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7906112355",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma^2",
                     latex_rhs:"\frac{c^2}{c^2 - \gamma^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Pow(Add(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7912578203",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7917051060",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{electron}",
                     latex_rhs:"\vec{p}_{1}-\vec{p}_{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004299'), Add(Symbol('pdg0006029'), Mul(Integer(-1), Symbol('pdg0002097'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7924063906",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"K_{equilibrium}",
                     latex_rhs:"\frac{k_{\rm adsorption}}{k_{\rm desorption}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004933'), Mul(Symbol('pdg0006850'), Pow(Symbol('pdg0008379'), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7924842770",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007343')", 
                     latex:"T"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7928111771",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{\theta_A}",
                     latex_rhs:"\frac{1}{K_{\rm equilibrium} p_A} + 1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001791'), Integer(-1)), Add(Integer(1), Pow(Mul(Symbol('pdg0004933'), Symbol('pdg0009046')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7935917166",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003236')", 
                     latex:"r_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7939765107",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v^2",
                     latex_rhs:"v_0^2 + 2 a d",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001357'), Integer(2)), Add(Mul(Integer(2), Mul(Symbol('pdg0009140'), Symbol('pdg0001943'))), Pow(Symbol('pdg0005153'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"7939947931",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001352')", 
                     latex:"KE_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8014566709",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Symbol('pdg0001790'), Integer(2)), Mul(Symbol('pdg0001467'), Symbol('pdg0001357')))", 
                     latex:"\gamma^2 v t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8020058613",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8044416349",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002798')", 
                     latex:"d_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8046208134",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm coherent}",
                     latex_rhs:"|A|^2 + |A|^2 + |A| |A| 2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008251'), Add(Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004453')), Integer(2))), Mul(Mul(Integer(2), Abs(Symbol('pdg0004453'))), Abs(Symbol('pdg0004453')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8049905441",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\Delta KE",
                     latex_rhs:"KE_{\rm final} - KE_{\rm initial}",
                     latex_condition:"",
                     name_latex:"change in kinetic energy",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005734'), Add(Symbol('pdg0005340'), Mul(Integer(-1), Symbol('pdg0004121'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8059639673",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v^2",
                     latex_rhs:"\frac{4 \pi^2 r^2}{T_{\rm orbit}^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001357'), Integer(2)), Mul(Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Pow(Symbol('pdg0002530'), Integer(2)))), Pow(Pow(Symbol('pdg0008762'), Integer(2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8061701434",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004093')", 
                     latex:"PE_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8065128065",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"A A^* + B B^* + A B^* + B A^*",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004453'))), Add(Mul(Symbol('pdg0004453'), conjugate(Symbol('pdg0004698'))), Add(Mul(Symbol('pdg0004453'), conjugate(Symbol('pdg0004453'))), Mul(Symbol('pdg0004698'), conjugate(Symbol('pdg0004698')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8066819515",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8072682558",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001572')", 
                     latex:"x_0"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8090924099",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{ \left( f\frac{E}{a^3} \right) \frac{1}{\rho} }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Pow(Mul(Symbol('pdg0002241'), Pow(Symbol('pdg0005854'), Integer(-3)), Symbol('pdg0006235'), Pow(Symbol('pdg0003935'), Integer(-1))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8106885760",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"fine structure constant definition",
                     latex_lhs:"\alpha",
                     latex_rhs:"\frac{1}{4 \pi \epsilon_0} \frac{e^2}{\hbar c}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001370'), Mul(Pow(Mul(Integer(4), Mul(Symbol('pdg0007940'), Symbol('pdg0003141'))), Integer(-1)), Mul(Pow(Symbol('pdg0001999'), Integer(2)), Pow(Mul(Symbol('pdg0004567'), Symbol('pdg0001054')), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8111389082",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8120663858",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007092')", 
                     latex:"y_f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8122039815",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Pow(Add(Symbol('pdg0007652'), Symbol('pdg0002798')), Integer(-1)), Add(Symbol('pdg0007652'), Symbol('pdg0002798')))", 
                     latex:"\frac{d_1+d_2}{d_1+d_2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8131665171",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{\theta_A}",
                     latex_rhs:"\frac{[S_0]}{[A_{\rm adsorption}]}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0001791'), Integer(-1)), Mul(Pow(Symbol('pdg0004940'), Integer(-1)), Symbol('pdg0003037')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8135396036",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8139187332",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{1}",
                     latex_rhs:"\vec{p}_{2}+\vec{p}_{electron}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006029'), Add(Symbol('pdg0002097'), Symbol('pdg0004299')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8145337879",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g t dt + v_{0, y} dt",
                     latex_rhs:"dy",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0004711'), Symbol('pdg0009431')), Mul(Integer(-1), Mul(Symbol('pdg0001649'), Mul(Symbol('pdg0004711'), Symbol('pdg0001467'))))), Symbol('pdg0005842'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8162179726",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0006850'), Symbol('pdg0009046'))", 
                     latex:"k_{\rm adsorption} p_A"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8173074178",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8198310977",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"- \frac{1}{2} g t_f^2 + v_0 t_f \sin(\theta) + y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0002467'), sin(Symbol('pdg0001575')))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0002467'), Integer(2))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8228733125",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_y",
                     latex_rhs:"\frac{d}{dt} v_y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007055'), Derivative(Symbol('pdg0009107'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8257621077",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{\rm before}",
                     latex_rhs:"\vec{p}_{1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001302'), Symbol('pdg0006029'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8269198922",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 a d",
                     latex_rhs:"v^2 - v_0^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Mul(Symbol('pdg0009140'), Symbol('pdg0001943'))), Add(Pow(Symbol('pdg0001357'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0005153'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8283354808",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I_{\rm coherent}",
                     latex_rhs:"|A|^2 + |B|^2 + |A| |B| 2 \cos( 0 )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0008251'), Add(Mul(Mul(Mul(Integer(2), cos(Integer(0))), Abs(Symbol('pdg0004698'))), Abs(Symbol('pdg0004453'))), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8311458118",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{p}_{\rm after}",
                     latex_rhs:"\vec{p}_{2}+\vec{p}_{electron}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005493'), Add(Symbol('pdg0002097'), Symbol('pdg0004299')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8332931442",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i \pi)",
                     latex_rhs:"\cos(\pi)+i \sin(\pi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0003141'))), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0003141'))), cos(Symbol('pdg0003141'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8357234146",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     latex_lhs:"KE",
                     latex_rhs:"\frac{1}{2} m v^2",
                     latex_condition:"",
                     name_latex:"kinetic energy",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004929'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8360117126",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"not a physically valid result in this context",
                     latex_lhs:"\gamma",
                     latex_rhs:"\frac{-1}{\sqrt{1-\frac{v^2}{c^2}}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001790'), Mul(Integer(-1), Pow(Pow(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0004567'), Integer(-2)), Pow(Symbol('pdg0001357'), Integer(2)))), Rational(1, 2)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8361238989",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_{centripetal}",
                     latex_rhs:"\frac{v^2}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('a_{c*(e*(n*(t*(r*(i*(p*(e*(t*(a*l)))))))))}'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Pow(Symbol('pdg0001357'), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8362338572",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008656')", 
                     latex:"v_{\rm escape}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8368984890",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{-1}{V} \left( \frac{ \partial }{\partial P}\left(\frac{nRT}{P}\right) \right)_T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Mul(Mul(Integer(-1), Pow(Symbol('pdg0007586'), Integer(-1))), Derivative(Mul(Pow(Symbol('pdg0008134'), Integer(-1)), Mul(Symbol('pdg0002834'), Mul(Symbol('pdg0008179'), Symbol('pdg0007343')))), Tuple(Symbol('pdg0008134'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8396997949",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"intensity of two waves traveling opposite directions on same path",
                     latex_lhs:"I",
                     latex_rhs:"| A + B |^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Pow(Abs(Add(Symbol('pdg0004453'), Symbol('pdg0004698'))), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8399484849",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle x^2 - 2 x \langle x \rangle + \langle x \rangle^2 \rangle",
                     latex_rhs:"\langle x^2 \rangle-\langle x \rangle^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8405272745",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm to\ system}",
                     latex_rhs:"-G m_1 m_2\int_{\infty}^r \frac{1}{x^2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009372'), Mul(Integer(-1), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Mul(Symbol('pdg0004851'), Integral(Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1)), Tuple(Symbol('pdg0004037'), oo, Symbol('pdg0002530'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8406170337",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005647')", 
                     latex:"y"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8416464049",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005332')", 
                     latex:"KE_{\rm escape}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8418527415",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(i x)",
                     latex_rhs:"i \sinh(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), Mul(Symbol('pdg0004621'), sinh(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8435841627",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Ideal_gas_law",
                     latex_lhs:"P V",
                     latex_rhs:"n R T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0008134'), Symbol('pdg0007586')), Mul(Symbol('pdg0002834'), Mul(Symbol('pdg0008179'), Symbol('pdg0007343'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8460820419",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_x",
                     latex_rhs:"\frac{dx}{dt}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005505'), Derivative(Symbol('pdg0009199'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8483686863",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin(2 x)",
                     latex_rhs:"\frac{1}{2i}\left(\exp(i 2 x)-\exp(-i 2 x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Mul(Integer(2), Symbol('pdg0001464'))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))))), exp(Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8484544728",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-a k^2\sin(k x) + -b k^2\cos(k x)",
                     latex_rhs:"-a k^2 \sin(kx) + -b k^2 \cos(k x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004037')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8485757728",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a \frac{d^2}{dx^2}\sin(kx) + b \frac{d^2}{dx^2}\cos(k x)",
                     latex_rhs:"-a k^2 \sin(kx) + -b k^2 \cos(kx)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0009199')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8485867742",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{2}{W}",
                     latex_rhs:"a^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Pow(Symbol('pdg0002523'), Integer(-1))), Pow(Symbol('pdg0009139'), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8486706976",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x} t + x_0",
                     latex_rhs:"x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0001467'), Symbol('pdg0002958')), Symbol('pdg0001572')), Symbol('pdg0004037'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8489593958",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d(u v)",
                     latex_rhs:"u dv + v du",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004221')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8489593960",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d(u v) - v du",
                     latex_rhs:"u dv",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004221')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8489593962",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"u dv",
                     latex_rhs:"d(u v) - v du",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004221')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8489593964",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int u dv",
                     latex_rhs:"u v - \int v du",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Symbol('pdg0004221'), Tuple(Symbol('pdg0005177'))), Add(Mul(Symbol('pdg0004221'), Symbol('pdg0005177')), Mul(Integer(-1), Integral(Symbol('pdg0005177'), Tuple(Symbol('pdg0004221'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8494839423",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\nabla^2 \vec{E}",
                     latex_rhs:"\mu_0 \epsilon_0 \frac{\partial^2 \vec{E}}{\partial t^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('nabla'), Integer(2)), Symbol('pdg0004326')), Mul(Symbol('pdg0006197'), Mul(Symbol('pdg0007940'), Mul(Pow(Mul(Symbol('partial'), Pow(Symbol('pdg0001467'), Integer(2))), Integer(-1)), Mul(Pow(Symbol('partial'), Integer(2)), Symbol('pdg0004326'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8495187962",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\theta_{\rm Brewster}",
                     latex_rhs:"\arctan{ \left( \frac{ n_1 }{ n_2 } \right) }",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004928'), atan(Mul(Symbol('pdg0002941'), Pow(Symbol('pdg0001958'), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8497631728",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"I",
                     latex_rhs:"|A|^2 + |B|^2 + |A| |B| 2 \cos( \theta - \phi )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007882'), Add(Mul(Mul(Mul(Integer(2), cos(Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575')))), Abs(Symbol('pdg0004698'))), Abs(Symbol('pdg0004453'))), Add(Pow(Abs(Symbol('pdg0004453')), Integer(2)), Pow(Abs(Symbol('pdg0004698')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8515803375",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"frame of reference is moving only along x direction",
                     latex_lhs:"z'",
                     latex_rhs:"z",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004306'), Symbol('pdg0006728'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8532702080",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh^2 x",
                     latex_rhs:"\left(\frac{\exp(x) + \exp(-x)}{2}\right)\left(\frac{\exp(x) + \exp(-x)}{2}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(cosh(Symbol('pdg0001464')), Integer(2)), Mul(Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464')))), Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8552710882",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_{\rm final}",
                     latex_rhs:"\frac{1}{2} m_1 v_{\rm final}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005340'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005022'), Pow(Symbol('pdg0008909'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8558338742",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Conservation_of_energy",
                     latex_lhs:"E_2",
                     latex_rhs:"E_1",
                     latex_condition:"",
                     name_latex:"conservation of energy",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004550'), Symbol('pdg0005579'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8563535636",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh^2 x - \sinh^2 x",
                     latex_rhs:"\left(\frac{\exp(x) + \exp(-x)}{2}\right)\left(\frac{\exp(x) + \exp(-x)}{2}\right) - \left(\frac{\exp(x) - \exp(-x)}{2}\right)\left(\frac{\exp(x) - \exp(-x)}{2}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(sinh(Symbol('pdg0001464')), Integer(2))), Pow(cosh(Symbol('pdg0001464')), Integer(2))), Add(Mul(Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464')))), Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464'))))), Mul(Integer(-1), Rational(1, 4), Pow(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Symbol('pdg0001464')))), exp(Symbol('pdg0001464'))), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8571466509",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Add(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2))))", 
                     latex:"c^2 - \gamma^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8572657110",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"1",
                     latex_rhs:"\int |\psi(x)|^2 dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(1), Integral(Pow(Abs(Function('pdg0009489')(Symbol('pdg0001464'))), Integer(2)), Tuple(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8572852424",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{E}",
                     latex_rhs:"E( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004326'), Function('pdg0006238')(Symbol('pdg0009472'), Symbol('pdg0001467')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8575746378",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\int \frac{1}{2} dx",
                     latex_rhs:"\frac{1}{2} x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integral(Pow(Integer(2), Integer(-1)), Tuple(Symbol('pdg0001464'))), Mul(Pow(Integer(2), Integer(-1)), Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8575748999",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d^2}{dx^2} \left(a \sin(k x) + b \cos(k x) \right)",
                     latex_rhs:"-k^2 \left(a \sin(kx) + b \cos(kx) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Pow(Symbol('d'), Integer(2)), Pow(Pow(Symbol('pdg0009199'), Integer(2)), Integer(-1))), Add(Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0005321'), Symbol('pdg0001464')))), Mul(Symbol('pdg0001939'), cos(Mul(Symbol('pdg0005321'), Symbol('pdg0001464')))))), Mul(Integer(-1), Mul(Pow(Symbol('pdg0005321'), Integer(2)), Add(Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0005321'), Symbol('pdg0001464')))), Mul(Symbol('pdg0001939'), cos(Mul(Symbol('pdg0005321'), Symbol('pdg0001464'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8576785890",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"1",
                     latex_rhs:"\int_0^W a^2 \frac{1-\cos\left(2\frac{n \pi}{W}x\right)}{2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(1), Integral(Mul(Pow(Symbol('pdg0009139'), Integer(2)), Mul(Pow(Integer(2), Integer(-1)), Add(Integer(1), Mul(Integer(-1), cos(Mul(Integer(2), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))))))), Tuple(Symbol('pdg0001464'), Integer(0), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8577275751",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"a \sin(0) + b\cos(0)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Mul(Symbol('pdg0009139'), sin(Integer(0))), Mul(Symbol('pdg0001939'), cos(Integer(0)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8582885111",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)",
                     latex_rhs:"a \sin(kx) + b \cos(kx)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0004037')), Add(Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0005321'), Symbol('pdg0004037')))), Mul(Symbol('pdg0001939'), cos(Mul(Symbol('pdg0005321'), Symbol('pdg0004037'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8582954722",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x^2 + 2 x h + h^2",
                     latex_rhs:"(x + h)^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0003410'), Integer(2)), Add(Mul(Integer(2), Mul(Symbol('pdg0003410'), Symbol('pdg0001464'))), Pow(Symbol('pdg0001464'), Integer(2)))), Pow(Add(Symbol('pdg0003410'), Symbol('pdg0001464')), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8584698994",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g \int dt",
                     latex_rhs:"\int d v_y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Symbol('dt'), Symbol('g'))), Symbol('pdg0005674'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8588429722",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin( 90^{\circ} - x )",
                     latex_rhs:"\cos( x )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Add(Integer(90), Mul(Integer(-1), Symbol('pdg0001464')))), cos(Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8602221482",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"incoherent light source",
                     latex_lhs:"\langle \cos(\theta - \phi) \rangle",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Add(Mul(Integer(-1), Symbol('pdg0008586')), Symbol('pdg0001575'))), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8602512487",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"decompose acceleration into two components",
                     latex_lhs:"\vec{a}",
                     latex_rhs:"a_x \hat{x} + a_y \hat{y}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002423'), Add(Mul(Symbol('pdg0007159'), Symbol('pdg0008339')), Mul(Symbol('pdg0007055'), Symbol('pdg0001700'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8604483515",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"dW",
                     latex_rhs:"G \frac{m_1 m_2}{x^2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009398'), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0009199'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0004037'), Integer(2)), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8607458157",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004711')", 
                     latex:"dt"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8642992037",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8651044341",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(i x)",
                     latex_rhs:"\frac{1}{2} \left( \exp(-x) + \exp(x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), Mul(Pow(Integer(2), Integer(-1)), Add(exp(Mul(Integer(-1), Symbol('pdg0001464'))), exp(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8655294002",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a",
                     latex_rhs:"-\frac{k}{m}x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009140'), Mul(Integer(-1), Mul(Symbol('pdg0004037'), Mul(Symbol('pdg0001356'), Pow(Symbol('pdg0005156'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8661803554",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"F",
                     latex_rhs:"G \frac{m_{\rm Earth} m}{r_{\rm Earth}^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005156'), Symbol('pdg0005458')), Pow(Pow(Symbol('pdg0003236'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8688588981",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a^3 \rho",
                     latex_rhs:"m",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0005854'), Integer(3)), Symbol('pdg0003935')), Symbol('pdg0009863'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8699789241",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 \sin(x) \cos(x)",
                     latex_rhs:"\frac{1}{2 i} \left( \exp(i 2 x) - 1 + 1 - \exp(-i 2 x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464')))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(Add(Add(exp(Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))), Integer(-1)), Integer(1)), Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8706092970",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\left(\frac{v + v_0}{2}\right)t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Symbol('pdg0001467'), Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0001357'), Symbol('pdg0005153')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8710504862",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004453')", 
                     latex:"A"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8717193282",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004711')", 
                     latex:"dt"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8721295221",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"t_{\rm Earth\ orbit}",
                     latex_rhs:"3.16 10^7 {\rm seconds}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005344'), Integer(3))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8730201316",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"first term was multiplied by \gamma/\gamma",
                     latex_lhs:"\frac{\gamma x (1 - \gamma^2 )}{\gamma^2 v} + \gamma t",
                     latex_rhs:"t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001790')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8747785338",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(i x)",
                     latex_rhs:"\cosh(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), cosh(Symbol('pdg0001464')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8750379055",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"\frac{d}{dt} v_x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Derivative(Symbol('pdg0005505'), Tuple(Symbol('pdg0001467'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8808860551",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g \int t dt + v_{0, y} \int dt",
                     latex_rhs:"\int dy",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Mul(Symbol('pdg0001649'), Integral(Symbol('pdg0001467'), Tuple(Symbol('pdg0001467'))))), Mul(Symbol('pdg0009431'), Integral(Integer(1), Tuple(Symbol('pdg0001467'))))), Integral(Integer(1), Tuple(Symbol('pdg0005647'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8849289982",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)^*",
                     latex_rhs:"a \sin(\frac{n \pi}{W} x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(conjugate(Function('pdg0009489')(Symbol('pdg0004037'))), Mul(Symbol('pdg0009139'), sin(Mul(Symbol('pdg0004037'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8854422847",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007343')", 
                     latex:"dT"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8857931498",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004567')", 
                     latex:"c"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8865085668",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001467')", 
                     latex:"t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8871333437",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0006431')", 
                     latex:"PE_{\rm Earth\ surface}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8880467139",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Integer(2)", 
                     latex:"2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8889444440",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"1",
                     latex_rhs:"\int_0^W a^2 \left(\sin\left(\frac{n \pi}{W} x\right) \right)^2 dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(1), Integral(Mul(Pow(Symbol('pdg0009139'), Integer(2)), Pow(sin(Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))), Integer(2))), Tuple(Symbol('pdg0001464'), Integer(0), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8908736791",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"geometry",
                     latex_lhs:"\rho",
                     latex_rhs:"\frac{m}{a^3}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003935'), Mul(Symbol('pdg0009863'), Pow(Pow(Symbol('pdg0005854'), Integer(3)), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8916428651",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8922441655",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"\frac{v_0^2}{g} \sin(2 \theta)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Mul(Pow(Symbol('pdg0001649'), Integer(-1)), Pow(Symbol('pdg0005153'), Integer(2))), sin(Mul(Integer(2), Symbol('pdg0001575')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8945218208",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"based on figure 34-27 on page 824 in \cite{2001_HRW}",
                     latex_lhs:"\theta_{\rm Brewster} + \theta_{\rm refracted}",
                     latex_rhs:"90^{\circ}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004928')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8946383937",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm escape}^2",
                     latex_rhs:"2 G \frac{m}{r}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0008656'), Integer(2)), Mul(Integer(2), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0002530'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8949329361",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_0 \sin(\theta)",
                     latex_rhs:"v_{0, y}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0005153'), sin(Symbol('pdg0001575'))), Symbol('pdg0009431'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8953094349",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"m a x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Mul(Symbol('pdg0005156'), Mul(Symbol('pdg0009140'), Symbol('pdg0004037'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8960645192",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_2 + PE_2",
                     latex_rhs:"KE_1 + PE_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001552'), Symbol('pdg0008849')), Add(Symbol('pdg0001955'), Symbol('pdg0004093')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"8991236357",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d^2 x}{dt^2}",
                     latex_rhs:"-\frac{k}{m} x",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Pow(Symbol('d'), Integer(2)), Symbol('pdg0004037')), Pow(Pow(Symbol('dt'), Integer(2)), Integer(-1))), Mul(Integer(-1), Mul(Symbol('pdg0004037'), Mul(Symbol('pdg0001356'), Pow(Symbol('pdg0005156'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9025853427",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004928')", 
                     latex:"\theta_{\rm Brewster}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9029795851",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004928')", 
                     latex:"\theta_{\rm Brewster}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9031609275",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x (1 - \gamma^2 )",
                     latex_rhs:"- \gamma^2 v t + \gamma v t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001790')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9040079362",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004201')", 
                     latex:"f"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9053099840",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004501')", 
                     latex:"I"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9059289981",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)",
                     latex_rhs:"a \sin(k x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001464')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9063568209",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V_{\rm total}",
                     latex_rhs:"V_1 + V_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004691'), Add(Symbol('pdg0008257'), Symbol('pdg0008721')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9070394000",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_2 d_2 \frac{4 \pi^2}{T^2}",
                     latex_rhs:"G \frac{m_1 m_2}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004851'), Mul(Symbol('pdg0002798'), Mul(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Pow(Pow(Symbol('pdg0009491'), Integer(2)), Integer(-1))))), Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005022'), Symbol('pdg0004851')), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9070454719",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Pow(Symbol('pdg0005153'), Integer(2))", 
                     latex:"v_0^2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9072369552",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_{\rm Earth}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9081138616",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W_{\rm by\ system}",
                     latex_rhs:"\frac{1}{2} m_1 v_{\rm final}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006191'), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005022'), Pow(Symbol('pdg0008909'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9110536742",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Integer(2), Symbol('pdg0001464'))", 
                     latex:"2 x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9112191201",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y_f",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007092'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9152823411",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{T^2}",
                     latex_rhs:"\frac{1}{d_2 4 \pi^2} G \frac{m_1}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009491'), Integer(2)), Integer(-1)), Mul(Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))), Pow(Mul(Symbol('pdg0002798'), Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2)))), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9170048197",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"T^2",
                     latex_rhs:"d_2 4 \pi^2 \frac{r^2}{G m_1}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0009491'), Integer(2)), Mul(Symbol('pdg0002798'), Mul(Integer(4), Mul(Pow(Symbol('pdg0003141'), Integer(2)), Mul(Pow(Symbol('pdg0002530'), Integer(2)), Pow(Mul(Symbol('pdg0006277'), Symbol('pdg0005022')), Integer(-1)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9174439158",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008697')", 
                     latex:"R_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9180861128",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 \sin(x) \cos(x)",
                     latex_rhs:"\frac{1}{2 i} \left( \exp(i 2 x) - \exp(-i 2 x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464')))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))))), exp(Mul(Symbol('pdg0004621'), Mul(Integer(2), Symbol('pdg0001464')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9191880568",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"Z Z^*",
                     latex_rhs:"|Z| |Z| \exp( -i \theta ) \exp( i \theta )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0003192')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9226945488",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"https://en.wikipedia.org/wiki/Centripetal_force",
                     latex_lhs:"F",
                     latex_rhs:"\frac{m v^2}{r}",
                     latex_condition:"",
                     name_latex:"Centripetal force",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004202'), Mul(Pow(Symbol('pdg0002530'), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0001357'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9243879541",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"V",
                     latex_rhs:"I_2 R_2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006599'), Mul(Symbol('pdg0004856'), Symbol('pdg0003461')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9262596735",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"2 \pi r",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Mul(Integer(2), Mul(Symbol('pdg0003141'), Symbol('pdg0002530'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9285928292",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"ax^2 + bx + c",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0004231'), Add(Mul(Symbol('pdg0009139'), Pow(Symbol('pdg0001464'), Integer(2))), Mul(Symbol('pdg0001939'), Symbol('pdg0001464')))), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9291999979",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{ \nabla} \times \vec{E}",
                     latex_rhs:"-\mu_0\vec{ \nabla} \times \frac{\partial \vec{H}}{\partial t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('nabla'), Mul(Symbol('nabla'), Symbol('pdg0004326'))), Mul(Integer(-1), Mul(Symbol('pdg0006197'), Mul(Symbol('nabla'), Derivative(Symbol('pdg0002069'), Tuple(Symbol('pdg0001467'), Integer(1)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9294858532",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\hat{A}^+",
                     latex_rhs:"\hat{A}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Dagger(Operator(Symbol('pdg0005598'))), Operator(Symbol('pdg0005598')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9305761407",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9337785146",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{x_2 - x_1}{t}",
                     latex_condition:"",
                     name_latex:"average velocity",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0003852')), Symbol('pdg0005467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9341391925",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{v}_0",
                     latex_rhs:"v_{0, x} \hat{x} + v_{0, y} \hat{y}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006091'), Add(Mul(Symbol('pdg0002958'), Symbol('pdg0008339')), Mul(Symbol('pdg0009431'), Symbol('pdg0001700'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9346215480",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008762')", 
                     latex:"T_{\rm orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9350663581",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003141')", 
                     latex:"\pi"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9350720370",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9355039511",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001649')", 
                     latex:"g"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9356924046",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{KE_2 - KE_1}{t}",
                     latex_rhs:"m \frac{v_2 + v_1}{2} \frac{ v_2 - v_1 }{t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001955')), Symbol('pdg0001352'))), Mul(Symbol('pdg0005156'), Mul(Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0002473'), Symbol('pdg0004770'))), Mul(Pow(Symbol('pdg0001467'), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0002473')), Symbol('pdg0004770'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9370882921",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005332')", 
                     latex:"KE_{\rm escape}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9376481176",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"proportionality coefficient fvaries in the range 1-4 for a majority of elemental solids",
                     latex_lhs:"K",
                     latex_rhs:"f \frac{E}{a^3}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('K'), Mul(Symbol('pdg0006235'), Mul(Symbol('pdg0002241'), Pow(Pow(Symbol('pdg0005854'), Integer(3)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9385938295",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(x+(b/(2 a)))^2",
                     latex_rhs:"-(c/a) + (b/(2 a))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Add(Symbol('pdg0001464'), Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))), Integer(2)), Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Integer(-1), Mul(Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9393939991",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)",
                     latex_rhs:"-\sqrt{\frac{2}{W}} \sin\left(\frac{n \pi}{W} x\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0001464')), Mul(Integer(-1), Mul(Mul(Pow(Integer(2), Rational(1, 2)), Pow(Pow(Symbol('pdg0002523'), Integer(-1)), Rational(1, 2))), sin(Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9393939992",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x)",
                     latex_rhs:"\sqrt{\frac{2}{W}} \sin\left(\frac{n \pi}{W} x\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Symbol('pdg0001464')), Mul(Mul(Pow(Integer(2), Rational(1, 2)), Pow(Pow(Symbol('pdg0002523'), Integer(-1)), Rational(1, 2))), sin(Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9394939493",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\nabla^2 E( \vec{r},t)",
                     latex_rhs:"\mu_0 \epsilon_0 \frac{\partial^2}{\partial t^2} E( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Symbol('nabla'), Symbol('nabla')), Function('pdg0006238')(Symbol('pdg0009472'), Symbol('pdg0001467'))), Mul(Symbol('pdg0006197'), Mul(Symbol('pdg0007940'), Mul(Mul(Pow(Symbol('partial'), Integer(2)), Pow(Mul(Symbol('partial'), Pow(Symbol('pdg0001467'), Integer(2))), Integer(-1))), Function('pdg0006238')(Symbol('pdg0009472'), Symbol('pdg0001467'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9397152918",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{v_1 + v_2}{2}",
                     latex_condition:"",
                     name_latex:"average velocity",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001357'), Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0002473'), Symbol('pdg0004770'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9407192813",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"G \frac{m_{\rm Earth} m}{r_{\rm Earth}^2}",
                     latex_rhs:"m g_{\rm Earth}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006277'), Mul(Mul(Symbol('pdg0005156'), Symbol('pdg0005458')), Pow(Pow(Symbol('pdg0003236'), Integer(2)), Integer(-1)))), Mul(Symbol('pdg0007557'), Symbol('pdg0005156')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9409776983",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x (1 - \gamma^2 ) + \gamma^2 v t",
                     latex_rhs:"\gamma v t'",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0001790')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9412953728",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{\rm escape}^2",
                     latex_rhs:"2 G \frac{m_{\rm Earth}}{r_{\rm Earth}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Symbol('pdg0008656'), Integer(2)), Mul(Integer(2), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005458'), Pow(Symbol('pdg0003236'), Integer(-1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9413609246",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cosh^2 x - \sinh^2 x",
                     latex_rhs:"1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Integer(-1), Pow(sinh(Symbol('pdg0001464')), Integer(2))), Pow(cosh(Symbol('pdg0001464')), Integer(2))), Integer(1))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9413699705",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"W",
                     latex_rhs:"m a \frac{v_2^2 - v_1^2}{2 a}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0006789'), Mul(Symbol('pdg0005156'), Mul(Symbol('pdg0009140'), Mul(Pow(Mul(Integer(2), Symbol('pdg0009140')), Integer(-1)), Add(Mul(Integer(-1), Pow(Symbol('pdg0002473'), Integer(2))), Pow(Symbol('pdg0004770'), Integer(2)))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9429829482",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d}{dx} y",
                     latex_rhs:"-\sin(x) + i\cos(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Symbol('pdg0001452'), Tuple(Symbol('pdg0001464'), Integer(1))), Add(Mul(Symbol('pdg0004621'), cos(Symbol('pdg0001464'))), Mul(Integer(-1), sin(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9440616166",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"m_{\rm Earth}",
                     latex_rhs:"\frac{g_{\rm Earth} r_{\rm Earth}^2}{G}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005458'), Mul(Pow(Symbol('pdg0006277'), Integer(-1)), Mul(Symbol('pdg0007557'), Pow(Symbol('pdg0003236'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482113948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{dy}{y}",
                     latex_rhs:"i dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004621')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482438243",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(\cos(x))^2",
                     latex_rhs:"\cos(2 x) + (\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(cos(Symbol('pdg0001464')), Integer(2)), Add(Pow(sin(Symbol('pdg0001464')), Integer(2)), cos(Mul(Integer(2), Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482923849",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\exp(i x)",
                     latex_rhs:"y",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))), Symbol('pdg0001452'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482928242",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x)",
                     latex_rhs:"(\cos(x))^2 - (\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cos(Mul(Integer(2), Symbol('pdg0001464'))), Add(Mul(Integer(-1), Pow(sin(Symbol('pdg0001464')), Integer(2))), Pow(cos(Symbol('pdg0001464')), Integer(2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482928243",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x) + (\sin(x))^2",
                     latex_rhs:"(\cos(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(sin(Symbol('pdg0001464')), Integer(2)), cos(Mul(Integer(2), Symbol('pdg0001464')))), Pow(cos(Symbol('pdg0001464')), Integer(2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482943948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\log(y)",
                     latex_rhs:"i dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(log(Symbol('pdg0001452'), Integer(10)), Mul(Symbol('pdg0009199'), Symbol('pdg0004621')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9482984922",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d}{dx} y",
                     latex_rhs:"(i\sin(x) + \cos(x)) i",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Symbol('pdg0001452'), Tuple(Symbol('pdg0001464'), Integer(1))), Mul(Symbol('pdg0004621'), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464')))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9483928192",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\cos(2 x) + i\sin(2 x)",
                     latex_rhs:"(\cos(x))^2 + 2 i \cos(x) \sin(x) - (\sin(x))^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Mul(Symbol('pdg0004621'), sin(Mul(Integer(2), Symbol('pdg0001464')))), cos(Mul(Integer(2), Symbol('pdg0001464')))), Add(Add(Mul(Integer(2), Mul(Symbol('pdg0004621'), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464'))))), Pow(cos(Symbol('pdg0001464')), Integer(2))), Mul(Integer(-1), Pow(sin(Symbol('pdg0001464')), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9485384858",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\nabla^2 E( \vec{r})\exp(i \omega t)",
                     latex_rhs:"- \frac{\omega^2}{c^2} E( \vec{r})\exp(i \omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Mul(Symbol('nabla'), Symbol('nabla')), Mul(Function('pdg0006238')(Symbol('pdg0009472')), Function('pdg0002718')(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467')))))), Mul(Integer(-1), Mul(Mul(Pow(Symbol('pdg0002321'), Integer(2)), Pow(Pow(Symbol('pdg0004567'), Integer(2)), Integer(-1))), Mul(Function('pdg0006238')(Symbol('pdg0009472')), Function('pdg0002718')(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467'))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9485747245",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sqrt{\frac{2}{W}}",
                     latex_rhs:"a",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Integer(2), Rational(1, 2)), Pow(Pow(Symbol('pdg0002523'), Integer(-1)), Rational(1, 2))), Symbol('pdg0009139'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9485747246",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-\sqrt{\frac{2}{W}}",
                     latex_rhs:"a",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Pow(Integer(2), Rational(1, 2)), Pow(Pow(Symbol('pdg0002523'), Integer(-1)), Rational(1, 2)))), Symbol('pdg0009139'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9492920340",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y",
                     latex_rhs:"\cos(x)+i \sin(x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001452'), Add(Mul(Symbol('pdg0004621'), sin(Symbol('pdg0001464'))), cos(Symbol('pdg0001464'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9495857278",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"2022-03-25 BHP: Conversion between Latex and Sympy is incomplete",
                     latex_lhs:"\psi(x=W)",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0002523')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9499428242",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E( \vec{r},t)",
                     latex_rhs:"E( \vec{r})\exp(i \omega t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0006238')(Symbol('pdg0009472'), Symbol('pdg0001467')), Mul(Function('pdg0006238')(Symbol('pdg0009472')), Function('pdg0002718')(Mul(Symbol('pdg0004621'), Mul(Symbol('pdg0002321'), Symbol('pdg0001467'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9510328252",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"KE_{\rm initial}",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004121'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9524810853",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Mul(Integer(1), Pow(Symbol('pdg0002798'), Integer(-1))), Pow(Mul(Integer(1), Pow(Symbol('pdg0002798'), Integer(-1))), Integer(-1)))", 
                     latex:"\frac{1/d_2}{1/d_2}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9562264720",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"[S]",
                     latex_rhs:"\frac{k_{\rm desorption} [A_{\rm adsorption}]}{k_{\rm adsorption} p_A}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0009067'), Mul(Mul(Symbol('pdg0004940'), Symbol('pdg0008379')), Pow(Mul(Symbol('pdg0006850'), Symbol('pdg0009046')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9565166889",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009491')", 
                     latex:"T"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9582958293",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\sqrt{(b/(2 a))^2 - (c/a)}-(b/(2 a))",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'), Add(Mul(Integer(-1), Mul(Rational(1, 2), Pow(Symbol('pdg0009139'), Integer(-1))), Symbol('pdg0001939')), Pow(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9582958294",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x+(b/(2 a))",
                     latex_rhs:"\sqrt{(b/(2 a))^2 - (c/a)}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001464'), Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)))), Pow(Add(Pow(Mul(Symbol('pdg0001939'), Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1))), Integer(2)), Mul(Integer(-1), Pow(Symbol('pdg0009139'), Integer(-1)), Symbol('pdg0004231'))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9585727710",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\psi(x=0)",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Function('pdg0009489')(Equality(Symbol('pdg0001464'),Integer(0))),Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9590696981",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Float('9.8066499999999994', precision=53)", 
                     latex:"9.80665"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9594072504",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004851')", 
                     latex:"m_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9596004948",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\langle\psi_{\alpha}| \hat{A} |\psi_{\beta}\rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'),Bra('pdg0004679')*Symbol('pdg0005598')*Ket('pdg0002090'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9601500174",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0007427')", 
                     latex:"v_{\rm Earth\ orbit}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9623791270",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004037')", 
                     latex:"d"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9640720571",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\frac{e^2}{4 \pi \epsilon_0 \hbar} \sqrt{\frac{m_e}{2 m}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Mul(Mul(Pow(Symbol('pdg0001999'), Integer(2)), Pow(Mul(Integer(4), Mul(Symbol('pdg0003141'), Mul(Symbol('pdg0007940'), Symbol('pdg0001054')))), Integer(-1))), Pow(Mul(Pow( Mul(Symbol('pdg0009863'), Integer(2)), Integer(-1)), Symbol('pdg0002515')), Rational(1, 2))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9645178657",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Symbol('pdg0009140'), Symbol('pdg0001467'))", 
                     latex:"a t"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9658195023",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d",
                     latex_rhs:"v_0 t + \frac{1}{2} a t^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001943'), Add(Mul(Symbol('pdg0001467'), Symbol('pdg0005153')), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0009140'), Pow(Symbol('pdg0001467'), Integer(2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9674924517",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"StrictGreaterThan(Symbol('pdg0001466'), Symbol('pdg0003033'))", 
                     latex:"K >> G"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9703482302",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"G \frac{m_{\rm Earth} m}{r_{\rm Earth}}",
                     latex_rhs:"\frac{1}{2} m v_{\rm escape}^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0006277'), Mul(Pow(Symbol('pdg0003236'), Integer(-1)), Mul(Symbol('pdg0005156'), Symbol('pdg0005458')))), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0005156'), Pow(Symbol('pdg0008656'), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9707028061",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"a_x",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0007159'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9718685793",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{1}{P}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Pow(Symbol('pdg0008134'), Integer(-1)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9746066299",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003461')", 
                     latex:"R_2"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9749777192",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"0",
                     latex_rhs:"KE_1 + PE_1",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Integer(0), Add(Symbol('pdg0001955'), Symbol('pdg0004093')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9753878784",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001357')", 
                     latex:"v"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9756089533",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\sin( \theta_{\rm Brewster} )",
                     latex_rhs:"\frac{n_2}{n_1} \cos( \theta_{\rm Brewster} )",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(sin(Symbol('pdg0004928')), Mul(Mul(Pow(Symbol('pdg0002941'), Integer(-1)), Symbol('pdg0001958')), cos(Symbol('pdg0004928'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9759901995",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v - v_0",
                     latex_rhs:"a t",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Symbol('pdg0001357'), Mul(Integer(-1), Symbol('pdg0005153'))), Mul(Symbol('pdg0009140'), Symbol('pdg0001467')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9761485403",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0003192')", 
                     latex:"Z"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9781951738",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"definition of isothermal compressibility",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{-1}{V} \left( \frac{ \partial V}{\partial P} \right)_T",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Mul(Mul(Integer(-1), Pow(Symbol('pdg0007586'), Integer(-1))), Derivative(Symbol('pdg0007586'), Tuple(Symbol('pdg0008134'), Integer(1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9789485295",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004082')", 
                     latex:"v_{\rm satellite}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9794128647",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005458')", 
                     latex:"m_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9805063945",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\gamma^2 (x - v t)^2 + y^2 + z^2",
                     latex_rhs:"c^2 \gamma^2 \left( t + \frac{ 1 - \gamma^2 }{ \gamma^2 } \frac{x}{v} \right)^2",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Add(Pow(Symbol('pdg0006728'), Integer(2)), Add(Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Add(Mul(Integer(-1), Symbol('pdg0001467'), Symbol('pdg0001357')), Symbol('pdg0004037')), Integer(2))), Pow(Symbol('pdg0005647'), Integer(2)))), Mul(Pow(Symbol('pdg0004567'), Integer(2)), Mul(Pow(Symbol('pdg0001790'), Integer(2)), Pow(Add(Symbol('pdg0001467'), Mul(Mul(Pow(Symbol('pdg0001357'), Integer(-1)), Symbol('pdg0004037')), Mul(Add(Integer(1), Mul(Integer(-1), Pow(Symbol('pdg0001790'), Integer(2)))), Pow(Pow(Symbol('pdg0001790'), Integer(2)), Integer(-1))))), Integer(2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9830343096",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0008257')", 
                     latex:"V_1"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9838128064",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"d_2 \frac{4 \pi^2}{T^2}",
                     latex_rhs:"G \frac{m_1}{r^2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0002798'), Mul(Mul(Integer(4), Pow(Symbol('pdg0003141'), Integer(2))), Pow(Pow(Symbol('pdg0009491'), Integer(2)), Integer(-1)))), Mul(Symbol('pdg0006277'), Mul(Symbol('pdg0005022'), Pow(Pow(Symbol('pdg0002530'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9847143017",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\kappa_T",
                     latex_rhs:"\frac{-PV}{V} \left( \frac{-1}{P^2}\right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004645'), Mul(Mul(Pow(Symbol('pdg0007586'), Integer(-1)), Mul(Integer(-1), Mul(Symbol('pdg0008134'), Symbol('pdg0007586')))), Mul(Integer(-1), Pow(Pow(Symbol('pdg0008134'), Integer(2)), Integer(-1)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9848292229",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"dy",
                     latex_rhs:"y i dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005842'), Mul(Symbol('pdg0001452'), Mul(Symbol('pdg0009199'), Symbol('pdg0004621'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9848294829",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d}{dx} y",
                     latex_rhs:"y i",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Derivative(Symbol('pdg0001452'), Tuple(Symbol('pdg0001464'), Integer(1))), Mul(Symbol('pdg0004621'), Symbol('pdg0001452')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9854442418",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v",
                     latex_rhs:"\sqrt{\frac{E}{m}}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0002077'), Pow(Mul(Symbol('pdg0002241'), Pow(Symbol('pdg0009863'), Integer(-1))), Rational(1, 2)))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9858028950",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{1}{a^2}",
                     latex_rhs:"\int_0^W \frac{1-\cos\left(2\frac{n \pi}{W}x\right)}{2} dx",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(Pow(Symbol('pdg0009139'), Integer(2)), Integer(-1)), Integral(Mul(Pow(Integer(2), Integer(-1)), Add(Integer(1), Mul(Integer(-1), cos(Mul(Integer(2), Mul(Symbol('pdg0001464'), Mul(Pow(Symbol('pdg0002523'), Integer(-1)), Mul(Symbol('pdg0001592'), Symbol('pdg0003141'))))))))), Tuple(Symbol('pdg0001464'), Integer(0), Symbol('pdg0002523'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9862900242",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"y",
                     latex_rhs:"- \frac{1}{2} g t^2 + v_0 t \sin(\theta) + y_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0005647'), Add(Symbol('pdg0001469'), Add(Mul(Symbol('pdg0005153'), Mul(Symbol('pdg0001467'), sin(Symbol('pdg0001575')))), Mul(Integer(-1), Mul(Pow(Integer(2), Integer(-1)), Mul(Symbol('pdg0001649'), Pow(Symbol('pdg0001467'), Integer(2))))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9881106100",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0009140')", 
                     latex:"a"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9882526611",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"v_{0, x} t",
                     latex_rhs:"x - x_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0001467'), Symbol('pdg0002958')), Add(Symbol('pdg0004037'), Mul(Integer(-1), Symbol('pdg0001572'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9884115626",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0002530')", 
                     latex:"r"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9885190237",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004621')", 
                     latex:"i"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9889984281",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 (\sin(x))^2",
                     latex_rhs:"1 - \cos(2 x)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Pow(sin(Symbol('pdg0001464')), Integer(2))), Add(Integer(1), Mul(Integer(-1), cos(Mul(Integer(2), Symbol('pdg0001464'))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9894826550",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"2 \sin(x) \cos(x)",
                     latex_rhs:"\frac{1}{2i}\left(\exp(i x)-\exp(-i x) \right) \left(\exp(i x)+\exp(-i x) \right)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(2), Mul(sin(Symbol('pdg0001464')), cos(Symbol('pdg0001464')))), Mul(Pow(Mul(Integer(2), Symbol('pdg0004621')), Integer(-1)), Mul(Add(Mul(Integer(-1), exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464'))))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), Add(exp(Mul(Integer(-1), Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))), exp(Mul(Symbol('pdg0004621'), Symbol('pdg0001464')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9897284307",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{d}{t}",
                     latex_rhs:"\frac{v + v_0}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0001943'), Pow(Symbol('pdg0001467'), Integer(-1))), Mul(Pow(Integer(2), Integer(-1)), Add(Symbol('pdg0001357'), Symbol('pdg0005153'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9903988330",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0005156')", 
                     latex:"m"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9906920183",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0001464')", 
                     latex:"x"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9919999981",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\rho",
                     latex_rhs:"0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0003935'), Integer(0))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9933742680",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Symbol('pdg0004518')", 
                     latex:"r_{\rm Schwarzschild}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9941599459",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"based on U(p, T, V) = U(T, V)",
                     latex_lhs:"dU",
                     latex_rhs:"\left(\frac{\partial U}{\partial T}\right)_V dT + \left(\frac{\partial U}{\partial V}\right)_T dV",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('dU'), Derivative(Symbol('pdg0005786'), Tuple(Symbol('pdg0007343'), Integer(1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9956609318",
         properties:{lean:"", 
                     author_name_latex:"ben", 
                     sympy:"Mul(Float('6.6742999999999997', precision=53), Pow(Integer(10), Mul(Integer(-1), Integer(11))))", 
                     latex:"6.67430*10^{-11}"}}] AS row
CREATE (n:feed{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9958485859",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{-\hbar^2}{2m} \nabla^2 \psi \left( \vec{r},t \right)",
                     latex_rhs:"i \hbar \frac{\partial}{\partial t} \psi( \vec{r},t)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Mul(Mul(Mul(Integer(-1), Pow(Symbol('pdg0001054'), Integer(2))), Pow(Mul(Integer(2), Symbol('pdg0005156')), Integer(-1))), Mul(Mul(Symbol('nabla'), Symbol('nabla')), Function('pdg0009489')(Symbol('pdg0009472'), Symbol('pdg0001467'))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9973952056",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"-g t",
                     latex_rhs:"v_y - v_{0, y}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Integer(-1), Mul(Symbol('pdg0001649'), Symbol('pdg0001467'))), Add(Mul(Integer(-1), Symbol('pdg0005153')), Symbol('pdg0009431')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9988949211",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"(\sin(x))^2",
                     latex_rhs:"\frac{1 - \cos(2 x)}{2}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Pow(sin(Symbol('pdg0001464')), Integer(2)), Mul(Pow(Integer(2), Integer(-1)), Add(Integer(1), Mul(Integer(-1), cos(Mul(Integer(2), Symbol('pdg0001464')))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9991999979",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \times \vec{E}",
                     latex_rhs:"-\mu_0\frac{\partial \vec{H}}{\partial t}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(cross(Symbol('pdg0006238'), Symbol('nabla')), Mul(Integer(-1), Mul(Symbol('pdg0006197'), Derivative(Symbol('pdg0002069'), Tuple(Symbol('pdg0001467'), Integer(1))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999998870",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{ \vec{p}}{\hbar}",
                     latex_rhs:"\vec{k}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0002046')), Symbol('pdg0007394'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999870",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{p}{\hbar}",
                     latex_rhs:"k",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Pow(Symbol('pdg0001054'), Integer(-1)), Symbol('pdg0001134')), Symbol('pdg0005321'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999960",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\hbar",
                     latex_rhs:"h/(2 \pi)",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001054'), Mul(Symbol('pdg0004413'), Pow(Mul(Integer(2), Symbol('pdg0003141')), Integer(-1))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999961",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\frac{E}{\hbar}",
                     latex_rhs:"\omega",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('pdg0004931'), Pow(Symbol('pdg0001054'), Integer(-1))), Symbol('pdg0002321'))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999962",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"p",
                     latex_rhs:"\hbar k",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001134'), Mul(Symbol('pdg0001054'), Symbol('pdg0005321')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999965",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"E",
                     latex_rhs:"\omega \hbar",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0004931'), Mul(Symbol('pdg0001054'), Symbol('pdg0002321')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999968",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\frac{-b-\sqrt{b^2-4ac}}{2 a}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'), Mul(Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001939')), Mul(Integer(-1), Pow(Add(Mul(Integer(-1), Integer(4), Symbol('pdg0009139'), Symbol('pdg0004231')), Pow(Symbol('pdg0001939'), Integer(2))), Rational(1, 2))))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999969",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"x",
                     latex_rhs:"\frac{-b+\sqrt{b^2-4ac}}{2 a}",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Symbol('pdg0001464'), Mul(Pow(Mul(Integer(2), Symbol('pdg0009139')), Integer(-1)), Add(Mul(Integer(-1), Symbol('pdg0001939')), Pow(Add(Mul(Integer(-1), Integer(4), Symbol('pdg0009139'), Symbol('pdg0004231')), Pow(Symbol('pdg0001939'), Integer(2))), Rational(1, 2)))))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999975",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\langle \psi| \hat{A} |\psi \rangle",
                     latex_rhs:"\langle a \rangle",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Symbol('pdg0004065')",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"9999999981",
         properties:{sympy_lhs:"",
                     reference_latex:"",
                     sympy_rhs:"",
                     description_latex:"",
                     latex_lhs:"\vec{ \nabla} \cdot \vec{E}",
                     latex_rhs:"\rho/\epsilon_0",
                     latex_condition:"",
                     name_latex:"",
                     lean:"",
                     author_name_latex:"ben",
                     sympy:"Equality(Mul(Symbol('nabla'), Symbol('pdg0004326')), Mul(Pow(Symbol('pdg0007940'), Integer(-1)), Symbol('pdg0003935')))",
                     latex_relation:"="}}] AS row
CREATE (n:expression{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
