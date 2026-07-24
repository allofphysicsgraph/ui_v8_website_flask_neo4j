#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import logging
import pytest
import sympy
from sympy.physics.units import (
    length,
    mass,
    time,
    temperature,
    charge,
    luminous_intensity,
    amount_of_substance,
)

from webserver_for_pdg.library.sympy_validate_expression import (
    convert_sympy_expr_to_pdg_symbols,
    build_symbol_dimension_map,
    dimensional_consistency,
)

logger = logging.getLogger(__name__)


def make_symbol_dict(symbol_id, **kwargs) -> dict:
    """Helper function to create a symbol dictionary with default 0 dimensions."""
    symbol_dict = {
        "id": symbol_id,
        "dimension_time": 0,
        "dimension_electric_charge": 0,
        "dimension_luminous_intensity": 0,
        "dimension_length": 0,
        "dimension_amount_of_substance": 0,
        "dimension_mass": 0,
        "dimension_temperature": 0,
    }
    symbol_dict.update(kwargs)
    return symbol_dict


# ************************************************************************
# Tests for convert_sympy_expr_to_pdg_symbols
# ************************************************************************


def test_convert_sympy_expr_to_pdg_symbols_basic():
    """Test converting basic SymPy symbols to PDG prefixed symbols."""
    x, r = sympy.symbols("x r")
    sympy_expr = sympy.Eq(x, r)
    symbol_id_dict = {"r": "99", "x": "00"}

    result = convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict)

    expected = sympy.Eq(sympy.Symbol("pdg00"), sympy.Symbol("pdg99"))
    assert result == expected


def test_convert_sympy_expr_to_pdg_symbols_partial_mapping():
    """Test converting expression when only some symbols are in the dictionary."""
    a, b = sympy.symbols("a b")
    sympy_expr = a + b
    symbol_id_dict = {"a": "123"}

    result = convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict)

    expected = sympy.Symbol("pdg123") + sympy.Symbol("b")
    assert result == expected


def test_convert_sympy_expr_to_pdg_symbols_empty_dict():
    """Test converting expression with an empty dictionary returns unchanged expression."""
    x = sympy.Symbol("x")
    sympy_expr = 2 * x + 1
    symbol_id_dict = {}

    result = convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict)

    assert result == sympy_expr


def test_convert_sympy_expr_to_pdg_symbols_int_ids():
    """Test converting expression with integer IDs in the dictionary."""
    a, b = sympy.symbols("a b")
    sympy_expr = sympy.Eq(a, b)
    symbol_id_dict = {"a": 10, "b": 20}

    result = convert_sympy_expr_to_pdg_symbols(sympy_expr, symbol_id_dict)

    expected = sympy.Eq(sympy.Symbol("pdg10"), sympy.Symbol("pdg20"))
    assert result == expected


def test_convert_sympy_expr_to_pdg_symbols_logging(caplog):
    """Test logging trace output for convert_sympy_expr_to_pdg_symbols."""
    x = sympy.Symbol("x")
    with caplog.at_level(logging.INFO):
        convert_sympy_expr_to_pdg_symbols(x, {"x": "1"})

    assert any("[TRACE] start" in record.message for record in caplog.records)
    assert any("[TRACE] end" in record.message for record in caplog.records)


# ************************************************************************
# Tests for build_symbol_dimension_map
# ************************************************************************


def test_build_symbol_dimension_map_single_dimension():
    """Test building a dimension map for a symbol with a single dimension (length)."""
    symbols_in_expr = [make_symbol_dict("100", dimension_length=1)]

    result = build_symbol_dimension_map(symbols_in_expr)

    pdg_sym = sympy.Symbol("pdg100")
    assert pdg_sym in result
    assert result[pdg_sym] == length


def test_build_symbol_dimension_map_compound_dimensions():
    """Test building a dimension map for a symbol with compound dimensions (Force = mass * length / time^2)."""
    symbols_in_expr = [
        make_symbol_dict(
            "200", dimension_mass=1, dimension_length=1, dimension_time=-2
        )
    ]

    result = build_symbol_dimension_map(symbols_in_expr)

    pdg_sym = sympy.Symbol("pdg200")
    assert pdg_sym in result
    assert sympy.simplify(result[pdg_sym] - (mass * length * (time**-2))) == 0


def test_build_symbol_dimension_map_dimensionless():
    """Test building a dimension map for a dimensionless symbol (fallback to mass/mass)."""
    symbols_in_expr = [make_symbol_dict("300")]

    result = build_symbol_dimension_map(symbols_in_expr)

    pdg_sym = sympy.Symbol("pdg300")
    assert pdg_sym in result
    assert sympy.simplify(result[pdg_sym] - (mass / mass)) == 0


