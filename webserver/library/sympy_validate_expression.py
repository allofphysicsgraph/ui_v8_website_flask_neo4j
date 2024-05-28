#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2024
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import random

import sympy


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
