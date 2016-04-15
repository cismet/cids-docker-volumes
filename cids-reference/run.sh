#!/bin/bash

docker rm -v -f cids-reference-cids-integration-base_1
docker rm -v -f cids-reference-cids-server_1
docker rm -v -f cids-reference-cids-server-rest-legacy_1

docker volume rm cids-reference-cids-integration-base
docker volume rm cids-reference-cids-server

docker-compose up -d
