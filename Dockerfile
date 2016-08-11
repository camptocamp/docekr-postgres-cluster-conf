FROM alpine

ENV CONFD_VERSION=0.12.0-alpha3 \
  MASTER=master

RUN apk add --no-cache curl \
  && curl -L -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 \
  && chmod +x /usr/local/bin/confd

COPY ./conf.d/ /etc/confd/conf.d/
COPY ./templates/ /etc/confd/templates/

VOLUME [ "/docker-entrypoint-initdb.d" ]

ENTRYPOINT ["confd"]
CMD ["-onetime", "-backend", "rancher", "-prefix", "/2015-12-19"]
