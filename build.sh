#!/bin/bash

set -ex

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]:-$0}")" >/dev/null 2>&1 ; pwd -P )"
DIST_DIR="${SCRIPT_DIR}/dist"
CONTAINER_DIR="${SCRIPT_DIR}/container"

mkdir -p "${DIST_DIR}"
cd "${CONTAINER_DIR}" && docker-compose run --rm pop-shell-builder
