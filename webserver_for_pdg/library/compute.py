#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

""" """

import os
import random
import string
import time
import tokenize
import re
import hashlib
import csv
import uuid
import subprocess

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List, Tuple, Any, Union  # for type hinting

from . import neo4j_query
from . import list_of_valid
from . import sympy_validate_expression
from . import latex_and_sympy

# ORDERING: this has to come before the functions that use this type
unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)
query_timing_result_type = NewType("query_timing_result_type", Dict[str, float])

import logging

# TODO: file created in `static` isn't persistent across restarts of the Docker image
# Perhaps this should be in "dumpinggrounds" instead since that is persistent?
shorten_url_file = "static/url_shorten_expand.csv"

logger = logging.getLogger(__name__)


def generate_random_id(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[unique_numeric_id_as_str, query_timing_result_type]:
    """
    create statically defined numeric IDs for nodes in the graph

    The node IDs that Neo4j assigns internally are not static,
    so they can't be used for the Physics Derivation Graph
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    try:
        assert node_type in list_of_valid.node_types
    except Exception as err:
        logger.error(str(type(err).__name__) + ": " + str(err))

    list_of_existing_IDs = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_existing_IDs = session.read_transaction(neo4j_query.get_list_IDs)
        query_time_dict["compute/generate_random_id: get_list_IDs " + trace_id] = round(
            time.time() - query_start_time, 3
        )

    found_new_ID = False
    while not found_new_ID:
        new_id = str(random.randint(1000000000, 9999999999))
        if new_id not in list_of_existing_IDs:
            found_new_ID = True

    logger.info("new_id=" + str(new_id))
    logger.info("[TRACE] end " + trace_id)
    return str(new_id), query_time_dict


def guess_symbols_from_latex(graphDB_Driver, query_time_dict, expression_dict):
    """
    after users enter latex, guess which symbols they want to associate with expression

    The naive option would be to return to the user the complete list of
    symbols and then ask the user to select relevant symbols.

    There are multiple tactics to enact that are more clever:
      * given a Latex expression, use SymPy to identify possible symbols.
      and, separately
      * given a Latex expression, and given all existing symbols, return a list of matching symbols

    The first tactic is likely to result in an undercount,
    the second tactic will result in an overcount.

    I'll use keyword SYMBOL_SEARCH_SYMPY for the first tactic and
                     SYMBOL_SEARCH_LATEX for the second tactic.
    Order doesn't matter for the two tactics since they are independent.

    """
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "symbol"
        )
        query_time_dict[
            "pdg_app/to_add_symbols_and_operations_for_expression, get_nodes_of_type symbol "
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    # SYMBOL_SEARCH_SYMPY

    cleaned_latex_str_lhs = remove_latex_presention_markings(
        expression_dict["latex_lhs"]
    )
    cleaned_latex_str_relation = remove_latex_presention_markings(
        expression_dict["latex_relation"]
    )
    cleaned_latex_str_rhs = remove_latex_presention_markings(
        expression_dict["latex_rhs"]
    )
    logger.info("cleaned_latex_str_lhs=" + str(cleaned_latex_str_lhs))
    logger.info("cleaned_latex_str_relation=" + str(cleaned_latex_str_relation))
    logger.info("cleaned_latex_str_rhs=" + str(cleaned_latex_str_rhs))

    try:
        sympy_expr_lhs = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
            cleaned_latex_str_lhs
        )
    except Exception as err:
        flash(
            "pdg_app/to_add_symbols_and_operations_for_expression: sympy_expr_lhs: "
            + str(type(err).__name__)
            + str(err)
        )
        logger.error("sympy_expr_lhs: " + str(err))
        sympy_expr_lhs = None
    # ERROR: SymPy can't convert "="
    # sympy_expr_relation = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
    #     cleaned_latex_str_relation
    # )
    try:
        sympy_expr_rhs = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
            cleaned_latex_str_rhs
        )
    except Exception as err:
        flash(
            "pdg_app/to_add_symbols_and_operations_for_expression: sympy_expr_rhs: "
            + str(type(err).__name__)
            + str(err)
        )
        logger.error("sympy_expr_rhs: " + str(err))
        sympy_expr_rhs = None

    logger.info("sympy_expr_lhs=" + str(sympy_expr_lhs))
    # logger.info("sympy_expr_relation=", str(sympy_expr_relation))
    logger.info("sympy_expr_rhs=" + str(sympy_expr_rhs))

    list_of_sympy_symbols_from_expr = []
    list_of_sympy_symbols_from_expr += (
        latex_and_sympy.list_of_sympy_symbols_in_sympy_expression(sympy_expr_lhs)
    )
    # list_of_sympy_symbols_from_expr += (
    #     latex_and_sympy.list_of_sympy_symbols_in_sympy_expression(
    #         sympy_expr_relation
    #     )
    # )
    list_of_sympy_symbols_from_expr += (
        latex_and_sympy.list_of_sympy_symbols_in_sympy_expression(sympy_expr_rhs)
    )

    # TODO: this is missing relation operators like "="
    logger.info(
        "list_of_sympy_symbols_from_expr= " + str(list_of_sympy_symbols_from_expr)
    )

    # do any of the list_of_sympy_symbols_from_expr
    # show up in list_of_symbol_dicts?
    list_of_potential_matching_symbols_from_sympy = []
    for this_symbol_dict in list_of_symbol_dicts:
        logger.info("this_symbol_dict=" + str(this_symbol_dict))
        for this_symbol_from_sympy in list_of_sympy_symbols_from_expr:
            logger.info(str(this_symbol_from_sympy))
            if this_symbol_dict["latex"] == str(this_symbol_from_sympy):
                list_of_potential_matching_symbols_from_sympy.append(
                    this_symbol_dict["id"]
                )

    logger.info(
        "list_of_potential_matching_symbols_from_sympy= "
        + str(list_of_potential_matching_symbols_from_sympy)
    )

    # SYMBOL_SEARCH_LATEX
    # given a Latex expression, and given all existing symbols,
    # sort existing symbol_latex by length,
    # then search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"
    # TODO: matching the symbol "a" just because the Latex string contains "\frac" is a false positive.

    list_of_symbol_latex = []  # type: List[str]
    dict_of_symbol_dicts = {}
    for this_symbol_dict in list_of_symbol_dicts:
        dict_of_symbol_dicts[this_symbol_dict["id"]] = this_symbol_dict
        # list_of_symbol_latex.append(this_symbol_dict["latex"])

    # https://stackoverflow.com/a/2587419/1164295
    # list_of_symbol_latex.sort(key=len)

    # # https://stackoverflow.com/a/73050/1164295
    # list_of_symbol_dicts_sorted_by_latex = sorted(
    #     list_of_symbol_dicts, key=lambda d: d["latex"]
    # )

    # logger.info("list_of_symbol_dicts_sorted_by_latex=", list_of_symbol_dicts_sorted_by_latex)

    # SYMBOL_SEARCH_LATEX, continued
    # TODO: search (starting with the longest symbols first) for each symbol in the expression
    # provide the user with the list of guessed symbols
    # There may be multiple matching symbol IDs for a given latex symbol, e.g., "x"

    potential_symbols_found_in_Latex_expression = []  # type: List[str]
    # symbol_id_dict = {}

    for this_symbol_dict in list_of_symbol_dicts:
        if (
            (this_symbol_dict["latex"] in expression_dict["latex_lhs"])
            or (this_symbol_dict["latex"] in expression_dict["latex_relation"])
            or (this_symbol_dict["latex"] in expression_dict["latex_rhs"])
        ):
            potential_symbols_found_in_Latex_expression.append(this_symbol_dict)

            # symbol_id_dict[this_symbol_dict["latex"]] = this_symbol_dict["id"]

    logger.info(
        "potential_symbols_found_in_Latex_expression="
        + str(potential_symbols_found_in_Latex_expression)
    )

    return query_time_dict, potential_symbols_found_in_Latex_expression


def hash_of_string(str_to_hash: str) -> str:
    """
    convert string to bytes, then get hash

    Args:
        str_to_hash: string to be hashed
    Returns:
        hash as string
    Raises:
        None

    >>> hash_of_string('a_string')
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    hashed_str = hashlib.sha256(str_to_hash.encode("utf-8")).hexdigest()

    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
    return hashed_str


def encode_user_identifier(user_identifier: str) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
    user_id = user_identifier.strip().lower()
    hash_object = hashlib.sha256(user_id.encode("utf-8"))
    hex_dig = hash_object.hexdigest()
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))
    return hex_dig


