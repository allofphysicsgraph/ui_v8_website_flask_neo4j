#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import random
import tokenize
import uuid
import logging

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
)  # type: ignore
from sympy.physics.units.systems.si import dimsys_SI  # type: ignore
from sympy.parsing.sympy_parser import parse_expr

logger = logging.getLogger(__name__)


def convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict: dict):
    """
    see sympy_validate_expression.README.md for more explanation.

    BHP, 2024-05-27: The approach used in this function is a fragile hack.

    sympy_expr is a SymPy expression with no PDG symbol IDs, e.g.,
    Eq(a, b)
    and the purpose of this function is to use a lookup dict (symbol_id_dict)
    to convert to a SymPy expression with PDG symbol IDs.

    >>> from sympy.parsing.latex import parse_latex
    >>> sympy_expr = parse_latex("x = r")
    >>> convert_sympy_expr_to_pdg_symbols(sympy_expr, {'r': '99', 'x': 00})
    Eq(sympy.Symbol('pdg99'), sympy.Symbol('pdg00'))
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
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
            # register the atom as a SymPy symbol:
            my_str = str(this_symb) + " = sympy.Symbol('" + str(this_symb) + "')"
            logger.info("to exec:" + my_str)
            exec(my_str)

            pdg_id = "pdg" + str(symbol_id_dict[str(this_symb)])
            # print("pdg_id=", pdg_id)
            # print(sympy.Symbol(pdg_id))
            # print(type(sympy.Symbol(pdg_id)))

            revised_expr = revised_expr.subs(this_symb, sympy.Symbol(pdg_id))

    logger.info("type(revised_expr)=" + str(type(revised_expr)))
    logger.info("[TRACE] end " + trace_id)
    return revised_expr


def dimensional_consistency(
    expression_dict: dict,
    list_of_symbol_IDs_in_expression: list,
    dict_of_all_symbol_dicts: dict,
) -> str:
    """
    see sympy_validate_expression.README.md for more explanation.

    The error handling here is similar to `compute/get_sympy_as_latex_per_expr_id`

    >>> expression_dict = {'id': '9942'}
    >>> dict_of_all_symbol_dicts = {'9942': {'id': '9942'}}
    >>> dimensional_consistency(expression_dict,
                                dict_of_all_symbol_dicts)
    unknown
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    # logger.info("expression_dict = " + str(expression_dict))
    # logger.info(
    #     "list_of_symbol_IDs_in_expression = " + str(list_of_symbol_IDs_in_expression)
    # )
    # logger.info("dict_of_all_symbol_dicts = " + str(dict_of_all_symbol_dicts))

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

    # for each symbol used in the expression,
    # convert the numeric value for each dimension
    # into a SymPy expression that gets multiplied together for all dimensions
    for symbol_id in list_of_symbol_IDs_in_expression:
        # print("symbol_id=", symbol_id)
        this_symbol_dict = dict_of_all_symbol_dicts[symbol_id]
        # print("this_symbol_dict=", this_symbol_dict)
        symbol_dim_powers = ""
        if this_symbol_dict["dimension_time"] != 0:
            symbol_dim_powers += (
                "time**(" + str(this_symbol_dict["dimension_time"]) + ")*"
            )
        if this_symbol_dict["dimension_electric_charge"] != 0:
            symbol_dim_powers += (
                "charge**(" + str(this_symbol_dict["dimension_electric_charge"]) + ")*"
            )
        if this_symbol_dict["dimension_luminous_intensity"] != 0:
            symbol_dim_powers += (
                "luminous_intensity**("
                + str(this_symbol_dict["dimension_luminous_intensity"])
                + ")*"
            )
        if this_symbol_dict["dimension_length"] != 0:
            symbol_dim_powers += (
                "length**(" + str(this_symbol_dict["dimension_length"]) + ")*"
            )
        if this_symbol_dict["dimension_amount_of_substance"] != 0:
            symbol_dim_powers += (
                "amount_of_substance**("
                + str(this_symbol_dict["dimension_amount_of_substance"])
                + ")*"
            )
        if this_symbol_dict["dimension_mass"] != 0:
            symbol_dim_powers += (
                "mass**(" + str(this_symbol_dict["dimension_mass"]) + ")*"
            )
        if this_symbol_dict["dimension_temperature"] != 0:
            symbol_dim_powers += (
                "temperature**(" + str(this_symbol_dict["dimension_temperature"]) + ")*"
            )

        logger.info("symbol_dim_powers=" + str(symbol_dim_powers[:-1]))

        if (
            symbol_dim_powers[:-1] == ""
        ):  # everything was dimensionless for this variable
            symbol_dim_powers_result = "mass/mass"
        else:
            symbol_dim_powers_result = symbol_dim_powers[:-1]

        logger.info("symbol_dim_powers_result=" + str(symbol_dim_powers_result))

        # TODO: `exec` seems bad?
        exec("pdg" + str(symbol_id) + " = " + symbol_dim_powers_result)

    # now that the symbol dimensions have been set,
    # evaluate the dimensionality of the expression

    logger.info(type(LHS))
    logger.info(type(RHS))

    logger.info("LHS = " + str(LHS))
    logger.info("RHS = " + str(RHS))

    try:
        determine_consistency_bool = dimsys_SI.equivalent_dims(
            eval(str(LHS)), eval(str(RHS))
        )
    except Exception as err:
        return "ERROR for dim with " + expression_dict["id"]

    if determine_consistency_bool:
        return "dimensions are consistent"
    else:
        return "inconsistent dimensions"

    logger.info("[TRACE] end " + trace_id)
    return "unknown"


# EOF
