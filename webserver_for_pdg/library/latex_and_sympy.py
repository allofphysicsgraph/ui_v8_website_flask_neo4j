#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2025
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
The purpose of this file is to transform between Latex to SymPy
The reason this scope has been isolated is to facilitate changing the Computer Algebra System (CAS) to something other than SymPy if that becomes relevant.
For example, two different Computer Algebra Systems could be used with the Physics Derivation Graph (e.g., Sympy and Sage) to either duplicate a given validation or to extend coverage to inference rules one of the CAS cannot address.

In the situation where another CAS like Sage is used, a separate "latex_and_sage.py" module would be created.
"""

import random
import sympy  # type: ignore
from sympy.parsing.latex import parse_latex  # type: ignore
import time

import logging

logger = logging.getLogger(__name__)


def sympy_to_latex_str(sympy_expr: str) -> str:
    """
        TODO: this isn't working as desired.
        https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/19

    latex_and_sympy/sympy_to_latex_str: SymPy to be converted to Latex: sympy.Eq(sympy.Symbol('pdg1881666'),sympy.Symbol('pdg3882725'))
    latex_and_sympy/sympy_to_latex_str: latex_str= \mathtt{\text{sympy.Eq(sympy.Symbol('pdg1881666'),sympy.Symbol('pdg3882725'))}}

    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] latex_and_sympy/sympy_to_latex_str start "
        + trace_id
        + " "
        + str(time.time())
    )

    print(
        "latex_and_sympy/sympy_to_latex_str: SymPy to be converted to Latex: "
        + str(sympy_expr)
    )

    latex_str = sympy.latex(eval(sympy_expr))

    # TODO: sometimes the above files, like on a string with no SymPy formatting:
    #    NameError: name 'b' is not defined

    print("latex_and_sympy/sympy_to_latex_str: latex_str=", latex_str)

    print(
        "[TRACE] latex_and_sympy/sympy_to_latex_str end "
        + trace_id
        + " "
        + str(time.time())
    )
    return latex_str


def cleaned_latex_str_to_sympy_expression(expr_latex: str):
    """
    see compute.remove_latex_presention_markings()

    input: latex expression as string
    for input, assume the latex string has had presentation-related syntax removed

    returns sympy representation

    >>> cleaned_latex_str_to_sympy_expression('a = b')
    Eq(a, b)
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] latex_and_sympy/cleaned_latex_str_to_sympy_expression start "
        + trace_id
        + " "
        + str(time.time())
    )

    print("latex to be converted to SymPy: " + expr_latex)

    try:
        symp_expr = parse_latex(expr_latex)
    except sympy.SympifyError as err:
        # logger.error(err)
        print("ERROR latex_and_sympy/cleaned_latex_str_to_sympy_expression", err)
        raise Exception("Sympy unable to parse latex (1): " + expr_latex)
    except sympy.parsing.latex.errors.LaTeXParsingError as err:
        # logger.error(err)
        print("ERROR latex_and_sympy/cleaned_latex_str_to_sympy_expression", err)
        raise Exception("Sympy unable to parse latex (2): " + expr_latex)
    except sympy.core.sympify.SympifyError as err:
        print("ERROR latex_and_sympy/cleaned_latex_str_to_sympy_expression", err)
        raise Exception("Sympy unable to parse latex (3): " + expr_latex)

    print(
        "[TRACE] latex_and_sympy/cleaned_latex_str_to_sympy_expression start "
        + trace_id
        + " "
        + str(time.time())
    )
    return symp_expr
    # >>> type(symp_expr)
    # <class 'sympy.core.relational.Equality'>


def list_of_sympy_symbols_in_sympy_expression(sympy_expr):
    """
    >>> from sympy.parsing.latex import parse_latex
    >>> sympy_expr = parse_latex('a = b')
    >>> list_of_sympy_symbols_in_sympy_expression(sympy_expr)
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] latex_and_sympy/list_of_sympy_symbols_in_sympy_expression start "
        + trace_id
        + " "
        + str(time.time())
    )
    # list_of_symbols = []
    # for symb in sympy_expr.atoms(sympy.Symbol):
    #     list_of_symbols.append(str(symb))
    # list_of_symbols = list(set(list_of_symbols))
    list_of_sympy_symbols = sympy_expr.atoms(sympy.Symbol)

    # >>> type(list_of_sympy_symbols)
    # <class 'set'>

    # >>> type(list(list_of_sympy_symbols)[0])
    # <class 'sympy.core.symbol.Symbol'>

    print(
        "[TRACE] latex_and_sympy/list_of_sympy_symbols_in_sympy_expression end "
        + trace_id
        + " "
        + str(time.time())
    )
    return list(list_of_sympy_symbols)


# For the difference between "free_symbols" and "atoms" see
# https://docs.sympy.org/latest/modules/core.html#sympy.core.basic.Basic.free_symbols
# and
# https://docs.sympy.org/latest/modules/core.html#sympy.core.basic.Basic.atoms
# and
# https://stackoverflow.com/questions/36594508/sympy-get-functions-from-expression/36629624
#
# def list_of_sympy_symbols_in_sympy_expression(sympy_expr) -> list:
#     """
#     Sometimes Sympy works as desired (for simple algebraic synatx)
#     >>> parse_latex(r'a + k = b + k').free_symbols
#     {b, a, k}
#
#     Sometimes the Sympy output does not reflect user intent
#     #>>> parse_latex(r'\nabla \vec{x} = f(y)').free_symbols
#     {x, nabla, y, vec}
#     """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] latex_and_sympy/list_of_str_symbols_from_cleaned_latex_str start " + trace_id)
#
#     my_sym = list(sympy_expr.free_symbols)
#
#     logger.info("[TRACE] latex_and_sympy/list_of_str_symbols_from_cleaned_latex_str end " + trace_id)
#     return my_sym

# EOF
