FROM alpine:3.12.4

# install
RUN apk update && apk upgrade && apk add influxdb supervisor \ 
telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --no-cache --allow-untrusted

COPY /supervisor.conf /etc/supervisord.conf
COPY ./influxdb.conf /etc/influxdb.conf
COPY ./influxdb-entrypoint.sh /tmp/influxdb-entrypoint.sh
RUN chmod +x /tmp/influxdb-entrypoint.sh

EXPOSE 8086

# ENTRYPOINT ["/tmp/influxdb-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/supervisord", "-n"]

