#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

# this is what is exposed inside the Docker container
URL = "http://localhost:5000"

from playwright.sync_api import Page

import requests


def test_workflow_documentation_links(page: Page):
    page.goto(f"{URL}/workflow_documentation")

    # Find all anchor tags with an 'href' attribute
    link_elements = page.locator("a[href]").all()

    # Extract the actual URLs
    urls = set()
    for element in link_elements:
        href = element.get_attribute("href")
        if href:
            # Resolve relative URLs against the current page URL if necessary
            # (e.g., /about -> http://localhost:5000/about)
            full_url = page.eval_on_selector(f"a[href='{href}']", "(el) => el.href")
            urls.add(full_url)

    # Check each link
    broken_links = []
    for url in urls:
        # Skip mailto, tel, or javascript pseudo-links
        if url.startswith(("mailto:", "tel:", "javascript:")):
            continue

        try:
            # Use a timeout so the test doesn't hang indefinitely on a dead server
            response = requests.head(url, timeout=5, allow_redirects=True)

            # Some servers don't support HEAD requests, fall back to GET if 405 Method Not Allowed
            if response.status_code == 405:
                response = requests.get(url, timeout=5, allow_redirects=True)

            if response.status_code >= 400:
                broken_links.append((url, response.status_code))
        except requests.RequestException as e:
            broken_links.append((url, str(e)))

    # Fail the test if any broken links were found
    assert not broken_links, f"Found broken links: {broken_links}"


# EOF
