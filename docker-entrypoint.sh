#!/bin/sh

DIR=/postgres-c2c-conf/docker-entrypoint.d

if test -d "$DIR"
then
  /bin/run-parts --verbose "$DIR"
fi

cp -f /postgres-c2c-conf/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d

exec /docker-entrypoint.sh "$@"
