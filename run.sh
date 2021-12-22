#!/bin/bash
docker run --rm \
  -v $PWD/esconfig:/usr/share/elasticsearch/config \
  -p 9200:9200 \
  -p 9300:9300 \
  --name myelasticsearch \
  -it myelasticsearch /usr/share/elasticsearch/bin/elasticsearch $@
