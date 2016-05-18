FROM alpine

ENV MASTER master

VOLUME [ "/docker-entrypoint-initdb.d" ]
COPY 15-bootstrap.sh /docker-entrypoint-initdb.d/
ENTRYPOINT ["/bin/true"]
