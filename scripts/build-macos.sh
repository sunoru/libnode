#!/bin/bash
set -ex

brew install coreutils
cd ./node

PREFIX="${WORKSPACE}/artifacts/"
mkdir -p "${PREFIX}"

./configure --prefix=$PREFIX --shared

make -j${WORKER_COUNT}
make install
