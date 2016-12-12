#!/bin/bash

mkdir -p ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init
curl --output ~/cids-docker-volumes/cids-reference/cids-integration-base/import/cids-init/cids_init_script.sql --retry 3 https://raw.githubusercontent.com/cismet/cids-init/dev/cids_init_script.sql

docker stop cidsreference_cids-integration-base

docker rm -v -f cidsreference_cids-integration-base
docker volume rm cidsreference_cids-integration-base
docker run -it -p 5434:5432 \
    --name cidsreference_cids-integration-base \
    -v cidsreference_cids-integration-base:/cidsIntegrationBase/pg_data/ \
    -v ~/cids-docker-volumes/cids-reference/cids-integration-base/import/:/import/cidsIntegrationBase/ \
    cismet/cids-integration-base:latest start import

#    -v ~/git_work/cids-docker-images/cids-integration-base/cidsIntegrationBase/utils:/cidsIntegrationBase/utils \
#    -v ~/git_work/cids-docker-images/cids-integration-base/cidsIntegrationBase/cids_ctl.sh:/cidsIntegrationBase/cids_ctl.sh \
#    -v ~/git_work/cids-docker-images/cids-integration-base/import/container_ctl.sh:/container_ctl.sh \
