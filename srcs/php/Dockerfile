FROM alpine:3.12.5

# install
RUN apk update && apk upgrade && \
apk add supervisor nginx php-mbstring php7-fpm openssl \
php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir -p /run/nginx && mkdir -p /run/php &&  mkdir -p /www/phpmyadmin

COPY ./supervisor.conf /etc/supervisord.conf
COPY ./php.conf /etc/nginx/conf.d/default.conf
COPY ./config.inc.php /www/phpmyadmin/config.inc.php
RUN openssl req -x509 -days 365 -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=phpmyadmin'

WORKDIR /www/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C phpmyadmin && rm phpMyAdmin-5.0.4-all-languages.tar.gz \
&& chmod 755 /www/*
WORKDIR /

EXPOSE 5000

ENTRYPOINT ["/usr/bin/supervisord", "-n"]