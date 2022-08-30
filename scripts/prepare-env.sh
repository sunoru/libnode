#!/bin/bash
set -ex

export WORKSPACE=$(realpath "$(dirname "$0")"/..)
export OUTPUT_PREFIX="${WORKSPACE}/artifacts"
mkdir -p "${OUTPUT_PREFIX}"
