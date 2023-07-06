#!/bin/bash
set -ex

./configure --prefix=$OUTPUT_PREFIX --shared --no-cross-compiling

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
