#!/usr/bin/env python3

# Physics Derivation Graph
# Ben Payne
# http://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

import os
import hashlib
import zlib
import random
import json
import logging
from datetime import datetime
from typing import List, Optional, Dict, Any

logger = logging.getLogger(__name__)


def load_configured_api_keys() -> List[dict]:
    """Parse PDG_API_KEYS, a JSON array of records identifying each caller.

    Expected shape:

    .. code-block:: json

        PDG_API_KEYS='[
            {"token": "long-random-string-1", "author_id": "ben", "author_name_latex": "Ben"},
            {"token": "long-random-string-2", "author_id": "alice", "author_name_latex": "Alice"}
        ]'

    Falls back to the legacy single-key PDG_API_KEY var (attributed to
    author_id "unknown") so existing deployments don't break on upgrade.
    Returns a list of dicts, or [] if nothing is configured / the JSON is malformed.
    """
    raw = os.environ.get("PDG_API_KEYS")
    if raw:
        try:
            records = json.loads(raw)
        except json.JSONDecodeError as err:
            logger.critical("PDG_API_KEYS is not valid JSON: " + str(err))
            return []
        valid_records = []
        for record in records:
            if (
                not isinstance(record, dict)
                or not record.get("token")
                or not record.get("author_id")
            ):
                logger.critical(
                    "Ignoring malformed PDG_API_KEYS entry (needs token + author_id): "
                    + str(record)
                )
                continue
            record.setdefault("author_name_latex", record["author_id"])
            valid_records.append(record)
        return valid_records
    return []


def extract_bearer_token(auth_header: Optional[str]) -> Optional[str]:
    """
    called in `pdg_api` using

    .. code-block:: python

        supplied_token = api_keys.extract_bearer_token(
            request.headers.get("Authorization"))

    """
    if not auth_header:
        return None
    parts = auth_header.split(None, 1)
    if len(parts) != 2 or parts[0].lower() != "bearer":
        return None
    return parts[1].strip()


def match_caller(supplied_token: str, configured_keys: List[dict]) -> Optional[dict]:
    """Constant-time-compare supplied_token against every configured token.

    Checks every record rather than stopping at the first mismatch so the
    response time doesn't leak which position in the list (if any) is close
    to matching.

    https://docs.python.org/3/library/secrets.html
    """
    matched = None
    for record in configured_keys:
        if secrets.compare_digest(supplied_token, record["token"]):
            matched = record
    return matched


def generate_api_key(username: str, dt: datetime) -> str:
    """
    Generates a deterministic API key based on a username and datetime.

    The resulting key follows the format: pdg_api_<32_char_random><8_char_checksum>

    Instead of calling the global `random.seed()`, which can
    cause side effects across your application, this function
    instantiates a standalone `random.Random(seed_hash)` generator.

    Using CRC32 provides a lightweight, standard 8-character
    hexadecimal checksum. This allows you to quickly verify
    that a key is well-formed (e.g., catching typos or
    cut-and-paste errors) before querying a database.

    """
    # 1. Create a stable seed string from the input parameters
    dt_str = dt.isoformat()
    seed_input = f"{username}_{dt_str}"

    # 2. Hash the seed input to get a consistent byte sequence
    seed_hash = hashlib.sha256(seed_input.encode("utf-8")).digest()

    # 3. Seed a local Random instance to ensure thread-safety and determinism
    local_random = random.Random(seed_hash)

    # 4. Generate a 32-character random string from alphanumeric characters
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    random_part = "".join(local_random.choice(alphabet) for _ in range(32))

    # 5. Calculate a CRC32 checksum of the random part
    # Masking with 0xffffffff ensures consistent 32-bit unsigned behavior across platforms
    checksum_val = zlib.crc32(random_part.encode("utf-8")) & 0xFFFFFFFF
    checksum_str = f"{checksum_val:08x}"  # Generates an 8-character hex string

    # 6. Assemble the API key with the required prefix
    api_key = f"pdg_api_{random_part}{checksum_str}"

    return api_key


def validate_api_key(api_key: str) -> bool:
    """
    Validates the structure and checksum integrity of a given API key.
    """
    prefix = "pdg_api_"
    if not api_key.startswith(prefix):
        return False

    # Strip the prefix to get the key body
    key_body = api_key[len(prefix) :]

    # The body must be exactly 40 characters (32-character random string + 8-character checksum)
    if len(key_body) != 40:
        return False

    random_part = key_body[:-8]
    provided_checksum = key_body[-8:]

    # Recalculate and compare the checksum
    calculated_val = zlib.crc32(random_part.encode("utf-8")) & 0xFFFFFFFF
    calculated_checksum = f"{calculated_val:08x}"

    return provided_checksum == calculated_checksum
