#!/bin/bash

docker stop cids-reference-cids-server

docker rm -v -f cids-reference-cids-server
docker volume rm cids-reference-cids-server
docker run -d -p 9986:9986 --link cids-reference-cids-integration-base:cids-integration-base --name cids-reference-cids-server -e CIDS_ACCOUNT_EXTENSION=CidsReference -e LOG4J_HOST=172.17.0.3 -v cids-reference-cids-server:/data -v ~/docker-volumes/cids-reference/cids-server/import/:/import/cids-server/ cismet/cids-server:latest
