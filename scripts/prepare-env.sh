#!/bin/bash
set -ex

if [[ "$RUNNER_OS" == "macOS" ]]; then
    brew install coreutils
    TARGET_OS="linux"
fi

export WORKSPACE=$(realpath "$(dirname "$0")"/..)
export OUTPUT_PREFIX="${WORKSPACE}/artifacts"
mkdir -p "${OUTPUT_PREFIX}"
