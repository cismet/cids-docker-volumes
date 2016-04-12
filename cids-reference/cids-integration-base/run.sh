#!/bin/bash

docker run -d -p 5434:5432 --name cids-reference-cids-integration-base -v cids-reference:/data  -v /w/git_work/docker-volumes/cids-reference/cids-integration-base/import/cids_reference.sql:/import/cids-integration-base/cids_reference.sql cismet/cids-integration-base:latest
