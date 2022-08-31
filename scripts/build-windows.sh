#!/bin/bash
set -ex

choco install nasm
. "$(dirname "$0")"/prepare-env.sh
cd ./node

./vcbuild.bat release dll package

mv ./out/Release/* "${OUTPUT_PREFIX}/"
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
