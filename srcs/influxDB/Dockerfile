FROM alpine:3.12.4

# install
RUN apk update && apk upgrade && apk add influxdb

# COPY /supervisor.conf /etc/supervisord.conf

COPY ./influxdb-entrypoint.sh /tmp/influxdb-entrypoint.sh
RUN chmod +x /tmp/influxdb-entrypoint.sh

EXPOSE 8086

ENTRYPOINT ["/tmp/influxdb-entrypoint.sh"]
# ENTRYPOINT ["/usr/bin/supervisord", "-n"]

