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
import time
import tokenize
import uuid

# move and copy files
import shutil

import sympy  # type: ignore
from sympy.parsing.latex import parse_latex  # type: ignore
from sympy.parsing.sympy_parser import parse_expr  # type: ignore

from subprocess import PIPE  # https://docs.python.org/3/library/subprocess.html
import subprocess  # https://stackoverflow.com/questions/39187886/what-is-the-difference-between-subprocess-popen-and-subprocess-run/39187984

import logging

logger = logging.getLogger(__name__)

proc_timeout = 10


def sympy_to_latex_str(sympy_expr: str) -> str:
    """
        TODO: this isn't working as desired.
        https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/19

    sympy_to_latex_str: SymPy to be converted to Latex: sympy.Eq(sympy.Symbol('pdg1881666'),sympy.Symbol('pdg3882725'))
    sympy_to_latex_str: latex_str= \mathtt{\text{sympy.Eq(sympy.Symbol('pdg1881666'),sympy.Symbol('pdg3882725'))}}

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    if sympy_expr == "":
        return "empty str sent to sympy_to_latex_str"

    logger.info("SymPy to be converted to Latex: " + str(sympy_expr))

    expr = parse_expr(sympy_expr)

    latex_str = sympy.latex(expr)

    # TODO: sometimes the above files, like on a string with no SymPy formatting:
    #    NameError: name 'b' is not defined

    logger.info("latex_str=" + latex_str)

    logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info("latex to be converted to SymPy: " + expr_latex)

    try:
        symp_expr = parse_latex(expr_latex)
    except sympy.SympifyError as err:
        # logger.error(err)
        logger.error(str(err))
        raise Exception("Sympy unable to parse latex (1): " + expr_latex)
    except sympy.parsing.latex.errors.LaTeXParsingError as err:
        # logger.error(err)
        logger.error(str(err))
        raise Exception("Sympy unable to parse latex (2): " + expr_latex)
    except sympy.core.sympify.SympifyError as err:
        logger.error(str(err))
        raise Exception("Sympy unable to parse latex (3): " + expr_latex)

    logger.info("[TRACE] end " + trace_id)
    return symp_expr
    # >>> type(symp_expr)
    # <class 'sympy.core.relational.Equality'>


def list_of_sympy_symbols_in_sympy_expression(sympy_expr):
    """
    >>> from sympy.parsing.latex import parse_latex
    >>> sympy_expr = parse_latex('a = b')
    >>> list_of_sympy_symbols_in_sympy_expression(sympy_expr)
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # list_of_symbols = []
    # for symb in sympy_expr.atoms(sympy.Symbol):
    #     list_of_symbols.append(str(symb))
    # list_of_symbols = list(set(list_of_symbols))
    try:
        list_of_sympy_symbols = sympy_expr.atoms(sympy.Symbol)
    except AttributeError as e:
        logger.error(str(e))
        return []

    # >>> type(list_of_sympy_symbols)
    # <class 'set'>

    # >>> type(list(list_of_sympy_symbols)[0])
    # <class 'sympy.core.symbol.Symbol'>

    logger.info("[TRACE] end " + trace_id)
    return list(list_of_sympy_symbols)


def create_AST_png_for_latex(sympy_expr: str, output_filename: str) -> str:
    """
    >>> create_AST_png_for_latex('Eq(Symbol('a'),Symbol('b'))','filename')
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info("output_filename = " + output_filename)

    try:
        expr = parse_expr(sympy_expr, evaluate=False)
    except NameError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except SyntaxError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except AttributeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )
    except TypeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )
    except tokenize.TokenError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )
    except IndexError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + sympy_expr
            + " as SymPy; error="
            + str(err)
        )

    graphviz_of_AST_for_expr = sympy.printing.dot.dotprint(expr)
    dot_filename = "tmp.dot"
    with open(dot_filename, "w") as fil:
        fil.write(graphviz_of_AST_for_expr)

    output_filename_with_extension = output_filename + ".png"

    logger.info("dot -Tpng " + dot_filename + " -o " + output_filename_with_extension)
    # neato -Tpng graphviz.dot > /home/appuser/app/static/graphviz.png
    # if not os.path.exists("/code/static/" + output_filename):
    process = subprocess.run(
        # ["dot", "-Tpng", dot_filename, "-o","/code/static/" + output_filename_with_extension],
        ["dot", "-Tpng", dot_filename, "-o", output_filename_with_extension],
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )
    neato_stdout = process.stdout.decode("utf-8")
    if len(neato_stdout) > 0:
        logger.debug("neato_stdout = " + str(neato_stdout))
    neato_stderr = process.stderr.decode("utf-8")
    if len(neato_stderr) > 0:
        logger.debug("neato_stderr = " + str(neato_stderr))

    shutil.move(
        output_filename_with_extension, "/code/static/" + output_filename_with_extension
    )

    logger.info("[TRACE] end " + trace_id)
    return ""


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
#     trace_id = str(uuid.uuid4())
#     logger.info("[TRACE] list_of_str_symbols_from_cleaned_latex_str start " + trace_id)
#
#     my_sym = list(sympy_expr.free_symbols)
#
#     logger.info("[TRACE] list_of_str_symbols_from_cleaned_latex_str end " + trace_id)
#     return my_sym

# EOF
