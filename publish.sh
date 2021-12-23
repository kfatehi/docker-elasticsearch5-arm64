#!/bin/bash
set -euo pipefail
./build.sh
REPO=keyvanfatehi/elasticsearch:5.6.4_jre9_m1
docker tag myelasticsearch $REPO
docker push $REPO
