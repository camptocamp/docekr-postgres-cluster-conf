#!/bin/sh

if [ "$POSTGRES_PASSWORD" ]; then
  pass="PASSWORD '$POSTGRES_PASSWORD'"
  authMethod=md5
else
  pass=
  authMethod=trust
fi

if grep -q "^host all all 0.0.0.0/0 " "$PGDATA/pg_hba.conf"; then
  if grep -q "^host all all 0.0.0.0/0 $authMethod$" "$PGDATA/pg_hba.conf"; then
    echo "pg_hba.conf already valid"
  else
    sed -i "s/^host all all 0.0.0.0\/0 .*$/host all all 0.0.0.0\/0 $authMethod/" "$PGDATA/pg_hba.conf"
  fi
else
  { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA/pg_hba.conf"
fi

