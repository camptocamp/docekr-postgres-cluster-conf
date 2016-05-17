FROM alpine

ENV MASTER master

COPY 15-bootstrap.sh /docker-entrypoint-initdb.d/

ENTRYPOINT ["/bin/true"]
