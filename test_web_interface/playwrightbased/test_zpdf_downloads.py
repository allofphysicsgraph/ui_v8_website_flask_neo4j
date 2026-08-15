#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

import re
from playwright.sync_api import Page, expect

# URL = "https://localhost"
URL = "https://host.docker.internal"


def test_get_review_derivation_instance(page: Page):
    page.on("console", lambda msg: print(f"Console: {msg.text}"))
    page.on("pageerror", lambda exc: print(f"JS Error: {exc}"))

    page.goto(URL + "/review_derivation/0000201726")

    expect(
        page.get_by_role("heading", name=re.compile("Symbols used in"))
    ).to_be_visible()

    pdf_button = page.locator('input[name="generate pdf"]')

    page.wait_for_load_state("networkidle")  # Wait for all scripts to finish loading

    # When you click a button that triggers a download (especially one served with a
    # `Content-Disposition: attachment` header), the browser does not navigate the
    # page to a new URL. It stays on the current page while the file downloads in the background.

    with page.expect_download() as download_info:
        pdf_button.click(force=True)

        print("download PDF using button")
        download = download_info.value
        print(f"Downloaded from: {download.url}")

        # ASSERT AGAINST THE DOWNLOAD URL, NOT THE PAGE
        expected_pdf_url = (
            URL
            + "/static/generated_0000201726.pdf?referrer=select_from_existing_derivations"
        )
        assert download.url == expected_pdf_url

        # Wait for the download process to complete
        path = (
            download.path()
        )  # This waits for the download to finish and returns local path
        assert path is not None

        # Check the filename
        assert download.suggested_filename == "generated_0000201726.pdf"

    # Verify the page didn't navigate away
    expect(page).to_have_url(URL + "/review_derivation/0000201726")


def test_get_query_list_derivation_IDs(page: Page):
    page.goto(URL + "/query?cypher=MATCH%20(n:derivation)%20RETURN%20n.id")

    expect(page.get_by_role("heading", name="Cypher query")).to_be_visible()

    raw_records = page.locator("ul li span.mathjax_ignore").all_text_contents()

    derivation_ids = []
    for text in raw_records:
        match = re.search(r"n\.id='(\d+)'", text)
        if match:
            derivation_ids.append(match.group(1))

    for dev_id in derivation_ids:
        page.goto(f"{URL}/review_derivation/{dev_id}")

        print(f"{URL}/review_derivation/{dev_id}")

        expect(
            page.get_by_role("heading", name=re.compile("Symbols used in"))
        ).to_be_visible()

        pdf_button = page.locator('input[name="generate pdf"]')

        page.wait_for_load_state(
            "networkidle"
        )  # Wait for all scripts to finish loading

        # When you click a button that triggers a download (especially one served with a
        # `Content-Disposition: attachment` header), the browser does not navigate the
        # page to a new URL. It stays on the current page while the file downloads in the background.

        with page.expect_download() as download_info:
            pdf_button.click(force=True)

            download = download_info.value
            print(f"Downloaded from: {download.url}")

            # ASSERT AGAINST THE DOWNLOAD URL, NOT THE PAGE
            expected_pdf_url = (
                URL
                + "/static/generated_"
                + dev_id
                + ".pdf?referrer=select_from_existing_derivations"
            )
            assert download.url == expected_pdf_url

            # Wait for the download process to complete
            path = (
                download.path()
            )  # This waits for the download to finish and returns local path
            assert path is not None

            # Check the filename
            assert download.suggested_filename == "generated_" + dev_id + ".pdf"

        # Verify the page didn't navigate away
        expect(page).to_have_url(URL + "/review_derivation/" + dev_id)
