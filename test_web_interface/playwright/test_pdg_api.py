#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

from playwright.sync_api import Page, expect

# The HATEOAS blueprint is registered under url_prefix='/api'
# this is what is exposed inside the Docker container
URL = "http://localhost:5000/api/"

# Gemini 3.5 Flash suggested
# URL = "https://host.docker.internal/api/"

# import requests
# import urllib3

# Suppress insecure request warnings if testing against self-signed local certificates
# urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def test_api_entrypoint():
    """Verifies that the API entry point returns the expected HATEOAS response structure."""
    print("Testing HATEOAS Entrypoint...")
    response = requests.get(BASE_URL, verify=False)
    response.raise_for_status()

    # Assert correct Content-Type as configured in hal_response()
    expected_content_type = "application/prs.hal-forms+json"
    assert expected_content_type in response.headers.get(
        "Content-Type", ""
    ), f"Expected content type to contain {expected_content_type}, but got {response.headers.get('Content-Type')}"

    data = response.json()
    print("Status Code:", response.status_code)
    print("Content-Type:", response.headers.get("Content-Type"))

    # Structural assertions matching the api_start_here function in pdg_api.py
    assert "message" in data
    assert "Welcome to the Physics Derivation Graph API" in data["message"]
    assert "_links" in data

    links = data["_links"]
    assert "self" in links
    assert "derivations" in links
    assert "inference_rules" in links
    assert "expressions" in links
    assert "whoami" in links

    print("HATEOAS Entrypoint verification passed.\n")
    return data


def test_get_derivations(entrypoint_links):
    """Navigates to the derivations collection and asserts structure."""
    print("Testing Navigation to Derivations Collection...")
    derivations_url = entrypoint_links["derivations"]["href"]

    response = requests.get(derivations_url, verify=False)
    response.raise_for_status()

    assert "application/prs.hal-forms+json" in response.headers.get("Content-Type", "")
    data = response.json()

    # Assert basic response structure for collections
    assert "count" in data
    assert "_links" in data
    assert "self" in data["_links"]

    print(f"Discovered {data.get('count', 0)} derivation items.")
    print("Derivations Collection verification passed.\n")


def test_unauthorized_whoami(entrypoint_links):
    """Verifies that accessing an authorized endpoint without a token returns a 401 error."""
    print("Testing Unauthorized access on /whoami...")
    whoami_url = entrypoint_links["whoami"]["href"]

    response = requests.get(whoami_url, verify=False)

    # The require_auth decorator returns a 401 status code
    assert (
        response.status_code == 401
    ), f"Expected status code 401, got {response.status_code}"
    assert "application/prs.hal-forms+json" in response.headers.get("Content-Type", "")

    error_payload = response.json()
    assert error_payload.get("title") == "Unauthorized"
    assert "WWW-Authenticate" in response.headers
    assert "Bearer" in response.headers["WWW-Authenticate"]

    print("Unauthorized behavior verified successfully.\n")


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
    """Verifies that the API entry point returns the expected HATEOAS response structure."""
    print("Testing HATEOAS Entrypoint...")
    response = page.request.get(f"{URL}/api/")
    assert response.ok
    assert response.status == 200
    # Assert correct Content-Type as configured in hal_response()
    expected_content_type = "application/prs.hal-forms+json"
    assert expected_content_type in response.headers.get(
        "Content-Type", ""
    ), f"Expected content type to contain {expected_content_type}, but got {response.headers.get('Content-Type')}"

    data = response.json()
    print("Status Code:", response.status_code)
    print("Content-Type:", response.headers.get("Content-Type"))

    # Structural assertions matching the api_start_here function in pdg_api.py
    assert "message" in data
    assert "Welcome to the Physics Derivation Graph API" in data["message"]
    assert "_links" in data

    links = data["_links"]
    assert "self" in links
    assert "derivations" in links
    assert "inference_rules" in links
    assert "expressions" in links
    assert "whoami" in links

    print("HATEOAS Entrypoint verification passed.\n")
    return data


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
