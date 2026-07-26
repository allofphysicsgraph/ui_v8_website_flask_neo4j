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
from typing import (
    NewType,
    Dict,
    List,
    Tuple,
    Any,
    Union,
    TypeAlias,
    Optional,
)  # for type hinting

from . import neo4j_query
from . import list_of_valid
from . import sympy_validate_expression
from . import latex_and_sympy
from .tracing import trace_execution, trace_id_var

from .custom_types import unique_numeric_id_as_str, query_timing_result_type


import logging

# TODO: file created in `static` isn't persistent across restarts of the Docker image
# Perhaps this should be in "dumpinggrounds" instead since that is persistent?
shorten_url_file = "static/url_shorten_expand.csv"

logger = logging.getLogger(__name__)


@trace_execution
def generate_random_id(
    graphDB_Driver: Any, query_time_dict: query_timing_result_type
) -> Tuple[unique_numeric_id_as_str, query_timing_result_type]:
    """Suggest a 10-digit id that, as of a moment ago, was not in use.

    create statically defined numeric IDs for nodes in the graph

    The node IDs that Neo4j assigns internally are not static,
    so they can't be used for the Physics Derivation Graph

    Claude Sonnet 5 'high' says: This is an optimization, not a correctness guarantee. The
    existence check reads a snapshot of ids into memory and is evaluated outside
    of any write transaction, so two concurrent callers can easily be handed the
    same "unused" id - with a large enough id space this is rare per call, but not
    rare enough to ignore. Actual uniqueness is enforced by the database's
    constraint on (:a_node {id}) (see neo4j_query.constrain_unique_id) at the
    moment the node is created. Callers that create a node from an id returned
    here MUST go through create_node_with_unique_id below, which retries this
    function on a collision, rather than calling generate_random_id + a raw
    write_transaction directly.
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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
    # logger.info("[TRACE] end " + trace_id)
    return str(new_id), query_time_dict


@trace_execution
def create_node_with_unique_id(
    graphDB_Driver: Any,
    query_time_dict: query_timing_result_type,
    create_fn: Any,
    build_args: Any,
    max_attempts: int = 5,
    trace_label: str = "",
) -> Tuple[unique_numeric_id_as_str, Any, query_timing_result_type]:
    """Generate an id and create a node with it, retrying with a fresh id if that
    id turns out to collide with an existing node.

    This is the one correct way to pair generate_random_id() with a node-creation
    write: generate_random_id() only offers a probably-unused id, and the actual
    guarantee comes from the database's uniqueness constraint on (:a_node {id})
    plus the retry loop here. `create_fn` MUST be a neo4j_query write-transaction
    function, i.e. callable(tx, *args), that CREATEs (never MERGEs) the node
    holding the new id, and raises neo4j_query.NodeIdCollisionError if that id is
    already taken (every add_* function in neo4j_query.py that creates a node from
    a freshly generated id follows this contract).

    Args:
        create_fn: e.g. neo4j_query.add_scalar_symbol, neo4j_query.add_derivation,
            neo4j_query.connect_step_to_derivation, etc.
        build_args: callable(candidate_id: str) -> tuple of positional args to pass
            to create_fn after tx. The candidate id can appear anywhere in that
            tuple (e.g. add_constant_value_with_units expects the parent scalar_id
            first and the new value_with_units_id second).
        max_attempts: number of ids to try before giving up.

    Returns:
        (new_id, create_fn_result, query_time_dict). create_fn_result is whatever
        create_fn returned on the attempt that succeeded (e.g. True/False for a
        duplicate-name check unrelated to id collisions, or a dict/None for
        connect_step_to_derivation) - it is passed through untouched so existing
        callers can keep checking it exactly as before.

    Raises:
        RuntimeError: if max_attempts consecutive ids all collided. With a
        10-digit id space this signals something is badly wrong (e.g. the id
        space is nearly exhausted, or generate_random_id's existence check is
        broken) rather than ordinary bad luck, so this is deliberately not
        swallowed - it should surface as a 500 rather than fail silently.
    """
    trace_id = trace_id_var.get()
    # logger.info(
    #     "[TRACE] start " + trace_id + " create_node_with_unique_id: " + trace_label
    # )
    last_error: Optional[Exception] = None
    for attempt in range(1, max_attempts + 1):
        candidate_id, query_time_dict = generate_random_id(
            graphDB_Driver, query_time_dict
        )
        args = build_args(candidate_id)
        try:
            with graphDB_Driver.session() as session:
                query_start_time = time.time()
                result = session.write_transaction(create_fn, *args)
                query_time_dict[
                    "compute/create_node_with_unique_id: "
                    + trace_label
                    + " attempt_"
                    + str(attempt)
                    + " "
                    + trace_id
                ] = round(time.time() - query_start_time, 3)
            logger.info("[TRACE] end " + trace_id)
            return (candidate_id, result, query_time_dict)
        except neo4j_query.NodeIdCollisionError as err:
            last_error = err
            logger.warning(
                "compute/create_node_with_unique_id: id collision on attempt "
                + str(attempt)
                + " for "
                + trace_label
                + ": "
                + str(candidate_id)
                + "; retrying with a new id"
            )
            continue
    # logger.error(
    #     "[TRACE] end " + trace_id + " - exhausted " + str(max_attempts) + " attempts"
    # )
    raise RuntimeError(
        f"create_node_with_unique_id: could not generate a unique id for {trace_label} after {max_attempts} attempts"
    ) from last_error


@trace_execution
def get_placement_options(
    list_of_sequence_values: List[str], selected_sequence_index: str
) -> List[str]:
    """
    This function identifies where a step could be re-ordered to

    >>> list_of_str = ['a', 'c', 'f', 'm', 'p', 'u']
    >>> selected = 'f'
    >>> get_placement_options(list_of_str, selected)
    """
    if len(list_of_sequence_values) == 0:
        logger.error("empty list provided")
        return [""]

    if selected_sequence_index not in list_of_sequence_values:
        logger.error(
            selected_sequence_index
            + " not in list_of_sequence_values="
            + str(list_of_sequence_values)
        )
        return [""]

    # Identify the current position
    current_idx = list_of_sequence_values.index(selected_sequence_index)
    others = [x for (i, x) in enumerate(list_of_sequence_values) if i != current_idx]
    n = len(others)

    options = []  # type: List[str]

    # Iterate through all possible gaps in the 'others' list
    # There are n + 1 possible insertion points
    for i in range(n + 1):
        # Skip the position that would result in the current ordering
        # Moving the element to its current index in the 'others' list
        # is functionally doing nothing.
        if i == current_idx:
            continue

        if i == 0:
            options.append(f"before '{others[0]}'")
        elif i == n:
            options.append(f"after '{others[-1]}'")
        else:
            options.append(f"between '{others[i-1]}' and '{others[i]}'")

    return options


@trace_execution
def guess_sympy_from_expression(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_dict: dict,
) -> Tuple[query_timing_result_type, Optional[str], Optional[str]]:
    """
    guess the SymPy based on the Latex
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    cleaned_latex_lhs_str = remove_latex_presention_markings(
        expression_dict["latex_lhs"]
    )
    logger.info("cleaned_latex_lhs_str=" + str(cleaned_latex_lhs_str))

    cleaned_latex_rhs_str = remove_latex_presention_markings(
        expression_dict["latex_rhs"]
    )
    logger.info("cleaned_latex_rhs_str=" + str(cleaned_latex_rhs_str))

    try:
        sympy_expr_lhs = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
            cleaned_latex_lhs_str
        )
    except Exception as err:
        logger.error("sympy_expr_lhs: " + str(type(err).__name__) + str(err))
        sympy_expr_lhs = None

    logger.info("sympy_expr_lhs= " + str(sympy_expr_lhs))

    try:
        sympy_expr_rhs = latex_and_sympy.cleaned_latex_str_to_sympy_expression(
            cleaned_latex_rhs_str
        )
    except Exception as err:
        logger.error("sympy_expr_rhs: " + str(type(err).__name__) + str(err))
        sympy_expr_rhs = None

    logger.info("sympy_expr_rhs= " + str(sympy_expr_rhs))

    # list_of_sympy_symbols = latex_and_sympy.list_of_sympy_symbols_in_sympy_expression(sympy_expr)
    # logger.info("list_of_sympy_symbols=",list_of_sympy_symbols)

    # look at each sympy_symbol replaced with PDG symbol

    # TODO:
    symbol_id_dict = {}  # type: Dict[str, str]
    try:
        revised_expr_lhs = sympy_validate_expression.convert_sympy_expr_to_pdg_symbols(
            sympy_expr_lhs, symbol_id_dict
        )
    except Exception as err:
        logger.error("revised_expr_lhs = " + str(type(err).__name__) + str(err))
        revised_expr_lhs = None
    try:
        revised_expr_rhs = sympy_validate_expression.convert_sympy_expr_to_pdg_symbols(
            sympy_expr_rhs, symbol_id_dict
        )
    except Exception as err:
        logger.error("revised_expr_rhs = " + str(type(err).__name__) + str(err))
        revised_expr_rhs = None

    logger.info(
        "revised_expr_lhs,rhs=" + str(revised_expr_lhs) + " " + str(revised_expr_rhs)
    )

    revised_expr_lhs_with_str = None
    revised_expr_rhs_with_str = None

    if revised_expr_lhs:
        revised_expr_lhs_with_str = re.sub(
            r"(pdg\d\d\d\d\d\d\d)", r"Symbol('\1')", str(revised_expr_lhs)
        )

    if revised_expr_rhs:
        revised_expr_rhs_with_str = re.sub(
            r"(pdg\d\d\d\d\d\d\d)", r"Symbol('\1')", str(revised_expr_rhs)
        )

    logger.info("revised_expr_lhs_with_str=" + str(revised_expr_lhs_with_str))
    logger.info("revised_expr_rhs_with_str=" + str(revised_expr_rhs_with_str))

    # logger.info("[TRACE] end " + trace_id)
    return query_time_dict, revised_expr_lhs_with_str, revised_expr_rhs_with_str


