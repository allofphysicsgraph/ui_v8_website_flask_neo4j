#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

""" """

import os
import random
import time
import tokenize
import neo4j_query
import list_of_valid
import sympy_validate_expression
import latex_and_sympy
import re

# https://docs.python.org/3/library/typing.html
# inspired by https://news.ycombinator.com/item?id=33844117
from typing import NewType, Dict, List, Tuple, Any, Union  # for type hinting

# ORDERING: this has to come before the functions that use this type
unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)
query_timing_result_type = NewType("query_timing_result_type", Dict[str, float])

import logging

logger = logging.getLogger(__name__)


def generate_random_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, node_type: str
) -> Tuple[unique_numeric_id_as_str, query_timing_result_type]:
    """
    create statically defined numeric IDs for nodes in the graph

    The node IDs that Neo4j assigns internally are not static,
    so they can't be used for the Physics Derivation Graph
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)
    # print("node_type=", node_type)

    try:
        assert node_type in list_of_valid.node_types
    except Exception as err:
        logger.info("error=" + str(err))

    list_of_existing_IDs = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_existing_IDs = session.read_transaction(
            neo4j_query.get_list_IDs, node_type
        )
        query_time_dict[
            "compute/generate_random_id: get_list_IDs" + node_type + " " + trace_id
        ] = round(time.time() - query_start_time, 3)

    found_new_ID = False
    while not found_new_ID:
        new_id = str(random.randint(1000000, 9999999))
        if new_id not in list_of_existing_IDs:
            found_new_ID = True

    logger.info("new_id=" + str(new_id))
    logger.info("[TRACE] compute/generate_random_id end " + trace_id)
    return str(new_id), query_time_dict


# def convert_expr_sympy_pdg_symbols_to_neo4j_edge(
#     graphDB_Driver, query_time_dict: query_timing_result_type
# ):
#     """
#    in the content imported from ui_v7's JSON there's no use of HAS_SYMBOL edges.
#    That's because in ui_v7 the JSON deduced the symbol membership from "AST"
#
#    This one-time-use function
#    1) detects all 'pdg' in the sympy for expr
#    2) adds 'HAS_SYMBOL' edge to the expression and symbol
#
#    """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] start " + trace_id)

#     # get all expressions
#     with graphDB_Driver.session() as session:
#         query_start_time = time.time()
#         list_of_expression_dicts = session.read_transaction(
#             neo4j_query.get_list_node_dicts_of_type, "expression"
#         )
#         query_time_dict[
#             "compute/convert_expr_sympy_pdg_symbols_to_neo4j_edge: list_nodes_of_type expression"
#             + trace_id
#         ] = round(time.time() - query_start_time, 3)

#     # get all symbols
#     with graphDB_Driver.session() as session:
#         query_start_time = time.time()
#         list_of_symbol_dicts = session.read_transaction(
#             neo4j_query.get_list_node_dicts_of_type, "symbol"
#         )
#         query_time_dict[
#             "compute/convert_expr_sympy_pdg_symbols_to_neo4j_edge: list_nodes_of_type symbol"
#             + trace_id
#         ] = round(time.time() - query_start_time, 3)

#     for this_expression_dict in list_of_expression_dicts:
#         list_of_pdg_symbols_found = []
#         if "sympy_lhs" in this_expression_dict.keys():
#             list_of_pdg_symbols_found += re.findall(
#                 r"pdg\d\d\d\d\d\d\d", this_expression_dict["sympy_lhs"]
#             )
#         if "sympy_rhs" in this_expression_dict.keys():
#             list_of_pdg_symbols_found += re.findall(
#                 r"pdg\d\d\d\d\d\d\d", this_expression_dict["sympy_rhs"]
#             )
#         if "sympy" in this_expression_dict.keys():
#             list_of_pdg_symbols_found += re.findall(
#                 r"pdg\d\d\d\d\d\d\d", this_expression_dict["sympy"]
#             )
#         list_of_pdg_symbols_found = list(set(list_of_pdg_symbols_found))

