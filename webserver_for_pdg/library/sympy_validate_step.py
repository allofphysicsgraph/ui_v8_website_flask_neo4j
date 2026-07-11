#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2025
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
2026-03-06 assessment by Gemini 3.1 Pro:
https://drive.google.com/file/d/1-m6_ATyReOsUBrrYsPtSmhXeReMAg0Bk/view?usp=sharing, https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%221gKNOg8pLzUVr-Knq09ceZJgXydGG0Dgt%22%5D,%22action%22:%22open%22,%22userId%22:%22101193243042884231058%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing

For a given derivation step, use SymPy to validate the consistency of the input and output expressions with the feeds and inference rule.

Historically, the validation functions are from
https://github.com/allofphysicsgraph/proofofconcept/blob/gh-pages/v2_XML/databases/inference_rules_database.xml

Convention: every inference rule validation function has the same arguments

Observations:
- there are pairs which undo each other -- "divide both sides by" versus "multiply both sides by"
- there are triplets -- "add X to LHS" and "add X to RHS" and "add X to both sides"

TODO: although some functions have doctests, these doctests rely on the previous argument structures
rather than the current "list of dicts"x3.
        # Implementation expects:
        input_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])

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
import uuid

import sympy  # type: ignore

# rather than use "sympy.Symbol" and "sympy.Mul" I just import everything:
from sympy import *

# the following is only relevant for doctests
from sympy.parsing.latex import parse_latex  # type: ignore

# https://docs.python.org/3/library/typing.html
from typing import NewType, Dict, List, Tuple

import logging

logger = logging.getLogger(__name__)


# from . import compute
from .compute import query_timing_result_type


