#!/bin/bash
TAG=keyvanfatehi/elasticsearch:5.6.4_openjdk8_arm64
docker build -t $TAG . && docker push $TAG