#         logger.info("list_of_pdg_symbols_found = " + str(list_of_pdg_symbols_found))

#         expression_id = this_expression_dict["id"]

#         for this_pdg_symbol in list_of_pdg_symbols_found:

#             symbol_id_to_add = this_pdg_symbol[3:]

#             with graphDB_Driver.session() as session:
#                 query_start_time = time.time()
#                 list_of_node_labels = session.read_transaction(
#                     neo4j_query.get_node_labels_from_property, "id", symbol_id_to_add
#                 )
#                 query_time_dict[
#                     "compute/convert_expr_sympy_pdg_symbols_to_neo4j_edge: get_node_labels_from_property"
#                     + trace_id
#                 ] = round(time.time() - query_start_time, 3)

#             # logger.info("list_of_node_labels = " + str(list_of_node_labels))

#             if len(list_of_node_labels) > 1:
#                 logger.critical("WARNING: multiple nodes with same ID found")
#                 logger.critical("list_of_node_labels = " + str(list_of_node_labels))

#             node_label = list_of_node_labels[0]["NodeLabel"]

#             if isinstance(node_label, List):
#                 if "symbol" in node_label:
#                     node_label.remove("symbol")
#                     # logger.info("what remains: " + str(node_label[0]))
#                     symbol_category = node_label[0]
#             else:
#                 # logger.info("not a list: " + str(node_label))
#                 symbol_category = node_label

#             with graphDB_Driver.session() as session:
#                 query_start_time = time.time()
#                 str_to_print = session.write_transaction(
#                     neo4j_query.add_symbol_to_expression_or_feed,
#                     "expression",
#                     symbol_id_to_add,
#                     expression_id,
#                     symbol_category,
#                 )
#                 query_time_dict[
#                     "compute/convert_expr_sympy_pdg_symbols_to_neo4j_edge: convert_sympy_pdg_symbols_to_neo4j_edge expr"
#                     + trace_id
#                 ] = round(time.time() - query_start_time, 3)

#     return query_time_dict


# def convert_feed_sympy_pdg_symbols_to_neo4j_edge(
#     graphDB_Driver, query_time_dict: query_timing_result_type
# ):
#     """
#    in the content imported from ui_v7's JSON there's no use of HAS_SYMBOL edges.
#    That's because in ui_v7 the JSON deduced the symbol membership from "AST"
#
#    This one-time-use function
#    1) detects all 'pdg' in the sympy for feed
#    2) adds 'HAS_SYMBOL' edge to the feed and symbol
#
#    """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] start " + trace_id)

#     # get all expressions
#     with graphDB_Driver.session() as session:
#         query_start_time = time.time()
#         list_of_expression_dicts = session.read_transaction(
#             neo4j_query.get_list_node_dicts_of_type, "feed"
#         )
#         query_time_dict[
#             "compute/convert_feed_sympy_pdg_symbols_to_neo4j_edge: list_nodes_of_type feed"
#             + trace_id
#         ] = round(time.time() - query_start_time, 3)

#     # get all symbols
#     with graphDB_Driver.session() as session:
#         query_start_time = time.time()
#         list_of_symbol_dicts = session.read_transaction(
#             neo4j_query.get_list_node_dicts_of_type, "symbol"
#         )
#         query_time_dict[
#             "compute/convert_feed_sympy_pdg_symbols_to_neo4j_edge: list_nodes_of_type symbol"
#             + trace_id
#         ] = round(time.time() - query_start_time, 3)

#     for this_expression_dict in list_of_expression_dicts:
#         list_of_pdg_symbols_found = []
#         if "sympy_lhs" in this_expression_dict.keys():
#             raise Exception(
#                 "why does FEED have LHS sympy?" + this_expression_dict["id"]
#             )
#         if "sympy_rhs" in this_expression_dict.keys():
#             raise Exception(
#                 "why does FEED have LHS sympy?" + this_expression_dict["id"]
#             )
#         if "sympy" in this_expression_dict.keys():
#             list_of_pdg_symbols_found += re.findall(
#                 r"pdg\d\d\d\d\d\d\d", this_expression_dict["sympy"]
#             )
#         list_of_pdg_symbols_found = list(set(list_of_pdg_symbols_found))

