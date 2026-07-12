https://pymotw.com/3/doctest/
how to use doctest for the entire file:
python -m doctest -v validate_inference_rules_sympy.py

testing per function on the command line:
import doctest
from validate_steps_sympy import *
doctest.run_docstring_examples(split_expr_into_lhs_rhs, globals(), verbose=True)

I wasn't able to get the following to work:
from doctest import testmod
from validate_inference_rules_sympy import *
testmod(name ='split_expr_into_lhs_rhs', verbose = True)



TODO: although some functions have doctests, these doctests rely on the previous argument structures
rather than the current "list of dicts"x3.
        # Implementation expects:
        input_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])

        # Doctest provides:
        input_expr = parse_latex("a = b") # Returns an Equality object
