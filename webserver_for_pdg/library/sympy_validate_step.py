#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2025
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
For a given derivation step, use SymPy to validate the consistency of the input and output expressions with the feeds and inference rule.

Historically, the validation functions are from
https://github.com/allofphysicsgraph/proofofconcept/blob/gh-pages/v2_XML/databases/inference_rules_database.xml

Convention: every inference rule validation function has the same arguments

TODO: although some functions have doctests, these doctests rely on the previous argument structures
rather than the current "list of dicts"x3.
        # Implementation expects:
        input_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])

        # Doctest provides:
        input_expr = parse_latex("a = b") # Returns an Equality object


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

import random
import time

import sympy  # type: ignore

# rather than use "sympy.Symbol" and "sympy.Mul" I just import everything:
from sympy import *

# the following is only relevant for doctests
from sympy.parsing.latex import parse_latex  # type: ignore

# https://docs.python.org/3/library/typing.html
from typing import NewType, Dict, List, Tuple

import logging

logger = logging.getLogger(__name__)


import compute
from compute import query_timing_result_type

import time


def validate_step(
    inference_rule_dict: dict,
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    The possible return strings from this function include:
    * "no validation is available..." (e.g., for declarations)
    * "no check performed" (the check is not implemented yet)
    * "valid"
    * "diff is ..."

    >>> validate_step('4924823', '2500423', 'data.json')
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] validate_step start " + trace_id + " " + str(time.time()))

    # logger.debug(str(inference_rule_dict))
    # logger.debug(str(list_of_input_dicts))
    # logger.debug(str(list_of_feed_dicts))
    # logger.debug(str(list_of_output_dicts))

    name_latex = inference_rule_dict["name_latex"]

    if name_latex in [
        "declare initial expression",
        "declare final expression",
        "declare identity",
        "declare guess solution",
        "declare assumption",
    ]:
        # logger.info("[trace end " + trace_id + "]")
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "no validation is available for declarations"

    elif name_latex in [
        "assume N dimensions",
        "normalization condition",
        "boundary condition",
        "boundary condition for expression",
    ]:
        # logger.info("[trace end " + trace_id + "]")
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "no validation is available for assumptions"

    elif name_latex == "add X to both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return add_X_to_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "divide both sides by":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return divide_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "multiply both sides by":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return multiply_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "subtract X from both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return subtract_X_from_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "LHS of expr 1 equals LHS of expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return LHS_of_expr_1_eq_LHS_of_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "RHS of expr 1 equals RHS of expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return RHS_of_expr_1_eq_RHS_of_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "X cross both sides by":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return X_cross_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "X dot both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return X_dot_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add expr 1 to expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return add_expr_1_to_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add zero to LHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return add_zero_to_LHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add zero to RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return add_zero_to_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply divergence":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return apply_divergence(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply function to both sides of expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "apply gradient to scalar function":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return apply_gradient_to_scalar_function(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply operator to bra":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return apply_operator_to_bra(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply operator to ket":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return apply_operator_to_ket(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "both sides cross X":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return both_sides_cross_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "both sides dot X":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return both_sides_dot_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change variable X to Y":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_variable_X_to_Y(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change two variables in expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_two_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change three variables in expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_three_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change four variables in expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_four_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change five variables in expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_five_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change six variables in expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return change_six_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "claim LHS equals RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return claim_LHS_equals_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "claim expr 1 equals expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return claim_expr_1_equals_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "combine like terms":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "conjugate both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return conjugate_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "conjugate function X":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return conjugate_function_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "conjugate transpose both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return conjugate_transpose_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "differentiate with respect to":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return differentiate_with_respect_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "distribute conjugate to factors":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return distribute_conjugate_to_factors(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "distribute conjugate transpose to factors":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return distribute_conjugate_transpose_to_factors(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "divide expr 1 by expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return divide_expr_by_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "drop non-dominant term":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return drop_nondominant_term(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "evaluate definite integral":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return evaluate_definite_integral(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "expand LHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return expand_LHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "expand RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "expand integrand":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "expand magnitude to conjugate":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return expand_magnitude_to_conjugate(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "expr 1 is equivalent to expr 2 under the condition":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "expr 1 is true under condition expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "factor out X":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return factor_out_x(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "factor out X from LHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return factor_out_x_from_lhs(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "factor out X from RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return factor_out_x_from_rhs(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "function is even":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return function_is_even(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "function is odd":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return function_is_odd(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integral over":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return indefinite_integral_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integrate LHS over":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return indefinite_integrate_LHS_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integrate RHS over":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return indefinite_integrate_RHS_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integration":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return indefinite_integration(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    # "integrate" might be DEPRECATED in favor of other integration infrules
    # TODO: investigate whether any steps reference this infrule. If not, delete
    elif name_latex == "integrate":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "integrate over from to":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return integrate_over_from_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "make expr power":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return make_expr_power(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "maximum of expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "multiply LHS by unity":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return multiply_LHS_by_unity(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "multiply RHS by unity":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return multiply_RHS_by_unity(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "multiply expr 1 by expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return mult_expr_1_by_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "partially differentiate with respect to":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return partially_differentiate_with_respect_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "raise both sides to power":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return raise_both_sides_to_power(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "replace constant with value":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "replace curl with LeviCevita summation contravariant":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "replace scalar with vector":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return replace_scalar_with_vector(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "replace summation notation with vector notation":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "select imaginary parts":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return select_imag_parts(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "select real parts":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return select_real_parts(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate three vector components":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return separate_three_vector_components(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate two vector components":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return separate_two_vector_components(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate vector into two trigonometric ratios":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "simplify":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return simplify(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "solve for X":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "square root both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return square_root_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute LHS of five expressions into expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of four expressions into expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of six expressions into expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of three expressions into expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of two expressions into expression":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return substitute_LHS_of_two_expressions_into_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute LHS of expr 1 into expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return substitute_LHS_of_expr_1_into_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute RHS of expr 1 into expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return substitute_RHS_of_expr_1_into_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "subtract expr 1 from expr 2":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return subtract_expr_1_from_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "sum exponents":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "sum exponents LHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return sum_exponents_LHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "sum exponents RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return sum_exponents_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "swap LHS with RHS":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return swap_LHS_with_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "take curl of both sides":
        logger.info("[TRACE] validate_step end " + trace_id + " " + str(time.time()))
        return take_curl_of_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    else:
        # logger.error("unexpected inf rule:" + step_dict["inf rule"])
        logger.warning(
            "sympy_validate_step/validate_step unexpected inf rule:" + name_latex
        )
        # raise Exception(
        #     "sympy_validate_step/validate_step Unexpected inf rule: "
        #     + name_latex
        # )
        return "unrecognized inference rule"

    logger.info("[TRACE] validate_step end " + trace_id)
    return "This message should not be seen"


def add_X_to_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
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
    logger.info(
        "[TRACE] add_X_to_both_sides start " + trace_id + " " + str(time.time())
    )

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    # since this inference rule is valid for equality and inequality, no need to check the relation

    input_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed = eval(list_of_feed_dicts[0]["sympy"])
    output_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    delta_lhs = sympy.simplify(sympy.Add(input_lhs, feed) - output_lhs)

    difference_str = ""
    if delta_lhs != 0:
        difference_str += "LHS diff is " + str(delta_lhs)
    delta_rhs = sympy.simplify(sympy.Add(input_rhs, feed) - output_rhs)
    if delta_rhs != 0:
        if len(difference_str) > 0:
            difference_str += "\n"
        difference_str += "RHS diff is " + str(delta_rhs)
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info(
            "[TRACE] add_X_to_both_sides end " + trace_id + " " + str(time.time())
        )
        return "valid"
    else:
        logger.info(
            "[TRACE] add_X_to_both_sides end " + trace_id + " " + str(time.time())
        )
        return difference_str
    return "ERROR: sympy_validate_step/add_X_to_both_sides should not reach here"


def subtract_X_from_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    https://docs.sympy.org/latest/tutorial/manipulation.html

    Rather than have "add X to both sides" and "subtract X from both sides"
    as separate inference rules, we could write "subtract X from both sides"
    to use "add X to both sides"

    Given a = b
    subtract c
    get a - c = b - c

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    Issue: The logic assumes a specific ordering of inputs and
           outputs that maps strictly to "If A=B and A=D then B=D".
    Inconsistency: If the user provides the inputs in the reverse order
                   (Input 0: A=D, Input 1: A=B), the validation logic
                   rhs0 - out_lhs (D - B) might fail if the output is B=D (B-D != 0),
                   even though the derivation is logically valid.
                   The validation is brittle regarding the order of the input list.

    >>> input_expr = parse_latex("a = b")
    >>> feed = parse_latex("c")
    >>> output_expr = parse_latex("a - c = b - c")
    >>> subtract_X_from_both_sides(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info(
        "[TRACE] subtract_X_from_both_sides start " + trace_id + " " + str(time.time())
    )

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    # since this inference rule is valid for equality and inequality, no need to check the relation

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    delta_lhs = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs, sympy.Mul(-1, feed_sympy))
        - output_expr_sympy_lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs, sympy.Mul(-1, feed_sympy))
        - output_expr_sympy_rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info("[TRACE] subtract_X_from_both_sides end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] subtract_X_from_both_sides end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def multiply_both_sides_by(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """

    inference_rule_dict
    {'name_latex': 'multiply both sides by',
    'assumptions_latex': '',
    'number_of_outputs': 1, 'number_of_inputs': 1, 'number_of_feeds': 1,
    'author_name_latex': 'ben.is.located@gmail.com',
    'notes_latex': '',
    'id': '111182',
    'latex': 'Multiply both sides of Eq.~\ref{eq:#2} by $#1$; yields Eq.~\ref{eq:#3}.'}

    list_of_input_dicts[ {'sympy_lhs': "Symbol('pdg0009491')",
                          'sympy_rhs': "Pow(Symbol('pdg0004201'), Integer(-1))",
                          'name_latex': '', 'reference_latex': '', 'latex_condition': '', 'lean': '',
                          'latex_lhs': 'T', 'latex_relation': '=', 'latex_rhs': '1 / f',
                          'author_name_latex': 'ben.is.located@gmail.com',
                          'description_latex': '', 'id': '3131111133'}]

    list_of_feed_dicts[  {'lean': '',
                          'author_name_latex': 'ben.is.located@gmail.com', 'id': '9040079362', 'sympy': "Symbol('pdg0004201')", 'latex': 'f'}]

    list_of_output_dicts[{'name_latex': '',
                          'sympy_lhs': "Mul(Symbol('pdg0004201'), Symbol('pdg0009491'))",
                          'sympy_rhs': 'Integer(1)',
                          'latex_lhs': 'T f', 'latex_relation': '=', 'latex_rhs': '1',
                          'reference_latex': '', 'latex_condition': '', 'lean': '',
                          'author_name_latex': 'ben.is.located@gmail.com', 'description_latex': '', 'id': '2131616531'}]

    Gemini 3 Pro on 2026-02-02 complains that
    The validation logic assumes that applying an operation to both sides preserves the relation operator (e.g., =). This is mathematically false for inequalities involving multiplication or division by negative numbers.
    Inconsistency: If the input is x < y and the feed is -1, the correct output is -x > -y.
        If the user provides the correct math (-x > -y), the assert fails (relations > and < differ), marking a valid derivation as an error.
        If the user provides incorrect math (-x < -y), the assert passes, and the algebraic check ((-x) - (-x) == 0) passes, marking an invalid derivation as "valid".

    Gemini 3 Pro on 2026-02-02 complains that
    Rules that introduce division do not check if the divisor is zero, which would make the derivation  invalid.
    Checks feed - 1 == 0. If feed is 0/0, SymPy yields nan. Validating strictly feed - 1 == 0 might catch this, but explicit handling is safer.

    see also dividebothsidesby
    x*y = Mul(x,y)

    given 'a + b = c'
    multiply both sides by d
    to get '(a + b)*d = c*d'

    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)*d = c*d")
    >>> multiply_both_sides_by([input_expr], [feed], [output_expr])
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] multiply_both_sides_by start " + trace_id)

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    # TODO: address non-equality relations, e.g., >, >=, <, <=, >>, <<, \lt, \leq, \gt, \geq
    assert list_of_input_dicts[0]["latex_relation"] == "="
    assert list_of_output_dicts[0]["latex_relation"] == "="

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info("[TRACE] multiply_both_sides_by end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] multiply_both_sides_by end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def divide_both_sides_by(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also multiply_both_sides_by
    https://docs.sympy.org/latest/tutorial/manipulation.html

    x/y = Mul(x, Pow(y, -1))

    Gemini 3 Pro on 2026-02-02 complains that
    The validation logic assumes that applying an operation to both sides preserves the relation operator (e.g., =). This is mathematically false for inequalities involving multiplication or division by negative numbers.
    Inconsistency: If the input is x < y and the feed is -1, the correct output is -x > -y.
        If the user provides the correct math (-x > -y), the assert fails (relations > and < differ), marking a valid derivation as an error.
        If the user provides incorrect math (-x < -y), the assert passes, and the algebraic check ((-x) - (-x) == 0) passes, marking an invalid derivation as "valid".

    Gemini 3 Pro on 2026-02-02 complains that
    Rules that introduce division do not check if the divisor is zero, which would make the derivation  invalid.
    Checks LHS * (1/feed) - Output == 0. If feed is 0, SymPy represents this as zoo (complex infinity) or raises an error depending on context. The validation should explicitly check feed != 0.


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
    logger.info("[TRACE] divide_both_sides_by start " + trace_id)

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    # TODO: address non-equality relations, e.g., >, >=, <, <=
    assert list_of_input_dicts[0]["latex_relation"] == "="
    assert list_of_output_dicts[0]["latex_relation"] == "="

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy_lhs, sympy.Pow(feed_sympy, -1))
        - output_expr_sympy_lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy_rhs, sympy.Pow(feed_sympy, -1))
        - output_expr_sympy_rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info("[TRACE] divide_both_sides_by end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] divide_both_sides_by end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def change_variable_X_to_Y(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given 'a + b = c',
    substitute b --> d
    to get 'a + d = c'

    # to run the doctest below, use
    import doctest
    from validate_steps_sympy import *
    doctest.run_docstring_examples(change_variable_X_to_Y, globals(), verbose=True)

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a + b'), 'RHS': parse_latex('c')}]
    >>> latex_dict['feed'] = [parse_latex('b'), parse_latex('d')]
    >>> latex_dict['output'] = [{'LHS': parse_latex('a + d'), 'RHS': parse_latex('c')}]
    >>> change_variable_X_to_Y(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace change_variable_X_to_Y start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1) - output_expr_sympy_lhs
    )  # subs(old, new)
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1) - output_expr_sympy_rhs
    )  # subs(old, new)
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_variable_X_to_Y end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_variable_X_to_Y end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def multiply_LHS_by_unity(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also multRHSbyUnity

    Given a = b
    mult LHS by (c/c)
    get (a*c)/c = b

    # to run the doctest below, use
    import doctest
    from validate_steps_sympy import *
    doctest.run_docstring_examples(multiply_LHS_by_unity, globals(), verbose=True)


    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')}]
    >>> latex_dict['feed'] = [parse_latex('c/c')]
    >>> latex_dict['output'] = [{'LHS': parse_latex('(a c)/c'), 'RHS': parse_latex('b')}]
    >>> multiply_LHS_by_unity(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace multiply_LHS_by_unity start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy - 1)
    d2 = sympy.simplify(
        sympy.Mul(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    )
    d3 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace multiply_LHS_by_unity end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace multiply_LHS_by_unity end " + trace_id + "]")
        return (
            "feed diff is "
            + str(d1)
            + "\n"
            + "LHS diff is "
            + str(d2)
            + "\n"
            + "RHS diff is "
            + str(d3)
        )


def multiply_RHS_by_unity(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also multLHSbyUnity

    Given a = b
    mult by (c/c)
    get a = (b*c)/c

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')}]
    >>> latex_dict['feed'] = [parse_latex('c/c')]
    >>> latex_dict['output'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('(b c)/c')}]
    >>> multiply_RHS_by_unity(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace multiply_RHS_by_unity start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy - 1)
    d2 = sympy.simplify(
        sympy.Mul(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    )
    d3 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace multiply_RHS_by_unity end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace multiply_RHS_by_unity end " + trace_id + "]")
        return (
            "feed diff is "
            + str(d1)
            + "\n"
            + "LHS diff is "
            + str(d3)
            + "\n"
            + "RHS diff is "
            + str(d2)
        )


def add_zero_to_LHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also add_zero_to_RHS
    ((feed==0) and (out_lhs0 == (in_lhs0+zero)) and (out_rhs0 == in_rhs0))

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> latex_dict['feed'] = [parse_latex('')]
    >>> latex_dict['output'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> add_zero_to_LHS(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace add_zero_to_LHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy)
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    )
    d3 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace add_zero_to_LHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace add_zero_to_LHS end " + trace_id + "]")
        return (
            "feed diff is "
            + str(d1)
            + "\n"
            + "LHS diff is "
            + str(d2)
            + "\n"
            + "RHS diff is "
            + str(d3)
        )


def add_zero_to_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((feed==0) and (out_rhs0 == (in_rhs0+zero)) and (out_lhs0 == in_lhs0))


    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> latex_dict['feed'] = [parse_latex('')]
    >>> latex_dict['output'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> add_zero_to_RHS(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace add_zero_to_RHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy)
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    )
    d3 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace add_zero_to_RHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace add_zero_to_RHS end " + trace_id + "]")
        return (
            "feed diff is "
            + str(d1)
            + "\n"
            + "LHS diff is "
            + str(d3)
            + "\n"
            + "RHS diff is "
            + str(d2)
        )


def take_curl_of_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (\nabla \times in_lhs0)) and (out_rhs0 == \nabla \times in_rhs0))
    """
    return "recognized infrule but not yet supported"


def apply_divergence(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Curl: $\vec{\nabla} \cdot$
    """
    return "recognized infrule but not yet supported"


def indefinite_integral_over(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (\int in_lhs0 feed0)) and (out_rhs0 == \int in_rhs0 feed0))

    Given a = b
    over dt
    get \inf a dt = \inf b dt
    """
    return "recognized infrule but not yet supported"


def indefinite_integration(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (\int in_lhs0 )) and (out_rhs0 == \int in_rhs0 ))
    """
    return "recognized infrule but not yet supported"


def indefinite_integrate_LHS_over(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (\int in_lhs0 feed0)) and (out_rhs0 == in_rhs0))
    """
    return "recognized infrule but not yet supported"


def indefinite_integrate_RHS_over(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == in_lhs0) and (out_rhs0 == \int in_rhs0 feed0))
    """
    return "recognized infrule but not yet supported"


def integrate_over_from_to(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (\int_{feed1}^{feed2} in_lhs0 feed0)) and (out_rhs0 == \int_{feed1}^{feed2} in_rhs0 feed0))
    """
    return "recognized infrule but not yet supported"


def partially_differentiate_with_respect_to(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    \frac{\partial}{\partial #1}
    """
    return "recognized infrule but not yet supported"


def X_cross_both_sides_by(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    arg x LHS = arg x RHS
    """
    return "recognized infrule but not yet supported"


def both_sides_cross_X(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    LHS x arg = RHS x arg
    """
    return "recognized infrule but not yet supported"


def X_dot_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    arg \cdot LHS = arg \cdot RHS
    """
    return "recognized infrule but not yet supported"


def both_sides_dot_X(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    LHS \cdot arg = RHS \cdot arg
    """
    return "recognized infrule but not yet supported"


def make_expr_power(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (feed0)**(in_lhs0)) and (out_rhs0 == (feed0)**(in_rhs0)))
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace make_expr_power start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        output_expr_sympy_lhs - sympy.Pow(feed_sympy, input_expr_sympy_lhs)
    )
    d2 = sympy.simplify(
        output_expr_sympy_rhs - sympy.Pow(feed_sympy, input_expr_sympy_rhs)
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace make_expr_power end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace make_expr_power end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def select_real_parts(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    sympy.re(2+3*sympy.I)==2

    Given a+i*b = c+i*d
    get a = c
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace select_real_parts start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(sympy.re(input_expr_sympy_lhs) - output_expr_sympy_lhs)
    d2 = sympy.simplify(sympy.re(input_expr_sympy_rhs) - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace select_real_parts end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace select_real_parts end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def select_imag_parts(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    sympy.im(2+3*sympy.I)==3

    Given a+i*b = c+i*d
    get b = d
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace select_imag_parts start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(sympy.im(input_expr_sympy_lhs) - output_expr_sympy_lhs)
    d2 = sympy.simplify(sympy.im(input_expr_sympy_rhs) - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace select_imag_parts end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace select_imag_parts end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def swap_LHS_with_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((in_lhs0 == out_rhs0) and (in_rhs0 == out_lhs0))

    given 'a + b = c'
    get   'c = a + b'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace swap_LHS_with_RHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_rhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace swap_LHS_with_RHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace swap_LHS_with_RHS end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def sum_exponents_LHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also sum_exponents_RHS
    (in_rhs0 == out_rhs0)
    """
    return "recognized infrule but not yet supported"


def sum_exponents_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also sum_exponents_LHS
    (in_lhs0 == out_lhs0)
    """
    return "recognized infrule but not yet supported"


def add_expr_1_to_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    assumes result form LHS(X)+LHS(Y)=RHS(X)+RHS(Y)

    (((in_lhs0+in_lhs1)==out_lhs0) and ((in_rhs0+in_rhs1)==out_rhs0))
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace add_expr_1_to_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs_0, input_expr_sympy_lhs_1)
        - output_expr_sympy_lhs_0
    )
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs_0, input_expr_sympy_rhs_1)
        - output_expr_sympy_rhs_0
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace add_expr_1_to_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace add_expr_1_to_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def substitute_RHS_of_expr_1_into_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and c = b*d
    get c = a*d
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace substitute_RHS_of_expr_1_into_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs_1.subs(input_expr_sympy_rhs_0, input_expr_sympy_lhs_0)
        - output_expr_sympy_lhs_0
    )  # subs(old,new)
    d2 = sympy.simplify(
        input_expr_sympy_rhs_1.subs(input_expr_sympy_rhs_0, input_expr_sympy_lhs_0)
        - output_expr_sympy_rhs_0
    )  # subs(old,new)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace substitute_RHS_of_expr_1_into_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace substitute_RHS_of_expr_1_into_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def substitute_LHS_of_expr_1_into_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and   c = a*d
    get   c = b*d
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace substitute_LHS_of_expr_1_into_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs_1.subs(input_expr_sympy_lhs_0, input_expr_sympy_rhs_0)
        - output_expr_sympy_lhs_0
    )  # subs(old,new)
    d2 = sympy.simplify(
        input_expr_sympy_rhs_1.subs(input_expr_sympy_lhs_0, input_expr_sympy_rhs_0)
        - output_expr_sympy_rhs_0
    )  # subs(old,new)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace substitute_LHS_of_expr_1_into_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace substitute_LHS_of_expr_1_into_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def mult_expr_1_by_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and   c = d
    get a*c = b*d

    ((in_lhs0*in_lhs1 == out_lhs0) and (in_rhs0*in_rhs1 == out_rhs0))
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace mult_expr_1_by_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        sympy.Mul(input_expr_sympy_lhs_0, input_expr_sympy_lhs_1)
        - output_expr_sympy_lhs_0
    )
    d2 = sympy.simplify(
        sympy.Mul(input_expr_sympy_rhs_0, input_expr_sympy_rhs_1)
        - output_expr_sympy_rhs_0
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace mult_expr_1_by_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace mult_expr_1_by_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def LHS_of_expr_1_eq_LHS_of_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and   a = d
    get   b = d

    ((in_lhs0 == in_lhs1) and (out_lhs0 == in_rhs0) and (out_rhs0 == in_rhs1))

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')},
                               {'LHS': parse_latex('a'), 'RHS': parse_latex('d')}]
    >>> latex_dict['output'] = [{'LHS': parse_latex('b'), 'RHS': parse_latex('d')}]
    >>> LHS_of_expr_1_eq_LHS_of_expr_2(latex_dict)
    'valid'

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace LHS_of_expr_1_eq_LHS_of_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs_0 - input_expr_sympy_lhs_1)  #  0 = a - a
    d2 = sympy.simplify(input_expr_sympy_rhs_0 - output_expr_sympy_lhs_0)  #  0 = b - b
    d3 = sympy.simplify(input_expr_sympy_rhs_1 - output_expr_sympy_rhs_0)  #  0 = d - d

    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace LHS_of_expr_1_eq_LHS_of_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace LHS_of_expr_1_eq_LHS_of_expr_2 end " + trace_id + "]")
        return (
            "input diff is "
            + str(d1)
            + "\n"
            + " diff is "
            + str(d2)
            + "\n"
            + " diff is "
            + str(d3)
        )


