#!/usr/bin/env python3
# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import os
import random
import uuid

import logging

logger = logging.getLogger(__name__)

from subprocess import PIPE  # https://docs.python.org/3/library/subprocess.html
import subprocess  # https://stackoverflow.com/questions/39187886/what-is-the-difference-between-subprocess-popen-and-subprocess-run/39187984

proc_timeout = 120

STATIC_DIR = os.environ.get(
    "STATIC_DIR",
    os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "static")),
)


def run_lean(user_lean_input: str) -> str:
    """ """
    trace_id = str(uuid.uuid4())
    logger.info("[TRACE] run_lean start " + trace_id)

    logger.info("STATIC_DIR= " + str(STATIC_DIR))

    folder_path = STATIC_DIR + "/temp_lean/"

    logger.info("folder_path= " + str(folder_path))

    os.makedirs(folder_path, exist_ok=True)

    path_to_lean_file = folder_path + str(random.randint(1000000, 9999999)) + ".lean"

    with open(path_to_lean_file, "w") as file_handle:
        file_handle.write(user_lean_input)

    # validate that file exists
    logger.info(os.path.exists(path_to_lean_file))

    try:
        process = subprocess.run(
            ["lake", "env", "lean", path_to_lean_file],
            cwd="/opt/new_project/project_name",
            stdout=PIPE,
            stderr=PIPE,
            timeout=proc_timeout,
        )
        # https://stackoverflow.com/questions/41171791/how-to-suppress-or-capture-the-output-of-subprocess-run
        lean_stdout = process.stdout.decode("utf-8")
        lean_stderr = process.stderr.decode("utf-8")
    except subprocess.TimeoutExpired as err:
        raise Exception("time-out error after " + str(proc_timeout) + " seconds")

    logger.info("[TRACE] run_lean end " + trace_id)
    return lean_stdout, lean_stderr
