FROM alpine:3.12.5

# install
RUN apk update && apk upgrade && \
apk add supervisor nginx php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir -p /run/nginx && mkdir -p /run/php && mkdir -p /www/wordpress

COPY /supervisor.conf /etc/supervisord.conf
COPY /wp.conf /etc/nginx/conf.d/default.conf
COPY ./wp-config.php /www/wordpress/wp-config.php

WORKDIR /www/
ADD https://wordpress.org/latest.tar.gz latest.tar.gz
RUN tar xzf latest.tar.gz --strip-components=1 -C wordpress && rm latest.tar.gz && chmod 755 /www/*

WORKDIR /

EXPOSE 5050

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
