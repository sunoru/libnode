#!/bin/bash
set -ex

if [[ "$TARGET_ARCH" == "x64" ]]; then
    ./configure --prefix=$OUTPUT_PREFIX --shared --no-cross-compiling
else
    DEST_CPU=$TARGET_ARCH
    if [[ "$TARGET_ARCH" == "armv7" ]]; then
        DEST_CPU="arm"
        sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
        CC=arm-linux-gnueabihf-gcc
        CXX=arm-linux-gnueabihf-g++
    elif [[ "$TARGET_ARCH" == "x86" ]]; then
        sudo apt-get install gcc-multilib g++-multilib
    elif [[ "$TARGET_ARCH" == "arm64" ]]; then
        sudo apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
        CC=aarch64-linux-gnu-gcc
        CXX=aarch64-linux-gnu-g++
    fi
    patch -p1 < $WORKSPACE/patches/configure.py.patch
    ./configure --prefix=$OUTPUT_PREFIX --shared \
        --cross-compiling --dest-cpu=$DEST_CPU --dest-os=linux
fi

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
