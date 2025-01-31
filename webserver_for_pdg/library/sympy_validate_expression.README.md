This README uses
```bash
docker run -it --rm -v `pwd`:/scratch --workdir /scratch sympyonubuntu python3
```
from <https://github.com/allofphysicsgraph/sympy-in-docker/tree/main>
which provides SymPy 1.12 and antlr4-python3-runtime==4.11 


Abstract: How to convert Latex to SymPy with symbol IDs, then check dimensionality.


A Latex expression can serve as input for SymPy:
```python
>>> from sympy.parsing.latex import parse_latex
>>> my_expr = parse_latex("x = r")
>>> my_expr
Eq(x, r)
```

Also, SymPy can print to Latex. A round-trip example:
```python
>>> import sympy
>>> print(sympy.__version__)
1.12
>>> from sympy.parsing.latex import parse_latex
>>> print(sympy.latex(parse_latex("x = y")))
x = y
```

# _Goal_: replace symbols like `r` with something like `pdg123`. 
Substituting in the Latex string doesn't work:
```python
>>> from sympy.parsing.latex import parse_latex
>>> parse_latex("x = pdg123")
Eq(x, p*(dg*123))
```
That's not what we were seeking. 

From the page
<https://docs.sympy.org/latest/tutorials/intro-tutorial/basic_operations.html#substitution>
substitution of variables is available in SymPy:
```python
>>> import sympy
>>> x, y, z = sympy.symbols("x y z")
>>> expr = sympy.cos(x) + 1
>>> expr.subs(x, y)
cos(y) + 1
```

Use SymPy's substitution, but with arbitrary strings for replacement.

First, observe that the symbols can be extracted:
```python
>>> from sympy.parsing.latex import parse_latex
>>> expr = parse_latex('x = y a')
>>> expr.atoms()
{x, a, y}
```

At this point `x, a, y` aren't SymPy symbols yet:
```python
>>> from sympy.parsing.latex import parse_latex
>>> expr = parse_latex('x = y a')
>>> expr.atoms()
{x, a, y}
>>> a
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'a' is not defined
```
Declare the symbols using dynamic execution ([Pythons' `exec`](https://docs.python.org/3/library/functions.html#exec)):
```python
>>> import sympy
>>> from sympy.parsing.latex import parse_latex
>>> expr = parse_latex('x = y a')
>>> for this_symb in expr.atoms():
    my_str = str(this_symb)+" = sympy.Symbol('"+str(this_symb)+"')"
    exec(my_str)

>>> type(x)
<class 'sympy.core.symbol.Symbol'>

>>> revised_expr = expr.subs(x, sympy.Symbol('pdg12')).subs(a, sympy.Symbol('pdg99')).subs(y, sympy.Symbol('pdg00'))
>>> revised_expr
Eq(pdg12, pdg00*pdg99)
```
That's what we wanted. We are now treating `pdg12` as a symbol registered with SymPy. 

# _Goal_: consistent dimensionality of symbols in an expression

```python
>>> from sympy.parsing.latex import parse_latex
>>> from sympy.physics.units import mass, length, time, temperature, luminous_intensity, amount_of_substance, charge
>>> from sympy.physics.units.systems.si import dimsys_SI  # type: ignore

>>> expr = parse_latex('x = y a')
>>> for this_symb in expr.atoms():
    my_str = str(this_symb)+" = sympy.Symbol('"+str(this_symb)+"')"
    exec(my_str)

>>> revised_expr = expr.subs(x, sympy.Symbol('pdg12')).subs(a, sympy.Symbol('pdg99')).subs(y, sympy.Symbol('pdg00'))

>>> pdg12 = (mass**2)*(time**3)
>>> pdg00 = (mass**2)
>>> pdg99 = (time**3)
```
Now that the variables have dimensions, we can check for consistency:
```python
>>> dimsys_SI.equivalent_dims(pdg12, pdg00*pdg99)
True
```
For reasons I don't understand, `equivalent_dims` doesn't seem to unpack `revised_expr`
```python
>>> dimsys_SI.equivalent_dims(revised_expr.lhs, revised_expr.rhs)
False
```
even though we can confirm they are comprised of these symbols
```python
>>> revised_expr.lhs
pdg12
>>> revised_expr.rhs
pdg00*pdg99
```
Here's the ugly hack to check dimensions:
```python
>>> dimsys_SI.equivalent_dims(eval(str(revised_expr.lhs)), eval(str(revised_expr.rhs)))
True
```