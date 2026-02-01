#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2025
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
For a given derivation step, use SymPy to validate the consistency of the input and output expressions with the feeds and inference rule.

Historically, the validation functions are from
https://github.com/allofphysicsgraph/proofofconcept/blob/gh-pages/v2_XML/databases/inference_rules_database.xml

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
    logger.info(
        "[TRACE] sympy_validate_step/validate_step start "
        + trace_id
        + " "
        + str(time.time())
    )

    # logger.debug(str(inference_rule_dict))
    # logger.debug(str(list_of_input_dicts))
    # logger.debug(str(list_of_feed_dicts))
    # logger.debug(str(list_of_output_dicts))

    if inference_rule_dict["name_latex"] in [
        "declare initial expression",
        "declare final expression",
        "declare identity",
        "declare guess solution",
        "declare assumption",
    ]:
        # logger.info("[trace end " + trace_id + "]")
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "no validation is available for declarations"

    elif inference_rule_dict["name_latex"] in [
        "assume N dimensions",
        "normalization condition",
        "boundary condition",
        "boundary condition for expression",
    ]:
        # logger.info("[trace end " + trace_id + "]")
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "no validation is available for assumptions"

    elif inference_rule_dict["name_latex"] == "add X to both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return add_X_to_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif inference_rule_dict["name_latex"] == "divide both sides by":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return divide_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif inference_rule_dict["name_latex"] == "multiply both sides by":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return multiply_both_sides_by(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif inference_rule_dict["name_latex"] == "subtract X from both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return subtract_X_from_both_sides(
            list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
        )

    elif inference_rule_dict["name_latex"] == "LHS of expr 1 equals LHS of expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "RHS of expr 1 equals RHS of expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "X cross both sides by":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "X dot both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "add X to both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "add expr 1 to expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "add zero to LHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "add zero to RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "apply divergence":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "apply function to both sides of expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "apply gradient to scalar function":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "apply operator to bra":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "apply operator to ket":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "assume N dimensions":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "both sides cross X":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "both sides dot X":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "boundary condition":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "boundary condition for expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change five variables in expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change four variables in expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change six variables in expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change three variables in expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change two variables in expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "change variable X to Y":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "claim LHS equals RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "claim expr 1 equals expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "combine like terms":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "conjugate both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "conjugate function X":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "conjugate transpose both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "declare assumption":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "declare guess solution":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "declare identity":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "differentiate with respect to":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "distribute conjugate to factors":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"] == "distribute conjugate transpose to factors"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "divide expr 1 by expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "drop non-dominant term":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "evaluate definite integral":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "expand LHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "expand RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "expand integrand":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "expand magnitude to conjugate":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "expr 1 is equivalent to expr 2 under the condition"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "expr 1 is true under condition expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "factor out X":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "factor out X from LHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "factor out X from RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "function is even":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "function is odd":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "indefinite integral over":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "indefinite integrate LHS over":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "indefinite integrate RHS over":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "indefinite integration":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "integrate":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "integrate over from to":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "make expr power":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "maximum of expression":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "multiply LHS by unity":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "multiply RHS by unity":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "multiply expr 1 by expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "normalization condition":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "partially differentiate with respect to":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "raise both sides to power":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "replace constant with value":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "replace curl with LeviCevita summation contravariant"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "replace scalar with vector":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "replace summation notation with vector notation"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "select imaginary parts":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "select real parts":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "separate three vector components":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "separate two vector components":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "separate vector into two trigonometric ratios"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "simplify":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "solve for X":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "square root both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "substitute LHS of expr 1 into expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "substitute LHS of five expressions into expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "substitute LHS of four expressions into expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "substitute LHS of six expressions into expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "substitute LHS of three expressions into expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif (
        inference_rule_dict["name_latex"]
        == "substitute LHS of two expressions into expression"
    ):
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "substitute RHS of expr 1 into expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "subtract expr 1 from expr 2":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "sum exponents":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "sum exponents LHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "sum exponents RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "swap LHS with RHS":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"
    elif inference_rule_dict["name_latex"] == "take curl of both sides":
        logger.info(
            "[TRACE] sympy_validate_step/validate_step end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "recognized infrule but not yet supported"

    else:
        # logger.error("unexpected inf rule:" + step_dict["inf rule"])
        logger.warning(
            "sympy_validate_step/validate_step unexpected inf rule:"
            + inference_rule_dict["name_latex"]
        )
        # raise Exception(
        #     "sympy_validate_step/validate_step Unexpected inf rule: "
        #     + inference_rule_dict["name_latex"]
        # )
        return "unrecognized inference rule"

    logger.info("[TRACE] sympy_validate_step/validate_step end " + trace_id)
    return "This message should not be seen"


def add_X_to_both_sides(
    list_of_input_dicts, list_of_feed_dicts, list_of_output_dicts
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
    print(
        "[TRACE] sympy_validate_step/add_X_to_both_sides start "
        + trace_id
        + " "
        + str(time.time())
    )

    print("list_of_input_dicts", list_of_input_dicts)

    # list_of_input_dicts [{'sympy_lhs': "sympy.Symbol('pdg9906071')", 'reference_latex': 'ref to source', 'latex_condition': '', 'sympy_rhs': "sympy.Symbol('pdg7880077')", 'description_latex': '', 'latex_lhs': 'a', 'name_latex': 'great name', 'lean': '', 'latex_rhs': 'b', 'author_name_latex': 'ben', 'id': '2922355', 'sympy': "sympy.Eq(sympy.Symbol('pdg9906071'),sympy.Symbol('pdg7880077'))", 'latex_relation': '='}]

    print("list_of_feed_dicts", list_of_feed_dicts)
    print("list_of_output_dicts", list_of_output_dicts)

    print(type(list_of_input_dicts[0]["sympy_lhs"]))  # str

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
        print(
            "[TRACE] sympy_validate_step/add_X_to_both_sides end "
            + trace_id
            + " "
            + str(time.time())
        )
        return "valid (as per SymPy)"
    else:
        print(
            "[TRACE] sympy_validate_step/add_X_to_both_sides end "
            + trace_id
            + " "
            + str(time.time())
        )
        return difference_str
    return "ERROR: sympy_validate_step/add_X_to_both_sides should not reach here"


def subtract_X_from_both_sides(
    input_expr_sympy, feed_expr_sympy, output_expr_sympy
) -> str:
    """
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
    trace_id = str(random.randint(1000000, 9999999))
    print(
        "[TRACE] sympy_validate_step/subtract_X_from_both_sides start "
        + trace_id
        + " "
        + str(time.time())
    )

    delta_lhs = sympy.simplify(
        sympy.Add(input_expr_sympy.lhs, sympy.Mul(-1, feed_expr_sympy))
        - output_expr_sympy.lhs
    )
    delta_rhs = sympy.simplify(
        sympy.Add(input_expr_sympy.rhs, sympy.Mul(-1, feed_expr_sympy))
        - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info(
            "[TRACE] sympy_validate_step/subtract_X_from_both_sides end " + trace_id
        )
        return "valid"
    else:
        logger.info(
            "[TRACE] sympy_validate_step/subtract_X_from_both_sides end " + trace_id
        )
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def multiply_both_sides_by(input_expr_sympy, feed_expr_sympy, output_expr_sympy) -> str:
    """

    inference_rule_dict is {'name_latex': 'multiply both sides by', 
                            'assumptions_latex': '', 
                            'number_of_outputs': 1, 'number_of_inputs': 1, 'number_of_feeds': 1, 
                            'author_name_latex': 'ben.is.located@gmail.com', 
                            'notes_latex': '', 'id': '111182', 
                            'latex': 'Multiply both sides of Eq.~\ref{eq:#2} by $#1$; yields Eq.~\ref{eq:#3}.'}

    list_of_input_dicts[{'name_latex': '', 
                         'latex_lhs': 'T', 
                         'latex_relation': '='
                         'latex_rhs': '1 / f', 
                         'sympy_lhs': "Equality(Symbol('pdg0009491'), Pow(Symbol('pdg0004201'), Integer(-1)))", 
                         'sympy_rhs': '', 
                         'reference_latex': '', 
                         'latex_condition': '', 
                         'lean': '', 
                         'author_name_latex': 'ben.is.located@gmail.com', 
                         'description_latex': '', 
                         'id': '3131111133'}]

    list_of_feed_dicts[{'lean': '', 
                        'author_name_latex': 'ben.is.located@gmail.com', 
                        'id': '9040079362', 
                        'sympy': "Symbol('pdg0004201')", 
                        latex': 'f'}]

    list_of_output_dicts[{'sympy_lhs': "Equality(Mul(Symbol('pdg0009491'), Symbol('pdg0004201')), Integer(1))", 
                          'name_latex': '', 
                          'reference_latex': '', 
                          'latex_condition': '', 
                          'lean': '', 
                          'latex_rhs': '1', 
                          'sympy_rhs': '', 
                          'author_name_latex': 'ben.is.located@gmail.com', 
                          'description_latex': '', 
                          'id': '2131616531', 
                          'latex_lhs': 'T f', 
                          'latex_relation': '='}]

    see also dividebothsidesby
    x*y = Mul(x,y)

    given 'a + b = c'
    multiply both sides by d
    to get '(a + b)*d = c*d'

    >>> input_expr = parse_latex("a + b = c")
    >>> feed = parse_latex("d")
    >>> output_expr = parse_latex("(a + b)*d = c*d")
    >>> multiply_both_sides_by(input_expr, feed, output_expr)
    'valid'
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] sympy_validate_step/multiply_both_sides_by start " + trace_id)

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.lhs, feed_expr_sympy) - output_expr_sympy.rhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.rhs, feed_expr_sympy) - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info(
            "[TRACE] sympy_validate_step/multiply_both_sides_by end " + trace_id
        )
        return "valid"
    else:
        logger.info(
            "[TRACE] sympy_validate_step/multiply_both_sides_by end " + trace_id
        )
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


def divide_both_sides_by(input_expr_sympy, feed_expr_sympy, output_expr_sympy) -> str:
    """
    see also multiply_both_sides_by
    https://docs.sympy.org/latest/tutorial/manipulation.html

    x/y = Mul(x, Pow(y, -1))

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
    logger.info("[TRACE] sympy_validate_step/divide_both_sides_by start " + trace_id)

    delta_lhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.lhs, sympy.Pow(feed_expr_sympy, -1))
        - output_expr_sympy.rhs
    )
    delta_rhs = sympy.simplify(
        sympy.Mul(input_expr_sympy.rhs, sympy.Pow(feed_expr_sympy, -1))
        - output_expr_sympy.rhs
    )
    if (delta_lhs == 0) and (delta_rhs == 0):
        logger.info("[TRACE] sympy_validate_step/divide_both_sides_by end " + trace_id)
        return "valid"
    else:
        logger.info("[TRACE] sympy_validate_step/divide_both_sides_by end " + trace_id)
        return "LHS diff is " + str(delta_lhs) + "\n" + "RHS diff is " + str(delta_rhs)


# EOF