def generate_lookup_for_shorten_url(shorten_url_file: str) -> str:
    """
    TODO: if URL already exists in CSV, then just return existing lookup
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    data_list = []  # contents of file as list of dicts

    # newline='' is a best practice when using the csv module to handle line endings correctly
    with open(shorten_url_file, mode="r", newline="") as file_handle:
        reader = csv.DictReader(file_handle, delimiter="|")
        for row in reader:
            data_list.append(row)

    characters = string.ascii_letters  # + string.digits

    collision_found = True
    while collision_found:
        random_string = "".join(random.choices(characters, k=5))

        collision_found = False
        for this_row_dict in data_list:
            if this_row_dict["lookup"] == random_string:
                collision_found = True

    logger.info("random_string=" + random_string)

    logger.info("[TRACE] end " + trace_id)
    return random_string


def add_url_to_shortened_list(now_str: str, current_user_email, user_url: str) -> str:
    """
    User's email is part of the database in case someone decides to put something naughty in the database

    User's email is hashed because the database is exposed publicly on the website
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    if not os.path.exists(shorten_url_file):
        with open(shorten_url_file, "a") as file_handle:
            file_handle.write("timestamp|email|count|lookup|url\n")

    lookup = generate_lookup_for_shorten_url(shorten_url_file)

    stable_user_email_hash = hashlib.sha256(
        current_user_email.encode("utf-8")
    ).hexdigest()

    with open(shorten_url_file, "a") as file_handle:
        file_handle.write(
            now_str
            + "|"
            + stable_user_email_hash
            + "|0|"
            + lookup
            + "|"
            + user_url
            + "\n"
        )

    logger.info("[TRACE] end " + trace_id)
    return lookup


