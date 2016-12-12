#!/bin/bash

docker stop cidsreference_cids-server

docker rm -v -f cidsreference_cids-server
docker volume rm cidsreference_cids-server
docker run -d -p 9986:9986 \
    --link cidsreference_cids-integration-base:cids-integration-base \
    --name cidsreference_cids-server \
    -e CIDS_ACCOUNT_EXTENSION=CidsReference \
    -e LOG4J_HOST=172.17.0.3 \
    -v cidsreference_cids-server:/cidsDistribution \
    -v ~/cids-docker-volumes/cids-reference/cids-server/import/:/import/cids-server/ \
    cismet/cids-server:latest