@trace_execution
def guess_operations_from_latex(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_dict: dict,
) -> Tuple[query_timing_result_type, List[dict]]:
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "operation"
        )
        query_time_dict[
            "pdg_app/to_add_symbols_and_operations_for_expression, get_nodes_of_type operation "
            + trace_id
        ] = round(time.time() - query_start_time, 3)

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

    # TODO
    potential_operations_found_in_Latex_expression = list_of_operation_dicts

    # Prompt used:
    # I have a list of dictionaries in Python and one of the keys in each dictionary is latex.
    # How do I sort that list of dictionaries by the values for the key latex?
    potential_operations_found_in_Latex_expression = sorted(
        potential_operations_found_in_Latex_expression,
        key=lambda x: x["latex"].lower(),
    )

    logger.info(
        "potential_operations_found_in_Latex_expression="
        + str(potential_operations_found_in_Latex_expression)
    )

    # logger.info("[TRACE] end " + trace_id)
    return query_time_dict, potential_operations_found_in_Latex_expression


@trace_execution
def guess_symbols_from_latex(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_dict: dict,
) -> Tuple[query_timing_result_type, List[dict], List[dict]]:
    """
    after users enter latex, guess which symbols they want to associate with expression

    The naive option would be to return to the user the complete list of
    symbols and then ask the user to select relevant symbols.

    There are multiple tactics to enact that are more clever:

    - given a Latex expression, use SymPy to identify possible symbols.

      and, separately

    - given a Latex expression, and given all existing symbols, return a list of matching symbols

    The first tactic is likely to result in an undercount,
    the second tactic will result in an overcount.

    I'll use keyword `SYMBOL_SEARCH_SYMPY` for the first tactic and
                     `SYMBOL_SEARCH_LATEX` for the second tactic.
    Order doesn't matter for the two tactics since they are independent.

    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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
        logger.error("sympy_expr_lhs: " + str(type(err).__name__) + str(err))
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
        logger.error("sympy_expr_rhs: " + str(type(err).__name__) + str(err))
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

    # Prompt used:
    # I have a list of dictionaries in Python and one of the keys in each dictionary is latex.
    # How do I sort that list of dictionaries by the values for the key latex?
    potential_symbols_found_in_Latex_expression = sorted(
        potential_symbols_found_in_Latex_expression,
        key=lambda x: x["latex"].lower(),
    )

    logger.info(
        "potential_symbols_found_in_Latex_expression="
        + str(potential_symbols_found_in_Latex_expression)
    )

    # logger.info("[TRACE] end " + trace_id)
    return query_time_dict, potential_symbols_found_in_Latex_expression


@trace_execution
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
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    hashed_str = hashlib.sha256(str_to_hash.encode("utf-8")).hexdigest()

    # logger.info("[TRACE] end " + trace_id)
    return hashed_str


@trace_execution
def encode_user_identifier(user_identifier: str) -> str:
    """ """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)
    user_id = user_identifier.strip().lower()
    hash_object = hashlib.sha256(user_id.encode("utf-8"))
    hex_dig = hash_object.hexdigest()
    # logger.info("[TRACE] end " + trace_id)
    return hex_dig


@trace_execution
def generate_lookup_for_shorten_url(shorten_url_file: str) -> str:
    """
    TODO: if URL already exists in CSV, then just return existing lookup
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    # logger.info("[TRACE] end " + trace_id)
    return random_string


