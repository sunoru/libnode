#!/bin/bash
set -ex

if [ "$TARGET_ARCH" == "x64" ]; then
    ./configure --prefix=$OUTPUT_PREFIX --shared --no-cross-compiling
else
    DEST_CPU=$TARGET_ARCH
    if [ "$TARGET_ARCH" == "armv7" ]; then
        DEST_CPU="arm"
    fi
    ./configure --prefix=$OUTPUT_PREFIX --shared \
        --cross-compiling --dest-cpu=$DEST_CPU --dest-os=linux
fi

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