def validate_step(
    inference_rule_dict: dict,
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    The possible return strings from this function include:

    - "no validation is available..." (e.g., for declarations)
    - "no check performed" (the check is not implemented yet)
    - "valid"
    - "diff is ..."

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    name_latex = inference_rule_dict["name_latex"]

    # CATEGORY: derivation mechanics
    if name_latex in [
        "declare initial expression",
        "declare final expression",
        "declare identity",
        "declare guess solution",
        "declare assumption",
    ]:
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "no validation is available for declarations"

    # CATEGORY: assumptions
    elif name_latex in [
        "assume N dimensions",
        "normalization condition",
        "boundary condition",
        "boundary condition for expression",
    ]:
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "no validation is available for assumptions"

    # validate that the keys exist
    for this_input in list_of_input_dicts:
        if "sympy_lhs" not in this_input.keys():
            return "missing SymPy for LHS of expression " + this_input["id"]
        if "sympy_rhs" not in this_input.keys():
            return "missing SymPy for RHS of expression " + this_input["id"]

    for this_feed in list_of_feed_dicts:
        if "sympy" not in this_feed.keys():
            return "missing SymPy for feed " + this_feed["id"]

    for this_output in list_of_output_dicts:
        if "sympy_lhs" not in this_output.keys():
            return "missing SymPy for LHS of expression " + this_output["id"]
        if "sympy_rhs" not in this_output.keys():
            return "missing SymPy for RHS of expression " + this_output["id"]

    if name_latex == "add X to both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return add_X_to_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "divide both sides by":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return divide_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "multiply both sides by":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return multiply_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "subtract X from both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return subtract_X_from_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif name_latex == "LHS of expr 1 equals LHS of expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return LHS_of_expr_1_eq_LHS_of_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "RHS of expr 1 equals RHS of expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return RHS_of_expr_1_eq_RHS_of_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "X cross both sides by":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return X_cross_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "X dot both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return X_dot_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add expr 1 to expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return add_expr_1_to_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add zero to LHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return add_zero_to_LHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "add zero to RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return add_zero_to_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply divergence":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return apply_divergence(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply function to both sides of expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "apply gradient to scalar function":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return apply_gradient_to_scalar_function(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply operator to bra":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return apply_operator_to_bra(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "apply operator to ket":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return apply_operator_to_ket(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "both sides cross X":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return both_sides_cross_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "both sides dot X":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return both_sides_dot_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change variable X to Y":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_variable_X_to_Y(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change two variables in expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_two_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change three variables in expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_three_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change four variables in expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_four_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change five variables in expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_five_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "change six variables in expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return change_six_variables_in_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "claim LHS equals RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return claim_LHS_equals_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "claim expr 1 equals expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return claim_expr_1_equals_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "combine like terms":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "conjugate both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return conjugate_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "conjugate function X":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return conjugate_function_X(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "conjugate transpose both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return conjugate_transpose_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "differentiate with respect to":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return differentiate_with_respect_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "distribute conjugate to factors":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return distribute_conjugate_to_factors(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "distribute conjugate transpose to factors":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return distribute_conjugate_transpose_to_factors(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "divide expr 1 by expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return divide_expr_by_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "drop non-dominant term":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return drop_nondominant_term(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "evaluate definite integral":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return evaluate_definite_integral(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "expand LHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return expand_LHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "expand RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return expand_RHS(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "expand integrand":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "expand magnitude to conjugate":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return expand_magnitude_to_conjugate(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "expr 1 is equivalent to expr 2 under the condition":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "expr 1 is true under condition expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "factor out X":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return factor_out_x(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "factor out X from LHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return factor_out_x_from_lhs(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "factor out X from RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return factor_out_x_from_rhs(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "function is even":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return function_is_even(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "function is odd":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return function_is_odd(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integral over":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return indefinite_integral_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integrate LHS over":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return indefinite_integrate_LHS_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integrate RHS over":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return indefinite_integrate_RHS_over(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "indefinite integration":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return indefinite_integration(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    # "integrate" might be DEPRECATED in favor of other integration infrules
    # TODO: investigate whether any steps reference this infrule. If not, delete
    elif name_latex == "integrate":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "integrate over from to":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return integrate_over_from_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "make expr power":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return make_expr_power(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "maximum of expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "multiply LHS by unity":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return multiply_LHS_by_unity(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "multiply RHS by unity":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return multiply_RHS_by_unity(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "multiply expr 1 by expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return mult_expr_1_by_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "partially differentiate with respect to":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return partially_differentiate_with_respect_to(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "raise both sides to power":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return raise_both_sides_to_power(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "replace constant with value":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "replace curl with LeviCevita summation contravariant":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "replace scalar with vector":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return replace_scalar_with_vector(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "replace summation notation with vector notation":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "select imaginary parts":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return select_imag_parts(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "select real parts":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return select_real_parts(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate three vector components":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return separate_three_vector_components(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate two vector components":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return separate_two_vector_components(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "separate vector into two trigonometric ratios":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "simplify":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return simplify(list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts)
    elif name_latex == "solve for X":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "square root both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return square_root_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute LHS of five expressions into expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of four expressions into expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of six expressions into expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of three expressions into expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "substitute LHS of two expressions into expression":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return substitute_LHS_of_two_expressions_into_expr(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute LHS of expr 1 into expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return substitute_LHS_of_expr_1_into_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "substitute RHS of expr 1 into expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return substitute_RHS_of_expr_1_into_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "subtract expr 1 from expr 2":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return subtract_expr_1_from_expr_2(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "sum exponents":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "recognized infrule but not yet supported"
    elif name_latex == "sum exponents LHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return sum_exponents_LHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "sum exponents RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return sum_exponents_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "swap LHS with RHS":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return swap_LHS_with_RHS(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )
    elif name_latex == "take curl of both sides":
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return take_curl_of_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    else:
        # logger.error("unexpected inf rule:" + step_dict["inf rule"])
        logger.warning("unexpected inf rule: " + name_latex)
        # raise Exception(
        #     "sympy_validate_step/validate_step Unexpected inf rule: "
        #     + name_latex
        # )
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "unrecognized inference rule: " + name_latex

    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
    return "This message should not be seen"


def validate_that_content_exists(
    number_of_inputs: int,
    number_of_feeds: int,
    number_of_outputs: int,
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str | None:
    """ """
    # validate there is a value for each key

    assert len(list_of_input_dicts) == number_of_inputs
    assert len(list_of_feed_dicts) == number_of_feeds
    assert len(list_of_output_dicts) == number_of_outputs

    for input_index in range(number_of_inputs):
        if not list_of_input_dicts[input_index]["sympy_lhs"]:
            logger.info("Not evaluated due to missing term in SymPy")
            return "Not evaluated due to missing term in SymPy"
        if not list_of_input_dicts[input_index]["sympy_rhs"]:
            logger.info("Not evaluated due to missing term in SymPy")
            return "Not evaluated due to missing term in SymPy"

    for feed_index in range(number_of_feeds):
        if not list_of_feed_dicts[feed_index]["sympy"]:
            logger.info("Not evaluated due to missing term in SymPy")
            return "Not evaluated due to missing term in SymPy"

    for output_index in range(number_of_outputs):
        if not list_of_output_dicts[output_index]["sympy_lhs"]:
            logger.info("Not evaluated due to missing term in SymPy")
            return "Not evaluated due to missing term in SymPy"
        if not list_of_output_dicts[output_index]["sympy_rhs"]:
            logger.info("Not evaluated due to missing term in SymPy")
            return "Not evaluated due to missing term in SymPy"

    return None


def parse_to_sympy(expr_str: str):
    """
    Helper function to replace eval() and handle empty strings
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    if not expr_str:  # gracefully handle empty strings like ''
        logger.error("Empty string instead of SymPy")
        raise Exception("Empty string instead of SymPy")

    # try:
    res = sympy.sympify(expr_str)
    # except Exception as err:
    #     logger.error(str(type(err).__name__) + ": " + str(err) + " : " + str(expr_str))
    #     return None

    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
    return res


def add_X_to_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    https://docs.sympy.org/latest/gotchas.html#double-equals-signs
    https://stackoverflow.com/questions/37112738/sympy-comparing-expressions

    Given  a = b
    add c to both sides
    get a + c = b + c

    latex_expansion:  Add $#1$ to both sides of Eq.~\ref{eq:#2}.


    >>> input_expr = parse_latex("a = b")
    >>> feed = parse_latex("c")
    >>> output_expr = parse_latex("a + c = b + c")
    >>> add_X_to_both_sides(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    # since this inference rule is valid for equality and inequality, no need to check the relation

    input_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

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
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
        return difference_str
    return "ERROR: sympy_validate_step/add_X_to_both_sides should not reach here"


def subtract_X_from_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion:  Subtract $#1$ from both sides of Eq.~\ref{eq:#2}.

    https://docs.sympy.org/latest/tutorial/manipulation.html

    Rather than have "add X to both sides" and "subtract X from both sides"
    as separate inference rules, we could write "subtract X from both sides"
    to use "add X to both sides"

    Given a = b
    subtract c
    get a - c = b - c


    >>> input_expr = parse_latex("a = b")
    >>> feed = parse_latex("c")
    >>> output_expr = parse_latex("a - c = b - c")
    >>> subtract_X_from_both_sides(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    # since this inference rule is valid for equality and inequality, no need to check the relation

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    delta_lhs = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs, sympy.Mul(-1, feed_sympy))
        - output_expr_sympy_lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs, sympy.Mul(-1, feed_sympy))
        - output_expr_sympy_rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def multiply_both_sides_by(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Multiply both sides of Eq.~\ref{eq:#2} by $#1$.

    see also `dividebothsidesby`

    x*y = Mul(x,y)

    Example:

        given "A*x=B", multbothsidesby(feed=2) yields "A*x*2=B*2"

    another example:

        given 'a + b = c'
        multiply both sides by d
        to get '(a + b)*d = c*d'

    Validates the operation of multiplying both sides of an equation or inequality by a term.

    Handles edge cases:
    1. Algebraic consistency: Checks (LHS_in * feed) == LHS_out and (RHS_in * feed) == RHS_out.
    2. Inequalities:
       - If feed > 0, relation must be preserved (e.g., < remains <).
       - If feed < 0, relation must flip (e.g., < becomes >).
       - If feed sign is indeterminate (symbolic), allows either provided the relation remains an inequality.
    3. Zero/Invalid multipliers: Flags if the multiplier simplifies to 0 (which destroys information) or is undefined.

    Args:
        list_of_input_dicts: List containing the source equation/inequality.
        list_of_feed_dicts: List containing the term to multiply by.
        list_of_output_dicts: List containing the resulting equation/inequality.

    Returns:
        str: 'valid' if the derivation step is correct, otherwise an error message describing the issue.



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


    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)*d = c*d")
    >>> multiply_both_sides_by([input_expr], [feed], [output_expr])
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    # BHP's original (inadequate) attempt:
    # delta_lhs = sympy.simplify(
    #     sympy.Mul(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    # )
    # delta_rhs = sympy.simplify(
    #     sympy.Mul(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    # )
    # if (delta_lhs == 0) and (delta_rhs == 0):
    #     logger.info("[TRACE] end " + trace_id)
    #     return "valid"
    # else:
    #     logger.info("[TRACE] end " + trace_id)
    #     return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    # Gemini 3 Pro says `sympy.parse_expr` or specific context handling is safer than `eval()`.
    # Gemini 3 Pro also says using sympify is safer and more robust than eval() for math expressions
    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    input_rel_latex = list_of_input_dicts[0].get("latex_relation", "=").strip()
    output_rel_latex = list_of_output_dicts[0].get("latex_relation", "=").strip()

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    try:
        # Check for Zero or Invalid Multiplier
        # Multiplying by zero (0=0) is trivially true but usually invalid in derivations.
        # Multiplying by infinity/nan is invalid.
        if feed_sympy == 0:
            return (
                "Invalid derivation: Multiplier is zero, which destroys the equation."
            )

        # Check for NaN (e.g., 0/0) or complex infinity
        if feed_sympy is sympy.nan or feed_sympy is sympy.zoo:
            return (
                "Invalid derivation: Multiplier evaluates to NaN or Complex Infinity."
            )

        # Algebraic Verification
        # Check: (Input * Feed) - Output == 0
        delta_lhs = sympy.simplify(
            sympy.Mul(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
        )
        delta_rhs = sympy.simplify(
            sympy.Mul(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
        )

        if delta_lhs != 0:
            logger.info(f"[TRACE] {trace_id} LHS mismatch: {delta_lhs}")
            logger.info(f"[TRACE] end {trace_id}")
            return f"LHS arithmetic error. Diff: {delta_lhs}"

        if delta_rhs != 0:
            logger.info(f"[TRACE] {trace_id} RHS mismatch: {delta_rhs}")
            logger.info(f"[TRACE] end {trace_id}")
            return f"RHS arithmetic error. Diff: {delta_rhs}"

        # Relation Logic (Inequality Edge Cases)

        # Normalize LaTeX relations to standard symbols for comparison
        # Mapping common LaTeX relations to internal representations
        rel_map = {
            "=": "=",
            "\\approx": "=",
            "\\equiv": "=",
            "<": "<",
            "\\lt": "<",
            ">": ">",
            "\\gt": ">",
            "\\leq": "<=",
            "\\le": "<=",
            "\\geq": ">=",
            "\\ge": ">=",
            "\\ll": "<",  # treat strict strong inequalities as strict
            "\\gg": ">",
        }

        in_rel = rel_map.get(input_rel_latex, input_rel_latex)
        out_rel = rel_map.get(output_rel_latex, output_rel_latex)

        # Define the "flip" map for negative multiplication
        flip_map = {"<": ">", ">": "<", "<=": ">=", ">=": "<="}

        is_equality = in_rel in ["="]
        is_inequality = in_rel in flip_map

        # Case A: Equality
        if is_equality:
            if in_rel != out_rel:
                logger.info(f"[TRACE] end {trace_id}")
                return f"Relation Error: Expected equality '{in_rel}', got '{out_rel}'."

        # Case B: Inequality
        elif is_inequality:
            # Determine properties of the feed term (multiplier)
            # is_negative returns True, False, or None (if indeterminate)
            is_neg = feed_sympy.is_negative
            is_pos = feed_sympy.is_positive

            # Determine if the relation actually flipped in the user's output
            did_flip = out_rel == flip_map.get(in_rel)
            did_stay = out_rel == in_rel

            if is_neg is True:
                # Must flip
                if not did_flip:
                    logger.info(f"[TRACE] end {trace_id}")
                    return f"Inequality Error: Multiplied by negative term '{feed_sympy}' but relation did not flip."
            elif is_pos is True:
                # Must NOT flip
                if not did_stay:
                    logger.info(f"[TRACE] end {trace_id}")
                    return f"Inequality Error: Multiplied by positive term '{feed_sympy}' but relation flipped."
            else:
                # Indeterminate sign (e.g., multiplying by variable 'a')
                # Allow the step if the user consistently flipped OR stayed,
                # but reject if the relation became an equality or nonsense.
                if not (did_flip or did_stay):
                    logger.info(f"[TRACE] end {trace_id}")
                    return f"Relation Error: Inequality relation changed unpredictably from '{in_rel}' to '{out_rel}'."

        else:
            # Unknown relation type (e.g., set membership \in), default to requiring identity
            if input_rel_latex != output_rel_latex:
                logger.info(f"[TRACE] end {trace_id}")
                return f"Relation mismatch: '{input_rel_latex}' vs '{output_rel_latex}'"

        # If all checks pass
        logger.info(f"[TRACE] end {trace_id}")
        return "valid"

    except Exception as e:
        logger.error(f"[TRACE] {trace_id} Exception: {str(e)}")
        logger.info(f"[TRACE] end {trace_id}")
        return f"Validation Exception: {str(e)}"


def divide_both_sides_by(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    latex_expansion: Divide both sides of Eq.~\ref{eq:#2} by $#1$.

    see also multiply_both_sides_by

    Example:

        given "A*x=B", dividebothsidesby(feed=2) yields "(A*x)/2=B/2"

    another example:

        given 'a + b = c'
        divide both sides by d
        to get '(a + b)/d = c/d'


    https://docs.sympy.org/latest/tutorial/manipulation.html

    x/y = Mul(x, Pow(y, -1))



    Validates dividing both sides of an equation or inequality by a value (feed).
    Handles edge cases: division by zero and inequality sign flipping.

    Edge Cases Addressed:
    1. Division by Zero: explicitly returns an error.
    2. Inequalities with Negative Numbers: Enforces relation flipping (e.g., -x > -y).
    3. Symbolic Ambiguity: Allows relation to either flip or stay same if divisor sign is unknown.

    Args:
        list_of_input_dicts: List containing dict with 'sympy_lhs', 'sympy_rhs', 'latex_relation'.
        list_of_feed_dicts: List containing dict with 'sympy' (the divisor).
        list_of_output_dicts: List containing dict with 'sympy_lhs', 'sympy_rhs', 'latex_relation'.

    Returns:
        'valid' if step is mathematically correct, otherwise an error string.




    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)/d = c/d")
    >>> divide_both_sides_by(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    # input and output should have same relation
    assert (
        list_of_input_dicts[0]["latex_relation"]
        == list_of_output_dicts[0]["latex_relation"]
    )

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    # BHP's original (inadequate) attempt:
    # delta_lhs = sympy.simplify(
    #     sympy.Mul(input_expr_sympy_lhs, sympy.Pow(feed_sympy, -1))
    #     - output_expr_sympy_lhs
    # )
    # delta_rhs = sympy.simplify(
    #     sympy.Mul(input_expr_sympy_rhs, sympy.Pow(feed_sympy, -1))
    #     - output_expr_sympy_rhs
    # )
    # if (delta_lhs == 0) and (delta_rhs == 0):
    #     logger.info("[TRACE] end " + trace_id)
    #     return "valid"
    # else:
    #     logger.info("[TRACE] end " + trace_id)
    #     return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)

    input_rel = list_of_input_dicts[0]["latex_relation"]
    output_rel = list_of_output_dicts[0]["latex_relation"]

    # Check for Division by Zero
    if feed_sympy == 0:
        logger.info("[TRACE] end " + trace_id)
        return "Invalid derivation: Division by zero is undefined."

    # Check Algebraic Correctness (LHS and RHS values)
    # We compute: Input_Side / Feed - Output_Side. Should be 0.
    delta_lhs = sympy.simplify(
        (input_expr_sympy_lhs / feed_sympy) - output_expr_sympy_lhs
    )
    delta_rhs = sympy.simplify(
        (input_expr_sympy_rhs / feed_sympy) - output_expr_sympy_rhs
    )

    if delta_lhs != 0 or delta_rhs != 0:
        logger.info("[TRACE] end " + trace_id)
        return f"Algebraic error: LHS diff is {delta_lhs}, RHS diff is {delta_rhs}"

    # Check Relation Correctness (Inequalities and Sign Flipping)
    flip_map = {"<": ">", ">": "<", "<=": ">=", ">=": "<="}
    is_inequality = input_rel in flip_map

    # Logic for Equalities (=, !=)
    if not is_inequality:
        if input_rel != output_rel:
            logger.info("[TRACE] end " + trace_id)
            return f"Relation error: '{input_rel}' should remain '{input_rel}' upon division."

    # Logic for Inequalities
    else:
        # Determine strict sign of the divisor (feed_sympy)
        # is_negative returns True (definitely negative), False (definitely non-negative), or None (unknown/symbolic)
        is_neg = feed_sympy.is_negative
        is_pos = feed_sympy.is_positive

        expected_flipped = flip_map[input_rel]

        if is_neg:
            # Case: Divisor is explicitly negative (e.g., -1, -5). Relation MUST flip.
            if output_rel != expected_flipped:
                logger.info("[TRACE] end " + trace_id)
                return (
                    f"Inequality error: When dividing by a negative value ({feed_sympy}), "
                    f"the relation must flip from '{input_rel}' to '{expected_flipped}'."
                )

        elif is_pos:
            # Case: Divisor is explicitly positive (e.g., 5, 10). Relation must NOT flip.
            if output_rel != input_rel:
                logger.info("[TRACE] end " + trace_id)
                return (
                    f"Inequality error: When dividing by a positive value ({feed_sympy}), "
                    f"the relation '{input_rel}' must be preserved."
                )

        else:
            # Case: Divisor sign is unknown (Symbolic, e.g., 'd').
            # The derivation is valid if the user ASSUMED d > 0 (kept relation)
            # OR ASSUMED d < 0 (flipped relation).
            # It is invalid if they changed the relation to something unrelated (e.g., < to =).
            if output_rel not in [input_rel, expected_flipped]:
                logger.info("[TRACE] end " + trace_id)
                return (
                    f"Relation error: The output relation '{output_rel}' is not consistent "
                    f"with the input '{input_rel}' regardless of the divisor's sign."
                )

    logger.info("[TRACE] end " + trace_id)
    return "valid"


def change_variable_X_to_Y(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    latex_expansion: Substitute $#1$ for $#2$ in Eq.~\ref{eq:#3}.

    given 'a + b = c',
    substitute b --> d
    to get 'a + d = c'

    to run the doctest below, use

    .. code-block:: python

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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 2, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(feed_sympy_0, feed_sympy_1) - output_expr_sympy_lhs
    )  # subs(old, new)
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(feed_sympy_0, feed_sympy_1) - output_expr_sympy_rhs
    )  # subs(old, new)
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def multiply_LHS_by_unity(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    see also multRHSbyUnity

    latex_expansion: Multiply LHS of Eq.~\ref{eq:#2} by 1, which in this case is $#1$

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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy - 1)
    d2 = sympy.simplify(
        sympy.Mul(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    )
    d3 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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

    latex_expansion: Multiply RHS of Eq.~\ref{eq:#2} by 1, which in this case is $#1$

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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy - 1)
    d2 = sympy.simplify(
        sympy.Mul(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    )
    d3 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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

    Example:

        given "A*x=B", addZerotoLHS(feed=C-C) yields "A*x+C-C=B"


    latex_expansion:

        Add zero to LHS of Eq.~\ref{eq:#2}, where $0=#1$.

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> latex_dict['feed'] = [parse_latex('')]
    >>> latex_dict['output'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> add_zero_to_LHS(latex_dict)
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy)
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs, feed_sympy) - output_expr_sympy_lhs
    )
    d3 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    Example:

        given "A*x=B", addZerotoRHS(feed=C-C) yields "A*x=B+C-C"


    ((feed==0) and (out_rhs0 == (in_rhs0+zero)) and (out_lhs0 == in_lhs0))

    latex_expansion:

        Add zero to RHS of Eq.~\ref{eq:#2}, where $0=#1$.

    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> latex_dict['feed'] = [parse_latex('')]
    >>> latex_dict['output'] = [{'LHS': parse_latex(''), 'RHS': parse_latex('')}]
    >>> add_zero_to_RHS(latex_dict)
    'valid'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(feed_sympy)
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs, feed_sympy) - output_expr_sympy_rhs
    )
    d3 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    latex_expansion: Apply curl to both sides of Eq.~\ref{eq:#1}.

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
    CATEGORY: calculus

    latex_expansion: Indefinite integral of both sides of Eq.~\ref{eq:#2} over $#1$.

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
    latex_expansion: Indefinite integral of both sides of Eq.~\ref{eq:#1}.

    CATEGORY: calculus

    ((out_lhs0 == (\int in_lhs0 )) and (out_rhs0 == \int in_rhs0 ))
    """
    return "recognized infrule but not yet supported"


def indefinite_integrate_LHS_over(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    CATEGORY: calculus

    latex_expansion: Indefinite integral of LHS of Eq.~\ref{eq:#2} over $#1$.

    ((out_lhs0 == (\int in_lhs0 feed0)) and (out_rhs0 == in_rhs0))
    """
    return "recognized infrule but not yet supported"


def indefinite_integrate_RHS_over(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    latex_expansion: Indefinite integral of RHS of Eq.~\ref{eq:#2} over $#1$.

    CATEGORY: calculus

    ((out_lhs0 == in_lhs0) and (out_rhs0 == \int in_rhs0 feed0))

    mathematica:
        Integrate[#2,#1]
    """
    return "recognized infrule but not yet supported"


def integrate_over_from_to(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    CATEGORY: calculus

    ((out_lhs0 == (\int_{feed1}^{feed2} in_lhs0 feed0)) and (out_rhs0 == \int_{feed1}^{feed2} in_rhs0 feed0))


    latex_expansion: Integrate Eq.~\ref{eq:#4} over $#1$ from lower limit $#2$ to upper limit $#3$.</latex_expansion

    comment
        $\int_{#2}^{#3}\ d #1$
    number_of_arguments: 4
    number_of_feeds: 3
    number_of_input_statements: 1
    number_of_output_statements: 1

    """
    return "recognized infrule but not yet supported"


def partially_differentiate_with_respect_to(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    CATEGORY: calculus

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
    latex_expansion: Make Eq.~\ref{eq:#2} the power of $#1$.

    ((out_lhs0 == (feed0)**(in_lhs0)) and (out_rhs0 == (feed0)**(in_rhs0)))
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    logger.info("feed_sympy " + str(feed_sympy))

    logger.info("output_expr_sympy_lhs " + str(output_expr_sympy_lhs))
    logger.info("output_expr_sympy_rhs " + str(output_expr_sympy_rhs))

    d1 = sympy.simplify(
        output_expr_sympy_lhs - sympy.Pow(feed_sympy, input_expr_sympy_lhs)
    )
    d2 = sympy.simplify(
        output_expr_sympy_rhs - sympy.Pow(feed_sympy, input_expr_sympy_rhs)
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def select_real_parts(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    latex_expansion: Select real parts of Eq.~\ref{eq:#1}.

    sympy.re(2+3*sympy.I)==2

    Given a+i*b = c+i*d
    get a = c
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    logger.info("output_expr_sympy_lhs " + str(output_expr_sympy_lhs))
    logger.info("output_expr_sympy_rhs " + str(output_expr_sympy_rhs))

    d1 = sympy.simplify(sympy.re(input_expr_sympy_lhs) - output_expr_sympy_lhs)
    d2 = sympy.simplify(sympy.re(input_expr_sympy_rhs) - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def select_imag_parts(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Select imaginary parts of Eq.~\ref{eq:#1}.

    .. code-block:: python

        sympy.im(2+3*sympy.I)==3

    Given a+i*b = c+i*d
    get b = d
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    logger.info("output_expr_sympy_lhs " + str(output_expr_sympy_lhs))
    logger.info("output_expr_sympy_rhs " + str(output_expr_sympy_rhs))

    d1 = sympy.simplify(sympy.im(input_expr_sympy_lhs) - output_expr_sympy_lhs)
    d2 = sympy.simplify(sympy.im(input_expr_sympy_rhs) - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def swap_LHS_with_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Swap LHS of Eq.~\ref{eq:#1} with RHS.

    ((in_lhs0 == out_rhs0) and (in_rhs0 == out_lhs0))

    given 'a + b = c'
    get   'c = a + b'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    logger.info("output_expr_sympy_lhs " + str(output_expr_sympy_lhs))
    logger.info("output_expr_sympy_rhs " + str(output_expr_sympy_rhs))

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_rhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_lhs)
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


# TODO: is there no "sum_exponents"?
# Example:
#      given "(A^x)*(A^y)=(C^3)*(C^r)+2", sum_exponents yields "A^(x+y)=(C^(3+r))+2"


def sum_exponents_LHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Sum exponents on LHS of Eq.~\ref{eq:#1}.

    Example:

        given "(A^x)*(A^y)=(C^3)*(C^r)+2", sumExponents_LHS yields "A^(x+y)=(C^3)*(C^r)+2"


    see also sum_exponents_RHS
    (in_rhs0 == out_rhs0)
    """
    return "recognized infrule but not yet supported"


def sum_exponents_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Sum exponents on RHS of Eq.~\ref{eq:#1}.

    Example:

        given "(A^x)*(A^y)=(C^3)*(C^r)+2", sumExponents_RHS yields "(A^x)*(A^y)=(C^(3+r))+2"


    see also sum_exponents_LHS
    (in_lhs0 == out_lhs0)
    """
    return "recognized infrule but not yet supported"


def add_expr_1_to_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    assumes result form LHS(X)+LHS(Y)=RHS(X)+RHS(Y)

    Example:

        given "A*x=B" and "C*y=F", add_expr_1_to_expr_2 yields "A*x+C*y=B+F"


    (((in_lhs0+in_lhs1)==out_lhs0) and ((in_rhs0+in_rhs1)==out_rhs0))

    latex_expansion:

        Add Eq.~\ref{eq:#1} to Eq.~\ref{eq:#2}.

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    d1 = sympy.simplify(
        sympy.Add(input_expr_sympy_lhs_0, input_expr_sympy_lhs_1)
        - output_expr_sympy_lhs_0
    )
    d2 = sympy.simplify(
        sympy.Add(input_expr_sympy_rhs_0, input_expr_sympy_rhs_1)
        - output_expr_sympy_rhs_0
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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

    Another example:

        given "A*x=B" and "C*y=A*x", subRHSofEqXintoEqY yields "C*y=B"

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info(str(list_of_input_dicts))
    logger.info(str(list_of_feed_dicts))
    logger.info(str(list_of_output_dicts))

    # input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    # input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    # input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    # input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    # output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    # output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    try:
        input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
        input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])

        input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
        input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])

        output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
        output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])
    except Exception as err:
        logger.error(
            str(type(err).__name__) + ": " + str(err) + " : loading parameters"
        )
        return str(type(err).__name__) + ": " + str(err) + " : loading parameters"

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    try:
        d1 = sympy.simplify(
            input_expr_sympy_lhs_1.subs(input_expr_sympy_rhs_0, input_expr_sympy_lhs_0)
            - output_expr_sympy_lhs_0
        )  # subs(old,new)
        d2 = sympy.simplify(
            input_expr_sympy_rhs_1.subs(input_expr_sympy_rhs_0, input_expr_sympy_lhs_0)
            - output_expr_sympy_rhs_0
        )  # subs(old,new)
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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

    another example:

        given "A*x=B" and "C*y=B", subLHSofEqXintoEqY yields "C*y=A*x"

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    try:
        d1 = sympy.simplify(
            input_expr_sympy_lhs_1.subs(input_expr_sympy_lhs_0, input_expr_sympy_rhs_0)
            - output_expr_sympy_lhs_0
        )  # subs(old,new)
        d2 = sympy.simplify(
            input_expr_sympy_rhs_1.subs(input_expr_sympy_lhs_0, input_expr_sympy_rhs_0)
            - output_expr_sympy_rhs_0
        )  # subs(old,new)
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def mult_expr_1_by_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Multiply Eq.~\ref{eq:#1} by Eq.~\ref{eq:#2}.

    Given a = b
    and   c = d
    get a*c = b*d

    ((in_lhs0*in_lhs1 == out_lhs0) and (in_rhs0*in_rhs1 == out_rhs0))
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    try:
        d1 = sympy.simplify(
            sympy.Mul(input_expr_sympy_lhs_0, input_expr_sympy_lhs_1)
            - output_expr_sympy_lhs_0
        )
        d2 = sympy.simplify(
            sympy.Mul(input_expr_sympy_rhs_0, input_expr_sympy_rhs_1)
            - output_expr_sympy_rhs_0
        )

    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def LHS_of_expr_1_eq_LHS_of_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    Given a = b
    and   a = d
    get   b = d

    ((in_lhs0 == in_lhs1) and (out_lhs0 == in_rhs0) and (out_rhs0 == in_rhs1))

    description: combine 2 expressions

    latex_expansion:

        LHS of Eq.~\ref{eq:#1} is equal to LHS of Eq.~\ref{eq:#2}.

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    Issue: The logic assumes a specific ordering of inputs and
           outputs that maps strictly to "If A=B and A=D then B=D".
    Inconsistency: If the user provides the inputs in the reverse order
                   (Input 0: A=D, Input 1: A=B), the validation logic
                   rhs0 - out_lhs (D - B) might fail if the output is B=D (B-D != 0),
                   even though the derivation is logically valid.
                   The validation is brittle regarding the order of the input list.


    >>> latex_dict = {}
    >>> latex_dict['input'] = [{'LHS': parse_latex('a'), 'RHS': parse_latex('b')},
                               {'LHS': parse_latex('a'), 'RHS': parse_latex('d')}]
    >>> latex_dict['output'] = [{'LHS': parse_latex('b'), 'RHS': parse_latex('d')}]
    >>> LHS_of_expr_1_eq_LHS_of_expr_2(latex_dict)
    'valid'

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    try:
        d1 = sympy.simplify(
            input_expr_sympy_lhs_0 - input_expr_sympy_lhs_1
        )  #  0 = a - a
        d2 = sympy.simplify(
            input_expr_sympy_rhs_0 - output_expr_sympy_lhs_0
        )  #  0 = b - b
        d3 = sympy.simplify(
            input_expr_sympy_rhs_1 - output_expr_sympy_rhs_0
        )  #  0 = d - d
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    r"""
    ((in_rhs0 == in_rhs1) and (out_lhs0 == in_lhs0) and (out_rhs0 == in_lhs1))

    latex_expansion:

        RHS of Eq.~\ref{eq:#1} is equal to RHS of Eq.~\ref{eq:#2}.

    Example:

        given "A*x=B" and "C=B", RHSofEqXeqRHSofEqY yields "A*x=C"

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs_0 " + str(input_expr_sympy_lhs_0))
    logger.info("input_expr_sympy_rhs_0 " + str(input_expr_sympy_rhs_0))

    logger.info("input_expr_sympy_lhs_1 " + str(input_expr_sympy_lhs_1))
    logger.info("input_expr_sympy_rhs_1 " + str(input_expr_sympy_rhs_1))

    logger.info("output_expr_sympy_lhs_0 " + str(output_expr_sympy_lhs_0))
    logger.info("output_expr_sympy_rhs_0 " + str(output_expr_sympy_rhs_0))

    try:
        d1 = sympy.simplify(input_expr_sympy_rhs_0 - input_expr_sympy_rhs_1)
        d2 = sympy.simplify(output_expr_sympy_lhs_0 - input_expr_sympy_lhs_0)
        d3 = sympy.simplify(output_expr_sympy_rhs_0 - input_expr_sympy_lhs_1)
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0) and (d3 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    r"""
    latex_expansion: Raise both sides of Eq.~\ref{eq:#2} to $#1$.

    ((out_lhs0 == (in_lhs0)**(feed0)) and (out_rhs0 == (in_rhs0)**(feed0)))
    """
    return "recognized infrule but not yet supported"


def claim_expr_1_equals_expr_2(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    ((in_lhs0 == in_lhs1) and (in_rhs0 == in_rhs1))

    latex_expansion:
        Thus we see that Eq.~\ref{eq:#1} is equivalent to Eq.~\ref{eq:#2}.

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    The function name suggests comparing two inputs, but the code ignores the second input entirely.

        The inference rule name implies comparing two distinct input expressions
        (Expression 1 and Expression 2). However, the implementation only reads the
        first input and compares it to the output. It treats the rule as an identity
        check (Input 0 == Output 0) rather than an equivalence check between two inputs.
        Inconsistency: It accesses list_of_input_dicts[0] but never accesses
        list_of_input_dicts[1], ignoring the second expression entirely.


    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    logger.info("output_expr_sympy_lhs " + str(output_expr_sympy_lhs))
    logger.info("output_expr_sympy_rhs " + str(output_expr_sympy_rhs))

    try:
        d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
        d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)


def claim_LHS_equals_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    (in_lhs0 == in_rhs0)

    latex_expansion: Thus we see that LHS of Eq.~\ref{eq:#1} is equal to RHS.

    Note: this infrule terminates a derivation.

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:
    This function checks if the Input's LHS equals the Input's RHS (checking for a tautology). However, it ignores the list_of_output_dicts entirely in the logic check.
    If a user inputs a valid tautology (e.g., x = x) but asserts a completely unrelated output (e.g., y = z), the function will return 'valid', creating a break in the derivation chain.

    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 0, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])

    logger.info("input_expr_sympy_lhs " + str(input_expr_sympy_lhs))
    logger.info("input_expr_sympy_rhs " + str(input_expr_sympy_rhs))

    try:
        d1 = sympy.simplify(input_expr_sympy_rhs - input_expr_sympy_lhs)
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy")
        return str(type(err).__name__) + ": " + str(err) + " : evaluating SymPy"

    if d1 == 0:
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "diff is " + str(d1)


def function_is_even(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion:

        $#1$ is even with respect to $#2$, so replace $#1$ with $#3$ in Eq.~\ref{eq:#4}.

    f(x)=f(-x)

    colloquially,

    .. code-block::

        sympy.cos(x)==sympy.cos(-x)
        sympy.cos(x) - sympy.cos(-x) == 0

    """
    assert len(list_of_feed_dicts) == 0

    return "recognized infrule but not yet supported"


def function_is_odd(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: $#1$ is odd with respect to $#2$, so replace $#1$ with $#3$ in Eq.~\ref{eq:#4}.

    -f(x) = f(-x)

    colloquially,
    sympy.sin(-x) == -sympy.sin(x)

    sympy.sin(-x) - -sympy.sin(x) == 0
    """
    assert len(list_of_feed_dicts) == 0

    return "recognized infrule but not yet supported"


def conjugate_function_X(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    r"""
    latex_expansion: Conjugate $#1$ in Eq.~\ref{eq:#2}.

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
    r"""
    latex_expansion: Conjugate both sides of Eq.~\ref{eq:#1}.

    colloquially,
    sympy.conjugate(sympy.I)==-sympy.I

    Apply ^*; replace $i$ with $-i$
    """
    assert len(list_of_feed_dicts) == 0

    return "recognized infrule but not yet supported"


def conjugate_transpose_both_sides(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    latex_expansion: Conjugate transpose of both sides of Eq.~\ref{eq:#1}.

    Apply ^+; replace $i$ with $-i$ and transpose matrices
    """
    assert len(list_of_feed_dicts) == 0

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
    assert len(list_of_feed_dicts) == 0

    return "recognized infrule but not yet supported"


def distribute_conjugate_to_factors(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    Apply ^*; replace $i$ with $-i$
    """
    assert len(list_of_feed_dicts) == 0

    return "recognized infrule but not yet supported"


def expand_magnitude_to_conjugate(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """
    replace |f|^2 with ff^*
    """
    assert len(list_of_feed_dicts) == 0

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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info(str(list_of_input_dicts))
    logger.info(str(list_of_feed_dicts))  # should be empty
    logger.info(str(list_of_output_dicts))

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        2, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs_0 = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    input_expr_sympy_lhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_lhs"])
    input_expr_sympy_rhs_1 = parse_to_sympy(list_of_input_dicts[1]["sympy_rhs"])
    output_expr_sympy_lhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs_0 = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        (input_expr_sympy_lhs_1 - input_expr_sympy_lhs_0) - output_expr_sympy_lhs_0
    )
    d2 = sympy.simplify(
        (input_expr_sympy_rhs_1 - input_expr_sympy_rhs_0) - output_expr_sympy_rhs_0
    )

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 1, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    The implementation uses chained substitution (.subs().subs()). This causes logical errors
    if the variables being swapped are coupled (e.g., swapping x→y and y→x).
    Scenario: Input x + y, swap x->y and y->x.
    Mathematical Expectation: y + x.
    Code Behavior: (x+y).subs(x,y) becomes y+y. Then (y+y).subs(y,x) becomes x+x.
    Result: The logic fails to handle simultaneous swaps or circular dependencies correctly.
    This logic applies to change_three_variables... and higher as well.

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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    # logger.info(str(list_of_input_dicts))
    # logger.info(str(list_of_feed_dicts))
    # logger.info(str(list_of_output_dicts))

    res = validate_that_content_exists(
        1, 4, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = parse_to_sympy(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = parse_to_sympy(list_of_feed_dicts[3]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(
            {feed_sympy_0: feed_sympy_1, feed_sympy_2: feed_sympy_3}, simultaneous=True
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(
            {feed_sympy_0: feed_sympy_1, feed_sympy_2: feed_sympy_3}, simultaneous=True
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info(str(list_of_input_dicts))
    logger.info(str(list_of_feed_dicts))
    logger.info(str(list_of_output_dicts))

    res = validate_that_content_exists(
        1, 6, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = parse_to_sympy(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = parse_to_sympy(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = parse_to_sympy(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = parse_to_sympy(list_of_feed_dicts[5]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
            },
            simultaneous=True,
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
            },
            simultaneous=True,
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_four_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 8, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = parse_to_sympy(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = parse_to_sympy(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = parse_to_sympy(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = parse_to_sympy(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = parse_to_sympy(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = parse_to_sympy(list_of_feed_dicts[7]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
            },
            simultaneous=True,
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
            },
            simultaneous=True,
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_five_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] " + trace_id)

    res = validate_that_content_exists(
        1, 10, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = parse_to_sympy(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = parse_to_sympy(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = parse_to_sympy(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = parse_to_sympy(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = parse_to_sympy(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = parse_to_sympy(list_of_feed_dicts[7]["sympy"])
    feed_sympy_8 = parse_to_sympy(list_of_feed_dicts[8]["sympy"])
    feed_sympy_9 = parse_to_sympy(list_of_feed_dicts[9]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
                feed_sympy_8: feed_sympy_9,
            },
            simultaneous=True,
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
                feed_sympy_8: feed_sympy_9,
            },
            simultaneous=True,
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\n" + "RHS diff is " + str(d2)
    return "no check performed"


def change_six_variables_in_expr(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 12, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    feed_sympy_0 = parse_to_sympy(list_of_feed_dicts[0]["sympy"])
    feed_sympy_1 = parse_to_sympy(list_of_feed_dicts[1]["sympy"])
    feed_sympy_2 = parse_to_sympy(list_of_feed_dicts[2]["sympy"])
    feed_sympy_3 = parse_to_sympy(list_of_feed_dicts[3]["sympy"])
    feed_sympy_4 = parse_to_sympy(list_of_feed_dicts[4]["sympy"])
    feed_sympy_5 = parse_to_sympy(list_of_feed_dicts[5]["sympy"])
    feed_sympy_6 = parse_to_sympy(list_of_feed_dicts[6]["sympy"])
    feed_sympy_7 = parse_to_sympy(list_of_feed_dicts[7]["sympy"])
    feed_sympy_8 = parse_to_sympy(list_of_feed_dicts[8]["sympy"])
    feed_sympy_9 = parse_to_sympy(list_of_feed_dicts[9]["sympy"])
    feed_sympy_10 = parse_to_sympy(list_of_feed_dicts[10]["sympy"])
    feed_sympy_11 = parse_to_sympy(list_of_feed_dicts[11]["sympy"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(
        input_expr_sympy_lhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
                feed_sympy_8: feed_sympy_9,
                feed_sympy_10: feed_sympy_11,
            },
            simultaneous=True,
        )
        - output_expr_sympy_lhs
    )
    d2 = sympy.simplify(
        input_expr_sympy_rhs.subs(
            {
                feed_sympy_0: feed_sympy_1,
                feed_sympy_2: feed_sympy_3,
                feed_sympy_4: feed_sympy_5,
                feed_sympy_6: feed_sympy_7,
                feed_sympy_8: feed_sympy_9,
                feed_sympy_10: feed_sympy_11,
            },
            simultaneous=True,
        )
        - output_expr_sympy_rhs
    )
    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
    CATEGORY: calculus

    Given   a = \int_0^x dx
    Get     a = x

    TODO: issue detected by Gemini 3 Pro on 2026-02-02:

    The function attempts to validate an integral by subtracting the output from the input. However, parsed LaTeX integrals in SymPy often result in unevaluated Integral objects. The sympy.simplify function does not strictly guarantee that it will call .doit() to perform the integration. Consequently, Integral(x, (x, 0, 1)) - 0.5 may result in a non-zero expression object, causing false validation failures.
    Fix: The code should likely call .doit() on the input expression to force evaluation before simplification.


    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs.doit() - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs.doit() - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)


def expand_LHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
        return "LHS diff is " + str(d1) + "\nRHS diff is " + str(d2)
    return "no check performed"


def expand_RHS(
    list_of_input_dicts: List[dict],
    list_of_feed_dicts: List[dict],
    list_of_output_dicts: List[dict],
) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    res = validate_that_content_exists(
        1, 0, 1, list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
    )
    if res is not None:
        return res

    input_expr_sympy_lhs = parse_to_sympy(list_of_input_dicts[0]["sympy_lhs"])
    input_expr_sympy_rhs = parse_to_sympy(list_of_input_dicts[0]["sympy_rhs"])
    output_expr_sympy_lhs = parse_to_sympy(list_of_output_dicts[0]["sympy_lhs"])
    output_expr_sympy_rhs = parse_to_sympy(list_of_output_dicts[0]["sympy_rhs"])

    d1 = sympy.simplify(input_expr_sympy_lhs - output_expr_sympy_lhs)
    d2 = sympy.simplify(input_expr_sympy_rhs - output_expr_sympy_rhs)

    if (d1 == 0) and (d2 == 0):
        logger.info("[TRACE] end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] end " + trace_id)
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