@trace_execution
def add_url_to_shortened_list(
    now_str: str, current_user_email: Optional[str], user_url: str
) -> str:
    """
    User's email is part of the database in case someone decides to put something naughty in the database

    User's email is hashed because the database is exposed publicly on the website
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    # logger.info("[TRACE] end " + trace_id)
    return lookup


def get_url_from_shortened_list(lookup: str) -> Tuple[str, str]:
    """
    Given the `lookup`, what is the URL?

    TODO: increment the "count" column
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    # logger.info("[TRACE] end " + trace_id)
    return "ERROR: lookup " + lookup + " not found", None


def send_email_with_msmtp(
    recipients: Union[str, List[str]], subject: str, body: str, from_address: str
) -> Tuple[bool, str]:
    """
    Sends an email using the system's msmtp command.

    https://github.com/allofphysicsgraph/task-tracker/issues/137

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
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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
    graphDB_Driver: Any,
    query_time_dict: query_timing_result_type,
    inference_rule_name: str,
    inference_rule_latex: str,
) -> Tuple[bool, str, query_timing_result_type]:
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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
            logger.info("[TRACE] end " + trace_id)
            return (
                True,
                "INVALID INPUT: inference rule with that name already exists",
                query_time_dict,
            )

        if inference_rule_latex == inference_rule_dict["latex"]:
            logger.info("[TRACE] end " + trace_id)
            return (
                True,
                "INVALID INPUT: inference rule with that latex already exists",
                query_time_dict,
            )

    logger.info("[TRACE] end " + trace_id)
    return False, "no message", query_time_dict


def get_sympy_as_latex_per_feed_id(
    list_of_feed_dicts: List[dict],
) -> Dict[str, str]:
    """ """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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


def get_sympy_as_latex_per_expr_id(
    list_of_expression_dicts: List[dict],
) -> List[dict]:
    """
    This function edits the input argument, whereas the `feed` version does not.

    The error handling here is similar to `sympy_validate_expression/dimensional_consistency`
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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