def get_url_from_shortened_list(lookup: str) -> Tuple[str, str]:
    """
    Given the `lookup`, what is the URL?

    TODO: increment the "count" column
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    data_list = []  # contents of file as list of dicts

    # newline='' is a best practice when using the csv module to handle line endings correctly
    with open(shorten_url_file, mode="r", newline="") as file_handle:
        reader = csv.DictReader(file_handle, delimiter="|")
        for row in reader:
            data_list.append(row)

    for this_row_dict in data_list:
        if this_row_dict["lookup"] == lookup:
            return "success", this_row_dict["url"]

    logger.error("lookup " + lookup + " not found")

    logger.info("[TRACE] end " + trace_id)
    return "ERROR: lookup " + lookup + " not found", None


def send_email_with_msmtp(
    recipients: Union[str, List[str]], subject: str, body: str, from_address: str = None
):
    """
    Sends an email using the system's msmtp command.

    Args:
        recipients: The email address of the recipient, or a list of emails.
        subject (str): The subject line of the email.
        body (str): The plain text body of the email.
        from_address (str, optional): The From: address. If None, msmtp will
                                      use the default from your .msmtprc.
                                      It's good practice to set it.
    Returns:
        bool: True for success, False for failure.
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    if isinstance(recipients, str):
        recipients_list = [recipients]
    else:
        recipients_list = recipients

    if not recipients_list:
        # print("No recipients specified.", file=sys.stderr)
        logger.error("No recipients specified.")
        return False

    headers = f"Subject: {subject}\n"
    if from_address:
        headers += f"From: {from_address}\n"

    # Join the list of recipients with a comma for the 'To:' header
    headers += f"To: {', '.join(recipients_list)}\n"

    # The full email message must have headers and body separated by a blank line.
    message = f"{headers}\n{body}"

    # print("\n")
    # print(message)
    # print("\n")

    # The command to execute. We pass the recipient as a command-line argument.
    command = ["msmtp"] + recipients_list

    try:
        # We run the command and pipe the message to its standard input (stdin).
        # `input` needs bytes, so we encode the message string.
        # `check=True` will raise a CalledProcessError if msmtp returns a non-zero exit code.
        # `capture_output=True` will capture stdout and stderr.
        process = subprocess.run(
            command, input=message.encode("utf-8"), check=True, capture_output=True
        )
        # print(f"Email sent successfully to: {', '.join(recipients_list)}")
        # For debugging, you can print the output from msmtp
        # print("STDOUT:", process.stdout.decode())
        return True

    except FileNotFoundError:
        # print("Error: 'msmtp' command not found.", file=sys.stderr)
        # print(
        #     "Please ensure msmtp is installed and in your system's PATH.",
        #     file=sys.stderr,
        # )
        # print("\nhere what was going to be sent:\n")
        # print(message)

        logger.error("'msmtp' command not found.")
        logger.error("Please ensure msmtp is installed and in your system's PATH.")
        logger.error("\nhere what was going to be sent:\n")
        logger.error(str(message))

        return False

    except subprocess.CalledProcessError as err:
        # This block runs if msmtp fails (e.g., auth error, network issue).
        logger.error("Error sending email:")
        logger.error(f"msmtp exit code: {err.returncode}")
        logger.error("\n--- msmtp STDOUT ---")
        logger.error(err.stdout.decode())
        logger.error("\n--- msmtp STDERR ---")
        logger.error(err.stderr.decode())
        return False

    logger.info("[TRACE] end " + trace_id)
    return


