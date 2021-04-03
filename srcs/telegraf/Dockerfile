FROM alpine:3.12.5

# install
RUN apk update && apk upgrade && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --no-cache --allow-untrusted

COPY telegraf-entrypoint.sh /tmp/telegraf-entrypoint.sh
RUN chmod +x /tmp/telegraf-entrypoint.sh

ENTRYPOINT ["/tmp/telegraf-entrypoint.sh"]