def RHS_of_expr_1_eq_RHS_of_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((in_rhs0 == in_rhs1) and (out_lhs0 == in_lhs0) and (out_rhs0 == in_lhs1))
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace RHS_of_expr_1_eq_RHS_of_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_rhs_0 - input_expr_sympy_rhs_1)
    d2 = sympy.simplify(output_expr_sympy_lhs_0 - input_expr_sympy_lhs_0)
    d3 = sympy.simplify(output_expr_sympy_rhs_0 - input_expr_sympy_lhs_1)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[trace RHS_of_expr_1_eq_RHS_of_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace RHS_of_expr_1_eq_RHS_of_expr_2 end " + trace_id + "]")
        return (
            "input diff is "
            + str(d1)
            + "\n"
            + " diff is "
            + str(d2)
            + "\n"
            + " diff is "
            + str(d3)
        )


def raise_both_sides_to_power(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((out_lhs0 == (in_lhs0)**(feed0)) and (out_rhs0 == (in_rhs0)**(feed0)))
    """
    return "recognized infrule but not yet supported"


def claim_expr_1_equals_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    ((in_lhs0 == in_lhs1) and (in_rhs0 == in_rhs1))

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    The function name suggests comparing two inputs, but the code ignores the second input entirely.

        The inference rule name implies comparing two distinct input expressions
        (Expression 1 and Expression 2). However, the implementation only reads the
        first input and compares it to the output. It treats the rule as an identity
        check (Input 0 == Output 0) rather than an equivalence check between two inputs.
        Inconsistency: It accesses list_of_input_dicts[0] but never accesses
        list_of_input_dicts[1], ignoring the second expression entirely.


    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace claim_expr_1_equals_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace claim_expr_1_equals_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace claim_expr_1_equals_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def claim_LHS_equals_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    (in_lhs0 == in_rhs0)

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    This function checks if the Input's LHS equals the Input's RHS (checking for a tautology). However, it ignores the list_of_output_dicts entirely in the logic check.
    If a user inputs a valid tautology (e.g., x = x) but asserts a completely unrelated output (e.g., y = z), the function will return 'valid', creating a break in the derivation chain.

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace claim_LHS_equals_RHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_rhs - input_expr_sympy_lhs)

    if d1 == 0:
        logger.info("[trace claim_LHS_equals_RHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace claim_LHS_equals_RHS end " + trace_id + "]")
        return "diff is " + str(d1)


def function_is_even(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    colloquially,
    sympy.cos(x)==sympy.cos(-x)

    sympy.cos(x) - sympy.cos(-x) == 0
    """
    return "recognized infrule but not yet supported"


def function_is_odd(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    colloquially,
    sympy.sin(-x) == -sympy.sin(x)

    sympy.sin(-x) - -sympy.sin(x) == 0
    """
    return "recognized infrule but not yet supported"


def conjugate_function_X(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    colloquially,
    sympy.conjugate(sympy.I)==-sympy.I

    replace f with f^*; replace $i$ with $-i$
    """
    return "recognized infrule but not yet supported"


def conjugate_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    colloquially,
    sympy.conjugate(sympy.I)==-sympy.I

    Apply ^*; replace $i$ with $-i$
    """
    return "recognized infrule but not yet supported"


def conjugate_transpose_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Apply ^+; replace $i$ with $-i$ and transpose matrices
    """
    return "recognized infrule but not yet supported"


def distribute_conjugate_transpose_to_factors(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Apply ^+; replace $i$ with $-i$ and transpose matrices, rotate bra-ket.
    this is a combination of "distribute conjugate" and then "distribute transpose"
    """
    return "recognized infrule but not yet supported"


def distribute_conjugate_to_factors(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Apply ^*; replace $i$ with $-i$
    """
    return "recognized infrule but not yet supported"


def expand_magnitude_to_conjugate(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    replace |f|^2 with ff^*
    """
    return "recognized infrule but not yet supported"


def replace_scalar_with_vector(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given F = m*a
    Get \vec{F} = m*\vec{a}
    """
    return "recognized infrule but not yet supported"


def simplify(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace simplify start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace simplify end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace simplify end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def subtract_expr_1_from_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Instead of creating the inf rule for subtraction,
    write this inf rule in terms of add_expr_1_to_expr_2

    Given  a = b
    and    c = d
    get    a - c = b - d
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace subtract_expr_1_from_expr_2 start " + trace_id + "]")

    input_expr_sympy_lhs_0 = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = eval(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = eval(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = eval(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        (input_expr_sympy_lhs_1 - input_expr_sympy_lhs_0) - output_expr_sympy_lhs_0
    )
    d2 = sympy.simplify(
        (input_expr_sympy_rhs_1 - input_expr_sympy_rhs_0) - output_expr_sympy_rhs_0
    )

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace subtract_expr_1_from_expr_2 end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace subtract_expr_1_from_expr_2 end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def factor_out_x(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a*x + b*x = c*x + d*x
    factor out x
    Get x*(a + b) = (c + d)*x
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace factor_out_x start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace factor_out_x end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace factor_out_x end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def factor_out_x_from_lhs(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a*x + b*x = c
    factor out x
    get x*(a + b) = c

    Gemini 3 Pro on 2026-02-02 complains that
    The validation logic for factoring rules checks for algebraic equivalence between input and output but fails to validate that the specific operation (factoring out a specific term) actually occurred.
    Inconsistency: If the input is ax + bx = y and the user provides an output ax + bx = y (no change) or (a+b)x = y (factored), both will return "valid". The function ignores the inference rule's intent (to factor out feed_sympy). It effectively degrades to a generic simplify check.

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace factor_out_x_from_lhs start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace factor_out_x_from_lhs end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace factor_out_x_from_lhs end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)
    return "no check performed"


def factor_out_x_from_rhs(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b*x + c*x
    factor out x
    get a = (b + c)*x

    Gemini 3 Pro on 2026-02-02 complains that
    The validation logic for factoring rules checks for algebraic equivalence between input and output but fails to validate that the specific operation (factoring out a specific term) actually occurred.
    Inconsistency: If the input is ax + bx = y and the user provides an output ax + bx = y (no change) or (a+b)x = y (factored), both will return "valid". The function ignores the inference rule's intent (to factor out feed_sympy). It effectively degrades to a generic simplify check.

    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace factor_out_x_from_rhs start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace factor_out_x_from_rhs end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace factor_out_x_from_rhs end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def differentiate_with_respect_to(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b,
    wrt t
    get \frac{d}{dt}a = \frac{d}{dt}b
    """
    return "recognized infrule but not yet supported"


def substitute_LHS_of_two_expressions_into_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and   c = d
    and   a + c = g
    Get   b + d = g
    """
    return "recognized infrule but not yet supported"


def change_two_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given 'a + b = c',
    substitute b --> d
    substitute a --> f
    to get 'f + d = c'

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    The implementation uses chained substitution (.subs().subs()). This causes logical errors if the variables being swapped are coupled (e.g., swapping x→y and y→x).
    Scenario: Input x + y, swap x->y and y->x.
    Mathematical Expectation: y + x.
    Code Behavior: (x+y).subs(x,y) becomes y+y. Then (y+y).subs(y,x) becomes x+x.
    Result: The logic fails to handle simultaneous swaps or circular dependencies correctly. This logic applies to change_three_variables... and higher as well.

    # to run the doctest below, use
    import doctest
    from validate_steps_sympy import *
    doctest.run_docstring_examples(change_two_variables_in_expr, globals(), verbose=True)

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a + b'), 'RHS': parse_latex('c')}]
    >>> latex_dict['feed'] = [parse_latex('b'), parse_latex('d'), parse_latex('a'), parse_latex('f')]
    >>> latex_dict['output'] = [{'LHS': parse_latex('f + d'), 'RHS': parse_latex('c')}]
    >>> change_two_variables_in_expr(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace change_two_variables_in_expr start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = eval(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = eval(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = eval(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = eval(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = eval(list_of_feed_dicts[6]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1).subs(
            feed_sympy_2, feed_sympy_3
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1).subs(
            feed_sympy_2, feed_sympy_3
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_two_variables_in_expr end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_two_variables_in_expr end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_three_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given 'a + b = c',
    substitute b --> d
    substitute a --> f
    substitute c --> g
    to get 'f + d = g'

    # to run the doctest below, use
    import doctest
    from validate_steps_sympy import *
    doctest.run_docstring_examples(change_three_variables_in_expr, globals(), verbose=True)

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a + b'), 'RHS': parse_latex('c')}]
    >>> latex_dict['feed'] = [parse_latex('b'), parse_latex('d'), parse_latex('a'), parse_latex('f'), parse_latex('c'), parse_latex('g')]
    >>> latex_dict['output'] = [{'LHS': parse_latex('f + d'), 'RHS': parse_latex('g')}]
    >>> change_three_variables_in_expr(latex_dict)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace change_three_variables_in_expr start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = eval(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = eval(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = eval(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = eval(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = eval(list_of_feed_dicts[6]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_three_variables_in_expr end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_three_variables_in_expr end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_four_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace change_four_variables_in_expr start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = eval(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = eval(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = eval(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = eval(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = eval(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = eval(list_of_feed_dicts[7]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_four_variables_in_expr end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_four_variables_in_expr end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_five_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = eval(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = eval(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = eval(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = eval(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = eval(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = eval(list_of_feed_dicts[7]["sympy"])
    feed_sympy_8 = eval(list_of_feed_dicts[8]["sympy"])
    feed_sympy_9 = eval(list_of_feed_dicts[9]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        .subs(feed_sympy_8, feed_sympy_9)
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        .subs(feed_sympy_8, feed_sympy_9)
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_five_variables_in_expr end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_five_variables_in_expr end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_six_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace change_six_variables_in_expr start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = eval(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = eval(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = eval(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = eval(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = eval(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = eval(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = eval(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = eval(list_of_feed_dicts[7]["sympy"])
    feed_sympy_8 = eval(list_of_feed_dicts[8]["sympy"])
    feed_sympy_9 = eval(list_of_feed_dicts[9]["sympy"])
    feed_sympy_10 = eval(list_of_feed_dicts[10]["sympy"])
    feed_sympy_11 = eval(list_of_feed_dicts[11]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        .subs(feed_sympy_8, feed_sympy_9)
        .subs(feed_sympy_10, feed_sympy_11)
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1)
        .subs(feed_sympy_2, feed_sympy_3)
        .subs(feed_sympy_4, feed_sympy_5)
        .subs(feed_sympy_6, feed_sympy_7)
        .subs(feed_sympy_8, feed_sympy_9)
        .subs(feed_sympy_10, feed_sympy_11)
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[trace change_six_variables_in_expr end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace change_six_variables_in_expr end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def square_root_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    sqrt both side
    get sqrt(a) = sqrt(b)
    and sqrt(a) = - sqrt(b)

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')}]
    >>> latex_dict['output'] = [{'LHS': parse_latex('\sqrt{a}'), 'RHS': parse_latex('\sqrt{b}')},
                                {'LHS': parse_latex('\sqrt{a}'), 'RHS': parse_latex('-\sqrt{b}')}]
    >>> square_root_both_sides(latex_dict)
    'valid'
    """
    return "recognized infrule but not yet supported"


def divide_expr_by_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a = b
    and c = d
    get a/c = b/d

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')},
                               {'LHS': parse_latex('c'), 'RHS': parse_latex('d')}]
    >>> latex_dict['output'] = [{'LHS': parse_latex('a/c'), 'RHS': parse_latex('b/d')}]
    >>> divide_expr_by_expr(latex_dict)
    'valid'
    """
    return "recognized infrule but not yet supported"


def separate_two_vector_components(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a_x \hat{x} + a_y \hat{y} = v_x \hat{x} + v_y \hat{y}
    get a_x = v_x
    and a_y = v_y
    """
    return "recognized infrule but not yet supported"


def separate_three_vector_components(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given a_x \hat{x} + a_y \hat{y} + a_z \hat{z} = v_x \hat{x} + v_y \hat{y} + v_z \hat{z}
    get a_x = v_x
    and a_y = v_y
    and a_z = v_z
    """
    return "recognized infrule but not yet supported"


def evaluate_definite_integral(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Given   a = \int_0^x dx
    Get     a = x

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:

    The function attempts to validate an integral by subtracting the output from the input. However, parsed LaTeX integrals in SymPy often result in unevaluated Integral objects. The sympy.simplify function does not strictly guarantee that it will call .doit() to perform the integration. Consequently, Integral(x, (x, 0, 1)) - 0.5 may result in a non-zero expression object, causing false validation failures.
    Fix: The code should likely call .doit() on the input expression to force evaluation before simplification.


    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace evaluate_definite_integral start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    # feed_sympy = eval(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace evaluate_definite_integral end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace evaluate_definite_integral end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def expand_LHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace expand_LHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace expand_LHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace expand_LHS end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)
    return "no check performed"


def expand_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[trace expand_RHS start " + trace_id + "]")

    input_expr_sympy_lhs = eval(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = eval(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = eval(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = eval(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[trace expand_RHS end " + trace_id + "]")
        return "valid"
    else:
        logger.info("[trace expand_RHS end " + trace_id + "]")
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)
    return "no check performed"


def apply_operator_to_bra(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given
    x = \\langle\\psi_{\\alpha}| \\hat{A} |\\psi_{\\beta}\\rangle
    return
    x = \\langle\\psi_{\\alpha}| a_{\\alpha} |\psi_{\\beta} \\rangle
    """
    return "recognized infrule but not yet supported"


def apply_operator_to_ket(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given
    x = \\langle\\psi_{\\alpha}| \\hat{A} |\\psi_{\\beta}\\rangle
    return
    x = \\langle\\psi_{\\alpha}| a_{\\beta} |\psi_{\\beta} \\rangle
    """
    return "recognized infrule but not yet supported"


def drop_nondominant_term(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given
    x = \\langle\\psi_{\\alpha}| \\hat{A} |\\psi_{\\beta}\\rangle
    return
    x = \\langle\\psi_{\\alpha}| a_{\\beta} |\psi_{\\beta} \\rangle
    """
    return "recognized infrule but not yet supported"


def apply_gradient_to_scalar_function(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    given
    x = \\langle\\psi_{\\alpha}| \\hat{A} |\\psi_{\\beta}\\rangle
    return
    x = \\langle\\psi_{\\alpha}| a_{\\beta} |\psi_{\\beta} \\rangle
    """
    return "recognized infrule but not yet supported"


# EOF
