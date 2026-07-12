#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

from playwright.sync_api import Page, expect

# this is what is exposed inside the Docker container
URL = "http://localhost:5000"


def test_validate_operations_api(page: Page):
    # Perform a GET request to the API endpoint
    response = page.request.get(f"{URL}/api/resources/symbol/operations")

    # Validate that the response is successful
    assert response.ok
    assert response.status == 200

    # Check the custom Content-Type header (Playwright normalizes keys to lowercase)
    assert response.headers.get("content-type") == "application/hal+json"

    # Extract and parse the response body as JSON
    data = response.json()

    # Validate the JSON structure
    assert "_embedded" in data
    assert "operation_symbols" in data["_embedded"]

    operation_symbols = data["_embedded"]["operation_symbols"]
    assert isinstance(operation_symbols, list)
    assert len(operation_symbols) > 0

    # Locate a specific item (e.g., 'multiplication') and assert its properties
    multiplication = next(
        (op for op in operation_symbols if op.get("name_latex") == "multiplication"),
        None,
    )
    assert (
        multiplication is not None
    ), "The 'multiplication' operation was not found in the payload"

    # Assert field values on the multiplication symbol
    # assert multiplication["id"] == "0001094924"
    assert multiplication["latex"] == "\\cdot"
    assert multiplication["argument_count"] == 2
    # assert multiplication["description_latex"] == "multiply two terms"

    # Assert HAL links are present and correct
    assert "_links" in multiplication
    links = multiplication["_links"]
    assert "delete" in links
    assert "edit" in links
    assert "self" in links

    assert links["delete"]["method"] == "DELETE"
    assert links["edit"]["method"] == "POST"
    assert "delete" in links["delete"]["href"]


#EOF