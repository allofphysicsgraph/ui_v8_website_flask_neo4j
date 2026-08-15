#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import pytest

from playwright.sync_api import Page, expect

URL = "https://host.docker.internal"
# URL = "https://localhost"

# See https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/107


# This test comes first so that we can "log in"
@pytest.fixture
def logged_in_page(page: Page):
    # Visit the backdoor route to establish the session cookie
    page.goto(f"{URL}/login-test-user")
    # Verify we are logged in
    return page


# EOF
