#!/bin/bash

docker-compose stop

docker-compose rm -v -f cidsreference_cids-integration-base
docker-compose rm -v -f cidsreference_cids-server
docker-compose rm -v -f cidsreference_cids-server-rest-legacy
docker rm -v -f cidsreference_cids-integration-base
docker rm -v -f cidsreference_cids-server
docker rm -v -f cidsreference_cids-server-rest-legacy

docker volume rm cidsreference_cids-integration-base
docker volume rm cidsreference_cids-server

docker-compose rm -v -f cidsreferencelocal_cids-integration-base
docker-compose rm -v -f cidsreferencelocal_cids-server
docker-compose rm -v -f cidsreferencelocal_cids-server-rest-legacy
docker rm -v -f cidsreferencelocal_cids-integration-base
docker rm -v -f cidsreferencelocal_cids-server
docker rm -v -f cidsreferencelocal_cids-server-rest-legacy

docker volume rm cidsreferencelocal_cids-integration-base
docker volume rm cidsreferencelocal_cids-server