def test_build_symbol_dimension_map_all_base_dimensions():
    """Test building dimension map covering all seven base SI units."""
    symbols_in_expr = [
        make_symbol_dict(
            "400",
            dimension_time=1,
            dimension_electric_charge=1,
            dimension_luminous_intensity=1,
            dimension_length=1,
            dimension_amount_of_substance=1,
            dimension_mass=1,
            dimension_temperature=1,
        )
    ]

    result = build_symbol_dimension_map(symbols_in_expr)

    pdg_sym = sympy.Symbol("pdg400")
    expected_dim = (
        time
        * charge
        * luminous_intensity
        * length
        * amount_of_substance
        * mass
        * temperature
    )
    assert sympy.simplify(result[pdg_sym] - expected_dim) == 0


def test_build_symbol_dimension_map_empty_list():
    """Test building a dimension map with an empty symbol list."""
    result = build_symbol_dimension_map([])
    assert result == {}


# ************************************************************************
# Tests for dimensional_consistency
# ************************************************************************


def test_dimensional_consistency_missing_lhs():
    """Test dimensional_consistency returns error when sympy_lhs is missing."""
    expr_dict = {"id": "expr1", "sympy_rhs": "pdg1"}
    symbols = [make_symbol_dict("1", dimension_length=1)]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "sympy_lhs not provided for expression"


def test_dimensional_consistency_missing_rhs():
    """Test dimensional_consistency returns error when sympy_rhs is missing."""
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1"}
    symbols = [make_symbol_dict("1", dimension_length=1)]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "sympy_rhs not provided for expression"


@pytest.mark.parametrize(
    "invalid_lhs, expected_error_type",
    [
        ("pdg1 +", "SyntaxError"),
        ("pdg1 pdg2", "SyntaxError"),
        ("(((", "TokenError"),
    ],
)
def test_dimensional_consistency_invalid_lhs_syntax(invalid_lhs, expected_error_type):
    """Test dimensional_consistency with malformed syntax in sympy_lhs."""
    expr_dict = {"id": "expr1", "sympy_lhs": invalid_lhs, "sympy_rhs": "pdg1"}
    symbols = [make_symbol_dict("1", dimension_length=1)]

    result = dimensional_consistency(expr_dict, symbols)

    assert expected_error_type in result
    assert "unable to parse" in result


@pytest.mark.parametrize(
    "invalid_rhs, expected_error_type",
    [
        ("pdg1 +", "SyntaxError"),
        ("pdg1 pdg2", "SyntaxError"),
        ("(((", "TokenError"),
    ],
)
def test_dimensional_consistency_invalid_rhs_syntax(invalid_rhs, expected_error_type):
    """Test dimensional_consistency with malformed syntax in sympy_rhs."""
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1", "sympy_rhs": invalid_rhs}
    symbols = [make_symbol_dict("1", dimension_length=1)]

    result = dimensional_consistency(expr_dict, symbols)

    assert expected_error_type in result
    assert "unable to parse" in result


def test_dimensional_consistency_consistent_simple():
    """Test matching dimensions on LHS and RHS returns 'dimensions are consistent'."""
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1", "sympy_rhs": "pdg2"}
    symbols = [
        make_symbol_dict("1", dimension_length=1),
        make_symbol_dict("2", dimension_length=1),
    ]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "dimensions are consistent"


def test_dimensional_consistency_consistent_derived():
    """Test derived dimensions (Velocity = Distance / Time) return 'dimensions are consistent'."""
    # pdg1 = velocity (length / time)
    # pdg2 = distance (length)
    # pdg3 = time (time)
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1", "sympy_rhs": "pdg2 / pdg3"}
    symbols = [
        make_symbol_dict("1", dimension_length=1, dimension_time=-1),
        make_symbol_dict("2", dimension_length=1),
        make_symbol_dict("3", dimension_time=1),
    ]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "dimensions are consistent"


def test_dimensional_consistency_inconsistent():
    """Test mismatched dimensions (length vs mass) returns 'inconsistent dimensions'."""
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1", "sympy_rhs": "pdg2"}
    symbols = [
        make_symbol_dict("1", dimension_length=1),
        make_symbol_dict("2", dimension_mass=1),
    ]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "inconsistent dimensions"


def test_dimensional_consistency_undefined_symbol():
    """Test that a symbol present in the expression but missing from symbol_dimension_map triggers an error."""
    expr_dict = {"id": "expr_999", "sympy_lhs": "pdg1", "sympy_rhs": "pdg2"}
    # Only define pdg1, leave pdg2 undefined
    symbols = [make_symbol_dict("1", dimension_length=1)]

    result = dimensional_consistency(expr_dict, symbols)

    assert result == "ERROR for dim with expr_999"


def test_dimensional_consistency_logging(caplog):
    """Test logging trace output for dimensional_consistency."""
    expr_dict = {"id": "expr1", "sympy_lhs": "pdg1", "sympy_rhs": "pdg1"}
    symbols = [make_symbol_dict("1", dimension_length=1)]

    with caplog.at_level(logging.INFO):
        dimensional_consistency(expr_dict, symbols)

    assert any("[TRACE] start" in record.message for record in caplog.records)
