#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne, 2021
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

"""
The purpose of this file is to generate .tex files from expressions
"""

import random
import re
import os
import glob
import time

# move and copy files
import shutil
from subprocess import PIPE  # https://docs.python.org/3/library/subprocess.html
import subprocess  # https://stackoverflow.com/questions/39187886/what-is-the-difference-between-subprocess-popen-and-subprocess-run/39187984

# verify the file contents are the same when generating pictures
import hashlib

# https://docs.python.org/3/library/typing.html
# TextIO is file handle assocaited with `open()`
from typing import TextIO, Tuple, List

# image dimensions in pixels
import cv2  # type: ignore

import compute

# ORDERING: this has to come before the functions that use this type
from compute import unique_numeric_id_as_str, query_timing_result_type
import neo4j_query

proc_timeout = 30


def hash_of_file(filename_with_full_path: str) -> str:
    """
    get hash of file content

    https://docs.python.org/3/library/hashlib.html
    https://www.geeksforgeeks.org/md5-hash-python/

    Args:
        filename_with_full_path: name of file to hash
    Returns:
        hash as string
    Raises:

    >>> hash_of_file('/code/static/name_of_file')
    d41d8cd98f00b204e9800998ecf8427e
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/hash_of_file start " + trace_id)

    # TODO: exception handling
    with open(filename_with_full_path, "rb") as file_handle:
        file_content = file_handle.read()

    hashed_file = hashlib.md5(file_content).hexdigest()

    print("[TRACE] func: latex/hash_of_file end " + trace_id)
    return hashed_file


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
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/hash_of_string start " + trace_id)

    hashed_str = hashlib.md5(str_to_hash.encode("utf-8")).hexdigest()

    print("[TRACE] func: latex/hash_of_string start " + trace_id)
    return hashed_str


def make_string_safe_for_latex(unsafe_str: str) -> str:
    """
    latex characters that require an escape for printing:
    # $ % & \ ^ _ { }
    TODO: I'm not escaping all of these

    Args:
        unsafe_str: strings that may cause Latex compilation to fail, e.g., "a_string" or "url#subsection"
    Returns:
        safe_str: a string that latex should be able to print, e.g., "a\_string" or "url\#subsection"

    >>> make_string_safe_for_latex("hello world")
    "hello world"

    >>> make_string_safe_for_latex("hello_world")
    "hello\_world"
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/make_string_safe_for_latex start " + trace_id)

    # some derivation notes have valid underscores, like
    # \cite{yyyy_author}
    # while some underscores are invalid latex, like
    # https://en.wikipedia.org/wiki/Equations_of_motion
    # --> Remove citations
    # problem: using
    # re.sub(r'cite{.*}', '', some_text)
    # on the string
    # some_text = "an example cite{2222_asdf} and http://asdf_fagaaf and cite{9492_942} of http:/ss_asdf and more"
    # is greedy
    # to use a non-greedy search; https://stackoverflow.com/a/2503438/1164295
    # unsafe_str_without_citations = re.sub(r"cite{.*?}", "", unsafe_str)

    # replace the first _ that occurs within citation with another string
    unsafe_str_replaced_cite = re.sub(
        r"cite{(.*?)_(.*?)}", "cite{\\1NONSTANDARDUNDRSCR\\2}", unsafe_str
    )
    # that approach breaks when cite has more than one underscore, for example
    # \cite{yyyy_author1_author2}
    unsafe_str_replaced_cite = re.sub(
        r"cite{(.*?)_(.*?)}", "cite{\\1NONSTANDARDUNDRSCR\\2}", unsafe_str_replaced_cite
    )

    safe_str = unsafe_str_replaced_cite.replace("_", "\_").replace("%", "\%")

    fixed_underscore_str = safe_str.replace("NONSTANDARDUNDRSCR", "_")

    no_hashtag_str = (
        fixed_underscore_str.replace("#", "\#").replace("$", "\$").replace("%", "\%")
    )

    print("[TRACE] func: latex/make_string_safe_for_latex end " + trace_id)
    return no_hashtag_str