@trace_execution
def get_dimensional_consistency_for_every_expression(
    graphDB_Driver: Any, query_time_dict: query_timing_result_type
) -> Tuple[Dict[str, str], query_timing_result_type]:
    """
    This function checks the dimensional consistency of ALL expressions in PDG
    That is relevant for 'list_expressions' and 'create_expression'

    TODO: a similar function for a restricted scope, like
    - all expressions for a specific derivation
    - editing one expression
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    dimensional_consistency_per_expression_id = {}  # type: Dict[str, str]

    # list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_nodes_of_type, "expression"
        )
        query_time_dict[
            "pdg_app/get_dimensional_consistency_for_every_expression: get_nodes_of_type expression "
            + trace_id
        ] = round(time.time() - query_start_time, 3)

        # with graphDB_Driver.session() as session:
        for this_expression_dict in list_of_expression_dicts:

            query_start_time = time.time()
            symbols_in_expression = session.read_transaction(
                neo4j_query.get_symbols_for_expression, this_expression_dict["id"]
            )
            query_time_dict[
                "pdg_app/get_dimensional_consistency_for_every_expression: get_symbols_for_expression "
                + this_expression_dict["id"]
                + trace_id
            ] = round(time.time() - query_start_time, 3)

            # TODO: vector dimensions should be consistent
            # TODO: vector shape should be consistent
            # https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/83

            # try:
            dimensional_consistency_per_expression_id[this_expression_dict["id"]] = (
                sympy_validate_expression.dimensional_consistency(
                    this_expression_dict, symbols_in_expression
                )
            )
        # except Exception as err:

        #     dimensional_consistency_per_expression_id[this_expression_dict["id"]] = str(
        #         err
        #     )

    # logger.info("[TRACE] end " + trace_id)
    return dimensional_consistency_per_expression_id, query_time_dict


@trace_execution
def get_dict_of_node_type_for_every_id(
    graphDB_Driver: Any, query_time_dict: query_timing_result_type
) -> Tuple[Dict[str, str], query_timing_result_type]:
    """
    >>> get_node_type_from_id()
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    dict_of_symbol_id_and_type = {}
    for this_dict in list_of_records:
        labels = this_dict["labels(n)"]
        # Filter for the specific node type using list_of_valid.node_types
        specific_types = [
            lbl
            for lbl in labels
            if lbl in list_of_valid.node_types and lbl not in ("symbol", "a_node")
        ]
        if specific_types:
            dict_of_symbol_id_and_type[this_dict["n.id"]] = specific_types[0]
        else:
            # Fallback to first label if no matches found
            dict_of_symbol_id_and_type[this_dict["n.id"]] = (
                labels[0] if labels else "unknown"
            )

    # logger.info("[TRACE] end " + trace_id)
    return dict_of_symbol_id_and_type, query_time_dict


