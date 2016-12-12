#!/bin/bash

mkdir -p ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init
curl --output ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init/cids_init_script.sql --retry 3 https://raw.githubusercontent.com/cismet/cids-init/dev/cids_init_script.sql

docker-compose rm -v -f cids-integration-base
docker-compose rm -v -f cids-server
docker-compose rm -v -f cids-server-rest-legacy
docker rm -v -f cidsreference_cids-integration-base
docker rm -v -f cidsreference_cids-server
docker rm -v -f cidsreference_cids-server-rest-legacy

docker volume rm cidsreference_cids-integration-base
docker volume rm cidsreference_cids-server

docker-compose up -d
