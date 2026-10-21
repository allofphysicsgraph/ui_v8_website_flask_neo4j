#!/usr/bin/env bash
#
# Renew Let's Encrypt certificates for derivationmap.net and allofphysics.com,
# copy them into the website's certs/ directory, and restart the webserver.
#
# Run from /home/pdg/ui_v8_website_flask_neo4j/ :
#     ./renew_certs.sh
#
# Notes:
#  * Uses --cert-name + --force-renewal instead of deleting /etc/letsencrypt
#    directories, so the existing certificate stays in place if issuance fails.
#  * Let's Encrypt limits duplicate certificates to 5 per week; do not
#    run this repeatedly.

set -euo pipefail

PROJECT_DIR="/home/pdg/ui_v8_website_flask_neo4j"
CERTS_DIR="${PROJECT_DIR}/certs"
LE_LIVE="/etc/letsencrypt/live"
CERT_NAME="derivationmap.net"
CANDIDATES=("derivationmap.net" "derivationmap.net-0001")
OWNER="pdg:pdg"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"

# --- sanity checks -----------------------------------------------------------
if [[ "$(pwd -P)" != "${PROJECT_DIR}" ]]; then
    echo "ERROR: run this script from ${PROJECT_DIR} (currently in $(pwd -P))" >&2
    exit 1
fi

if [[ ! -d "${CERTS_DIR}" ]]; then
    echo "ERROR: ${CERTS_DIR} does not exist" >&2
    exit 1
fi

# --- show current certificate dates -----------------------------------------
if [[ -f "${CERTS_DIR}/fullchain.pem" ]]; then
    echo "Current certificate in ${CERTS_DIR}:"
    openssl x509 -dates -noout < "${CERTS_DIR}/fullchain.pem"
fi

# --- request the new certificate --------------------------------------------
echo
echo "Requesting certificate from Let's Encrypt..."
sudo certbot certonly --webroot \
    -w "${CERTS_DIR}" \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --cert-name "${CERT_NAME}" \
    --force-renewal \
    --non-interactive \
    -d derivationmap.net -d www.derivationmap.net \
    -d allofphysics.com -d www.allofphysics.com

# --- pick the live directory whose certificate expires last -----------------
best_dir=""
best_epoch=0
for name in "${CANDIDATES[@]}"; do
    pem="${LE_LIVE}/${name}/fullchain.pem"
    if ! sudo test -f "${pem}"; then
        continue
    fi
    not_after="$(sudo openssl x509 -enddate -noout -in "${pem}" | cut -d= -f2)"
    epoch="$(date -d "${not_after}" +%s)"
    echo "Found ${pem} (expires ${not_after})"
    if (( epoch > best_epoch )); then
        best_epoch="${epoch}"
        best_dir="${LE_LIVE}/${name}"
    fi
done

if [[ -z "${best_dir}" ]]; then
    echo "ERROR: no fullchain.pem found in ${CANDIDATES[*]} under ${LE_LIVE}" >&2
    exit 1
fi
echo "Using certificate from: ${best_dir}"

# --- back up old files (timestamped, never overwrites earlier backups) ------
cd "${CERTS_DIR}"
for f in fullchain.pem privkey.pem dhparam.pem; do
    if [[ -f "${f}" ]]; then
        mv "${f}" "${f}_OLD_${TIMESTAMP}"
        echo "Backed up ${f} -> ${f}_OLD_${TIMESTAMP}"
    fi
done

# --- install new certificate and key ----------------------------------------
sudo cp "${best_dir}/fullchain.pem" .
sudo cp "${best_dir}/privkey.pem" .
sudo chown "${OWNER}" fullchain.pem privkey.pem

# --- dhparam: reuse the previous one if present, otherwise generate ----------
prev_dh="$(ls -1t dhparam.pem_OLD_* 2>/dev/null | head -n 1 || true)"
if [[ -n "${prev_dh}" ]]; then
    cp "${prev_dh}" dhparam.pem
    echo "Restored dhparam.pem from ${prev_dh}"
else
    echo "No existing dhparam.pem; generating (takes a few minutes)..."
    openssl dhparam -out dhparam.pem 2048
fi

echo
echo "New certificate in ${CERTS_DIR}:"
openssl x509 -dates -noout < fullchain.pem

# --- update code and restart the webserver ----------------------------------
cd "${PROJECT_DIR}"
git pull
make down
make launch_webserver COMPOSE_FLAGS=--detach

echo
echo "Done."

#EOF
