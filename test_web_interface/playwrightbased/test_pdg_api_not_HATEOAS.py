#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/


from playwright.sync_api import Page

# This blueprint registers routes starting with '/v1/resources' under url_prefix='/api'
URL = "http://localhost:5000/api"


def test_sympy(page: Page):
    """Verifies standard JSON output from the sympy validation endpoint."""
    sympy_url = f"{URL}/resources/sympy_check"
    params = {"sympy": "x**2 + y"}
    response = page.request.get(sympy_url, params=params)
    assert response.ok, f"Request failed with status {response.status}"

    # The non-HATEOAS endpoint uses standard Flask jsonify returning application/json
    assert "application/json" in response.headers.get("content-type", "")
    data = response.json()

    # SymPy parser returns variables and a canonical form or INVALID
    if "INVALID" in data:
        print("SymPy check completed with error:", data["INVALID"])
    else:
        assert "canonical" in data
        assert "variables" in data
        print("Canonical Form:", data["canonical"])
        print("Detected Variables:", data["variables"])
