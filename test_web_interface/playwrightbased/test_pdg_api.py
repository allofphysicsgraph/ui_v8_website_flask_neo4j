#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/
import os
from urllib.parse import urljoin
from typing import Generator
import pytest
from playwright.sync_api import Playwright, APIRequestContext

# The HATEOAS blueprint is registered under url_prefix='/api'
# this is what is exposed inside the Docker container
URL = os.environ.get("PDG_API_URL", "http://localhost:5000/api")

# Gemini 3.5 Flash suggested
# URL = "https://host.docker.internal/api/"

# import requests
# import urllib3


@pytest.fixture(scope="session")
def api_request_context(
    playwright: Playwright,
) -> Generator[APIRequestContext, None, None]:
    request_context = playwright.request.new_context()
    yield request_context
    request_context.dispose()


# Suppress insecure request warnings if testing against self-signed local certificates
# urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
def _resolve(href: str) -> str:
    """Resolve an href that may be root-relative or absolute against URL."""
    return urljoin(URL, href)


@pytest.fixture
def entrypoint_links(api_request_context: APIRequestContext):
    """Hits the API root once and hands back its _links for dependent tests."""
    response = api_request_context.get(f"{URL}/")

    assert response.ok
    return response.json()["_links"]


def test_api_entry_point(api_request_context: APIRequestContext):
    """Verifies that the API entry point returns the expected HATEOAS response structure."""

    response = api_request_context.get(f"{URL}/")
    assert response.ok
    assert response.status == 200

    # Assert correct Content-Type as configured in hal_response()
    expected_content_type = "application/prs.hal-forms+json"
    assert expected_content_type in response.headers.get("content-type", ""), (
        f"Expected content type to contain {expected_content_type}, "
        f"but got {response.headers.get('content-type')}"
    )
    data = response.json()

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


def test_get_derivations(entrypoint_links, api_request_context: APIRequestContext):
    """Navigates to the derivations collection and asserts structure."""

    derivations_url = _resolve(entrypoint_links["derivations"]["href"])

    response = api_request_context.get(derivations_url)
    assert response.ok

    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")
    data = response.json()

    # Assert basic response structure for collections
    assert "count" in data
    assert "_links" in data
    assert "self" in data["_links"]


def test_unauthorized_whoami(entrypoint_links, api_request_context: APIRequestContext):
    """Verifies that accessing an authorized endpoint without a token returns an error."""

    whoami_url = _resolve(entrypoint_links["whoami"]["href"])

    response = api_request_context.get(whoami_url)

    # The require_auth decorator returns a 500 status code
    assert response.status == 500, f"Expected status code 401, got {response.status}"
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    error_payload = response.json()
    assert error_payload.get("title") == "Server Misconfiguration"
    assert "www-authenticate" in response.headers
    assert "Bearer" in response.headers["www-authenticate"]


def test_validate_operations_api(api_request_context: APIRequestContext):
    # Perform a GET request to the API endpoint
    response = api_request_context.get(f"{URL}/resources/symbol/operations")

    # Validate that the response is successful
    assert response.ok
    assert response.status == 200

    # Check the custom Content-Type header (Playwright normalizes keys to lowercase)
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

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
    if multiplication is None:
        pytest.skip(
            "'multiplication' operation not present in this environment's seed data"
        )

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
    # Method is the contract we care about; the href itself is an opaque
    # implementation detail we shouldn't assert the content of.
    assert links["delete"]["href"]


def test_list_derivations_api(api_request_context: APIRequestContext):
    response = api_request_context.get(f"{URL}/resources/derivations")
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


def test_list_expressions_api(api_request_context: APIRequestContext):
    response = api_request_context.get(f"{URL}/resources/expressions")
    assert response.ok
    assert response.status == 200
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "_embedded" in data
    assert "expressions" in data["_embedded"]


def test_list_scalars_api(api_request_context: APIRequestContext):
    response = api_request_context.get(f"{URL}/resources/symbol/scalars")
    assert response.ok
    assert response.status == 200
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "_embedded" in data
    assert "scalar_symbols" in data["_embedded"]


def test_list_relations_api(api_request_context: APIRequestContext):
    response = api_request_context.get(f"{URL}/resources/symbol/relations")
    assert response.ok
    assert response.status == 200
    assert "application/prs.hal-forms+json" in response.headers.get("content-type", "")

    data = response.json()
    assert "count" in data
    assert "_embedded" in data
    assert "relation_symbols" in data["_embedded"]


def test_derivation_metadata_and_steps_api(api_request_context: APIRequestContext):
    list_response = api_request_context.get(f"{URL}/resources/derivations")
    assert list_response.ok
    derivations = list_response.json().get("_embedded", {}).get("derivations", [])

    if not derivations:
        pytest.skip("no derivations available to exercise metadata/steps endpoints")

    target_id = derivations[0]["id"]
    meta_response = api_request_context.get(
        f"{URL}/resources/derivation/{target_id}/metadata"
    )
    assert meta_response.ok
    assert meta_response.status == 200

    meta_data = meta_response.json()
    assert "metadata" in meta_data
    assert meta_data["metadata"]["id"] == target_id
    steps_response = api_request_context.get(
        f"{URL}/resources/derivation/{target_id}/steps"
    )
    assert steps_response.ok
    assert steps_response.status == 200

    steps_data = steps_response.json()
    assert "count" in steps_data
    assert "steps" in steps_data["_embedded"]


# EOF
