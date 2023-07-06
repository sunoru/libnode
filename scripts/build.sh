#!/bin/bash
set -ex

SCRIPTS_DIR="$(dirname "$0")"
. $SCRIPTS_DIR/prepare-env.sh
cd "$NODE_SOURCE_DIR"

if [ "$RUNNER_OS" == "Linux" ]; then
    TARGET_OS="linux"
elif [ "$RUNNER_OS" == "macOS" ]; then
    TARGET_OS="macos"
elif [ "$RUNNER_OS" == "Windows" ]; then
    TARGET_OS="win"
else
    echo "Unknown OS: $RUNNER_OS"
    exit 1
fi
$SCRIPTS_DIR/build/$TARGET_OS-$TARGET_ARCH.sh
