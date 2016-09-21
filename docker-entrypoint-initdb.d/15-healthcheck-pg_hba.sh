#!/bin/sh

grep -q "^host healthcheck healthcheck 0.0.0.0/0" /var/lib/postgresql/data/pg_hba.conf || sed -i '/^host all all 0.0.0.0\/0/i host healthcheck healthcheck 0.0.0.0\/0 trust' /var/lib/postgresql/data/pg_hba.conf
