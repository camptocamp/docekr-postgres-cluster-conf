FROM scratch

ENV MASTER master

COPY 15-bootstrap.sh /docker-entrypoint-initdb.d/