@trace_execution
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
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    for path_to_file in list_of_paths_to_files:
        for file_name in list_of_file_names:
            for file_ext in list_of_file_extensions:
                if os.path.isfile(path_to_file + file_name + "." + file_ext):
                    os.remove(path_to_file + file_name + "." + file_ext)
    # logger.info("[TRACE] end " + trace_id)
    return


@trace_execution
def get_symbols_not_in_expression(
    expression_dict: dict,
    symbols_in_expression: List[dict],
    graphDB_Driver: Any,
    query_time_dict: query_timing_result_type,
) -> Tuple[List[dict], query_timing_result_type]:
    """ """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    logger.info("symbols_in_expression=" + str(symbols_in_expression))

    logger.info("expression_dict=" + str(expression_dict))

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        all_symbols = session.read_transaction(neo4j_query.get_symbols)
        query_time_dict[
            "compute/get_symbols_not_in_expression, get_symbols " + trace_id
        ] = round(time.time() - query_start_time, 3)

    logger.info("all_symbols= " + str(all_symbols))

    all_symbol_IDs = []
    for this_symbol in all_symbols:
        all_symbol_IDs.append(this_symbol["id"])

    logger.info("all_symbol_IDs=" + str(all_symbol_IDs))

    symbol_IDs_in_expression = []
    for this_symbol in symbols_in_expression:
        symbol_IDs_in_expression.append(this_symbol["id"])

    logger.info("symbol_IDs_in_expression=" + str(symbol_IDs_in_expression))

    candidate_symbols = []

    for this_symbol_ID in all_symbol_IDs:
        if this_symbol_ID not in symbol_IDs_in_expression:
            candidate_symbols.append(this_symbol_ID)

    symbols_not_in_expression_but_might_be_relevant = []
    # given list of candidate symbols that are not currently associated with expression,
    # does the symbol latex match LHS str or RHS str? If yes, symbols_not_in_expression.append(this_symbol_id)
    for this_symbol in all_symbols:
        if this_symbol["id"] in candidate_symbols:
            if (this_symbol["latex"] in expression_dict["latex_lhs"]) or (
                this_symbol["latex"] in expression_dict["latex_rhs"]
            ):
                symbols_not_in_expression_but_might_be_relevant.append(this_symbol)

    # Prompt used:
    # I have a list of dictionaries in Python and one of the keys in each dictionary is latex.
    # How do I sort that list of dictionaries by the values for the key latex?
    symbols_not_in_expression_but_might_be_relevant = sorted(
        symbols_not_in_expression_but_might_be_relevant,
        key=lambda x: x["latex"].lower(),
    )

    # logger.info("[TRACE] end " + trace_id)
    return symbols_not_in_expression_but_might_be_relevant, query_time_dict


