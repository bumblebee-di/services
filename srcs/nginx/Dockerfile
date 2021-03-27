FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add nginx \
openssl

RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf

# get SSL certificate
RUN openssl req -x509 -days 365 -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=localhost'

COPY ./nginx-entrypoint.sh /tmp/nginx-entrypoint.sh
RUN chmod +x tmp/nginx-entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["tmp/nginx-entrypoint.sh"]
