#!/bin/sh

influxd
# /usr/sbin/influxd -config /etc/influxdb/influxdb.conf
telegraf -config /etc/telegraf.conf
