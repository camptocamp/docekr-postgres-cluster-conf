FROM rancher/confd-base:0.11.0-dev-rancher

ENV MASTER master

COPY conf.d/setup-replication.toml /etc/confd/conf.d/
COPY templates/setup-replication.sh.tmpl /etc/confd/templates

VOLUME [ "/docker-entrypoint-initdb.d" ]

ENTRYPOINT ["/confd"]
CMD []
