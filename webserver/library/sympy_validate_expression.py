#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2024
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import random

import sympy
from sympy.physics.units import (
    mass,
    length,
    time,
    temperature,
    luminous_intensity,
    amount_of_substance,
    charge,
)
from sympy.physics.units.systems.si import dimsys_SI  # type: ignore


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
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: sympy_validate_expression/convert_sympy_expr_to_pdg_symbols start "
        + trace_id
    )
    print(
        "sympy_validate_expression/convert_sympy_expr_to_pdg_symbols: sympy_expr=",
        sympy_expr,
    )
    print(
        "sympy_validate_expression/convert_sympy_expr_to_pdg_symbols: symbol_id_dict=",
        symbol_id_dict,
    )

    print("sympy_expr.atoms=", sympy_expr.atoms())
    for this_atom in sympy_expr.atoms():
        print(type(this_atom))

    revised_expr = sympy_expr
    for this_symb in sympy_expr.atoms():
        this_symb_as_str = str(this_symb)
        if this_symb_as_str in symbol_id_dict.keys():
            print("this_symb=", this_symb)
            # register the atom as a SymPy symbol:
            my_str = str(this_symb) + " = sympy.Symbol('" + str(this_symb) + "')"
            print("to exec:", my_str)
            exec(my_str)

            pdg_id = "pdg" + str(symbol_id_dict[str(this_symb)])
            # print("pdg_id=", pdg_id)
            # print(sympy.Symbol(pdg_id))
            # print(type(sympy.Symbol(pdg_id)))

            revised_expr = revised_expr.subs(this_symb, sympy.Symbol(pdg_id))

    print(
        "[TRACE] func: sympy_validate_expression/convert_sympy_expr_to_pdg_symbols end "
        + trace_id
    )
    return revised_expr


def dimensional_consistency(
    expression_dict: dict,
    list_of_symbol_IDs_in_expression: list,
    dict_of_all_symbol_dicts: dict,
):
    """
    see sympy_validate_expression.README.md for more explanation.

    >>> expression_dict = {'id': '9942'}
    >>> dict_of_all_symbol_dicts = {'9942': {'id': '9942'}}
    >>> dimensional_consistency(expression_dict,
                                dict_of_all_symbol_dicts)
    unknown
    """
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] func: sympy_validate_expression/dimensional_consistency start "
        + trace_id
    )
    print("expression_dict=", expression_dict)
    print("list_of_symbol_IDs_in_expression", list_of_symbol_IDs_in_expression)

    if "sympy" not in expression_dict.keys():
        return "sympy not provided for expression"

    sympy_expr = eval(expression_dict["sympy"])
    print("sympy_validate_expression/dimensional_consistency: sympy_expr=", sympy_expr)
    try:
        LHS = sympy_expr.lhs
        RHS = sympy_expr.rhs
    except Exception as err:
        print(str(err))
        return "unable to determine LHS,RHS for" + str(sympy_expr)

    print("sympy_validate_expression/dimensional_consistency: LHS=", LHS)
    print("sympy_validate_expression/dimensional_consistency: RHS=", RHS)

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

        print("symbol_dim_powers=", symbol_dim_powers[:-1])

        if (
            symbol_dim_powers[:-1] == ""
        ):  # everything was dimensionless for this variable
            symbol_dim_powers_result = "mass/mass"
        else:
            symbol_dim_powers_result = symbol_dim_powers[:-1]

        print("symbol_dim_powers_result=", symbol_dim_powers_result)

        exec("pdg" + str(symbol_id) + " = " + symbol_dim_powers_result)

    # now that the symbol dimensions have been set,
    # evaluate the dimensionality of the expression

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

    print(
        "[TRACE] func: sympy_validate_expression/dimensional_consistency start "
        + trace_id
    )
    return "unknown"
