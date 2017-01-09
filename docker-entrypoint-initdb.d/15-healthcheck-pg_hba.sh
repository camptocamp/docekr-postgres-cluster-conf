#!/bin/sh

grep -q "^host healthcheck healthcheck " "$PGDATA/pg_hba.conf" || sed -i '/^host all all all /i host healthcheck healthcheck all trust' "$PGDATA/pg_hba.conf"
