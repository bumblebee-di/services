FROM alpine:3.12

# install
RUN apk update && apk upgrade
RUN apk add openssl wget nginx php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir -p /run/nginx
RUN chmod 755 /run/nginx

COPY ./wp-entrypoint.sh /tmp/wp-entrypoint.sh
RUN chmod +x /tmp/wp-entrypoint.sh

COPY /wp.conf /etc/nginx/conf.d/default.conf

# RUN adduser -D -g 'www' www
RUN mkdir /www
# RUN chown -R nginx:nginx /www
RUN chmod 755 /www
WORKDIR /www/wordpress
COPY ./wp-config.php /www/wordpress/wp-config.php
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzf latest.tar.gz --strip-components=1
# RUN tar xzf ./latest.tar.gz && rm -rf latest.tar.gz
# RUN rm -rf latest.tar.gz

RUN openssl req -x509 -days 365 -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=localhost'

EXPOSE 5050

ENTRYPOINT ["/tmp/wp-entrypoint.sh"]
