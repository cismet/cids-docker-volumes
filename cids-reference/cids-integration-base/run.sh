#!/bin/bash

docker run -d -p 5434:5432 --name cids-reference-cids-integration-base -v cids-reference:/data  -v /w/git_work/docker-volumes/cids-reference/cids-integration-base/import/:/import/cids-integration-base/ cismet/cids-integration-base:latest
