#!/usr/bin/env python3

"""
Physics Derivation Graph
Ben Payne, 2026
http://creativecommons.org/licenses/by/4.0/
Attribution 4.0 International (CC BY 4.0)

https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/80

$ cd ui_v8_website_flask_neo4j/webserver_for_pdg/library
$ docker run --add-host=host.docker.internal:host-gateway --rm -v `pwd`:/scratch --workdir /scratch ui_v8_flask_webserver:latest-arm64 python3 test_api.py
"""

import requests
import json

# base_url = "https://localhost/api/v1/"
base_url = "https://host.docker.internal/api/v1/"  # running from docker

# Disable SSL verification for local self-signed certificates
response = requests.get(base_url, verify=False)
response.raise_for_status()  # Raise an exception for HTTP errors (4xx or 5xx)

# Check Content-Type header
assert response.headers["Content-Type"] == "application/hal+json"

data = response.json()

print("Status Code:", response.status_code)
print("Content-Type:", response.headers["Content-Type"])
# print("Response JSON:")
# print(json.dumps(data, indent=2))

# Assertions to check the structure and content
assert "message" in data
assert "Welcome to the Physics Derivation Graph API" in data["message"]
assert "_links" in data
assert "self" in data["_links"]
assert "derivations" in data["_links"]
assert "inference_rules" in data["_links"]


# except requests.exceptions.ConnectionError as e:
#     print(f"Error connecting to the server. Is the Flask app running? {e}")
# except requests.exceptions.RequestException as e:
#     print(f"An error occurred during the request: {e}")
