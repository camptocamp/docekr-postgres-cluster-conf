#!/bin/sh

SLOT_NAME=$(hostname)

gosu postgres pg_ctl -D "$PGDATA" -m fast -w stop
rm -rf $PGDATA/*
pg_basebackup -h $MASTER -R -D $PGDATA -U postgres -v -P --xlog-method=stream -w
psql -h $MASTER -c "SELECT * FROM pg_create_physical_replication_slot('${SLOT_NAME}');" -U postgres -d template1;
