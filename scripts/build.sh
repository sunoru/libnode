#!/bin/bash
set -ex

. "$(dirname "$0")"/prepare-env.sh
SCRIPTS_DIR=$WORKSPACE/scripts
cd $WORKSPACE/node

if [[ "$RUNNER_OS" == "Linux" ]]; then
    TARGET_OS="linux"
elif [[ "$RUNNER_OS" == "macOS" ]]; then
    TARGET_OS="macos"
elif [[ "$RUNNER_OS" == "Windows" ]]; then
    TARGET_OS="win"
else
    echo "Unknown OS: $RUNNER_OS"
    exit 1
fi
. $SCRIPTS_DIR/build/$TARGET_OS.sh