@trace_execution
def get_operations_not_in_expression(
    expression_dict: dict,
    operations_in_expression: List[dict],
    graphDB_Driver: Any,
    query_time_dict: query_timing_result_type,
) -> Tuple[List[dict], query_timing_result_type]:
    """ """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    logger.info("operations_in_expression=" + str(operations_in_expression))

    logger.info("expression_dict=" + str(expression_dict))

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        all_operations = session.read_transaction(neo4j_query.get_operations)
        query_time_dict[
            "compute/get_operations_not_in_expression, get_operations " + trace_id
        ] = round(time.time() - query_start_time, 3)

    logger.info("all_operations= " + str(all_operations))

    all_operation_IDs = []
    for this_operation in all_operations:
        all_operation_IDs.append(this_operation["id"])

    operation_IDs_in_expression = []
    for this_operation in operations_in_expression:
        operation_IDs_in_expression.append(this_operation["id"])

    candidate_operations = []

    for this_operation_ID in all_operation_IDs:
        if this_operation_ID not in operation_IDs_in_expression:
            candidate_operations.append(this_operation_ID)

    operations_not_in_expression_but_might_be_relevant = []
    # given list of candidate operations that are not currently associated with expression,
    # does the operation latex match LHS str or RHS str? If yes, operations_not_in_expression.append(this_operation_id)
    for this_operation in all_operations:
        if this_operation["id"] in candidate_operations:
            if (this_operation["latex"] in expression_dict["latex_lhs"]) or (
                this_operation["latex"] in expression_dict["latex_rhs"]
            ):
                operations_not_in_expression_but_might_be_relevant.append(
                    this_operation
                )

    # logger.info("[TRACE] end " + trace_id)
    return operations_not_in_expression_but_might_be_relevant, query_time_dict


@trace_execution
def get_relations_not_in_expression(
    expression_dict: dict,
    relation_latex: str,
    graphDB_Driver: Any,
    query_time_dict: query_timing_result_type,
) -> Tuple[List[dict], query_timing_result_type]:
    """ """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    logger.info("expression_dict=" + str(expression_dict))

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        all_relations = session.read_transaction(neo4j_query.get_relations)
        query_time_dict[
            "compute/get_relations_not_in_expression, get_relations " + trace_id
        ] = round(time.time() - query_start_time, 3)

    logger.info("all_relations= " + str(all_relations))

    candidate_relations = []

    for this_relation in all_relations:
        if this_relation["latex"] != relation_latex:
            candidate_relations.append(this_relation)

    # logger.info("[TRACE] end " + trace_id)
    return candidate_relations, query_time_dict


