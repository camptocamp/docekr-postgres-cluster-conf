#!/bin/sh

grep -q "^host healthcheck healthcheck 0.0.0.0/0 " "$PGDATA/pg_hba.conf" || sed -i '/^host all all 0.0.0.0\/0/i host healthcheck healthcheck 0.0.0.0\/0 trust' "$PGDATA/pg_hba.conf"
