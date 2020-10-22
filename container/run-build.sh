#!/bin/bash

set -ex

if [[ ${EUID} -eq 0 ]]; then
    echo "This script must NOT be run as root"
    exit 1
fi

BUILDER_DIR=/tmp/builder
DIST_DIR=/dist

mkdir -p "${BUILDER_DIR}"
git clone "https://github.com/pop-os/shell.git" "${BUILDER_DIR}"
cd "${BUILDER_DIR}" && make all && make zip-file

cp -f "${BUILDER_DIR}/pop-shell@system76.com.zip" "${DIST_DIR}"
cp -f "${BUILDER_DIR}/scripts/configure.sh" "${DIST_DIR}"
