#!/bin/bash

echo "NODE_VERSION=${NODE_VERSION}"
curl -O https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz
tar zxf ./node-${NODE_VERSION}.tar.gz
mv ./node-${NODE_VERSION} ./node
