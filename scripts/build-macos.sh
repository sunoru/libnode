#!/bin/bash
set -ex

brew install coreutils
. "$(dirname "$0")"/prepare-env.sh
cd ./node

./configure --prefix=$OUTPUT_PREFIX --shared

make -j`sysctl -n hw.ncpu`
make install
