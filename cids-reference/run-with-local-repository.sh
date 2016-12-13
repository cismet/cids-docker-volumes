#!/bin/bash

mkdir -p ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init
curl --output ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init/cids_init_script.sql --retry 3 https://raw.githubusercontent.com/cismet/cids-init/dev/cids_init_script.sql

docker-compose rm -v -f cidsreferencelocal_cids-integration-base
docker-compose rm -v -f cidsreferencelocal_cids-server
docker-compose rm -v -f cidsreferencelocal_cids-server-rest-legacy
docker rm -v -f cidsreferencelocal_cids-integration-base
docker rm -v -f cidsreferencelocal_cids-server
docker rm -v -f cidsreferencelocal_cids-server-rest-legacy

docker volume rm cidsreferencelocal_cids-integration-base
docker volume rm cidsreferencelocal_cids-server

docker-compose -f use-local-repository.yml --project-name cidsreferencelocal up -d

docker-compose ps