#!/bin/bash

cp entrypoint-builder.sh nodejs_v6_builder/entrypoint.sh
cp entrypoint-builder.sh nodejs_v8_builder/entrypoint.sh
docker build --tag syncano-cli .
docker build --tag syncano-builder:nodejs_v6 nodejs_v6_builder
docker build --tag syncano-builder:nodejs_v8 nodejs_v8_builder
rm nodejs_v6_builder/entrypoint.sh
rm nodejs_v8_builder/entrypoint.sh