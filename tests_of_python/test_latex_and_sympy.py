import logging
import pytest
import sympy
from sympy import *
from webserver_for_pdg.library.latex_and_sympy import *


logger = logging.getLogger(__name__)

#************************************************************************

# Test standard/expected input
def test_sympy_to_latex_str_expected():
    """Tests the conversion of a valid SymPy equation string to LaTeX."""
    input_str = "Eq(Symbol('pdg1881666'),Symbol('pdg3882725'))"
    expected_output = "pdg_{1881666} = pdg_{3882725}"

    assert sympy_to_latex_str(input_str) == expected_output


# Test empty string behavior
def test_sympy_to_latex_str_empty():
    """Tests that an empty string returns the designated fallback message."""
    assert sympy_to_latex_str("") == "empty str sent to sympy_to_latex_str"


# Test "hello" behavior (SymPy's auto-symbol conversion)
def test_sympy_to_latex_str_single_word():
    """
    Note: A plain string like 'hello' is actually parsed as a valid SymPy Symbol
    by default due to SymPy's 'auto_symbol' transformation.
    """
    assert sympy_to_latex_str("hello") == "hello"


# Test truly malformed string inputs
@pytest.mark.parametrize(
    "invalid_expr",
    [
        "hello hello",  # SyntaxError (consecutive identifiers without operators)
        "1 +",  # SyntaxError (incomplete expression)
        "Eq(x,",  # SyntaxError (unmatched parentheses)
    ],
)
def test_sympy_to_latex_str_malformed_syntax(invalid_expr):
    """Tests that invalid mathematical syntax raises a parsing exception."""
    with pytest.raises(Exception):
        sympy_to_latex_str(invalid_expr)


# Test malformed types (e.g., passing an integer instead of a string)
@pytest.mark.parametrize("invalid_type_input", [123, True, ["x", "+", "y"]])
def test_sympy_to_latex_str_invalid_types(invalid_type_input):
    """Tests that passing non-string types raises an expected error."""
    with pytest.raises((TypeError, AttributeError)):
        # parse_expr expects a string and calls string operations on it
        sympy_to_latex_str(invalid_type_input)


# Optional: Test that the logs are being outputted correctly
def test_sympy_to_latex_str_logging(caplog):
    """Verifies that start/end trace IDs and expected logs are recorded."""
    with caplog.at_level(logging.INFO):
        sympy_to_latex_str("x + y")

    assert any("[TRACE] start" in record.message for record in caplog.records)
    assert any("[TRACE] end" in record.message for record in caplog.records)



#************************************************************************


def test_cleaned_latex_str_to_sympy_expression_simple_equation():
    """test of Valid Latex"""
    result = cleaned_latex_str_to_sympy_expression("a = b")
    a, b = symbols("a b")
    assert result == Eq(a, b)

def test_cleaned_latex_str_to_sympy_expression_returns_a_sympy_object():
    """test of Valid Latex"""
    result = cleaned_latex_str_to_sympy_expression("a = b")
    assert isinstance(result, sympy.Basic)

def test_cleaned_latex_str_to_sympy_expression_polynomial_expression():
    """test of Valid Latex"""
    result = cleaned_latex_str_to_sympy_expression("x^2 + 1")
    x = symbols("x")
    assert result == x**2 + 1

def test_cleaned_latex_str_to_sympy_expression_fraction_expression():
    """test of Valid Latex"""
    result = cleaned_latex_str_to_sympy_expression(r"\frac{1}{2}")
    assert result == Rational(1, 2)

def test_cleaned_latex_str_to_sympy_expression_equation_with_expression_on_both_sides():
    """test of Valid Latex"""
    result = cleaned_latex_str_to_sympy_expression("x + 1 = 2 y")
    x, y = symbols("x y")
    assert result == Eq(x + 1, 2 * y)


def test_cleaned_latex_str_to_sympy_expression_integer_input_raises():
    """non-string input should not silently succeed with a bogus result -- it should raise."""
    with pytest.raises(Exception):
        cleaned_latex_str_to_sympy_expression(12345)

def test_cleaned_latex_str_to_sympy_expression_float_input_raises():
    """non-string input should not silently succeed with a bogus result -- it should raise."""
    with pytest.raises(Exception):
        cleaned_latex_str_to_sympy_expression(3.14)

def test_cleaned_latex_str_to_sympy_expression_none_input_raises():
    """non-string input should not silently succeed with a bogus result -- it should raise."""
    with pytest.raises(Exception):
        cleaned_latex_str_to_sympy_expression(None)

def test_cleaned_latex_str_to_sympy_expression_list_input_raises():
    """non-string input should not silently succeed with a bogus result -- it should raise."""
    with pytest.raises(Exception):
        cleaned_latex_str_to_sympy_expression(["a", "=", "b"])


def test_cleaned_latex_str_to_sympy_expression_unbalanced_braces_raises_custom_exception():
    """Malformed Latex should be caught by the except clauses and re-raised as a plain Exception with a 'Sympy unable to parse latex' message."""
    with pytest.raises(Exception) as exc_info:
        cleaned_latex_str_to_sympy_expression(r"\frac{1}{")
    assert "Sympy unable to parse latex" in str(exc_info.value)