def check_whether_inference_rule_exists(
    graphDB_Driver, query_time_dict, inference_rule_name: str, inference_rule_latex: str
) -> Tuple[bool, str, query_timing_result_type]:
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    # https://neo4j.com/docs/python-manual/current/session-api/
    list_of_inference_rule_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_inference_rule_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "inference_rule"
        )
        query_time_dict[
            "pdg_app/to_add_inference_rule: get_nodes_of_type inference_rule "
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    for inference_rule_dict in list_of_inference_rule_dicts:
        # logger.info("inference_rule_dict is " + str(inference_rule_dict))
        # logger.info(
        #     "inference_rule_dict['name_latex'] "
        #     + str(inference_rule_dict["name_latex"])
        # )
        if inference_rule_name == inference_rule_dict["name_latex"]:
            logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
            return (
                True,
                "INVALID INPUT: inference rule with that name already exists",
                query_time_dict,
            )

        if inference_rule_latex == inference_rule_dict["latex"]:
            logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
            return (
                True,
                "INVALID INPUT: inference rule with that latex already exists",
                query_time_dict,
            )

    logger.info("[TRACE] end " + trace_id + " " + str(time.time()))
    return False, "no message", query_time_dict


def get_sympy_as_latex_per_feed_id(list_of_feed_dicts):
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id + " " + str(time.time()))

    sympy_as_latex_per_feed_id = {}  # type: Dict[str, str]
    for this_feed_dict in list_of_feed_dicts:
        if "sympy" in this_feed_dict.keys():
            if len(this_feed_dict["sympy"]) > 0:
                try:
                    sympy_as_latex_per_feed_id[this_feed_dict["id"]] = (
                        latex_and_sympy.sympy_to_latex_str(this_feed_dict["sympy"])
                    )
                except Exception as err:
                    logger.error(
                        "converting to Sympy: "
                        + str(type(err).__name__)
                        + ": "
                        + str(err)
                    )
                    sympy_as_latex_per_feed_id[this_feed_dict["id"]] = (
                        "error converting"
                    )
            else:
                sympy_as_latex_per_feed_id[this_feed_dict["id"]] = (
                    "'sympy' key is empty"
                )
        else:
            sympy_as_latex_per_feed_id[this_feed_dict["id"]] = "no 'sympy' key"

    logger.info("[TRACE] end " + trace_id)
    return sympy_as_latex_per_feed_id


