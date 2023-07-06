#!/bin/bash
set -ex

if [[ "$TARGET_ARCH" == "x64" ]]; then
    ./configure --prefix=$OUTPUT_PREFIX --shared --no-cross-compiling
else
    DEST_CPU=$TARGET_ARCH
    if [[ "$TARGET_ARCH" == "armv7" ]]; then
        DEST_CPU="arm"
    fi
    # 32 bit
    if [[ "$TARGET_ARCH" == "armv7" || "$TARGET_ARCH" == "x86" ]]; then
        sudo apt-get install gcc-multilib g++-multilib
    fi
    patch -p1 $WORKSPACE/patches/configure.py.patch
    ./configure --prefix=$OUTPUT_PREFIX --shared \
        --cross-compiling --dest-cpu=$DEST_CPU --dest-os=linux
fi

make -j`nproc`
make install
cp ./LICENSE "${OUTPUT_PREFIX}/LICENSE"
