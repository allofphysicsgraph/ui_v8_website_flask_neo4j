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

import hashlib

# https://docs.python.org/3/library/typing.html
# from typing import Tuple, TextIO, List  # mypy
# TextIO is file handle assocaited with `open()`
from typing import TextIO

import compute
import neo4j_query

proc_timeout = 30


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


def generate_tex_file_for_derivation(
    graphDB_Driver, query_time_dict: dict, derivation_id: str, path_to_tex_file: str
) -> str:
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
    print("[TRACE] func: latex/generate_tex_file_for_derivation start " + trace_id)

    tex_filename = derivation_id

    compute.remove_file_debris(
        [path_to_tex_file], [tex_filename], ["tex", "log", "pdf", "aux"]
    )

    with graphDB_Driver.session() as session:
        query_start_time = time.time()
        derivation_dict = session.read_transaction(
            neo4j_query.get_node_properties, "derivation", derivation_id
        )
    print("latex/generate_tex_file_for_derivation: derivation_dict=", derivation_dict)

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
        "latex/generate_tex_file_for_derivation: list_of_sequence_values=",
        list_of_sequence_values,
    )

    with open(tex_filename + ".tex", "w") as lat_file:
        lat_file.write(
            "% this tex file was generated by the Physics Derivation Graph \n"
        )
        lat_file.write("\\documentclass[12pt]{article}\n")  # article or report
        #        lat_file.write('\\thispagestyle{empty}\n')
        lat_file.write(
            "\\usepackage{amsmath,amssymb,amsfonts}\n"
        )  # https://tex.stackexchange.com/questions/32100/what-does-each-ams-package-do
        lat_file.write(
            "\\usepackage[dvipdfmx,colorlinks=true,pdfkeywords={physics derivation graph}]{hyperref}\n"
        )
        lat_file.write("\\usepackage{graphicx} % for including PNG files\n")
        # lat_file.write("\\newcommand{\\when}[1]{{\\rm \\ when\\ }#1}\n")
        # lat_file.write("\\newcommand{\\bra}[1]{\\langle #1 |}\n")
        # lat_file.write("\\newcommand{\\ket}[1]{| #1\\rangle}\n")
        # lat_file.write("\\newcommand{\\op}[1]{\\hat{#1}}\n")
        # lat_file.write("\\newcommand{\\braket}[2]{\\langle #1 | #2 \\rangle}\n")
        # lat_file.write(
        #    "\\newcommand{\\rowCovariantColumnContravariant}[3]{#1_{#2}^{\\ \\ #3}} % left-bottom, right-upper\n"
        # )
        # lat_file.write(
        #    "\\newcommand{\\rowContravariantColumnCovariant}[3]{#1^{#2}_{\\ \\ #3}} % left-upper, right-bottom\n"
        # )

        with graphDB_Driver.session() as session:
            query_start_time = time.time()
            list_of_inference_rule_dicts = session.read_transaction(
                neo4j_query.get_list_node_dicts_of_type, "inference_rule"
            )

        # first, write the inference rules as newcommand at top of .tex file
        lat_file.write("% inference rules as newcommand for use in the body\n")
        for infrule_dict in list_of_inference_rule_dicts:
            number_of_args = (
                infrule_dict["number_of_feeds"]
                + infrule_dict["number_of_inputs"]
                + infrule_dict["number_of_outputs"]
            )
            # https://en.wikibooks.org/wiki/LaTeX/Macros#New_commands
            if number_of_args < 10:
                lat_file.write(
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
                lat_file.write(
                    "\\newcommand\\"
                    + "".join(filter(str.isalpha, infrule_dict["name_latex"]))
                    + "[9]{"
                    + "\\def\\ArgOne{{#1}}\n\\def\\ArgTwo{{#2}}\n\\def\\ArgThree{{#3}}\n\\def\\ArgFour{{#4}}\n\\def\\ArgFive{{#5}}\n"
                    + "\\def\\ArgSix{{#6}}\n\\def\\ArgSeven{{#7}}\n\\def\\ArgEight{{#8}}\n\\def\\ArgNine{{#9}}\n\\"
                    + "".join(filter(str.isalpha, infrule_dict["name_latex"]))
                    + "Relay\n"
                    + "}\n"
                )
                lat_file.write(
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

        lat_file.write("\\title{" + str(derivation_dict["name_latex"]) + "}\n")
        lat_file.write("\\date{\\today}\n")
        lat_file.write("\\author{" + str(derivation_dict["author_name_latex"]) + "}\n")
        lat_file.write("\\setlength{\\topmargin}{-.5in}\n")
        lat_file.write("\\setlength{\\textheight}{9in}\n")
        lat_file.write("\\setlength{\\oddsidemargin}{0in}\n")
        lat_file.write("\\setlength{\\textwidth}{6.5in}\n")

        lat_file.write("\\begin{document}\n")
        lat_file.write("\\maketitle\n")

        lat_file.write("\\begin{abstract}\n")
        lat_file.write(
            "Generated by the \\href{http://derivationmap.net/}{Physics Derivation Graph}.\n"
        )
        if len(derivation_dict["abstract_latex"]) > 0:
            # fixed bug https://github.com/allofphysicsgraph/proofofconcept/issues/249
            # safe_string = dat["derivations"][deriv_id]["notes"]
            #                lat_file.write(safe_string + "\n")
            lat_file.write(derivation_dict["abstract_latex"] + "\n")
        lat_file.write("\\end{abstract}\n")

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

                    lat_file.write("\n")
                    if len(step_dict["note_before_step_latex"]) > 0:
                        lat_file.write(step_dict["note_before_step_latex"] + "\n")

                    if (
                        "image" in step_dict.keys()
                    ):  # as of 2025-01-02 `image` isn't a valid key in the schema
                        lat_file.write("\\begin{center}\n")
                        lat_file.write("\\begin{figure}\n")
                        #        shutil.copy(
                        #            "static/diagrams/" + step_dict["image"]["file name"],
                        #        step_dict["image"]["file name"],
                        # )
                        lat_file.write(
                            "\\includegraphics{"
                            + step_dict["image"]["file name"]
                            + "}\n"
                        )
                        lat_file.write(
                            "\\caption{" + step_dict["image"]["caption"] + "}\n"
                        )
                        lat_file.write(
                            "\\label{fig:" + step_dict["image"]["label"] + "}\n"
                        )
                        lat_file.write("\\end{figure}\n")
                        lat_file.write("\\end{center}\n")
                    # using the newcommand, populate the expression identifiers
                    lat_file.write("% step ID = " + step_dict["id"] + "\n")
                    lat_file.write(
                        # digits cannot be used to name macros
                        "\\"
                        + "".join(filter(str.isalpha, inference_rule_name))
                    )
                    for feed_latex in list_of_feed_latex:
                        lat_file.write("{" + feed_latex + "}")
                    for input_latex in list_of_input_expression_latex:

                        this_str = str(input_latex) + str(derivation_dict["name_latex"])
                        local_id = hashlib.md5(this_str.encode("utf-8")).hexdigest()

                        lat_file.write("{" + local_id + "}")
                    for output_latex in list_of_output_expression_latex:

                        this_str = str(output_latex) + str(
                            derivation_dict["name_latex"]
                        )
                        local_id = hashlib.md5(this_str.encode("utf-8")).hexdigest()

                        lat_file.write("{" + local_id + "}")
                    lat_file.write("\n")

                    # write output expressions
                    for output_latex in list_of_output_expression_latex:

                        this_str = str(output_latex) + str(
                            derivation_dict["name_latex"]
                        )
                        local_id = hashlib.md5(this_str.encode("utf-8")).hexdigest()

                        lat_file.write("\\begin{equation}\n")
                        lat_file.write(output_latex + "\n")
                        lat_file.write("\\label{eq:" + local_id + "}\n")
                        lat_file.write("\\end{equation}\n")

                    if len(step_dict["note_after_step_latex"]) > 0:
                        lat_file.write(
                            step_dict["note_after_step_latex"] + "\n"
                        )  # TODO: if the note contains a $ or %, shenanigans arise

        lat_file.write("\\bibliographystyle{plain}\n")
        lat_file.write("\\bibliography{pdg.bib}\n")
        lat_file.write("\\end{document}\n")
        lat_file.write("% EOF\n")

    shutil.copy(tex_filename + ".tex", path_to_tex_file + tex_filename + ".tex")
    # logger.info("[trace end " + trace_id + "]")

    print("[TRACE] func: latex/generate_tex_file_for_derivation " + trace_id)
    return tex_filename  # pass back filename without extension because bibtex cannot handle .tex


def generate_pdf_for_derivation(
    graphDB_Driver, query_time_dict: dict, derivation_id: str, path_to_pdf: str
) -> str:
    """

    Args:
        deriv_id: numeric identifier of the derivation
        path_to_pdf = "/code/static/"  # must end with /
    Returns:
        pdf_filename + ".pdf":
    Raises:

    >>> generate_pdf_for_derivation("000001", "myemail@address.com","pdg.db")
    """
    # logger.info("[trace start " + trace_id + "]")
    trace_id = str(random.randint(1000000, 9999999))
    print("[TRACE] func: latex/generate_pdf_for_derivation start " + trace_id)


    # to isolate the build process, create a temporary folder
    tmp_latex_folder = "tmp_latex_folder_" + str(random.randint(1000000, 9999999))
    tmp_latex_folder_full_path = os.getcwd() + "/" + tmp_latex_folder + "/"
    os.mkdir(tmp_latex_folder_full_path)

    # destination for the PDF once file is built

    pdf_filename = derivation_id

    tex_filename_without_extension = generate_tex_file_for_derivation(
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

    print("[TRACE] func: latex/generate_pdf_for_derivation start " + trace_id)
    return pdf_filename + ".pdf"


def create_png_from_latex(input_latex_str: str, destination_folder:str, png_filename_no_extension: str) -> None:
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


    #    logger.debug("png_filename_no_extension = %s", png_filename_no_extension)
    #    logger.debug("input latex str = %s", input_latex_str)

    # TODO: I'd like to have the latex build process take place in an isolated directory
    # instead of the /code/ location used now

    tmp_latex_folder = "tmp_latex_folder_" + str(random.randint(1000000, 9999999))
    tmp_latex_folder_full_path = os.getcwd() + "/" + tmp_latex_folder + "/"
    original_dir = os.getcwd()
    os.mkdir(tmp_latex_folder_full_path)
    os.chdir(tmp_latex_folder_full_path)

    tmp_file = "lat"

    logger.debug("latex = " + str(input_latex_str))
    create_tex_file_for_latex_expression(tmp_file, input_latex_str)

    tex_filename_with_hash = png_filename_no_extension + "_" + md5_of_file(tmp_file + ".tex") + ".tex"

    # shutil.move(tmp_file + ".tex", tex_filename_with_hash)
    # logger.debug(str(os.listdir()))

    # only make PNG if .tex did not exist
    if not os.path.exists("/code/static/" + tex_filename_with_hash):
        shutil.copy(tmp_file + ".tex", destination_folder + tex_filename_with_hash)

        process = subprocess.run(
            ["latex", "-halt-on-error", tmp_file + ".tex"],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
        latex_stdout = process.stdout.decode("utf-8")
        latex_stderr = process.stderr.decode("utf-8")

        #    logger.debug(str(os.listdir()))

        logger.debug("latex std out:" + str(latex_stdout))
        logger.debug("latex std err:" + str(latex_stderr))

        if "Text line contains an invalid character" in latex_stdout:
            logging.error("tex input contains invalid charcter")
            shutil.copy(destination_folder + "error.png", destination_folder + png_filename_no_extension)
            raise Exception("no png generated due to invalid character in tex input.")
        #    remove_file_debris(["./"], [tmp_file], ["png"])

        # dvipng file.dvi -T tight -o file.png
        process = subprocess.run(
            ["dvipng", tmp_file + ".dvi", "-T", "tight", "-o", tmp_file + ".png"],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
        png_stdout = process.stdout.decode("utf-8")
        png_stderr = process.stderr.decode("utf-8")

        if len(png_stdout) > 0:
            if "This is dvipng" not in png_stdout:
                logger.debug("png std out %s", png_stdout)
        if len(png_stderr) > 0:
            logger.debug("png std err %s", png_stderr)

        # logger.debug(str(os.listdir()))

        if "No such file or directory" in png_stderr:
            logging.error("PNG creation failed for %s", png_filename_no_extension)
            shutil.copy(destination_folder + "error.png", destination_folder + png_filename_no_extension)
            # return False, "no PNG created. Check usepackage in latex"
            raise Exception(
                "no PNG created for " + png_filename_no_extension + ". Check 'usepackage' in latex"
            )

        if not (os.path.isfile(tmp_file + ".png")):
            logging.error("PNG creation failed for %s", png_filename_no_extension)

        shutil.move(tmp_file + ".png", destination_folder + png_filename_no_extension + ".png")

    logger.debug(destination_folder + png_filename_no_extension + ".png")

    os.chdir(original_dir)
    shutil.rmtree(tmp_latex_folder_full_path)

    #    if os.path.isfile(destination_folder + png_filename_no_extension):
    # os.remove('/code/static/'+name_of_png)
    #        logger.error("png already exists!")

    # return True, "success"
    #logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_png_from_latex start " + trace_id + "]")
    return


def create_tex_file_for_latex_expression(tmp_file: str, input_latex_str: str) -> None:
    """

    Args:
        tmp_file:
        input_latex_str
    Returns:
        None

    Raises:

    >>> create_tex_file_for_latex_expression('filename_without_extension', 'a \dot b \\nabla')
    """
    trace_id = str(random.randint(1000000, 9999999))
    # logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/create_tex_file_for_latex_expression start " + trace_id + "]")

    compute.remove_file_debris(["./"], [tmp_file], ["tex"])

    with open(tmp_file + ".tex", "w") as lat_file:
        lat_file.write("\\documentclass[12pt]{article}\n")
        lat_file.write("\\thispagestyle{empty}\n")
        # https://tex.stackexchange.com/questions/73016/how-do-i-install-an-individual-package-on-a-linux-system
        # if "usepackage{braket}" is on and the package is not available, the process pauses while waiting for user input
        # the web interface is not aware of this pause, so the page hangs
        # lat_file.write("\\usepackage{braket}\n")
        lat_file.write(
            "\\usepackage{amsmath}\n"
        )  # https://tex.stackexchange.com/questions/32100/what-does-each-ams-package-do
        # lat_file.write("\\newcommand{\\when}[1]{{\\rm \\ when\\ }#1}\n")
        # lat_file.write("\\newcommand{\\bra}[1]{\\langle #1 |}\n")
        # lat_file.write("\\newcommand{\\ket}[1]{| #1\\rangle}\n")
        # lat_file.write("\\newcommand{\\op}[1]{\\hat{#1}}\n")
        # lat_file.write("\\newcommand{\\braket}[2]{\\langle #1 | #2 \\rangle}\n")
        # lat_file.write(
        #    "\\newcommand{\\rowCovariantColumnContravariant}[3]{#1_{#2}^{\\ \\ #3}} % left-bottom, right-upper\n"
        # )
        # lat_file.write(
        #    "\\newcommand{\\rowContravariantColumnCovariant}[3]{#1^{#2}_{\\ \\ #3}} % left-upper, right-bottom\n"
        # )

        lat_file.write("\\begin{document}\n")
        lat_file.write("\\huge{\n")
        lat_file.write("$" + input_latex_str + "$\n")
        lat_file.write("}\n")
        lat_file.write("\\end{document}\n")
    # logger.debug("wrote tex file")
    # logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_tex_file_for_latex_expression end " + trace_id + "]")
    return


def create_derivation_png(graphDB_Driver, query_time_dict: dict, deriv_id: str, path_to_output_png: str) -> str:
    """
    for a clear description of the graphviz language, see
    https://www.graphviz.org/doc/info/lang.html

    Args:
        deriv_id: numeric identifier of the derivation
        path_to_output_png: where should png be placed? Includes trailing slash

    Returns:
        output_filename: name of file produced by graphviz; either `<deriv_id>.png` or `error.png`
    Raises:


    >>> create_derivation_png("000001", "pdg.db")
    """
    trace_id = str(random.randint(1000000, 9999999))
    #logger.info("[trace start " + trace_id + "]")
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
    print("latex/create_derivation_png: list_of_step_dicts_in_this_derivation=", list_of_step_dicts_in_this_derivation)

    dot_filename = path_to_output_png+"derivation_" + deriv_id + ".dot"
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
            # TODO: following needs to be updated 
            write_step_to_graphviz_file(deriv_id, step_id, file_handle, path_to_db)

        file_handle.write("}\n")

    # name the PNG file referencing the hash of the .dot so we can detect changes
    output_filename = (
        "derivation_" + deriv_id + "_" + md5_of_file(dot_filename) + ".png"
    )
    # neato -Tpng graphviz.dot > /code/static/graphviz.png
    #    process = Popen(['neato','-Tpng','graphviz.dot','>','/code/static/graphviz.png'], stdout=PIPE, stderr=PIPE)

    # force redraw when updating step
    # a better way would be to check the md5 hash of the .dot file
    if not os.path.exists(path_to_output_png + output_filename):
        process = subprocess.run(
            ["neato", "-Tpng", dot_filename, "-o" + output_filename],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )

        neato_stdout = process.stdout.decode("utf-8")
        if len(neato_stdout) > 0:
            logger.debug(neato_stdout)
        neato_stderr = process.stderr.decode("utf-8")
        if len(neato_stderr) > 0:
            logger.debug(neato_stderr)

        shutil.move(output_filename, path_to_output_png + output_filename)
    # return True, "no invalid latex", output_filename
    #logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_derivation_png end " + trace_id + "]")
    return output_filename


def create_step_graphviz_png(deriv_id: str, step_id: str, path_to_db: str) -> str:
    """
    for a clear description of the graphviz language, see
    https://www.graphviz.org/doc/info/lang.html

    Args:
        deriv_id: numeric identifier of the derivation
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
    #logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/create_step_graphviz_png start " + trace_id + "]")

    dot_filename = "/code/static/graphviz.dot"
    remove_file_debris(["/code/static/"], ["graphviz"], ["dot"])

    with open(dot_filename, "w") as fil:
        file_handle.write("digraph physicsDerivation { \n")
        file_handle.write("overlap = false;\n")
        file_handle.write(
            'label="step '
            + step_id
            + " in "
            + dat["derivations"][deriv_id]["name"]
            + '\nhttps://derivationmap.net";\n'
        )
        file_handle.write("fontsize=12;\n")

        write_step_to_graphviz_file(deriv_id, step_id, file_handle, path_to_db)
        file_handle.write("}\n")

    #    with open(dot_filename,'r') as fil:
    #       logger.debug(file_handle.read())

    output_filename = step_id + ".png"
    logger.debug("output_filename = %s", output_filename)
    remove_file_debris(["./"], ["graphviz"], ["png"])

    # neato -Tpng graphviz.dot > /code/static/graphviz.png
    #    process = Popen(['neato','-Tpng','graphviz.dot','>','/code/static/graphviz.png'], stdout=PIPE, stderr=PIPE)
    if not os.path.exists("/code/static/" + output_filename):
        process = subprocess.run(
            ["neato", "-Tpng", dot_filename, "-o" + output_filename],
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        neato_stdout = process.stdout.decode("utf-8")
        if len(neato_stdout) > 0:
            logger.debug(neato_stdout)
        neato_stderr = process.stderr.decode("utf-8")
        if len(neato_stderr) > 0:
            logger.debug(neato_stderr)

        shutil.move(output_filename, "/code/static/" + output_filename)
    # return True, "no invalid latex", output_filename
    #logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/create_step_graphviz_png end " + trace_id + "]")
    return output_filename


def write_step_to_graphviz_file(deriv_id: str, step_id: str, fil: TextIO) -> None:
    """

    used by `create_derivation_png`
    and `create_step_graphviz_png`

    Args:
        deriv_id: numeric identifier of the derivation
        step_id: numeric identifier of the step within the derivation
        fil:

    Returns:
        None

    Raises:

    >>> fil = open('a_file','r')
    >>> write_step_to_graphviz_file("000001", "1029890", file_handle, "pdg.db")
    """
    trace_id = str(random.randint(1000000, 9999999))
    #logger.info("[trace start " + trace_id + "]")
    print("[TRACE] latex/write_step_to_graphviz_file start " + trace_id + "]")


    step_dict = dat["derivations"][deriv_id]["steps"][step_id]
    print("step_dict = %s", step_dict)
    #logger.debug("step_dict = %s", step_dict)

    #  step_dict = {'inf rule': 'begin derivation', 'inputs': [], 'feeds': [], 'outputs': ['526874110']}
    #    for global_id, latex_and_ast_dict in dat["expressions"].items():
    #        logger.debug(
    #            "expr_dict has %s %s",
    #            global_id,
    #            latex_and_ast_dict["latex"],
    #        )

    # inference rule
    png_filename_no_extension = "".join(filter(str.isalnum, step_dict["inf rule"]))
    if not os.path.isfile("/code/static/" + png_filename_no_extension + ".png"):
        create_png_from_latex("\\text{" + step_dict["inf rule"] + "}", png_filename_no_extension)
    file_handle.write(
        step_id
        + ' [shape=invtrapezium, color=blue, label="",image="/code/static/'
        + png_filename_no_extension
        + ".png"
        + '",labelloc=b];\n'
    )

    # input expression
    for expr_local_id in step_dict["inputs"]:
        expr_global_id = dat["expr local to global"][expr_local_id]
        png_filename_no_extension = expr_global_id
        if not os.path.isfile("/code/static/" + png_filename_no_extension + ".png"):
            create_png_from_latex(dat["expressions"][expr_global_id]["latex"], png_filename_no_extension)
        file_handle.write(expr_local_id + " -> " + step_id + ";\n")
        file_handle.write(
            expr_local_id
            + ' [shape=ellipse, color=black,label="",image="/code/static/'
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    # output expressions
    for expr_local_id in step_dict["outputs"]:
        expr_global_id = dat["expr local to global"][expr_local_id]
        png_filename_no_extension = expr_global_id
        if not os.path.isfile("/code/static/" + png_filename_no_extension + ".png"):
            create_png_from_latex(dat["expressions"][expr_global_id]["latex"], png_filename_no_extension)
        file_handle.write(step_id + " -> " + expr_local_id + ";\n")
        file_handle.write(
            expr_local_id
            + ' [shape=ellipse, color=black,label="",image="/code/static/'
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    # feed expressions
    for expr_local_id in step_dict["feeds"]:
        expr_global_id = dat["expr local to global"][expr_local_id]
        png_filename_no_extension = expr_global_id
        if not os.path.isfile("/code/static/" + png_filename_no_extension + ".png"):
            create_png_from_latex(dat["expressions"][expr_global_id]["latex"], png_filename_no_extension)
        file_handle.write(expr_local_id + " -> " + step_id + ";\n")
        file_handle.write(
            expr_local_id
            + ' [shape=box, color=red,label="",image="/code/static/'
            + png_filename_no_extension
            + ".png"
            + '",labelloc=b];\n'
        )

    #logger.info("[trace end " + trace_id + "]")
    print("[TRACE] latex/write_step_to_graphviz_file end " + trace_id + "]")
    return

#EOF