def get_sympy_as_latex_per_expr_id(list_of_expression_dicts):
    """
    This function edits the input argument, whereas the `feed` version does not.

    The error handling here is similar to `sympy_validate_expression/dimensional_consistency`
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    for index, this_expression_dict in enumerate(list_of_expression_dicts):
        if "sympy_lhs" in this_expression_dict.keys():
            try:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    latex_and_sympy.sympy_to_latex_str(
                        this_expression_dict["sympy_lhs"]
                    )
                )
            except AttributeError as err:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "AttributeError in get_sympy_as_latex_per_expr_id: " + str(err)
                )
            except TypeError as err:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "TypeError in get_sympy_as_latex_per_expr_id: " + str(err)
                )
            except tokenize.TokenError as err:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "tokenize.TokenError in get_sympy_as_latex_per_expr_id: " + str(err)
                )
        if "sympy_rhs" in this_expression_dict.keys():
            try:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    latex_and_sympy.sympy_to_latex_str(
                        this_expression_dict["sympy_rhs"]
                    )
                )
            except AttributeError as err:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "AttributeError in get_sympy_as_latex_per_expr_id: " + str(err)
                )
            except TypeError as err:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "TypeError in get_sympy_as_latex_per_expr_id: " + str(err)
                )
            except tokenize.TokenError as err:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "tokenize.TokenError in get_sympy_as_latex_per_expr_id: " + str(err)
                )

    logger.info("[TRACE] end " + trace_id)
    return list_of_expression_dicts


def get_dimensional_consistency_per_expression_id(
    graphDB_Driver, query_time_dict: query_timing_result_type
):
    """
    This function checks the dimensional consistency of ALL expressions in PDG
    That is relevant for 'list_expressions' and 'create_expression'

    TODO: a similar function for a restricted scope, like
    - all expressions for a specific derivation
    - editing one expression
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dimensional_consistency_per_expression_id = {}  # type: Dict[str, str]

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
        query_time_dict[
            "pdg_app/get_dimensional_consistency_per_expression_id: get_nodes_of_type expression "
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    dict_of_all_symbol_dicts, query_time_dict = get_dict_of_all_symbol_dicts(
        graphDB_Driver, query_time_dict
    )

    # TODO: Neo4j inside loop causes high latency
    for this_expression_dict in list_of_expression_dicts:
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_symbol_scalar_IDs_in_expression = session.read_transaction(
                neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
                "expression",
                this_expression_dict["id"],
                "scalar",
            )
            query_time_dict["pdg_app/symbols_in_expression: " + trace_id] = round(
                time.time() - query_start_time, 3
            )

        logger.info(
            "list_of_symbol_scalar_IDs_in_expression="
            + str(list_of_symbol_scalar_IDs_in_expression)
        )

        # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/83
        # # TODO
        # with graphDB_Driver.session() as session:
        #     query_start_time = time.time()
        #     list_of_symbol_vector_IDs_in_expression = session.read_transaction(
        #         neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
        #         "expression",
        #         this_expression_dict["id"],
        #         "vector",
        #     )
        #     query_time_dict["pdg_app/symbols_in_expression: " + trace_id] = round(
        #         time.time() - query_start_time, 3
        #     )

        # TODO: vector dimensions should be consistent

        # TODO: vector shape should be consistent

        # try:
        dimensional_consistency_per_expression_id[this_expression_dict["id"]] = (
            sympy_validate_expression.dimensional_consistency(
                this_expression_dict,
                list_of_symbol_scalar_IDs_in_expression,
                dict_of_all_symbol_dicts,
            )
        )
        # except Exception as err:

        #     dimensional_consistency_per_expression_id[this_expression_dict["id"]] = str(
        #         err
        #     )

    logger.info("[TRACE] end " + trace_id)
    return dimensional_consistency_per_expression_id, query_time_dict


def get_dict_of_node_type_for_every_id(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """
    >>> get_node_type_from_id()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_records = session.read_transaction(
            neo4j_query.get_list_of_all_node_IDs_and_labels
        )
        query_time_dict[
            "compute/to_edit_node: get_list_of_all_node_IDs_and_labels " + trace_id
        ] = round(time.time() - query_start_time, 3)

    # [{'n.id': '8379131', 'labels(n)': ['relation']},
    #  {'n.id': '2201316', 'labels(n)': ['relation']},
    #  {'n.id': '9729306', 'labels(n)': ['relation']},
    #  {'n.id': '3354598', 'labels(n)': ['operation']},
    #  {'n.id': '3018530', 'labels(n)': ['operation']},
    #  {'n.id': '1685753', 'labels(n)': ['operation']},
    #  {'n.id': '3682453', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '9472315', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '5141110', 'labels(n)': ['value_with_units']},
    #  {'n.id': '6266889', 'labels(n)': ['scalar', 'symbol']},
    #  {'n.id': '8800098', 'labels(n)': ['vector', 'symbol']},
    #  {'n.id': '8047316', 'labels(n)': ['vector', 'symbol']},
    #  {'n.id': '2587054', 'labels(n)': ['vector']}, {'n.id': '7688226', 'labels(n)': ['feed']}, {'n.id': '6529449', 'labels(n)': ['feed']}, {'n.id': '6529458', 'labels(n)': ['feed']}]

    dict_of_symbol_id_and_type = {}  # type: Dict[str,str]
    for this_dict in list_of_records:
        if len(this_dict["labels(n)"]) > 1:
            for symbol_category in this_dict["labels(n)"]:
                if symbol_category != "symbol":
                    dict_of_symbol_id_and_type[this_dict["n.id"]] = symbol_category
        else:  # there's just one node label
            dict_of_symbol_id_and_type[this_dict["n.id"]] = this_dict["labels(n)"][0]

    logger.info("[TRACE] end " + trace_id)
    return dict_of_symbol_id_and_type, query_time_dict


def remove_file_debris(
    list_of_paths_to_files: List[str],
    list_of_file_names: List[str],
    list_of_file_extensions: List[str],
) -> None:
    """

    Args:
        list_of_paths_to_files:
        list_of_file_names:
        list_of_file_extensions
    Returns:
        None

    Raises:

    >>> remove_file_debris(['/path/to/file/'],['filename_without_extension'], ['ext1', 'ext2'])
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    for path_to_file in list_of_paths_to_files:
        for file_name in list_of_file_names:
            for file_ext in list_of_file_extensions:
                if os.path.isfile(path_to_file + file_name + "." + file_ext):
                    os.remove(path_to_file + file_name + "." + file_ext)
    logger.info("[TRACE] end " + trace_id)
    return


def get_list_of_nonoperation_symbol_IDs_in_expression_or_feed(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_or_feed: str,
    expression_id: unique_numeric_id_as_str,
) -> Tuple[List[str], query_timing_result_type]:
    """
    TODO: eliminate this function
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed = session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "relation",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed relation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed scalar"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "vector",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed vector"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed matrix"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    logger.info("[TRACE] end " + trace_id)
    return list_of_symbol_IDs_in_expression_or_feed, query_time_dict


def get_list_of_all_nonoperation_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[list, query_timing_result_type]:
    """
    TODO: eliminate this function

    use for "new feed" when promoting existing symbols to feed

    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:scalar OR n:vector OR n:matrix
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>> get_list_of_all_nonoperation_symbol_dicts
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    list_of_nonoperation_symbol_dicts = []  # type: List[dict]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "scalar"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "vector"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "matrix"
        )
        query_time_dict[
            "compute/get_list_of_all_nonoperation_symbol_dicts, list_nodes_of_type"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_nonoperation_symbol_dicts.append(this_symbol_dict)

    logger.info("[TRACE] end " + trace_id)
    return list_of_nonoperation_symbol_dicts, query_time_dict


def get_dict_of_all_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """
    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:symbol
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>>
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dict_of_all_symbol_dicts = {}  # type: Dict[str,dict]

    dict_of_all_operation_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "operation"
    )
    for ke, val in dict_of_all_operation_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_scalar_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "scalar"
    )
    for ke, val in dict_of_all_scalar_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_vector_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "vector"
    )
    for ke, val in dict_of_all_vector_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    dict_of_all_matrix_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "matrix"
    )
    for ke, val in dict_of_all_matrix_dicts.items():
        dict_of_all_symbol_dicts[ke] = val

    logger.info("[TRACE] end " + trace_id)
    return dict_of_all_symbol_dicts, query_time_dict


def get_dict_of_all_nonoperation_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """
    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:symbol
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>>
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dict_of_all_nonoperation_symbol_dicts = {}  # type: Dict[str,dict]

    dict_of_all_scalar_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "scalar"
    )
    for ke, val in dict_of_all_scalar_dicts.items():
        dict_of_all_nonoperation_symbol_dicts[ke] = val

    dict_of_all_vector_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "vector"
    )
    for ke, val in dict_of_all_vector_dicts.items():
        dict_of_all_nonoperation_symbol_dicts[ke] = val

    dict_of_all_matrix_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "matrix"
    )
    for ke, val in dict_of_all_matrix_dicts.items():
        dict_of_all_nonoperation_symbol_dicts[ke] = val

    logger.info("[TRACE] end " + trace_id)
    return dict_of_all_nonoperation_symbol_dicts, query_time_dict


