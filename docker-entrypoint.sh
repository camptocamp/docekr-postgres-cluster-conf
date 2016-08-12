#!/bin/sh

DIR=/postgres-c2c-conf/docker-entrypoint.d

if test -d "$DIR"
then
  /bin/run-parts --verbose "$DIR"
fi

exec /docker-entrypoint.sh "$@"