#         logger.info("list_of_pdg_symbols_found = " + str(list_of_pdg_symbols_found))

#         expression_id = this_expression_dict["id"]

#         for this_pdg_symbol in list_of_pdg_symbols_found:

#             symbol_id_to_add = this_pdg_symbol[3:]

#             with graphDB_Driver.session() as session:
#                 query_start_time = time.time()
#                 list_of_node_labels = session.read_transaction(
#                     neo4j_query.get_node_labels_from_property, "id", symbol_id_to_add
#                 )
#                 query_time_dict[
#                     "compute/convert_feed_sympy_pdg_symbols_to_neo4j_edge: get_node_labels_from_property"
#                     + trace_id
#                 ] = round(time.time() - query_start_time, 3)

#             # logger.info("list_of_node_labels = " + str(list_of_node_labels))

#             if len(list_of_node_labels) > 1:
#                 logger.critical("WARNING: multiple nodes with same ID found")
#                 logger.critical("list_of_node_labels = " + str(list_of_node_labels))

#             node_label = list_of_node_labels[0]["NodeLabel"]

#             if isinstance(node_label, List):
#                 if "symbol" in node_label:
#                     node_label.remove("symbol")
#                     # logger.info("what remains: " + str(node_label[0]))
#                     symbol_category = node_label[0]
#             else:
#                 # logger.info("not a list: " + str(node_label))
#                 symbol_category = node_label

#             with graphDB_Driver.session() as session:
#                 query_start_time = time.time()
#                 str_to_print = session.write_transaction(
#                     neo4j_query.add_symbol_to_expression_or_feed,
#                     "feed",
#                     symbol_id_to_add,
#                     expression_id,
#                     symbol_category,
#                 )
#                 query_time_dict[
#                     "compute/convert_feed_sympy_pdg_symbols_to_neo4j_edge: convert_sympy_pdg_symbols_to_neo4j_edge feed"
#                     + trace_id
#                 ] = round(time.time() - query_start_time, 3)

#     return query_time_dict


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
    logger.info("[TRACE]")

    if isinstance(recipients, str):
        recipients_list = [recipients]
    else:
        recipients_list = recipients

    if not recipients_list:
        print("Error: No recipients specified.", file=sys.stderr)
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
        print("Error: 'msmtp' command not found.", file=sys.stderr)
        print(
            "Please ensure msmtp is installed and in your system's PATH.",
            file=sys.stderr,
        )
        print("\nhere what was going to be sent:\n")
        print(message)
        return False

    except subprocess.CalledProcessError as e:
        # This block runs if msmtp fails (e.g., auth error, network issue).
        print("Error sending email:", file=sys.stderr)
        print(f"msmtp exit code: {e.returncode}", file=sys.stderr)
        print("\n--- msmtp STDOUT ---", file=sys.stderr)
        print(e.stdout.decode(), file=sys.stderr)
        print("\n--- msmtp STDERR ---", file=sys.stderr)
        print(e.stderr.decode(), file=sys.stderr)
        return False

    return


def get_sympy_as_latex_per_feed_id(list_of_feed_dicts):
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info(
        "[TRACE] start "
        + trace_id
        + " "
        + str(time.time())
    )
    sympy_as_latex_per_feed_id = {}  # type: Dict[str, str]
    for this_dict in list_of_feed_dicts:
        if "sympy" in this_feed_dict.keys():
            if len(this_dict["sympy"]) > 0:
                try:
                    sympy_as_latex_per_feed_id[this_feed_dict["id"]] = (
                        latex_and_sympy.sympy_to_latex_str(this_dict["sympy"])
                    )
                except Exception as err:
                    logger.error(
                        "converting to Sympy in get_sympy_as_latex_per_feed_id: "
                        + str(err)
                    )
                    sympy_as_latex_per_feed_id[this_dict["id"]] = "error converting"
            else:
                sympy_as_latex_per_feed_id[this_dict["id"]] = "'sympy' key is empty"
        else:
            sympy_as_latex_per_feed_id[this_dict["id"]] = "no 'sympy' key"

    logger.info(
        "[TRACE] end "
        + trace_id
        + " "
        + str(time.time())
    )
    return sympy_as_latex_per_feed_id


