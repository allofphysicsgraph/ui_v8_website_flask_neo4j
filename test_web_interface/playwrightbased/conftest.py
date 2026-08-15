#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/


# configure your browser context to ignore HTTPS errors.
# this file is found by `pytest-playwright`

import pytest

import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


@pytest.fixture(scope="session")
def browser_context_args(browser_context_args):
    return {**browser_context_args, "ignore_https_errors": True}


# EOF