def create_d3js_json(
    graphDB_Driver,
    query_time_dict: dict,
    derivation_id: unique_numeric_id_as_str,
    destination_folder: str,
) -> query_timing_result_type:
    """
    Produce a JSON file that contains something like
    {
      "nodes": [
        {"id": "Myriel", "group": 1, "img": "/static/test.png", "width": 138, "height": 39, "linear index": 1},
        {"id": "Napoleon", "group": 1, "img": "/static/test.png", "width": 138, "height": 39, "linear index": 2}
      ],
      "links": [
        {"source": "Napoleon", "target": "Myriel", "value": 1},
        {"source": "Mlle.Baptistine", "target": "Myriel", "value": 8}
      ]
    }

    for inspiration based on the last time I implemented this, see
    v3_CSV/bin/create_json_per_derivation_from_connectionsDB.py
    and then
    v7/compute.py create_d3js_json

    Args:
        deriv_id: numeric identifier of the derivation
        path_to_db: filename of the SQL database containing
                    a JSON entry that returns a nested dictionary
    Returns:
        d3js_json_filename: name of JSON file to be read by d3js
    Raises:

    >>> destination_folder = "/code/static/"
    >>> create_d3js_json("000001", "pdg.db")

    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/create_d3js_json start " + trace_id)

    d3js_json_filename = derivation_id + ".json"

    all_steps, query_time_dict = compute.all_steps_in_derivation(
        graphDB_Driver, derivation_id, query_time_dict
    )

    json_str = "{\n"
    json_str += '  "nodes": [\n'
    list_of_nodes = []
    for step_id, step_dict in all_steps.items():

        print("latex/create_d3js_json  step_dict", step_dict)

        # step_dict
        # {'sequence index': 0,
        #  'inference rule dict':
        #     {'name_latex': 'add x to both sides', 'number_of_outputs': 1, 'number_of_inputs': 1, 'author_name_latex': 'ben', 'number_of_feeds': 1, 'id': '2585287', 'latex': 'Add $#1$ to both sides of Eq.~\ref{eq:#2}; yields Eq.~\ref{eq:#3}.'},
        #  'list of input dicts': [
        #     {'m':
        #       {'sympy_lhs': "sympy.Symbol('pdg6101028')", 'reference_latex': 'ref to source', 'latex_condition': '', 'sympy_rhs': "sympy.Symbol('pdg6020501')", 'description_latex': 'a description of the expression', 'latex_lhs': 'a', 'name_latex': 'name of asdf', 'lean': '', 'latex_rhs': 'b', 'author_name_latex': 'ben', 'id': '3471224', 'sympy': "sympy.Eq(sympy.Symbol('pdg6101028'),sympy.Symbol('pdg6020501'))", 'latex_relation': '='}
        #     }],
        #  'list of feed dicts': [
        #     {'m':
        #         {'lean': '', 'author_name_latex': 'ben', 'id': '2175468', 'latex': 'c', 'sympy': "sympy.Symbol('pdg1921258')"}
        #     }],
        #  'list of output dicts': [
        #      {'m':
        #         {'sympy_lhs': "sympy.Symbol('pdg1921258') + sympy.Symbol('pdg6101028')", 'reference_latex': '', 'latex_condition': '', 'sympy_rhs': "sympy.Symbol('pdg1921258') + sympy.Symbol('pdg6020501')", 'description_latex': '', 'latex_lhs': 'a+c', 'name_latex': 'great name', 'lean': '', 'latex_rhs': 'b+c', 'author_name_latex': 'ben', 'id': '5309419', 'sympy': "sympy.Eq(sympy.Symbol('pdg1921258') + sympy.Symbol('pdg6101028'),sympy.Symbol('pdg1921258') + sympy.Symbol('pdg6020501'))", 'latex_relation': '='}
        #      }]}

        png_name = "".join(
            filter(str.isalnum, step_dict["inference rule dict"]["name_latex"])
        )
        print("latex/create_d3js_json PNG name = " + png_name)

        if not os.path.isfile(destination_folder + png_name + ".png"):
            create_png_from_latex(
                "\\text{" + step_dict["inference rule dict"]["name_latex"] + "}",
                destination_folder,
                png_name,
            )
            print("latex/create_d3js_json created PNG " + png_name)
            # addxtobothsides

        # purpose of reading image is to determine width and height; both are needed for d3js JSON
        image = cv2.imread(destination_folder + png_name + ".png")
        # logger.debug("type for cv2 image is " + str(type(image)))
        print("type for cv2 image is " + str(type(image)))

        # construct the node JSON content
        list_of_nodes.append(
            '    {"id": "'
            + step_id
            + '", "group": '
            + str(step_dict["sequence index"])
            + ", "
            + '"img": "/static/'
            + png_name
            + '.png", '
            + '"url": "https://derivationmap.net/list_all_inference_rules?referrer=d3js#'
            + step_dict["inference rule dict"]["name_latex"]
            + '", "width": '
            + str(image.shape[1])
            + ", "
            + '"height": '
            + str(image.shape[0])
            + ", "
            + '"sequence index": '
            + str(step_dict["sequence index"])
            + "},\n"
        )

        list_of_expressions = []
        for this_input_dict in step_dict["list of input dicts"]:
            temp_dict = this_input_dict["m"]
            temp_dict["type of math"] = "expression"
            list_of_expressions.append(temp_dict)
        for this_output_dict in step_dict["list of output dicts"]:
            temp_dict = this_output_dict["m"]
            temp_dict["type of math"] = "expression"
            list_of_expressions.append(temp_dict)
        for this_feed_dict in step_dict["list of feed dicts"]:
            temp_dict = this_feed_dict["m"]
            temp_dict["type of math"] = "feed"
            list_of_expressions.append(temp_dict)

        for this_expression_dict in list_of_expressions:
            print("latex/create_d3js_json this_expression_dict", this_expression_dict)

            if this_expression_dict["type of math"] == "expression":
                # TODO: account for input_dict['latex_condition']
                expression_latex = (
                    this_expression_dict["latex_lhs"]
                    + this_expression_dict["latex_relation"]
                    + this_expression_dict["latex_rhs"]
                )
                png_name = (
                    "expression_"
                    + this_expression_dict["id"]
                    + "_"
                    + hash_of_string(expression_latex)
                )
            elif this_expression_dict["type of math"] == "feed":
                expression_latex = this_expression_dict["latex"]
                png_name = (
                    "feed_"
                    + this_expression_dict["id"]
                    + "_"
                    + hash_of_string(expression_latex)
                )

            print("latex/create_d3js_json png_name", png_name)
            # logger.debug("PNG name = " + png_name)

            if not os.path.isfile(destination_folder + png_name + ".png"):
                create_png_from_latex(
                    expression_latex,
                    destination_folder,
                    png_name,
                )
                # logger.debug("created PNG " + png_name)

            image = cv2.imread(destination_folder + png_name + ".png")
            # logger.debug("type for cv2 image is " + str(type(image)))

            # construct the node JSON content
            list_of_nodes.append(
                '    {"id": "'
                + this_expression_dict["id"]
                + '", "group": 0, '
                + '"img": "/static/'
                + png_name
                + '.png", '
                + '"url": "https://derivationmap.net/list_all_expressions?referrer=d3js#'
                + this_expression_dict["id"]
                + '", "width": '
                + str(image.shape[1])
                + ", "
                + '"height": '
                + str(image.shape[0])
                + ", "
                + '"linear index": -1},\n'
            )

    list_of_nodes = list(set(list_of_nodes))
    all_nodes = "".join(list_of_nodes)
    all_nodes = (
        all_nodes[:-2] + "\n"
    )  # remove the trailing comma to be compliant with JSON
    json_str += all_nodes

    json_str += "  ],\n"
    json_str += '  "links": [\n'

    list_of_edges = edges_in_derivation_for_d3js(
        graphDB_Driver, query_time_dict, all_steps
    )
    list_of_edge_str = []
    for edge_tuple in list_of_edges:
        list_of_edge_str.append(
            '    {"source": "'
            + edge_tuple[0]
            + '", "target": "'
            + edge_tuple[1]
            + '", "value": 1},\n'
        )
    list_of_edge_str = list(set(list_of_edge_str))
    # logger.debug('number of edges = %s', len(list_of_edge_str))
    all_edges = "".join(list_of_edge_str)
    all_edges = all_edges[:-2] + "\n"
    # logger.debug('all edges = %s', all_edges)
    json_str += all_edges
    json_str += "  ]\n"
    json_str += "}\n"
    with open(destination_folder + d3js_json_filename, "w") as file_handle:
        file_handle.write(json_str)

    return query_time_dict


def edges_in_derivation_for_d3js(
    graphDB_Driver, query_time_dict: dict, all_steps
) -> List:
    """
    >>> edges_in_derivation_for_d3js()
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/edges_in_derivation_for_d3js start " + trace_id)

    list_of_edge_tuples = []

    print("latex/edges_in_derivation_for_d3js all_steps", all_steps)

    # TODO!

    print("[TRACE] func: latex/edges_in_derivation_for_d3js end " + trace_id)
    return list_of_edge_tuples


