#!/bin/bash
set -ex

choco install nasm

./vcbuild.bat release dll package ${TARGET_ARCH}

mv ./out/Release/node-${NODE_VERSION}-win-${TARGET_ARCH} "${OUTPUT_PREFIX}/"
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
