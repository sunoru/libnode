#!/bin/bash
set -ex

./configure --prefix=$OUTPUT_PREFIX --shared --cross-compiling --dest-cpu=armv7 --dest-os=linux

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
