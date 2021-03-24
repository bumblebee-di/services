# base image
FROM debian:buster

MAINTAINER bgoat@student.42.fr
ENV TZ=Europe/Moscow

#installation
# Without the mbstring extension phpMyAdmin is unable to split strings correctly and it may result in unexpected results.

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx \
php7.3-fpm php7.3-mysqli \
mariadb-server \
vim \
wget \
php-mbstring \
libnss3-tools \
openssl && apt-get clean -y

WORKDIR /srcs
COPY /srcs .

#work with files
RUN chmod 755 docker-entrypoint.sh && mv docker-entrypoint.sh /docker-entrypoint.sh && \
mv autoindex-off.sh /autoindex-off.sh &&  mv autoindex-on.sh /autoindex-on.sh

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

COPY /srcs/phpmyadmin/info.php /var/www/html/info.php
COPY /srcs/nginx/localhost.conf /etc/nginx/sites-available/default



#wget & wordpress instalation
RUN mkdir phpmyadmin wordpress
RUN wget https://wordpress.org/latest.tar.gz && tar xzf latest.tar.gz --strip-components=1 -C wordpress
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
	&& tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C phpmyadmin
RUN rm -rf latest.tar.gz phpMyAdmin-5.0.4-all-languages.tar.gz
COPY /srcs/phpmyadmin/config.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN mkdir -p /var/www/html/phpmyadmin/tmp && chmod 777 /var/www/html/phpmyadmin/tmp

WORKDIR /srcs

COPY /srcs/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php

# get SSL certificate
RUN openssl req -x509 -days 365 -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key \
-newkey rsa:2048 -nodes -sha256 \
-subj '/CN=localhost'


EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.sh"]
