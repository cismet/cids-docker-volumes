#!/bin/bash

docker-stop cids-reference-cids-server-rest-legacy

docker rm -f cids-reference-cids-server-rest-legacy
docker run -d -p 8890:8890 --link cids-reference-cids-server:cids-server --name cids-reference-cids-server-rest-legacy -e CIDS_ACCOUNT_EXTENSION=CidsReference -e LOG4J_HOST=172.17.0.3 --volumes-from="cids-reference-cids-server" -v ~/docker-volumes/cids-reference/cids-server-rest-legacy/import/:/import/cids-server-rest-legacy/ cismet/cids-server-rest-legacy:latest