def get_dict_of_nonoperation_symbol_dicts_in_expression(
    expression_id: str, graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    dict_of_all_nonoperation_symbol_dicts, query_time_dict = (
        get_dict_of_all_nonoperation_symbol_dicts(graphDB_Driver, query_time_dict)
    )

    list_of_nonoperation_symbol_IDs_in_expression, query_time_dict = (
        get_list_of_nonoperation_symbol_IDs_in_expression_or_feed(
            graphDB_Driver, query_time_dict, "expression", expression_id
        )
    )

    logger.info(
        "list_of_nonoperation_symbol_IDs_in_expression="
        + str(list_of_nonoperation_symbol_IDs_in_expression)
    )

    dict_of_nonoperation_symbol_dicts_in_expression = {}
    for this_symbol_ID in list_of_nonoperation_symbol_IDs_in_expression:
        dict_of_nonoperation_symbol_dicts_in_expression[this_symbol_ID] = (
            dict_of_all_nonoperation_symbol_dicts[this_symbol_ID]
        )

    return dict_of_nonoperation_symbol_dicts_in_expression, query_time_dict


def get_dict_of_nonoperation_symbol_dicts_not_in_expression(
    expression_id: str, graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)
    dict_of_all_nonoperation_symbol_dicts, query_time_dict = (
        get_dict_of_all_nonoperation_symbol_dicts(graphDB_Driver, query_time_dict)
    )

    list_of_nonoperation_symbol_IDs_in_expression, query_time_dict = (
        get_list_of_nonoperation_symbol_IDs_in_expression_or_feed(
            graphDB_Driver, query_time_dict, "expression", expression_id
        )
    )

    dict_of_nonoperation_symbol_dicts_in_expression, query_time_dict = (
        get_dict_of_nonoperation_symbol_dicts_in_expression(
            expression_id, graphDB_Driver, query_time_dict
        )
    )

    dict_of_nonoperation_symbol_dicts_not_in_expression = {}  # TODO

    for this_symbol_id in dict_of_all_nonoperation_symbol_dicts.keys():
        if this_symbol_id not in dict_of_nonoperation_symbol_dicts_in_expression.keys():
            dict_of_nonoperation_symbol_dicts_not_in_expression[this_symbol_id] = (
                dict_of_all_nonoperation_symbol_dicts[this_symbol_id]
            )

    return dict_of_nonoperation_symbol_dicts_not_in_expression, query_time_dict


def get_dict_of_operation_dicts_in_expression(
    expression_id: str, graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dict_of_all_operation_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "operation"
    )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_IDs_in_expression = session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            "expression",
            expression_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_operation_dicts_in_expression get_list_of_symbol_IDs_per_category_in_expression_or_feed operation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    dict_of_operation_dicts_in_expression = {}

    for this_operation_ID in list_of_operation_IDs_in_expression:
        logger.info(
            "pdg_app/to_edit_expression: this_operation_ID=" + str(this_operation_ID)
        )
        dict_of_operation_dicts_in_expression[this_operation_ID] = (
            dict_of_all_operation_dicts[this_operation_ID]
        )
    logger.info(
        "pdg_app/to_edit_expression: dict_of_operation_dicts_in_expression="
        + str(dict_of_operation_dicts_in_expression)
    )

    return dict_of_operation_dicts_in_expression, query_time_dict


def get_dict_of_operation_dicts_not_in_expression(
    expression_id: str, graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dict_of_all_operation_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "operation"
    )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_IDs_in_expression = session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            "expression",
            expression_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_operation_dicts_not_in_expression get_list_of_symbol_IDs_per_category_in_expression_or_feed operation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    dict_of_operation_dicts_in_expression, query_time_dict = (
        get_dict_of_operation_dicts_in_expression(
            expression_id, graphDB_Driver, query_time_dict
        )
    )

    dict_of_operation_dicts_not_in_expression = {}

    for this_operation_id in dict_of_all_operation_dicts.keys():
        if this_operation_id not in dict_of_operation_dicts_in_expression.keys():
            dict_of_operation_dicts_not_in_expression[this_operation_id] = (
                dict_of_all_operation_dicts[this_operation_id]
            )

    return dict_of_operation_dicts_not_in_expression, query_time_dict


def get_dict_of_relation_dicts_not_in_expression(
    expression_id: str, graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    dict_of_all_relation_dicts, query_time_dict = get_dict_of_node_dicts(
        graphDB_Driver, query_time_dict, "relation"
    )

    logger.info("dict_of_all_relation_dicts=" + str(dict_of_all_relation_dicts))

    # what is the relation currently used in this expression?
    expression_dict = {}
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        expression_dict = session.read_transaction(
            neo4j_query.get_node_properties_from_id, "expression", expression_id
        )
        query_time_dict[
            "pdg_app/to_edit_expression: get_node_properties_from_id expression "
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    logger.info("pdg_app/to_edit_expression: expression_dict:" + str(expression_dict))
    logger.info("relation is " + str(expression_dict["latex_relation"]))

    dict_of_relation_dicts_not_in_expression = {}

    for relation_id in dict_of_all_relation_dicts.keys():
        if relation_id != expression_dict["latex_relation"]:
            dict_of_relation_dicts_not_in_expression[relation_id] = (
                dict_of_all_relation_dicts[relation_id]
            )

    return dict_of_relation_dicts_not_in_expression, query_time_dict


def get_dict_of_node_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type, node_type: str
) -> Tuple[dict, query_timing_result_type]:
    """
    >>> get_dict_of_node_dicts()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    assert node_type in list_of_valid.node_types
    # print("compute/get_dict_of_node_dicts: node type=", node_type)

    list_of_all_node_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_all_node_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, node_type
        )
        query_time_dict[
            "compute/get_dict_of_node_dicts, get_nodes_of_type "
            + node_type
            + " "
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_all_node_dicts=", list_of_all_node_dicts)

    dict_of_all_node_dicts = {}
    for this_node_dict in list_of_all_node_dicts:
        this_node_dict["node_type"] = node_type
        dict_of_all_node_dicts[this_node_dict["id"]] = this_node_dict
    # print("dict_of_all_node_dicts=", dict_of_all_node_dicts)

    logger.info("[TRACE] end " + trace_id)
    return dict_of_all_node_dicts, query_time_dict


def get_dict_of_derivations_used_per_inference_rule(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    list_of_inference_rule_dicts: list,
) -> Tuple[dict, query_timing_result_type]:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    # TODO: Neo4j inside loop causes high latency
    dict_of_derivations_used_per_inference_rule = {}
    for this_inference_rule_dict in list_of_inference_rule_dicts:
        list_of_derivations_that_use_this_inference_rule_id = []
        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_derivations_that_use_this_inference_rule_id = (
                session.read_transaction(
                    neo4j_query.get_derivations_that_use_inference_rule,
                    this_inference_rule_dict["id"],
                )
            )
            query_time_dict[
                "compute/get_dict_of_derivations_used_per_inference_rule: get_derivations_that_use_inference_rule"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
        logger.info(
            "list_of_derivations_that_use_this_inference_rule_id="
            + str(list_of_derivations_that_use_this_inference_rule_id)
        )
        # can't use set on a list of dicts
        # list_of_derivations_that_use_this_inference_rule_id = list(
        #    set(list_of_derivations_that_use_this_inference_rule_id)
        # )
        new_temp_dict = {}
        for this_derivation_dict in list_of_derivations_that_use_this_inference_rule_id:
            new_temp_dict[this_derivation_dict["id"]] = this_derivation_dict

        list_of_derivations_that_use_this_inference_rule_id = []
        for derivation_id, derivation_dict in new_temp_dict.items():
            list_of_derivations_that_use_this_inference_rule_id.append(derivation_dict)

        dict_of_derivations_used_per_inference_rule[this_inference_rule_dict["id"]] = (
            list_of_derivations_that_use_this_inference_rule_id
        )
    return dict_of_derivations_used_per_inference_rule, query_time_dict


def get_dict_of_steps_in_derivation(
    graphDB_Driver,
    derivation_id: unique_numeric_id_as_str,
    query_time_dict: query_timing_result_type,
):
    """
    >>> get_dict_of_steps_in_derivation()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    # list all steps in this derivation
    list_of_step_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: steps_in_this_derivation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    logger.info(
        "list of steps for" + str(derivation_id) + ":" + str(list_of_step_dicts)
    )

    # TODO: Neo4j inside loop causes high latency
    all_steps = {}
    for this_step_dict in list_of_step_dicts:
        logger.info('this_step_dict["id"]:' + this_step_dict["id"])
        (
            inference_rule_dict,
            list_of_input_dicts,
            list_of_feed_dicts,
            list_of_output_dicts,
            query_time_dict,
        ) = input_feed_output_infrule_for_step(
            graphDB_Driver, query_time_dict, this_step_dict["id"]
        )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            sequence_index = session.read_transaction(
                neo4j_query.get_step_has_sequence_index, this_step_dict["id"]
            )
            query_time_dict[
                "compute/get_dict_of_steps_in_derivation: get_step_has_sequence_index"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
        # print("sequence_index=", sequence_index)

        all_steps[this_step_dict["id"]] = {
            "sequence index": sequence_index,
            "inference rule dict": inference_rule_dict,
            "list of input dicts": list_of_input_dicts,
            "list of feed dicts": list_of_feed_dicts,
            "list of output dicts": list_of_output_dicts,
        }

    # sorting on `id` isn't relevant to rendered HTML tables.
    # sorted_all_steps = dict(sorted(all_steps.items()))
    # The `step index` is what matters to the user
    sorted_all_steps = dict(
        sorted(all_steps.items(), key=lambda item: item[1]["sequence index"])
    )

    logger.info("[TRACE] end " + trace_id)
    return sorted_all_steps, query_time_dict


def input_feed_output_infrule_for_step(
    graphDB_Driver, query_time_dict: query_timing_result_type, step_id: str
) -> Tuple[dict, List[dict], List[dict], List[dict], query_timing_result_type]:
    """
    >>> input_feed_output_infrule_for_step()
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    inference_rule_dict = {}
    list_of_input_dicts = []
    list_of_feed_dicts = []
    list_of_output_dicts = []

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        inference_rule_dict = session.read_transaction(
            neo4j_query.get_inference_rule_connected_to_step_ID, step_id
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: get_inference_rule_connected_to_step_ID"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("inference_rule_dict=", inference_rule_dict)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_input_dicts = session.read_transaction(
            neo4j_query.get_expressions_from_step_id_and_expr_type,
            step_id,
            "HAS_INPUT",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: get_expressions_from_step_id_and_expr_type HAS_INPUT"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_input_dicts=", list_of_input_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_feed_dicts = session.read_transaction(
            neo4j_query.get_expressions_from_step_id_and_expr_type,
            step_id,
            "HAS_FEED",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: get_expressions_from_step_id_and_expr_type, HAS_FEED"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_feed_dicts=", list_of_feed_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_output_dicts = session.read_transaction(
            neo4j_query.get_expressions_from_step_id_and_expr_type,
            step_id,
            "HAS_OUTPUT",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: get_expressions_from_step_id_and_expr_type, HAS_OUTPUT"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_output_dicts=", list_of_output_dicts)

    logger.info("[TRACE] end " + trace_id)
    return (
        inference_rule_dict,
        list_of_input_dicts,
        list_of_feed_dicts,
        list_of_output_dicts,
        query_time_dict,
    )


def remove_latex_presention_markings(latex_str: str) -> str:
    """
    clean the latex string

    based on the struggle with spacing,
    https://github.com/sympy/sympy/issues/19075#issuecomment-633643570
    BHP realized removing the presentation-related aspects would make the task for Sympy easier

    >>> remove_latex_presention_markings('a\\ b = c')
    'a b = c'
    """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] start " + trace_id)

    logger.info("latex to be cleaned: " + latex_str)

    if "\\left." in latex_str:
        latex_str = latex_str.replace("\\left.", "")
    if "\\right." in latex_str:
        latex_str = latex_str.replace("\\right.", "")
    if "\\left|" in latex_str:
        latex_str = latex_str.replace("\\left|", "|")
    if "\\right|" in latex_str:
        latex_str = latex_str.replace("\\right|", "|")
    if "\\left(" in latex_str:
        latex_str = latex_str.replace("\\left(", "(")
    if "\\right)" in latex_str:
        latex_str = latex_str.replace("\\right)", ")")
    if "\\," in latex_str:
        # logger.debug("found space \\,")
        latex_str = latex_str.replace("\\,", " ")  # thinspace
    if "\\ " in latex_str:
        # logger.debug("found space \\ ")
        latex_str = latex_str.replace("\\ ", " ")
    if "\\;" in latex_str:
        # logger.debug("found space \\;")
        latex_str = latex_str.replace("\\;", " ")  # thick space
    if "\\:" in latex_str:
        # logger.debug("found space \\:")
        latex_str = latex_str.replace("\\:", " ")  # medium space
    if "\\!" in latex_str:
        # logger.debug("found space \\!")
        latex_str = latex_str.replace("\\!", " ")  # negative space
    if "\\;" in latex_str:
        # logger.debug("found space \\ ")
        latex_str = latex_str.replace("\\ ", " ")
    if "\\quad" in latex_str:
        # logger.debug("found space \\quad")
        latex_str = latex_str.replace("\\quad", " ")
    if "\\qquad" in latex_str:
        # logger.debug("found space \\qquad")
        latex_str = latex_str.replace("\\qquad", " ")

    logger.info("latex after cleaning: " + latex_str)

    logger.info("[TRACE] end " + trace_id)
    return latex_str


# EOF
