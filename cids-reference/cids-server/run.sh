#!/bin/bash

docker run -d -p 5434:5432 -p 9986:9986 --name cids-reference-cids-server -e CIDS_ACCOUNT_EXTENSION=CidsReference -e LOG4J_HOST=172.17.0.3 -v cids-reference:/data -v /w/git_work/docker-volumes/cids-reference/cids-server/import/:/import/cids-server/ cismet/cids-server:latest
