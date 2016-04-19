#!/bin/bash

docker-compose stop

docker-compose rm -v -f cids-reference-cids-integration-base
docker-compose rm -v -f cids-reference-cids-server
docker-compose rm -v -f cids-reference-cids-server-rest-legacy
docker rm -v -f cids-reference-cids-integration-base
docker rm -v -f cids-reference-cids-server
docker rm -v -f cids-reference-cids-server-rest-legacy

docker volume rm cids-reference-cids-integration-base
docker volume rm cids-reference-cids-server