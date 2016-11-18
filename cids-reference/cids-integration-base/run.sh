#!/bin/bash

docker stop cids-reference-cids-integration-base

docker rm -v -f cids-reference-cids-integration-base
docker volume rm cids-reference-cids-integration-base
docker run -d -p 5434:5432 --name cids-reference-cids-integration-base -v cids-reference-cids-integration-base:/data/ -v ~/docker-volumes/cids-reference/cids-integration-base/import/:/import/cids-integration-base/ cismet/cids-integration-base:postgres-9.0.3
