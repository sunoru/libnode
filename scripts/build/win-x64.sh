#!/bin/bash
set -ex

choco install nasm

./vcbuild.bat release dll package x64

mv ./out/Release/node-${NODE_VERSION}-win-x64 "${OUTPUT_PREFIX}/"
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
