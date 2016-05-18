FROM alpine

ENV MASTER master

VOLUME [ "/docker-entrypoint-initdb.d" ]
COPY 15-setup-replication.sh /docker-entrypoint-initdb.d/
COPY 15-setup-replication.sql /docker-entrypoint-initdb.d/
ENTRYPOINT ["/bin/true"]
