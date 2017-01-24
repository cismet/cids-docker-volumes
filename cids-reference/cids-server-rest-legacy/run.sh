#!/bin/bash

docker stop cidsreference_cids-server-rest-legacy

docker rm -f cidsreference_cids-server-rest-legacy
docker run -d -p 8890:8890 \
    --link cidsreference_cids-server:cids-server \
    --name cidsreference_cids-server-rest-legacy \
    -e CIDS_ACCOUNT_EXTENSION=CidsReference \
    -e LOG4J_HOST=172.17.0.3 \
    --volumes-from="cidsreference_cids-server" \
    -v ~/cids-docker-volumes/cids-reference/cids-server-rest-legacy/import/:/import/cids-server-rest-legacy/ \
    cismet/cids-server-rest-legacy:latest-snapshot
