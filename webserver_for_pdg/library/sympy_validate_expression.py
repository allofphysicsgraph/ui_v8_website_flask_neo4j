#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import tokenize
import uuid
import logging
from typing import Dict, List

# import time  # this creates a conflict with sympy's `time`

import sympy  # type: ignore
from sympy.physics.units import (
    mass,
    length,
    time,
    temperature,
    luminous_intensity,
    amount_of_substance,
    charge,
)  # type: ignore[import-untyped]
from sympy.physics.units.systems.si import dimsys_SI  # type: ignore
from sympy.parsing.sympy_parser import parse_expr  # type: ignore

from .tracing import trace_execution, trace_id_var

logger = logging.getLogger(__name__)


def convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict: dict):
    """
    see sympy_validate_expression.README.md for more explanation.

    sympy_expr is a SymPy expression with no PDG symbol IDs, e.g.,
    Eq(a, b)
    and the purpose of this function is to use a lookup dict (symbol_id_dict)
    to convert to a SymPy expression with PDG symbol IDs.

    >>> from sympy.parsing.latex import parse_latex
    >>> sympy_expr = parse_latex("x = r")
    >>> convert_sympy_expr_to_pdg_symbols(sympy_expr, {'r': '99', 'x': 00})
    Eq(sympy.Symbol('pdg99'), sympy.Symbol('pdg00'))
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)
    logger.info("sympy_expr=" + str(sympy_expr))
    logger.info("symbol_id_dict=" + str(symbol_id_dict))

    logger.info("sympy_expr.atoms=" + str(sympy_expr.atoms()))
    for this_atom in sympy_expr.atoms():
        logger.info("type:" + str(type(this_atom)))

    revised_expr = sympy_expr
    for this_symb in sympy_expr.atoms():
        this_symb_as_str = str(this_symb)
        if this_symb_as_str in symbol_id_dict.keys():
            logger.info("this_symb=" + str(this_symb))
            logger.info("type(this_symb)=" + str(type(this_symb)))

            pdg_id = "pdg" + str(symbol_id_dict[str(this_symb)])
            revised_expr = revised_expr.subs(this_symb, sympy.Symbol(pdg_id))

    logger.info("type(revised_expr)=" + str(type(revised_expr)))
    # logger.info("[TRACE] end " + trace_id)
    return revised_expr


# Maps each PDG dimension field name to the corresponding SymPy base
# dimension object. Used to build a substitution map without exec()/eval().
_DIMENSION_FIELD_TO_UNIT = {
    "dimension_time": time,
    "dimension_electric_charge": charge,
    "dimension_luminous_intensity": luminous_intensity,
    "dimension_length": length,
    "dimension_amount_of_substance": amount_of_substance,
    "dimension_mass": mass,
    "dimension_temperature": temperature,
}


def build_symbol_dimension_map(
    symbols_in_expression: List[dict],
) -> Dict[sympy.Symbol, sympy.Expr]:
    """
    Build a {pdg<id> symbol: dimension expression} substitution map for
    every symbol used in an expression.

    This replaces the original implementation, which built a Python source
    string such as "mass**(1)*length**(-2)" per symbol and pushed it into
    the function's namespace via `exec("pdgNNN = " + that_string)`. Doing
    that meant executing dynamically-assembled code built (in part) from
    values pulled out of `symbols_in_expression` -- values which, depending
    on caller, might not always be trustworthy integers. Building the
    SymPy expression directly with `**` and `*` is just as expressive,
    is type-checked by SymPy itself, and never touches exec/eval.
    """
    symbol_dimension_map: Dict[sympy.Symbol, sympy.Expr] = {}

    for this_symbol_dict in symbols_in_expression:
        dim_expr = None
        for field_name, unit_dim in _DIMENSION_FIELD_TO_UNIT.items():
            power = this_symbol_dict[field_name]
            if power != 0:
                term = unit_dim**power
                dim_expr = term if dim_expr is None else dim_expr * term

        if dim_expr is None:
            # everything was dimensionless for this variable -- matches the
            # original fallback of "mass/mass"
            dim_expr = mass / mass

        pdg_symbol = sympy.Symbol("pdg" + str(this_symbol_dict["id"]))
        symbol_dimension_map[pdg_symbol] = dim_expr

    return symbol_dimension_map


def dimensional_consistency(
    expression_dict: dict, symbols_in_expression: List[dict]
) -> str:
    """
    see sympy_validate_expression.README.md for more explanation.

    The error handling here is similar to `compute/get_sympy_as_latex_per_expr_id`
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    if "sympy_lhs" not in expression_dict.keys():
        return "sympy_lhs not provided for expression"
    if "sympy_rhs" not in expression_dict.keys():
        return "sympy_rhs not provided for expression"

    try:
        LHS = parse_expr(expression_dict["sympy_lhs"])
    except NameError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_lhs"]
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except SyntaxError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_lhs"]
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except AttributeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_lhs"]
            + " as SymPy; error="
            + str(err)
        )
    except TypeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_lhs"]
            + " as SymPy; error="
            + str(err)
        )
    except tokenize.TokenError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_lhs"]
            + " as SymPy; error="
            + str(err)
        )

    logger.info("sympy_expr_lhs = " + str(LHS))
    # sympy_expr = Eq(pdg4223281, pdg3715170*pdg6035023)

    try:
        RHS = parse_expr(expression_dict["sympy_rhs"])
    except NameError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_rhs"]
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except SyntaxError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_rhs"]
            + " as SymPy; error="
            + str(err)
        )  # this shows up in the HTML table
    except AttributeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_rhs"]
            + " as SymPy; error="
            + str(err)
        )
    except TypeError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_rhs"]
            + " as SymPy; error="
            + str(err)
        )
    except tokenize.TokenError as err:
        return (
            str(type(err).__name__)
            + ": unable to parse "
            + expression_dict["sympy_rhs"]
            + " as SymPy; error="
            + str(err)
        )

    logger.info("sympy_expr_lhs = " + str(RHS))
    # sympy_expr = Eq(pdg4223281, pdg3715170*pdg6035023)

    # Build a {pdgNNN symbol: dimension expression} map for every symbol
    # used in the expression, then substitute it straight into LHS/RHS.
    # This replaces the original exec()-built-locals + eval(str(expr))
    # round trip. `.subs()` walks the existing SymPy expression tree and
    # replaces each Symbol leaf with its dimension expression -- it never
    # executes arbitrary source text, so there's no code-injection surface
    # here regardless of what ends up in `symbols_in_expression`.
    symbol_dimension_map = build_symbol_dimension_map(symbols_in_expression)

    logger.info(type(LHS))
    logger.info(type(RHS))

    logger.info("LHS = " + str(LHS))
    logger.info("RHS = " + str(RHS))

    try:
        # The original implementation relied on eval(str(expr)) raising
        # NameError whenever the expression referenced a pdgNNN symbol that
        # was never exec'd into scope (i.e. it had no matching entry in
        # symbols_in_expression). `.subs()` doesn't error in that situation
        # by default -- it just leaves the symbol unsubstituted -- so this
        # check reproduces the original "undefined symbol" failure mode
        # instead of silently treating it as a real dimension mismatch.
        undefined_symbols = (LHS.free_symbols | RHS.free_symbols) - set(
            symbol_dimension_map.keys()
        )
        if undefined_symbols:
            missing_name = str(sorted(undefined_symbols, key=str)[0])
            raise NameError("name '" + missing_name + "' is not defined")

        lhs_dims = LHS.subs(symbol_dimension_map)
        rhs_dims = RHS.subs(symbol_dimension_map)
        determine_consistency_bool = dimsys_SI.equivalent_dims(lhs_dims, rhs_dims)
    except Exception as err:
        return "ERROR for dim with " + expression_dict["id"]

    if determine_consistency_bool:
        return "dimensions are consistent"
    else:
        return "inconsistent dimensions"

    # logger.info("[TRACE] end " + trace_id)
    return "unknown"


# EOF