# https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/140
# def test_cleaned_latex_str_to_sympy_expression_unknown_command_raises_custom_exception():
#     """Malformed Latex should be caught by the except clauses and re-raised as a plain Exception with a 'Sympy unable to parse latex' message."""
#     with pytest.raises(Exception) as exc_info:
#         cleaned_latex_str_to_sympy_expression(r"\notarealcommand{x}")
#     assert "Sympy unable to parse latex" in str(exc_info.value)

def test_cleaned_latex_str_to_sympy_expression_random_gibberish_raises_custom_exception():
    """Malformed Latex should be caught by the except clauses and re-raised as a plain Exception with a 'Sympy unable to parse latex' message."""
    with pytest.raises(Exception) as exc_info:
        cleaned_latex_str_to_sympy_expression("@#$%^&*(")
    assert "Sympy unable to parse latex" in str(exc_info.value)

def test_cleaned_latex_str_to_sympy_expression_empty_string_raises():
    """Malformed Latex should be caught by the except clauses and re-raised as a plain Exception with a 'Sympy unable to parse latex' message."""
    with pytest.raises(Exception):
        cleaned_latex_str_to_sympy_expression("")

def test_cleaned_latex_str_to_sympy_expression_exception_message_contains_original_input():
    bad_input = r"\frac{1}{"
    with pytest.raises(Exception) as exc_info:
        cleaned_latex_str_to_sympy_expression(bad_input)
    assert bad_input in str(exc_info.value)


def test_cleaned_latex_str_to_sympy_expression_logs_start_and_end_trace_markers(caplog):
    """test logging"""
    with caplog.at_level("INFO"):
        cleaned_latex_str_to_sympy_expression("a = b")
    start_logs = [r.message for r in caplog.records if "[TRACE] start" in r.message]
    end_logs = [r.message for r in caplog.records if "[TRACE] end" in r.message]
    assert len(start_logs) == 1
    assert len(end_logs) == 1

def test_cleaned_latex_str_to_sympy_expression_logs_error_on_malformed_input(caplog):
    """test logging"""
    with caplog.at_level("ERROR"):
        with pytest.raises(Exception):
            cleaned_latex_str_to_sympy_expression(r"\frac{1}{")
    assert any(r.levelname == "ERROR" for r in caplog.records)

    

#************************************************************************



def test_list_of_sympy_symbols_in_sympy_expression_single_symbol():
    x = Symbol("x")
    result = list_of_sympy_symbols_in_sympy_expression(x)
    assert result == [x]

def test_list_of_sympy_symbols_in_sympy_expression_multiple_symbols():
    x, y, z = symbols("x y z")
    expr = x + y * z
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert set(result) == {x, y, z}
    assert len(result) == 3

def test_list_of_sympy_symbols_in_sympy_expression_repeated_symbol_returns_unique():
    x = Symbol("x")
    expr = x * x + x + 3
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert result == [x]

def test_list_of_sympy_symbols_in_sympy_expression_no_symbols_numeric_expression():
    expr = sympy.Integer(5) + sympy.Integer(3)
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert result == []

def test_list_of_sympy_symbols_in_sympy_expression_expression_with_constants_and_functions_no_free_symbols():
    expr = sin(pi) + cos(0)
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert result == []

def test_list_of_sympy_symbols_in_sympy_expression_expression_with_functions_and_symbols():
    x, y = symbols("x y")
    expr = sin(x) + cos(y) + 3
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert set(result) == {x, y}

def test_list_of_sympy_symbols_in_sympy_expression_non_sympy_input_returns_empty_list():
    result = list_of_sympy_symbols_in_sympy_expression("not a sympy expr")
    assert result == []

def test_list_of_sympy_symbols_in_sympy_expression_none_input_returns_empty_list():
    result = list_of_sympy_symbols_in_sympy_expression(None)
    assert result == []

def test_list_of_sympy_symbols_in_sympy_expression_integer_input_returns_empty_list():
    # plain python int has no .atoms method -> AttributeError -> []
    result = list_of_sympy_symbols_in_sympy_expression(5)
    assert result == []

def test_list_of_sympy_symbols_in_sympy_expression_result_is_list_type():
    x = Symbol("x")
    result = list_of_sympy_symbols_in_sympy_expression(x)
    assert isinstance(result, list)

def test_list_of_sympy_symbols_in_sympy_expression_attribute_error_is_logged(caplog):
    with caplog.at_level(logging.ERROR):
        result = list_of_sympy_symbols_in_sympy_expression(42)
    assert result == []
    assert any("has no attribute" in record.message or "atoms" in record.message
                for record in caplog.records)

def test_list_of_sympy_symbols_in_sympy_expression_trace_logs_present(caplog):
    x = Symbol("x")
    with caplog.at_level(logging.INFO):
        list_of_sympy_symbols_in_sympy_expression(x)
    trace_messages = [r.message for r in caplog.records if "[TRACE]" in r.message]
    assert any("start" in m for m in trace_messages)
    assert any("end" in m for m in trace_messages)

def test_list_of_sympy_symbols_in_sympy_expression_expression_with_negative_and_fractional_symbols():
    x, y = symbols("x y")
    expr = -x / 2 + y ** 2
    result = list_of_sympy_symbols_in_sympy_expression(expr)
    assert set(result) == {x, y}


#************************************************************************


#************************************************************************


#EOF