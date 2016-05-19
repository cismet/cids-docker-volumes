#!/bin/bash

# option --no-password does not work
export PGPASSWORD=postgres

# default SRID in cids_init.sql is -1! change to SRID of dump (e.g. 25832)
echo "SELECT UpdateGeometrySRID('public', 'geom', 'geo_field', 25832);" > import/cids_reference.sql
echo "SELECT UpdateGeometrySRID('public', 'cs_cache', 'geometry', 25832);" >> import/cids_reference.sql

# export themes schema and data
pg_dump --host localhost --port 5434 --username "postgres" --format plain --section pre-data --section post-data --section data --encoding UTF8 --file "/tmp/cids_reference_themes.sql" --table "sph_*" --inserts "cids_reference"

more /tmp/cids_reference_themes.sql >> import/cids_reference.sql

# export cids data (schema already created by cids_init.sql!)
pg_dump --host localhost --port 5434 --username "postgres" --format plain --section data --encoding UTF8 --file "/tmp/cids_reference_cids.sql" --table "cs_*" --table "geom" --exclude-table "cs_config_attr_jt" --exclude-table "cs_locks" --exclude-table "cs_cache" --exclude-table "cs_attr_object" --exclude-table "cs_attr_object_derived" --exclude-table "cs_attr_string" --inserts "cids_reference"

more /tmp/cids_reference_cids.sql >> import/cids_reference.sql

# export CCA  
pg_dump --host localhost --port 5434 --username "postgres" --format plain --section data --encoding UTF8 --file "/tmp/cids_reference_cca.sql" --table "cs_config_attr_jt" --inserts "cids_reference"

more /tmp/cids_reference_cca.sql >> import/cids_reference.sql

# perform reindex
echo "SELECT recreate_cache();" >> import/cids_reference.sql
echo "SELECT reindex();" >> import/cids_reference.sql
