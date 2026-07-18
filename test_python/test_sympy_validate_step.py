#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import logging
import pytest
import sympy
from typing import List

from webserver_for_pdg.library.sympy_validate_step import *

logger = logging.getLogger(__name__)


# ************************************************************************


def test_combine_like_terms_valid():
    """
    Test that when input and output terms are mathematically equivalent,
    the function simplifies them successfully and returns 'valid'.
    """
    list_of_input_dicts = [{"sympy_lhs": "x + x + y", "sympy_rhs": "3 * a - a"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "2 * x + y", "sympy_rhs": "2 * a"}]

    result = combine_like_terms(
        list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )

    assert result == "valid"


def test_combine_like_terms_with_differences():
    """
    Test that when terms are not equivalent, the function returns the correct
    simplified differences for both LHS and RHS.
    """
    list_of_input_dicts = [{"sympy_lhs": "x + y", "sympy_rhs": "z"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x - y", "sympy_rhs": "z + 1"}]

    result = combine_like_terms(
        list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )

    # (x + y) - (x - y) = 2*y
    # z - (z + 1) = -1
    expected_result = "LHS diff is 2*y\nRHS diff is -1"
    assert result == expected_result


def test_combine_like_terms_missing_term_validation():
    """
    Test that empty strings in the input or output dictionaries are caught by
    the validation function and return the expected error message.
    """
    # Empty string in LHS of input dictionary
    list_of_input_dicts = [{"sympy_lhs": "", "sympy_rhs": "y"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    result = combine_like_terms(
        list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )

    assert result == "Not evaluated due to missing term in SymPy"


def test_combine_like_terms_assertion_error_on_length():
    """
    Test that passing dictionary lists with lengths that do not match the expected
    dimensions (1 input, 0 feed, 1 output) raises an AssertionError.
    """
    # Providing 2 input dicts instead of the expected 1
    list_of_input_dicts = [
        {"sympy_lhs": "x", "sympy_rhs": "y"},
        {"sympy_lhs": "a", "sympy_rhs": "b"},
    ]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    with pytest.raises(AssertionError):
        combine_like_terms(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )


def test_combine_like_terms_invalid_syntax():
    """
    Test that invalid mathematical expressions cause SymPy parsing
    exceptions to bubble up appropriately.
    """
    list_of_input_dicts = [{"sympy_lhs": "x + * y", "sympy_rhs": "z"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "z"}]

    with pytest.raises(Exception):
        combine_like_terms(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )


def test_combine_like_terms_logging_traces(caplog):
    """
    Test that the function records appropriate tracing logs (start/end)
    during execution using pytest's caplog fixture.
    """
    list_of_input_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    with caplog.at_level(logging.INFO):
        combine_like_terms(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    # Extract log messages
    messages = [record.message for record in caplog.records]

    # Check that both overall execution trace logs are captured
    assert any("[TRACE] start" in msg for msg in messages)
    assert any("[TRACE] end" in msg for msg in messages)


# ************************************************************************


def test_expand_rhs_valid():
    """
    Tests that expand_RHS returns 'valid' when the expressions
    algebraically simplify to match each other.
    """
    list_of_input_dicts = [{"sympy_lhs": "x + y", "sympy_rhs": "(a + b)**2"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "y + x", "sympy_rhs": "a**2 + 2*a*b + b**2"}]

    result = expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    assert result == "valid"


def test_expand_rhs_invalid_diff():
    """
    Tests that expand_RHS returns the calculated difference
    when the LHS or RHS expressions do not match.
    """
    list_of_input_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x + 2", "sympy_rhs": "y - 3"}]

    result = expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    assert "LHS diff is -2" in result
    assert "RHS diff is 3" in result


@pytest.mark.parametrize(
    "missing_key, dict_type",
    [
        ("sympy_lhs", "input"),
        ("sympy_rhs", "input"),
        ("sympy_lhs", "output"),
        ("sympy_rhs", "output"),
    ],
)
def test_expand_rhs_missing_terms(missing_key, dict_type):
    """
    Tests that expand_RHS returns a grace message if any of the required
    keys contain an empty string, preventing subsequent parsing exceptions.
    """
    input_dict = {"sympy_lhs": "x", "sympy_rhs": "y"}
    output_dict = {"sympy_lhs": "x", "sympy_rhs": "y"}

    if dict_type == "input":
        input_dict[missing_key] = ""
    else:
        output_dict[missing_key] = ""

    result = expand_RHS([input_dict], [], [output_dict])
    assert result == "Not evaluated due to missing term in SymPy"


def test_expand_rhs_assertion_error_inputs():
    """
    Tests that expand_RHS raises an AssertionError when the number of
    elements in list_of_input_dicts is not equal to 1.
    """
    list_of_input_dicts = []  # Expected 1, got 0
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    with pytest.raises(AssertionError):
        expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)


def test_expand_rhs_assertion_error_feeds():
    """
    Tests that expand_RHS raises an AssertionError when the number of
    elements in list_of_feed_dicts is not equal to 0.
    """
    list_of_input_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]
    list_of_feed_dicts = [{"sympy": "z"}]  # Expected 0, got 1
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    with pytest.raises(AssertionError):
        expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)


def test_expand_rhs_assertion_error_outputs():
    """
    Tests that expand_RHS raises an AssertionError when the number of
    elements in list_of_output_dicts is not equal to 1.
    """
    list_of_input_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]
    list_of_feed_dicts = []
    list_of_output_dicts = []  # Expected 1, got 0

    with pytest.raises(AssertionError):
        expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)


def test_expand_rhs_invalid_sympy_syntax():
    """
    Tests that parse_to_sympy errors are bubbled up if invalid syntax is passed.
    """
    list_of_input_dicts = [{"sympy_lhs": "x +// 2", "sympy_rhs": "y"}]
    list_of_feed_dicts = []
    list_of_output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    with pytest.raises((sympy.SympifyError, TypeError, SyntaxError)):
        expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)


# ************************************************************************


def test_validate_that_content_exists_with_feeds():
    """
    Directly tests validate_that_content_exists with feeds since expand_RHS
    hardcodes feed checking to 0.
    """
    input_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]
    feed_dicts = [{"sympy": ""}]  # Empty feed term
    output_dicts = [{"sympy_lhs": "x", "sympy_rhs": "y"}]

    res = validate_that_content_exists(1, 1, 1, input_dicts, feed_dicts, output_dicts)
    assert res == "Not evaluated due to missing term in SymPy"


# ************************************************************************


def test_parse_to_sympy_success():
    """
    Tests that parse_to_sympy correctly parses string expressions to SymPy objects.
    """
    expr_str = "x + 1"
    parsed = parse_to_sympy(expr_str)
    assert parsed == sympy.symbols("x") + 1


def test_parse_to_sympy_empty_string():
    """
    Tests that parse_to_sympy raises an Exception when an empty string is passed.
    """
    with pytest.raises(Exception) as exc_info:
        parse_to_sympy("")
    assert str(exc_info.value) == "Empty string instead of SymPy"


# ************************************************************************


# EOF
