#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

# this is what is exposed inside the Docker container
URL = "http://localhost:5000"

from playwright.sync_api import Page
from urllib.parse import urlparse, urlunparse


def test_local_sitemap(page: Page):
    # Visit the sitemap page
    page.goto(f"{URL}/sitemap.txt")

    # Extract the text content from the body
    content = page.inner_text("body")

    # Split into individual lines and filter out empty ones
    raw_urls = [line.strip() for line in content.splitlines() if line.strip()]

    failed_urls = []

    for raw_url in raw_urls:
        # Parse the URL and swap the domain to point to localhost:5000
        parsed = urlparse(raw_url)
        local_url = urlunparse(
            (
                "http",  # force http (or keep parsed.scheme if needed)
                "localhost:5000",  # replace domain/port
                parsed.path,
                parsed.params,
                parsed.query,
                parsed.fragment,
            )
        )

        # print(f"Testing reachability of {local_url}")

        try:
            # Use page.request.get() to check HTTP status without triggering browser rendering or downloads
            response = page.request.get(local_url)

            # Validate reachability (checking for HTTP status < 400)
            if response.status >= 400:
                failed_urls.append((local_url, response.status))
        except Exception as e:
            # Catch network errors (e.g., connection refused if the server is down)
            failed_urls.append((local_url, f"Error: {e}"))
            

    # Assert that all URLs passed (fails the test and lists all broken links at once)
    assert (
        not failed_urls
    ), f"The following local URLs are unreachable or returned errors: {failed_urls}"

    print("failed URLs: " + str(failed_urls))


# EOF
