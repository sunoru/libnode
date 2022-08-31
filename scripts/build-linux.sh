#!/bin/bash
set -ex

. "$(dirname "$0")"/prepare-env.sh
cd ./node

./configure --prefix=$OUTPUT_PREFIX --shared

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
