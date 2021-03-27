FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add supervisor

# RUN mkdir -p /run/grafana

# COPY /supervisor.conf /etc/supervisord.conf
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

COPY ./grafana-entrypoint.sh /tmp/grafana-entrypoint.sh
RUN chmod +x /tmp/grafana-entrypoint.sh

RUN mkdir -p /grafana

ADD https://dl.grafana.com/oss/release/grafana-7.5.1.linux-amd64.tar.gz grafana-7.5.1.linux-amd64.tar.gz
RUN tar -xzf grafana-7.5.1.linux-amd64.tar.gz --strip-components=1 -C grafana && rm grafana-7.5.1.linux-amd64.tar.gz && \
cp /grafana/conf/sample.ini /grafana/conf/grafana.ini

# RUN chmod 755 /grafana/*

EXPOSE 3000

ENTRYPOINT ["/tmp/grafana-entrypoint.sh"]
# ENTRYPOINT ["/usr/bin/supervisord", "-n"]

