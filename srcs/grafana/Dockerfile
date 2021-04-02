FROM alpine:3.12.3

# install
RUN apk update && apk upgrade && \
 apk --no-cache add ca-certificates wget supervisor && \
 wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
 wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
 apk add glibc-2.28-r0.apk

COPY ./grafana-entrypoint.sh /tmp/grafana-entrypoint.sh
COPY /supervisor.conf /etc/supervisord.conf

ADD https://dl.grafana.com/oss/release/grafana-7.5.1.linux-amd64.tar.gz grafana-7.5.1.linux-amd64.tar.gz
RUN tar -xzf grafana-7.5.1.linux-amd64.tar.gz && rm grafana-7.5.1.linux-amd64.tar.gz && \
chmod 755 /grafana-7.5.1/* && chmod +x /tmp/grafana-entrypoint.sh

EXPOSE 3000

# ENTRYPOINT ["/tmp/grafana-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/supervisord", "-n"]

