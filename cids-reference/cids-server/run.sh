#!/bin/bash

docker run -d -p 9986:9986 --name cids-reference-cids-server -e CIDS_ACCOUNT_EXTENSION=CidsReference -v cids-reference:/data -v /w/git_work/docker-volumes/cids-reference/cids-server/import/settings.xml:/import/cids-server/settings.xml -v /w/git_work/docker-volumes/cids-reference/cids-server/import/pom.xml:/import/cids-server/pom.xml -v/w/git_work/docker-volumes/cids-reference/cids-server/import/runtime.properties:/import/cids-server/runtime.properties.xml cismet/cids-server:latest
