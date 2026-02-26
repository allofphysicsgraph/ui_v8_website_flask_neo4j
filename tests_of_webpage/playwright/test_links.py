#!/usr/bin/env python3

import re
from playwright.sync_api import Page, expect

# this is what is exposed inside the Docker container
URL="http://localhost:5000"

def test_has_title(page: Page):
    page.goto(URL)

    # Expect a title to contain a substring.
    expect(page).to_have_title(re.compile("Welcome")) 
    # using a str would necessitate an exact match, whereas using `re` enables partial matches.
    # `.to_have_title` shows up in the HTML's <title> tag -- the browser tab

def test_get_started_link(page: Page):
    page.goto(URL)

    # Click the get started link.
    page.get_by_test_id("impatient-nav-link").click()

    # the following doesn't work because there are multiple `<a href="">navigation</a>`
    #page.get_by_role("link", name="navigation").click()

    # Expects page to have a heading with the name of `Navigating`.
    expect(page.get_by_role("heading", name="Navigating")).to_be_visible()


def test_nav_page(page: Page):
    page.goto(URL+"/navigation")

    expect(page).to_have_title(re.compile("site map"))

def test_nav_page_to_derivations(page: Page):
    page.goto(URL+"/navigation")

    page.get_by_role("link", name="derivations").click()

    expect(page).to_have_title(re.compile("Derivation"))

def test_derivations_list_to_curl_curl(page: Page):
    page.goto(URL+"/list_derivations")

    page.get_by_role("link", name="curl curl identity").click()

    expect(page.get_by_role("heading", name="Review curl curl identity")).to_be_visible()