def get_sympy_as_latex_per_expr_id(list_of_expression_dicts):
    """ """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)
    for index, this_expression_dict in enumerate(list_of_expression_dicts):
        if "sympy_lhs" in this_expression_dict.keys():
            try:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    latex_and_sympy.sympy_to_latex_str(
                        this_expression_dict["sympy_lhs"]
                    )
                )
            except AttributeError as e:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "AttributeError in get_sympy_as_latex_per_expr_id: " + str(e)
                )
            except TypeError as e:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "TypeError in get_sympy_as_latex_per_expr_id: " + str(e)
                )
            except tokenize.TokenError as e:
                list_of_expression_dicts[index]["latex_as_sympy_LHS"] = (
                    "tokenize.TokenError in get_sympy_as_latex_per_expr_id: " + str(e)
                )
        if "sympy_rhs" in this_expression_dict.keys():
            try:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    latex_and_sympy.sympy_to_latex_str(
                        this_expression_dict["sympy_rhs"]
                    )
                )
            except AttributeError as e:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "AttributeError in get_sympy_as_latex_per_expr_id: " + str(e)
                )
            except TypeError as e:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "TypeError in get_sympy_as_latex_per_expr_id: " + str(e)
                )
            except tokenize.TokenError as e:
                list_of_expression_dicts[index]["latex_as_sympy_RHS"] = (
                    "tokenize.TokenError in get_sympy_as_latex_per_expr_id: " + str(e)
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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    dimensional_consistency_per_expression_id = {}  # type: Dict[str, str]

    list_of_expression_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "expression"
        )
        query_time_dict["pdg_app/to_add_expression: list_nodes_of_type" + trace_id] = (
            round(time.time() - query_start_time, 3)
        )

    dict_of_all_symbol_dicts, query_time_dict = get_dict_of_all_symbol_dicts(
        graphDB_Driver, query_time_dict
    )

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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_records = session.read_transaction(
            neo4j_query.get_list_of_all_node_IDs_and_labels
        )
        query_time_dict[
            "compute/to_edit_node: get_list_of_all_node_IDs_and_labels" + trace_id
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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    for path_to_file in list_of_paths_to_files:
        for file_name in list_of_file_names:
            for file_ext in list_of_file_extensions:
                if os.path.isfile(path_to_file + file_name + "." + file_ext):
                    os.remove(path_to_file + file_name + "." + file_ext)
    logger.info("[TRACE] end " + trace_id)
    return


def get_list_of_symbol_IDs_in_expression_or_feed(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_or_feed: str,
    expression_id: unique_numeric_id_as_str,
) -> Tuple[List[str], query_timing_result_type]:
    """
    >>> get_list_of_symbol_IDs_in_expression_or_feed()
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed = session.read_transaction(
            neo4j_query.get_list_of_symbol_IDs_per_category_in_expression_or_feed,
            expression_or_feed,
            expression_id,
            "operation",
        )
        query_time_dict[
            "compute/get_list_of_symbol_IDs_in_expression_or_feed get_list_of_symbol_IDs_per_category_in_expression_or_feed operation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
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


def get_list_of_nonoperation_symbol_IDs_in_expression_or_feed(
    graphDB_Driver,
    query_time_dict: query_timing_result_type,
    expression_or_feed: str,
    expression_id: unique_numeric_id_as_str,
) -> Tuple[List[str], query_timing_result_type]:
    """
    >>> get_list_of_nonoperation_symbol_IDs_in_expression_or_feed()
    """
    trace_id = str(random.randint(1000000, 9999999))
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


def get_list_of_expression_dicts_that_use_symbol_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, symbol_id: str
) -> Tuple[List[dict], Dict[str, float]]:
    """
    This helper function returns all expressions for any category, unlike
    neo4j_query.get_dict_of_derivations_that_use_symbol_id_by_category
    which requires category as input

    This cannot be combined with
    get_list_of_derivations_that_use_symbol_id
    because the cypher query is different

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    list_of_expression_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category operation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category scalar"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "vector",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category vector"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_expression_dicts += session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_dict_of_expression_dicts_that_use_symbol_id: get_dict_of_expression_dicts_that_use_symbol_id_by_category matrix"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    logger.info("[TRACE] end " + trace_id)
    return list_of_expression_dicts, query_time_dict


def get_list_of_derivation_dicts_that_use_symbol_id(
    graphDB_Driver, query_time_dict: query_timing_result_type, symbol_id: str
):
    """
    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    list_of_derivation_dicts = []  # type: List[dict]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "operation",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol operation"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "scalar",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol scalar"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "vector",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivations_that_use_symbol vector"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_derivation_dicts += session.read_transaction(
            neo4j_query.get_list_of_derivation_dicts_that_use_symbol_id_by_category,
            symbol_id,
            "matrix",
        )
        query_time_dict[
            "compute/get_dict_of_derivation_dicts_that_use_symbol: derivation_dicts_that_use_symbol matrix"
            + trace_id
        ] = round(time.time() - query_start_time, 3)

    # This will keep the last dictionary encountered for each ID.
    list_of_unique_derivations = list(
        {v["id"]: v for v in list_of_derivation_dicts}.values()
    )

    logger.info("[TRACE] end " + trace_id)
    return list_of_unique_derivations, query_time_dict


# def get_list_of_derivation_dicts_that_use_feed_id(
#     graphDB_Driver, query_time_dict: dict, feed_id:str
# ):
#     """ """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] compute/ start " + trace_id)

#     list_of_derivation_dicts_that_use_feed = {}  # type: Dict[str, list]

#     return dict_of_derivation_dicts_that_use_feed, query_time_dict


def get_list_of_all_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[list, query_timing_result_type]:
    """
    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:operation OR n:relation OR n:scalar OR n:vector OR n:matrix
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>>
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    list_of_symbol_dicts = []  # type: List[dict]
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_operation_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "operation"
        )
        query_time_dict[
            "compute/get_list_of_all_symbol_dicts, list_nodes_of_type" + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_operation_symbol_dicts:
        this_symbol_dict["symbol_category"] = "operation"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
        )
        query_time_dict[
            "compute/get_list_of_all_symbol_dicts, list_nodes_of_type" + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_scalar_symbol_dicts:
        this_symbol_dict["symbol_category"] = "scalar"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_vector_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "vector"
        )
        query_time_dict[
            "compute/get_list_of_all_symbol_dicts, list_nodes_of_type" + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_vector_symbol_dicts:
        this_symbol_dict["symbol_category"] = "vector"
        list_of_symbol_dicts.append(this_symbol_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_matrix_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "matrix"
        )
        query_time_dict[
            "compute/get_list_of_all_symbol_dicts, list_nodes_of_type" + trace_id
        ] = round(time.time() - query_start_time, 3)
    for this_symbol_dict in list_of_matrix_symbol_dicts:
        this_symbol_dict["symbol_category"] = "matrix"
        list_of_symbol_dicts.append(this_symbol_dict)

    logger.info("[TRACE] end " + trace_id)
    return list_of_symbol_dicts, query_time_dict


def get_list_of_all_nonoperation_symbol_dicts(
    graphDB_Driver, query_time_dict: query_timing_result_type
) -> Tuple[list, query_timing_result_type]:
    """
    use for "new feed" when promoting existing symbols to feed

    a better Cypher query might make this function slimmer

    MATCH (n)
    WHERE n:scalar OR n:vector OR n:matrix
    RETURN n, label(n)

    (based on https://gist.github.com/DaniSancas/1d5265fc159a95ff457b940fc5046887 )

    >>> get_list_of_all_nonoperation_symbol_dicts
    """
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    list_of_nonoperation_symbol_dicts = []  # type: List[dict]

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_scalar_symbol_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, "scalar"
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
            neo4j_query.get_list_node_dicts_of_type, "vector"
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
            neo4j_query.get_list_node_dicts_of_type, "matrix"
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
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
            neo4j_query.get_node_properties, "expression", expression_id
        )
        query_time_dict[
            "pdg_app/to_edit_expression: get_node_properties expression" + trace_id
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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    assert node_type in list_of_valid.node_types
    # print("compute/get_dict_of_node_dicts: node type=", node_type)

    list_of_all_node_dicts = []
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_all_node_dicts = session.read_transaction(
            neo4j_query.get_list_node_dicts_of_type, node_type
        )
        query_time_dict[
            "compute/get_dict_of_node_dicts, list_nodes_of_type " + trace_id
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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

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


# def symbols_per_expression_or_feed(
#     graphDB_Driver,
#     query_time_dict: dict,
#     expression_or_feed: str,
#     list_of_expression_or_feed_dicts: list,
# ):
#     """
#     >>>
#     """
#     trace_id = str(random.randint(1000000, 9999999))
#     logger.info("[TRACE] app/symbols_per_expression start " + trace_id)

#     symbols_per_expression_or_feed = {}  # type: Dict[str, list]
#     for this_expression_or_feed_dict in list_of_expression_or_feed_dicts:
#         list_of_symbol_IDs_in_expression_or_feed = []

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "operation",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "scalar",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "vector",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )

#         with graphDB_Driver.session() as session:
#             query_start_time = time.time()
#             list_of_symbol_IDs_in_expression_or_feed += session.read_transaction(
#                 neo4j_query.get_list_of_symbol_IDs_in_expression_or_feed,
#                 expression_or_feed,
#                 this_expression_or_feed_dict["id"],
#                 "matrix",
#             )
#             query_time_dict["symbols_per_expression_or_feed"] = (
#                 round(time.time() - query_start_time,3)
#             )
#         symbols_per_expression_or_feed[this_expression_or_feed_dict["id"]] = (
#             list_of_symbol_IDs_in_expression_or_feed
#         )

#     logger.info("[TRACE] app/symbols_per_expression_or_feed end " + trace_id)
#     return symbols_per_expression_or_feed, query_time_dict


def get_dict_of_steps_in_derivation(
    graphDB_Driver,
    derivation_id: unique_numeric_id_as_str,
    query_time_dict: query_timing_result_type,
):
    """
    >>> get_dict_of_steps_in_derivation()
    """
    trace_id = str(random.randint(1000000, 9999999))
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
    trace_id = str(random.randint(1000000, 9999999))
    logger.info("[TRACE] start " + trace_id)

    inference_rule_dict = {}
    list_of_input_dicts = []
    list_of_feed_dicts = []
    list_of_output_dicts = []

    # https://neo4j.com/docs/python-manual/current/session-api/
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        inference_rule_dict = session.read_transaction(
            neo4j_query.get_step_has_inference_rule, step_id
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: step_has_inference_rule"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("inference_rule_dict=", inference_rule_dict)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_input_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_INPUT",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: step_id_has_expressions, HAS_INPUT"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_input_dicts=", list_of_input_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_feed_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_FEED",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: step_id_has_expressions, HAS_FEED"
            + trace_id
        ] = round(time.time() - query_start_time, 3)
    # print("list_of_feed_dicts=", list_of_feed_dicts)
    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_output_dicts = session.read_transaction(
            neo4j_query.get_list_of_expression_dicts_from_step_id_and_expr_type,
            step_id,
            "HAS_OUTPUT",
        )
        query_time_dict[
            "compute/get_dict_of_steps_in_derivation: step_id_has_expressions, HAS_OUTPUT"
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
    trace_id = str(random.randint(1000000, 9999999))
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
