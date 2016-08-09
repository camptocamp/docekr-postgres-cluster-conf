FROM camptocamp/confd:v0.12.0-alpha3

ENV MASTER master

COPY conf.d/setup-replication.toml /etc/confd/conf.d/
COPY templates/setup-replication.sh.tmpl /etc/confd/templates/

VOLUME [ "/docker-entrypoint-initdb.d" ]

ENTRYPOINT ["/confd"]
CMD ["-onetime", "-backend", "rancher", "-prefix", "/2015-12-19"]
