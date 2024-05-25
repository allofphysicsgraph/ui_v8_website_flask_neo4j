#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2021
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
For a given derivation step, use SymPy to validate the consistency of the input and output expressions with the feeds and inference rule.

Historically, the validation functions are from
https://github.com/allofphysicsgraph/proofofconcept/blob/gh-pages/v2_XML/databases/inference_rules_database.xml

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

"""

import sympy  # type: ignore

# the following is only relevant for doctests
from sympy.parsing.latex import parse_latex  # type: ignore


def add_X_to_both_sides(input_expr_sympy, feed_expr_sympy, output_expr_sympy) -> str:
    """
    https://docs.sympy.org/latest/gotchas.html#double-equals-signs
    https://stackoverflow.com/questions/37112738/sympy-comparing-expressions

    Given  a = b
    add c to both sides
    get a + c = b + c

    >>> input_expr = parse_latex("a = b")
    >>> feed = parse_latex("c")
    >>> output_expr = parse_latex("a + c = b + c")
    >>> add_X_to_both_sides(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: sympy_validate_step/add_X_to_both_sides start " + trace_id)

    delta_lhs = sympy.simplify(
        sympy.Add(input_expr_sympy.lhs, feed_expr_sympy) - output_expr_sympy.lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Add(input_expr_sympy.rhs, feed_expr_sympy) - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        print("[TRACE] func: sympy_validate_step/add_X_to_both_sides end " + trace_id)
        return "valid"
    else:
        print("[TRACE] func: sympy_validate_step/add_X_to_both_sides end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def subtract_X_from_both_sides(
    input_expr_sympy, feed_expr_sympy, output_expr_sympy
) -> str:
    """
    https://docs.sympy.org/latest/tutorial/manipulation.html

    Rather than have "add X to both sides" and "subtract X from both sides"
    as separate inference rules, we could write "subtract X from both sides"
    to use "add X to both sides"

    Given a = b
    subtract c
    get a - c = b - c


    >>> input_expr = parse_latex("a = b")
    >>> feed = parse_latex("c")
    >>> output_expr = parse_latex("a - c = b - c")
    >>> subtract_X_from_both_sides(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: sympy_validate_step/subtract_X_from_both_sides start " + trace_id
    )

    delta_lhs = sympy.simplify(
        sympy.Add(input_expr_sympy.lhs, sympy.Mul(-1, feed_expr_sympy))
        - output_expr_sympy.lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Add(input_expr_sympy.rhs, sympy.Mul(-1, feed_expr_sympy))
        - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        print(
            "[TRACE] func: sympy_validate_step/subtract_X_from_both_sides end "
            + trace_id
        )
        return "valid"
    else:
        print(
            "[TRACE] func: sympy_validate_step/subtract_X_from_both_sides end "
            + trace_id
        )
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def multiply_both_sides_by(input_expr_sympy, feed_expr_sympy, output_expr_sympy) -> str:
    """
    see also dividebothsidesby
    x*y = Mul(x,y)

    given 'a + b = c'
    multiply both sides by d
    to get '(a + b)*d = c*d'

    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)*d = c*d")
    >>> multiply_both_sides_by(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: sympy_validate_step/multiply_both_sides_by start " + trace_id)

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.lhs, feed_expr_sympy) - output_expr_sympy.rhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.rhs, feed_expr_sympy) - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        print(
            "[TRACE] func: sympy_validate_step/multiply_both_sides_by end " + trace_id
        )
        return "valid"
    else:
        print(
            "[TRACE] func: sympy_validate_step/multiply_both_sides_by end " + trace_id
        )
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def divide_both_sides_by(input_expr_sympy, feed_expr_sympy, output_expr_sympy) -> str:
    """
    see also multiply_both_sides_by
    https://docs.sympy.org/latest/tutorial/manipulation.html

    x/y = Mul(x, Pow(y, -1))

    given 'a + b = c'
    divide both sides by d
    to get '(a + b)/d = c/d'

    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)/d = c/d")
    >>> divide_both_sides_by(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: sympy_validate_step/divide_both_sides_by start " + trace_id)

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.lhs, sympy.Pow(feed_expr_sympy, -1))
        - output_expr_sympy.rhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.rhs, sympy.Pow(feed_expr_sympy, -1))
        - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        print("[TRACE] func: sympy_validate_step/divide_both_sides_by end " + trace_id)
        return "valid"
    else:
        print("[TRACE] func: sympy_validate_step/divide_both_sides_by end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)
