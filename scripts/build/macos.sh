#!/bin/bash
set -ex

./configure --prefix=$OUTPUT_PREFIX --shared

make -j`sysctl -n hw.ncpu`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
