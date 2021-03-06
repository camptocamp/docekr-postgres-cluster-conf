#!/bin/sh

if [ -s "$PGDATA/PG_VERSION" ]; then
  echo "PosgreSQL cluster already initialized."
  # internal start of server in order to allow set-up using psql-client
  # does not listen on external TCP/IP and waits until start finishes
  gosu postgres pg_ctl -D "$PGDATA" \
    -o "-c listen_addresses='localhost'" \
    -w start

  for f in /postgres-c2c-conf/docker-entrypoint.d/*; do
    case "$f" in
      *.sh)     echo "$0: running $f"; . "$f" ;;
      *.sql)    echo "$0: running $f"; psql -Upostgres < "$f"; echo ;;
      *.sql.gz) echo "$0: running $f"; gunzip -c "$f" | psql -Upostgres; echo ;;
      *)        echo "$0: ignoring $f" ;;
    esac
    echo
  done

  gosu postgres pg_ctl -D "$PGDATA" -m fast -w stop
else
  echo "PostgreSQL cluster not yet initialized."
fi

cp -f /postgres-c2c-conf/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d

exec /docker-entrypoint.sh "$@"
