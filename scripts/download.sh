#!/bin/bash

echo "NODE_VERSION=${NODE_VERSION}"
echo "NODE_SOURCE_DIR=${NODE_SOURCE_DIR}"
curl -O https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz
tar zxf ./node-${NODE_VERSION}.tar.gz
mv ./node-${NODE_VERSION} "$NODE_SOURCE_DIR"