@trace_execution
def get_dict_of_node_dicts(
    graphDB_Driver: Any, query_time_dict: query_timing_result_type, node_type: str
) -> Tuple[Dict[str, dict], query_timing_result_type]:
    """
    >>> get_dict_of_node_dicts()
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    # logger.info("[TRACE] end " + trace_id)
    return dict_of_all_node_dicts, query_time_dict


@trace_execution
def get_dict_of_steps_in_derivation(
    graphDB_Driver: Any,
    derivation_id: unique_numeric_id_as_str,
    query_time_dict: query_timing_result_type,
) -> Tuple[Dict[str, dict], query_timing_result_type]:
    """
    returns dict with keys "step ID" and value dict with keys
    - sequence index
    - infrule dict
    - list of input dicts
    - list of feed dicts
    - list of output dicts
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

    # list all steps in this derivation

    all_steps = {}

    # list_of_steps = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_steps = session.read_transaction(
            neo4j_query.get_list_of_steps_in_this_derivation, derivation_id
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: steps_in_this_derivation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
        logger.info(
            "list of steps for " + str(derivation_id) + ":" + str(list_of_steps)
        )

        for this_step_dict in list_of_steps:
            logger.info("step id:" + this_step_dict["id"])

            # inference_rule_dict = {}
            # list_of_input_dicts = [] # type: List[dict]
            # list_of_feed_dicts = [] # type: List[dict]
            # list_of_output_dicts = [] # type: List[dict]

            query_start_time = time.time()
            inference_rule_dict = session.read_transaction(
                neo4j_query.get_inference_rule_connected_to_step_ID,
                this_step_dict["id"],
            )
            query_time_dict[
                "compute/input_feed_output_infrule_for_step: get_inference_rule_connected_to_step_ID"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
            # print("inference_rule_dict=", inference_rule_dict)
            # with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_input_dicts = session.read_transaction(
                neo4j_query.get_expressions_from_step_id_and_expr_type,
                this_step_dict["id"],
                "HAS_INPUT",
            )
            query_time_dict[
                "compute/input_feed_output_infrule_for_step: get_expressions_from_step_id_and_expr_type HAS_INPUT"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
            # print("list_of_input_dicts=", list_of_input_dicts)
            # with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_feed_dicts = session.read_transaction(
                neo4j_query.get_expressions_from_step_id_and_expr_type,
                this_step_dict["id"],
                "HAS_FEED",
            )
            query_time_dict[
                "compute/input_feed_output_infrule_for_step: get_expressions_from_step_id_and_expr_type, HAS_FEED"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
            # print("list_of_feed_dicts=", list_of_feed_dicts)
            # with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_output_dicts = session.read_transaction(
                neo4j_query.get_expressions_from_step_id_and_expr_type,
                this_step_dict["id"],
                "HAS_OUTPUT",
            )
            query_time_dict[
                "compute/input_feed_output_infrule_for_step: get_expressions_from_step_id_and_expr_type, HAS_OUTPUT"
                + trace_id
            ] = round(time.time() - query_start_time, 3)
            # print("list_of_output_dicts=", list_of_output_dicts)

            query_start_time = time.time()
            sequence_index = session.read_transaction(
                neo4j_query.get_sequence_index_for_step, this_step_dict["id"]
            )
            query_time_dict[
                "compute/get_dict_of_steps_in_derivation: get_sequence_index_for_step"
                + trace_id
            ] = round(time.time() - query_start_time, 3)

            all_steps[this_step_dict["id"]] = {
                "sequence index": sequence_index,
                "step dict": this_step_dict,
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

    # logger.info("[TRACE] end " + trace_id)
    return sorted_all_steps, query_time_dict


# def input_feed_output_infrule_for_step(
#     graphDB_Driver, query_time_dict: query_timing_result_type, step_id: str
# ) -> Tuple[dict, List[dict], List[dict], List[dict], query_timing_result_type]:
#     """
#     >>> input_feed_output_infrule_for_step()
#     """
#     trace_id = str(uuid.uuid4())
#     logger.info("[TRACE] start " + trace_id)


#     logger.info("[TRACE] end " + trace_id)
#     return (
#         inference_rule_dict,
#         list_of_input_dicts,
#         list_of_feed_dicts,
#         list_of_output_dicts,
#         query_time_dict,
#     )


@trace_execution
def remove_latex_presention_markings(latex_str: str) -> str:
    """
    clean the latex string

    based on the struggle with spacing,
    https://github.com/sympy/sympy/issues/19075#issuecomment-633643570
    BHP realized removing the presentation-related aspects would make the task for Sympy easier

    >>> remove_latex_presention_markings('a\\ b = c')
    'a b = c'
    """
    trace_id = trace_id_var.get()
    # logger.info("[TRACE] start " + trace_id)

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

    # logger.info("[TRACE] end " + trace_id)
    return latex_str


# EOF
