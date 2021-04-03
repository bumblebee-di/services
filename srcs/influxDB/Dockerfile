FROM alpine:3.12.5

# install
RUN apk update && apk upgrade && apk add influxdb

COPY ./influxdb.conf /etc/influxdb.conf

EXPOSE 8086

ENTRYPOINT ["influxd"]
