FROM alpine:3.12.5

# install
RUN apk update && apk upgrade && \
apk add nginx openssl supervisor \
telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --no-cache --allow-untrusted

COPY ./nginx-entrypoint.sh /tmp/nginx-entrypoint.sh

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY /supervisor.conf /etc/supervisord.conf
# COPY telegraf.conf /etc/telegraf.conf

# get SSL certificate
RUN chmod +x tmp/nginx-entrypoint.sh && mkdir -p /run/nginx && \
openssl req -x509 -days 365 -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=nginx'

EXPOSE 80 443

ENTRYPOINT ["tmp/nginx-entrypoint.sh"]
# ENTRYPOINT ["/usr/bin/supervisord", "-n"]
