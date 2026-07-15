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


def test_api_entry_point(page: Page):
    response = page.request.get(f"{URL}/api/")
    assert response.ok
    assert response.status == 200
    assert "application/hal+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "message" in data
    assert "_links" in data

    links = data["_links"]
    assert "derivations" in links
    assert "inference_rules" in links
    assert "whoami" in links


def test_list_derivations_api(page: Page):
    response = page.request.get(f"{URL}/api/resources/derivations")
    assert response.ok
    assert response.status == 200
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "_embedded" in data
    assert "derivations" in data["_embedded"]

    # Check default template structures for creation
    assert "_templates" in data
    assert "default" in data["_templates"]
    assert data["_templates"]["default"]["method"] == "POST"


def test_list_expressions_api(page: Page):
    response = page.request.get(f"{URL}/api/resources/expressions")
    assert response.ok
    assert response.status == 200
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "expressions" in data["_embedded"]


def test_list_scalars_api(page: Page):
    response = page.request.get(f"{URL}/api/resources/symbol/scalars")
    assert response.ok
    assert response.status == 200
    assert "application/hal+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "scalar_symbols" in data["_embedded"]


def test_list_relations_api(page: Page):
    response = page.request.get(f"{URL}/api/resources/symbol/relations")
    assert response.ok
    assert response.status == 200
    assert "application/hal+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "relation_symbols" in data["_embedded"]


def test_derivation_metadata_and_steps_api(page: Page):
    # Step 1: Query the list to dynamically acquire a valid derivation ID
    list_response = page.request.get(f"{URL}/api/resources/derivations")
    assert list_response.ok
    derivations = list_response.json().get("_embedded", {}).get("derivations", [])

    if not derivations:
        return  # Skip if database is completely empty

    target_id = derivations[0]["id"]

    # Step 2: Validate Metadata API for this specific ID
    meta_response = page.request.get(
        f"{URL}/api/resources/derivation/{target_id}/metadata"
    )
    assert meta_response.ok
    assert meta_response.status == 200

    meta_data = meta_response.json()
    assert "metadata" in meta_data
    assert meta_data["metadata"]["id"] == target_id

    # Step 3: Validate Steps list API for this specific ID
    steps_response = page.request.get(
        f"{URL}/api/resources/derivation/{target_id}/steps"
    )
    assert steps_response.ok
    assert steps_response.status == 200

    steps_data = steps_response.json()
    assert "count" in steps_data
    assert "steps" in steps_data["_embedded"]


# EOF