def create_tex_file_for_derivation(
    graphDB_Driver,
    query_time_dict: dict,
    derivation_id: unique_numeric_id_as_str,
    path_to_tex_file: str,
) -> query_timing_result_type:
    """
    In v7 the PDG I started allowing inference rule names
    to have spaces. (In versions prior to 7 the inference rule names were
    camel case.) When I implemented this function in v7 I learned why the
    inference rule names had been camel case: Latex does not like
    newcommand names to have underscore in them; see https://tex.stackexchange.com/questions/306110/new-command-with-an-underscore
    Therefore, I remove all spaces from the inference rule name.

    Args:
        query_time_dict:
        derivation_id: numeric identifier of the derivation
    Returns:
        tex_filename: pass back filename without extension because bibtex cannot handle .tex
    Raises:

    >>> path_to_tex_file = "/code/static/"  # must end with /
    >>> generate_tex_for_derivation("000001", path_to_tex_file)
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/create_tex_file_for_derivation start " + trace_id)

    tex_filename = derivation_id

    compute.remove_file_debris(
        [path_to_tex_file], [tex_filename], ["tex", "log", "pdf", "aux"]
    )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
    print("latex/create_tex_file_for_derivation: derivation_dict=", derivation_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts_in_this_derivation = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_sequence_values = session.read_transaction(
            neo4j_query.get_list_of_sequence_values_for_derivation_id, derivation_id
        )
    print(
        "latex/create_tex_file_for_derivation: list_of_sequence_values=",
        list_of_sequence_values,
    )

    with open(tex_filename + ".tex", "w") as latex_file_handle:
        latex_file_handle.write(
            "% this tex file was generated by the Physics Derivation Graph \n"
        )
        latex_file_handle.write("\\documentclass[12pt]{article}\n")  # article or report
        #        latex_file_handle.write('\\thispagestyle{empty}\n')
        latex_file_handle.write(
            "\\usepackage{amsmath,amssymb,amsfonts}\n"
        )  # https://tex.stackexchange.com/questions/32100/what-does-each-ams-package-do
        latex_file_handle.write(
            "\\usepackage[dvipdfmx,colorlinks=true,pdfkeywords={physics derivation graph}]{hyperref}\n"
        )
        latex_file_handle.write("\\usepackage{graphicx} % for including PNG files\n")
        # latex_file_handle.write("\\newcommand{\\when}[1]{{\\rm \\ when\\ }#1}\n")
        # latex_file_handle.write("\\newcommand{\\bra}[1]{\\langle #1 |}\n")
        # latex_file_handle.write("\\newcommand{\\ket}[1]{| #1\\rangle}\n")
        # latex_file_handle.write("\\newcommand{\\op}[1]{\\hat{#1}}\n")
        # latex_file_handle.write("\\newcommand{\\braket}[2]{\\langle #1 | #2 \\rangle}\n")
        # latex_file_handle.write(
        #    "\\newcommand{\\rowCovariantColumnContravariant}[3]{#1_{#2}^{\\ \\ #3}} % left-bottom, right-upper\n"
        # )
        # latex_file_handle.write(
        #    "\\newcommand{\\rowContravariantColumnCovariant}[3]{#1^{#2}_{\\ \\ #3}} % left-upper, right-bottom\n"
        # )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.read_transaction(
                neo4j_query.get_list_node_dicts_of_type, "inference_rule"
            )

        # first, write the inference rules as newcommand at top of .tex file
        latex_file_handle.write("% inference rules as newcommand for use in the body\n")
        for infrule_dict in list_of_inference_rule_dicts:
            number_of_args = (
                infrule_dict["number_of_feeds"]
                + infrule_dict["number_of_inputs"]
                + infrule_dict["number_of_outputs"]
            )
            # https://en.wikibooks.org/wiki/LaTeX/Macros#New_commands
            if number_of_args < 10:
                latex_file_handle.write(
                    "\\newcommand\\"
                    + "".join(
                        filter(str.isalpha, infrule_dict["name_latex"])
                    )  # digits cannot be used to name macros. FAULT EXPECTED: This filtering will create a collision if the only characters distinguishing infrules is a digit
                    + "["
                    + str(  # https://tex.stackexchange.com/questions/306110/new-command-with-an-underscore
                        number_of_args  # macros are limited to 9 inputs;
                    )
                    + "]{"
                    + infrule_dict["latex"].replace("\r", "\\r")
                    + "}\n"
                )
            else:  # 10 or more args; see https://www.texfaq.org/FAQ-moren9
                latex_file_handle.write(
                    "\\newcommand\\"
                    + "".join(filter(str.isalpha, infrule_dict["name_latex"]))
                    + "[9]{"
                    + "\\def\\ArgOne{{#1}}\n\\def\\ArgTwo{{#2}}\n\\def\\ArgThree{{#3}}\n\\def\\ArgFour{{#4}}\n\\def\\ArgFive{{#5}}\n"
                    + "\\def\\ArgSix{{#6}}\n\\def\\ArgSeven{{#7}}\n\\def\\ArgEight{{#8}}\n\\def\\ArgNine{{#9}}\n\\"
                    + "".join(filter(str.isalpha, infrule_dict["name_latex"]))
                    + "Relay\n"
                    + "}\n"
                )
                latex_file_handle.write(
                    "\\newcommand\\"
                    + "".join(filter(str.isalpha, infrule_dict["name_latex"]))
                    + "Relay["
                    + str(number_of_args - 9)
                    + "]{"
                    + infrule_dict["latex"]
                    .replace("#1", "ArgOne")
                    .replace("#2", "ArgTwo")
                    .replace("#3", "ArgThree")
                    .replace("#4", "ArgFour")
                    .replace("#5", "ArgFive")
                    .replace("#6", "ArgSix")
                    .replace("#7", "ArgSeven")
                    .replace("#8", "ArgEight")
                    .replace("#9", "ArgNine")
                    .replace("#10", "#1")
                    .replace("#11", "#2")
                    .replace("#12", "#3")
                    .replace("#13", "#4")
                    .replace("#14", "#5")
                    + "}\n"
                )

        latex_file_handle.write("\\title{" + str(derivation_dict["name_latex"]) + "}\n")
        latex_file_handle.write("\\date{\\today}\n")
        latex_file_handle.write(
            "\\author{" + str(derivation_dict["author_name_latex"]) + "}\n"
        )
        latex_file_handle.write("\\setlength{\\topmargin}{-.5in}\n")
        latex_file_handle.write("\\setlength{\\textheight}{9in}\n")
        latex_file_handle.write("\\setlength{\\oddsidemargin}{0in}\n")
        latex_file_handle.write("\\setlength{\\textwidth}{6.5in}\n")

        latex_file_handle.write("\\begin{document}\n")
        latex_file_handle.write("\\maketitle\n")

        latex_file_handle.write("\\begin{abstract}\n")
        latex_file_handle.write(
            "Generated by the \\href{http://derivationmap.net/}{Physics Derivation Graph}.\n"
        )
        if len(derivation_dict["abstract_latex"]) > 0:
            # fixed bug https://github.com/allofphysicsgraph/proofofconcept/issues/249
            # safe_string = dat["derivations"][derivation_id]["notes"]
            #                latex_file_handle.write(safe_string + "\n")
            latex_file_handle.write(derivation_dict["abstract_latex"] + "\n")
        latex_file_handle.write("\\end{abstract}\n")

        all_steps, query_time_dict = compute.all_steps_in_derivation(
            graphDB_Driver, derivation_id, query_time_dict
        )
        # print("all_steps = ", all_steps)

        for linear_indx in list_of_sequence_values:
            # print("linear_indx=", linear_indx)
            for step_dict in list_of_step_dicts_in_this_derivation:
                # print("step_dict=", step_dict)

                inference_rule_name = all_steps[step_dict["id"]]["inference rule dict"][
                    "name_latex"
                ]
                # print("inference_rule_latex = ", inference_rule_latex)

                list_of_input_expression_latex = []
                for this_input_dict in all_steps[step_dict["id"]][
                    "list of input dicts"
                ]:
                    # print("this_input_dict=", this_input_dict)
                    # this_input_dict= {'m': {'sympy_lhs': "sympy.Symbol('pdg9592623')", 'reference_latex': '', 'latex_condition': '', 'sympy_rhs': "sympy.Symbol('pdg7689637')", 'description_latex': '', 'latex_lhs': 'a', 'name_latex': '', 'lean': '', 'latex_rhs': 'b', 'author_name_latex': 'ben', 'id': '3636307', 'sympy': "sympy.Eq(sympy.Symbol('pdg9592623'),sympy.Symbol('pdg7689637'))", 'latex_relation': '='}}
                    list_of_input_expression_latex.append(
                        this_input_dict["m"]["latex_lhs"]
                        + this_input_dict["m"]["latex_relation"]
                        + this_input_dict["m"]["latex_rhs"]
                    )

                list_of_feed_latex = []
                for this_feed_dict in all_steps[step_dict["id"]]["list of feed dicts"]:
                    list_of_feed_latex.append(this_feed_dict["m"]["latex"])

                list_of_output_expression_latex = []
                for this_output_dict in all_steps[step_dict["id"]][
                    "list of output dicts"
                ]:
                    list_of_output_expression_latex.append(
                        this_input_dict["m"]["latex_lhs"]
                        + this_input_dict["m"]["latex_relation"]
                        + this_input_dict["m"]["latex_rhs"]
                    )

                if step_dict["sequence_index"] == linear_indx:

                    latex_file_handle.write("\n")
                    if len(step_dict["note_before_step_latex"]) > 0:
                        latex_file_handle.write(
                            step_dict["note_before_step_latex"] + "\n"
                        )

                    if (
                        "image" in step_dict.keys()
                    ):  # as of 2025-01-02 `image` isn't a valid key in the schema
                        latex_file_handle.write("\\begin{center}\n")
                        latex_file_handle.write("\\begin{figure}\n")
                        #        shutil.copy(
                        #            "static/diagrams/" + step_dict["image"]["file name"],
                        #        step_dict["image"]["file name"],
                        # )
                        latex_file_handle.write(
                            "\\includegraphics{"
                            + step_dict["image"]["file name"]
                            + "}\n"
                        )
                        latex_file_handle.write(
                            "\\caption{" + step_dict["image"]["caption"] + "}\n"
                        )
                        latex_file_handle.write(
                            "\\label{fig:" + step_dict["image"]["label"] + "}\n"
                        )
                        latex_file_handle.write("\\end{figure}\n")
                        latex_file_handle.write("\\end{center}\n")
                    # using the newcommand, populate the expression identifiers
                    latex_file_handle.write("% step ID = " + step_dict["id"] + "\n")
                    latex_file_handle.write(
                        # digits cannot be used to name macros
                        "\\"
                        + "".join(filter(str.isalpha, inference_rule_name))
                    )
                    for feed_latex in list_of_feed_latex:
                        latex_file_handle.write("{" + feed_latex + "}")
                    for input_latex in list_of_input_expression_latex:

                        this_str = str(input_latex) + str(derivation_dict["name_latex"])
                        local_id = hash_of_string(this_str)

                        latex_file_handle.write("{" + local_id + "}")
                    for output_latex in list_of_output_expression_latex:

                        this_str = str(output_latex) + str(
                            derivation_dict["name_latex"]
                        )
                        local_id = hash_of_string(this_str)

                        latex_file_handle.write("{" + local_id + "}")
                    latex_file_handle.write("\n")

                    # write output expressions
                    for output_latex in list_of_output_expression_latex:

                        this_str = str(output_latex) + str(
                            derivation_dict["name_latex"]
                        )
                        local_id = hash_of_string(this_str)

                        latex_file_handle.write("\\begin{equation}\n")
                        latex_file_handle.write(output_latex + "\n")
                        latex_file_handle.write("\\label{eq:" + local_id + "}\n")
                        latex_file_handle.write("\\end{equation}\n")

                    if len(step_dict["note_after_step_latex"]) > 0:
                        latex_file_handle.write(
                            step_dict["note_after_step_latex"] + "\n"
                        )  # TODO: if the note contains a $ or %, shenanigans arise

        latex_file_handle.write("\\bibliographystyle{plain}\n")
        latex_file_handle.write("\\bibliography{pdg.bib}\n")
        latex_file_handle.write("\\end{document}\n")
        latex_file_handle.write("% EOF\n")

    shutil.copy(tex_filename + ".tex", path_to_tex_file + tex_filename + ".tex")
    # logger.info("[trace end " + trace_id + "]")

    print("[TRACE] func: latex/create_tex_file_for_derivation " + trace_id)
    return query_time_dict  # pass back filename without extension because bibtex cannot handle .tex


def create_pdf_for_derivation(
    graphDB_Driver,
    query_time_dict: dict,
    derivation_id: unique_numeric_id_as_str,
    path_to_pdf: str,
) -> str:
    """

    Args:
        derivation_id: numeric identifier of the derivation
        path_to_pdf = "/code/static/"  # must end with /
    Returns:
        pdf_filename + ".pdf":
    Raises:

    >>> create_pdf_for_derivation("000001", "myemail@address.com","pdg.db")
    """
    # logger.info("[trace start " + trace_id + "]")
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/create_pdf_for_derivation start " + trace_id)

    # to isolate the build process, create a temporary folder
    tmp_latex_folder = "tmp_latex_folder_" + str(random.randint(1000000, 9999999))
    tmp_latex_folder_full_path = os.getcwd() + "/" + tmp_latex_folder + "/"
    os.mkdir(tmp_latex_folder_full_path)

    # destination for the PDF once file is built

    pdf_filename = derivation_id

    tex_filename_without_extension = derivation_id

    query_time_dict = create_tex_file_for_derivation(
        graphDB_Driver, query_time_dict, derivation_id, path_to_pdf
    )
    shutil.move(tex_filename_without_extension + ".tex", tmp_latex_folder_full_path)

    # copy the current pdg.bib from static to local for use with bibtex when compiling tex to PDF
    # https://docs.python.org/3/library/shutil.html
    shutil.copy("/code/static/pdg.bib", tmp_latex_folder_full_path)
    # shutil.copy("/code/static/pdg.bib", "/code/")

    # images need to be in the temporary folder to compile the .tex to PDF
    # https://docs.python.org/3/library/shutil.html#shutil.copytree
    # shutil.copytree(
    #        "/code/static/diagrams/", tmp_latex_folder_full_path
    # )
    for filename in glob.glob("/code/static/diagrams/*"):
        # logger.info("copied "+filename+" from "+filename+" to "+tmp_latex_folder_full_path)
        shutil.copy(filename, tmp_latex_folder_full_path)

    # TODO: it would be good to check whether \cite appears in the .tex content

    # first of the latex runs
    process = subprocess.run(
        ["latex", "-halt-on-error", tex_filename_without_extension + ".tex"],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )
    # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
    latex_stdout = process.stdout.decode("utf-8")
    latex_stderr = process.stderr.decode("utf-8")

    # logger.debug("latex std out: %s", latex_stdout)
    # logger.debug("latex std err: %s", latex_stderr)

    if "Text line contains an invalid character" in latex_stdout:
        # logger.error("no PDF generated - tex contains invalid character")
        raise Exception("no PDF generated - tex contains invalid character")
    if "No pages of output." in latex_stdout:
        # logger.error("no PDF generated - reason unknown")
        raise Exception("no PDF generated - reason unknown")

    # first of two bibtex runs
    process = subprocess.run(
        ["bibtex", tex_filename_without_extension],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )
    # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
    bibtex_stdout = process.stdout.decode("utf-8")
    bibtex_stderr = process.stderr.decode("utf-8")
    # logger.debug("bibtex std out: %s", bibtex_stdout)
    # logger.debug("bibtex std err: %s", bibtex_stderr)

    # second of two bibtex runs
    process = subprocess.run(
        ["bibtex", tex_filename_without_extension],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )
    # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
    bibtex_stdout = process.stdout.decode("utf-8")
    bibtex_stderr = process.stderr.decode("utf-8")
    # logger.debug("bibtex std out: %s", bibtex_stdout)
    # logger.debug("bibtex std err: %s", bibtex_stderr)

    # run latex a second time to enable references to work
    process = subprocess.run(
        ["latex", "-halt-on-error", tex_filename_without_extension + ".tex"],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )

    # https://tex.stackexchange.com/questions/204291/bibtex-latex-compiling
    # run latex a third time to enable references to work
    process = subprocess.run(
        ["latex", "-halt-on-error", tex_filename_without_extension + ".tex"],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )

    # https://tex.stackexchange.com/questions/73783/dvipdfm-or-dvipdfmx-or-dvipdft
    # TODO: how does dvipdfmx know the name of the .tex input? In the process below only the output filename is specified (!)
    process = subprocess.run(
        ["dvipdfmx", pdf_filename + ".dvi"],
        cwd=tmp_latex_folder_full_path,
        stdout=PIPE,
        stderr=PIPE,
        timeout=proc_timeout,
    )

    dvipdf_stdout = process.stdout.decode("utf-8")
    dvipdf_stderr = process.stderr.decode("utf-8")

    # logger.debug("dvipdf std out: %s", dvipdf_stdout)
    # logger.debug("dvipdf std err: %s", dvipdf_stderr)

    shutil.move(
        tmp_latex_folder_full_path + pdf_filename + ".pdf",
        path_to_pdf + pdf_filename + ".pdf",
    )
    shutil.rmtree(tmp_latex_folder_full_path)
    # return True, pdf_filename + ".pdf"
    # logger.info("[trace end " + trace_id + "]")

    print("[TRACE] func: latex/create_pdf_for_derivation start " + trace_id)
    return pdf_filename + ".pdf", query_time_dict


def create_png_from_latex(
    input_latex_str: str, destination_folder: str, png_filename_no_extension: str
) -> None:
    """
    Used for both d3js representation and for graphviz.
    Relevant to both expressions and inference rules

    latex -halt-on-error file.tex
    dvipng file.dvi -T tight -o file.png

    this function relies on latex  being available on the command line
    this function relies on dvipng being available on the command line
    this function assumes generated PNG should be placed in /code/static/

    Args:
        path_to_db: filename of the SQL database containing
                    a JSON entry that returns a nested dictionary
    Returns:
        None

    Raises:

    >>> destination_folder = "/code/static/"
    >>> create_png_from_latex('a \dot b \\nabla', 'a_filename')
    """
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] latex/create_png_from_latex start " + trace_id + "]")
    # logger.info("[TRACE] latex/create_png_from_latex start " + trace_id + "]")

    print(
        "latex/create_png_from_latex png_filename_no_extension",
        png_filename_no_extension,
    )

    #    logger.debug("png_filename_no_extension = %s", png_filename_no_extension)
    #    logger.debug("input latex str = %s", input_latex_str)

    tmp_latex_folder = "tmp_latex_folder_for_create_png_from_latex_" + str(
        random.randint(1000000, 9999999)
    )
    tmp_latex_folder_full_path = os.getcwd() + "/" + tmp_latex_folder + "/"
    original_dir = os.getcwd()
    os.mkdir(tmp_latex_folder_full_path)
    os.chdir(tmp_latex_folder_full_path)

    tmp_file_no_extension_full_path = "lat"

    # logger.debug("latex = " + str(input_latex_str))
    print("latex/create_png_from_latex latex = " + str(input_latex_str))
    create_tex_file_for_latex_string(tmp_file_no_extension_full_path, input_latex_str)

    tex_filename_with_hash = png_filename_no_extension + ".tex"
    print("latex/create_png_from_latex tex_filename_with_hash:", tex_filename_with_hash)

    # shutil.move(tmp_file_no_extension_full_path + ".tex", tex_filename_with_hash)
    # logger.debug(str(os.listdir()))

    # only make PNG if .tex did not exist
    if not os.path.exists(destination_folder + tex_filename_with_hash):
        shutil.copy(
            tmp_file_no_extension_full_path + ".tex",
            destination_folder + tex_filename_with_hash,
        )

        process = subprocess.run(
            ["latex", "-halt-on-error", tmp_file_no_extension_full_path + ".tex"],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
        latex_stdout = process.stdout.decode("utf-8")
        latex_stderr = process.stderr.decode("utf-8")

        #    logger.debug(str(os.listdir()))

        # logger.debug("latex std out:" + str(latex_stdout))
        # logger.debug("latex std err:" + str(latex_stderr))
        print("latex/create_png_from_latex latex std out:" + str(latex_stdout))
        print("latex std err:" + str(latex_stderr))

        if "Text line contains an invalid character" in latex_stdout:
            # logging.error("tex input contains invalid charcter")
            print("tex input contains invalid charcter")
            shutil.copy(
                destination_folder + "error.png",
                destination_folder + png_filename_no_extension,
            )
            raise Exception("no png generated due to invalid character in tex input.")
        #    compute.remove_file_debris(["./"], [tmp_file_no_extension_full_path], ["png"])

        # dvipng file.dvi -T tight -o file.png
        process = subprocess.run(
            [
                "dvipng",
                tmp_file_no_extension_full_path + ".dvi",
                "-T",
                "tight",
                "-o",
                tmp_file_no_extension_full_path + ".png",
            ],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
        png_stdout = process.stdout.decode("utf-8")
        png_stderr = process.stderr.decode("utf-8")

        if len(png_stdout) > 0:
            if "This is dvipng" not in png_stdout:
                # logger.debug("png std out %s", png_stdout)
                print("png std out %s", png_stdout)
        if len(png_stderr) > 0:
            # logger.debug("png std err %s", png_stderr)
            print("png std err %s", png_stderr)

        # logger.debug(str(os.listdir()))

        if "No such file or directory" in png_stderr:
            # logging.error("PNG creation failed for %s", png_filename_no_extension)
            print(
                "latex/create_png_from_latex PNG creation failed for %s",
                png_filename_no_extension,
            )
            shutil.copy(
                destination_folder + "error.png",
                destination_folder + png_filename_no_extension,
            )
            # return False, "no PNG created. Check usepackage in latex"
            raise Exception(
                "no PNG created for "
                + png_filename_no_extension
                + ". Check 'usepackage' in latex"
            )

        if not (os.path.isfile(tmp_file_no_extension_full_path + ".png")):
            # logging.error("PNG creation failed for %s", png_filename_no_extension)
            print("PNG creation failed for %s", png_filename_no_extension)

        shutil.move(
            tmp_file_no_extension_full_path + ".png",
            destination_folder + png_filename_no_extension + ".png",
        )

    # logger.debug(destination_folder + png_filename_no_extension + ".png")
    print(
        "latex/create_png_from_latex: dest:"
        + destination_folder
        + png_filename_no_extension
        + ".png"
    )
    # /code/static/addxtobothsides.png

    os.chdir(original_dir)
    shutil.rmtree(tmp_latex_folder_full_path)

    #    if os.path.isfile(destination_folder + png_filename_no_extension):
    # os.remove('/code/static/'+name_of_png)
    #        logger.error("png already exists!")

    # return True, "success"
    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_png_from_latex start " + trace_id + "]")
    return


def create_tex_file_for_latex_string(
    tmp_file_no_extension_full_path: str, input_latex_str: str
) -> None:
    """

    Args:
        tmp_file_no_extension_full_path:
        input_latex_str:
    Returns:
        None

    Raises:

    >>> create_tex_file_for_latex_string('/code/static/filename_without_extension', 'a \dot b \\nabla')
    """
    trace_id = str(random.randint(1000000, 9999999))
    # logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/create_tex_file_for_latex_string start " + trace_id + "]")

    print(
        "latex/create_tex_file_for_latex_string tmp_file_no_extension_full_path:",
        tmp_file_no_extension_full_path,
    )
    print("latex/create_tex_file_for_latex_string input_latex_str:", input_latex_str)

    # compute.remove_file_debris(["./"], [tmp_file_no_extension_full_path], ["tex"])

    with open(tmp_file_no_extension_full_path + ".tex", "w") as latex_file_handle:
        latex_file_handle.write("\\documentclass[12pt]{article}\n")
        latex_file_handle.write("\\thispagestyle{empty}\n")
        # https://tex.stackexchange.com/questions/73016/how-do-i-install-an-individual-package-on-a-linux-system
        # if "usepackage{braket}" is on and the package is not available, the process pauses while waiting for user input
        # the web interface is not aware of this pause, so the page hangs
        # latex_file_handle.write("\\usepackage{braket}\n")
        latex_file_handle.write(
            "\\usepackage{amsmath}\n"
        )  # https://tex.stackexchange.com/questions/32100/what-does-each-ams-package-do
        # latex_file_handle.write("\\newcommand{\\when}[1]{{\\rm \\ when\\ }#1}\n")
        # latex_file_handle.write("\\newcommand{\\bra}[1]{\\langle #1 |}\n")
        # latex_file_handle.write("\\newcommand{\\ket}[1]{| #1\\rangle}\n")
        # latex_file_handle.write("\\newcommand{\\op}[1]{\\hat{#1}}\n")
        # latex_file_handle.write("\\newcommand{\\braket}[2]{\\langle #1 | #2 \\rangle}\n")
        # latex_file_handle.write(
        #    "\\newcommand{\\rowCovariantColumnContravariant}[3]{#1_{#2}^{\\ \\ #3}} % left-bottom, right-upper\n"
        # )
        # latex_file_handle.write(
        #    "\\newcommand{\\rowContravariantColumnCovariant}[3]{#1^{#2}_{\\ \\ #3}} % left-upper, right-bottom\n"
        # )

        latex_file_handle.write("\\begin{document}\n")
        latex_file_handle.write("\\huge{\n")
        latex_file_handle.write("$" + input_latex_str + "$\n")
        latex_file_handle.write("}\n")
        latex_file_handle.write("\\end{document}\n")
    # logger.debug("wrote tex file")
    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_tex_file_for_latex_string end " + trace_id + "]")
    return


def create_derivation_png(
    graphDB_Driver,
    query_time_dict: dict,
    derivation_id: unique_numeric_id_as_str,
    path_to_output_png: str,
) -> Tuple[str, dict]:
    """
    for a clear description of the graphviz language, see
    https://www.graphviz.org/doc/info/lang.html

    Args:
        derivation_id: numeric identifier of the derivation
        path_to_output_png: where should png be placed? Includes trailing slash

    Returns:
        output_filename: name of file produced by graphviz; either `<derivation_id>.png` or `error.png`
    Raises:


    >>> create_derivation_png("000001", "pdg.db")
    """
    trace_id = str(random.randint(1000000, 9999999))
    # logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/create_derivation_png start " + trace_id + "]")

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
    print("latex/create_derivation_png: derivation_dict=", derivation_dict)

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        list_of_step_dicts_in_this_derivation = session.read_transaction(
            neo4j_query.get_list_of_step_dicts_in_this_derivation, derivation_id
        )
    print(
        "latex/create_derivation_png: list_of_step_dicts_in_this_derivation=",
        list_of_step_dicts_in_this_derivation,
    )

    dot_filename = path_to_output_png + "derivation_" + derivation_id + ".dot"
    with open(dot_filename, "w") as file_handle:
        file_handle.write("digraph physicsDerivation { \n")
        file_handle.write("overlap = false;\n")
        file_handle.write(
            'label="derivation: '
            + derivation_dict["name_latex"]
            + '\nhttps://derivationmap.net";\n'
        )
        file_handle.write("fontsize=12;\n")

        for this_step_dict in list_of_step_dicts_in_this_derivation:
            print("latex/create_derivation_png step_dict=", this_step_dict)
            query_time_dict = write_step_to_graphviz_file(
                graphDB_Driver,
                query_time_dict,
                this_step_dict,
                file_handle,
                path_to_output_png,
            )

        file_handle.write("}\n")

    # name the PNG file referencing the hash of the .dot so we can detect changes
    output_filename_png = (
        "derivation_" + derivation_id + "_" + hash_of_file(dot_filename) + ".png"
    )
    output_filename_svg = (
        "derivation_" + derivation_id + "_" + hash_of_file(dot_filename) + ".svg"
    )
    # neato -Tpng graphviz.dot > /code/static/graphviz.png
    #    process = Popen(['neato','-Tpng','graphviz.dot','>','/code/static/graphviz.png'], stdout=PIPE, stderr=PIPE)

    # force redraw when updating step
    # a better way would be to check the md5 hash of the .dot file
    if not os.path.exists(path_to_output_png + output_filename_png):
        process = subprocess.run(
            ["neato", "-Tpng", dot_filename, "-o" + output_filename_png],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )

        neato_stdout = process.stdout.decode("utf-8")
        if len(neato_stdout) > 0:
            # logger.debug(neato_stdout)
            print(neato_stdout)
        neato_stderr = process.stderr.decode("utf-8")
        if len(neato_stderr) > 0:
            # logger.debug(neato_stderr)
            print(neato_stderr)

        print("output_filename_png, ", output_filename_png)
        print(
            "path_to_output_png + output_filename_png",
            path_to_output_png + output_filename_png,
        )
        shutil.move(output_filename_png, path_to_output_png + output_filename_png)

    # See https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/14
    # if not os.path.exists(path_to_output_png + output_filename_svg):
    #     process = subprocess.run(
    #         ["neato", "-Tsvg", dot_filename, "-o" + output_filename_svg],
    #         stdout=PIPE,
    #         stderr=PIPE,
    #         timeout=proc_timeout,
    #     )

    #     neato_stdout = process.stdout.decode("utf-8")
    #     if len(neato_stdout) > 0:
    #         # logger.debug(neato_stdout)
    #         print(neato_stdout)
    #     neato_stderr = process.stderr.decode("utf-8")
    #     if len(neato_stderr) > 0:
    #         # logger.debug(neato_stderr)
    #         print(neato_stderr)

    #     print("output_filename_svg=", output_filename_svg)
    #     print(
    #         "path_to_output_png + output_filename_svg=",
    #         path_to_output_png + output_filename_svg,
    #     )
    #     shutil.move(output_filename_svg, path_to_output_png + output_filename_svg)

    # return True, "no invalid latex", output_filename
    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_derivation_png end " + trace_id + "]")
    # return output_filename_png, output_filename_svg, query_time_dict
    return output_filename_png, query_time_dict


def create_step_graphviz_png(
    graphDB_Driver, query_time_dict, step_dict: dict, destination_folder: str
) -> str:
    """
    for a clear description of the graphviz language, see
    https://www.graphviz.org/doc/info/lang.html

    Args:
        derivation_id: numeric identifier of the derivation
        step_id: numeric identifier of the step within the derivation
        path_to_db: filename of the SQL database containing
                    a JSON entry that returns a nested dictionary
    Returns:
        output_filename: name of file produced by graphviz
    Raises:


    >>> step_dict = {'inf rule':'add X to both sides',
                     'inf rule local ID':'2948592',
                     'inputs':[{'expr local ID':'9428', 'expr ID':'4928923942'}],
                     'feeds':[{'feed local ID':'319', 'feed latex':'k'],
                     'outputs':[{'expr local ID':'3921', 'expr ID':'9499959299'}]}
    >>> create_step_graphviz_png("000001", "1029890", "pdg.db")

    """
    trace_id = str(random.randint(1000000, 9999999))
    # logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/create_step_graphviz_png start " + trace_id + "]")

    dot_filename = destination_folder + "graphviz.dot"
    compute.remove_file_debris([destination_folder], ["graphviz"], ["dot"])

    with open(dot_filename, "w") as file_handle:
        file_handle.write("digraph physicsDerivation { \n")
        file_handle.write("overlap = false;\n")
        file_handle.write(
            'label="step '
            + step_dict["id"]
            # + " in "
            # + dat["derivations"][derivation_id]["name"]
            + '\nhttps://derivationmap.net";\n'
        )
        file_handle.write("fontsize=12;\n")

        query_time_dict = write_step_to_graphviz_file(
            graphDB_Driver, query_time_dict, step_dict, file_handle, destination_folder
        )
        file_handle.write("}\n")

    #    with open(dot_filename,'r') as fil:
    #       logger.debug(file_handle.read())

    output_filename = step_dict["id"] + ".png"
    # logger.debug("output_filename = %s", output_filename)
    print("output_filename = %s", output_filename)
    compute.remove_file_debris([destination_folder], ["graphviz"], ["png"])

    # neato -Tpng graphviz.dot > /code/static/graphviz.png
    #    process = Popen(['neato','-Tpng','graphviz.dot','>','/code/static/graphviz.png'], stdout=PIPE, stderr=PIPE)
    if not os.path.exists(destination_folder + output_filename):
        process = subprocess.run(
            ["neato", "-Tpng", dot_filename, "-o" + output_filename],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        neato_stdout = process.stdout.decode("utf-8")
        if len(neato_stdout) > 0:
            # logger.debug(neato_stdout)
            print(neato_stdout)
        neato_stderr = process.stderr.decode("utf-8")
        if len(neato_stderr) > 0:
            # logger.debug(neato_stderr)
            print(neato_stdout)

        shutil.move(output_filename, destination_folder + output_filename)
    # return True, "no invalid latex", output_filename
    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_step_graphviz_png end " + trace_id + "]")
    return output_filename, query_time_dict


def write_step_to_graphviz_file(
    graphDB_Driver,
    query_time_dict: dict,
    step_dict: str,
    file_handle: TextIO,
    path_to_output_png: str,
) -> query_timing_result_type:
    """

    used by `create_derivation_png`
    and `create_step_graphviz_png`

    Args:
        derivation_id: numeric identifier of the derivation
        step_id: numeric identifier of the step within the derivation
        file_handle: file handle to open
        path_to_output_png: folder location (with trailing slash) to put PNG files in

    Returns:
        None

    Raises:

    >>> fil = open('a_file','r')
    >>> write_step_to_graphviz_file("000001", "1029890", file_handle, "pdg.db")
    """
    trace_id = str(random.randint(1000000, 9999999))
    # logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/write_step_to_graphviz_file start " + trace_id + "]")

    print("step_dict = %s", step_dict)
    # logger.debug("step_dict = %s", step_dict)

    (
        inference_rule_dict,
        list_of_input_dicts,
        list_of_feed_dicts,
        list_of_output_dicts,
    ) = compute.input_feed_output_infrule_for_step(
        graphDB_Driver, query_time_dict, step_dict
    )

    print("latex/write_step_to_graphviz_file inference_rule_dict", inference_rule_dict)
    print("latex/write_step_to_graphviz_file list_of_input_dicts", list_of_input_dicts)
    print("latex/write_step_to_graphviz_file list_of_feed_dicts", list_of_feed_dicts)
    print(
        "latex/write_step_to_graphviz_file list_of_output_dicts", list_of_output_dicts
    )

    # inference rule
    png_filename_no_extension = "".join(
        filter(str.isalnum, inference_rule_dict["name_latex"])
    )
    if not os.path.isfile(path_to_output_png + png_filename_no_extension + ".png"):
        create_png_from_latex(
            "\\text{" + inference_rule_dict["name_latex"] + "}",
            path_to_output_png,
            png_filename_no_extension,
        )
    file_handle.write(
        step_dict["id"]
        + ' [shape=invtrapezium, color=blue, label="",image="'
        + path_to_output_png
        + png_filename_no_extension
        + ".png"
        + '",labelloc=b];\n'
    )

    # input expression
    for input_dict in list_of_input_dicts:
        # TODO: account for input_dict['latex_condition']
        input_latex = (
            input_dict["m"]["latex_lhs"]
            + input_dict["m"]["latex_relation"]
            + input_dict["m"]["latex_rhs"]
        )
        png_filename_no_extension = (
            "expression_" + input_dict["m"]["id"] + "_" + hash_of_string(input_latex)
        )
        if not os.path.isfile(path_to_output_png + png_filename_no_extension + ".png"):
            create_png_from_latex(
                input_latex, path_to_output_png, png_filename_no_extension
            )
        file_handle.write(png_filename_no_extension + " -> " + step_dict["id"] + ";\n")
        file_handle.write(
            png_filename_no_extension
            + ' [shape=ellipse, color=black,label="",image="'
            + path_to_output_png
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    # output expressions
    for output_dict in list_of_output_dicts:
        # TODO: account for output_dict['latex_condition']
        output_latex = (
            output_dict["m"]["latex_lhs"]
            + output_dict["m"]["latex_relation"]
            + output_dict["m"]["latex_rhs"]
        )

        png_filename_no_extension = (
            "expression_" + output_dict["m"]["id"] + "_" + hash_of_string(output_latex)
        )
        if not os.path.isfile(path_to_output_png + png_filename_no_extension + ".png"):
            create_png_from_latex(
                output_latex, path_to_output_png, png_filename_no_extension
            )
        file_handle.write(step_dict["id"] + " -> " + png_filename_no_extension + ";\n")
        file_handle.write(
            png_filename_no_extension
            + ' [shape=ellipse, color=black,label="",image="'
            + path_to_output_png
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    # feed expressions
    for feed_dict in list_of_feed_dicts:
        png_filename_no_extension = (
            "feed_"
            + feed_dict["m"]["id"]
            + "_"
            + hash_of_string(feed_dict["m"]["latex"])
        )
        if not os.path.isfile(path_to_output_png + png_filename_no_extension + ".png"):
            create_png_from_latex(
                feed_dict["m"]["latex"], path_to_output_png, png_filename_no_extension
            )
        file_handle.write(png_filename_no_extension + " -> " + step_dict["id"] + ";\n")
        file_handle.write(
            png_filename_no_extension
            + ' [shape=box, color=red,label="",image="'
            + path_to_output_png
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/write_step_to_graphviz_file end " + trace_id + "]")
    return query_time_dict


# EOF
