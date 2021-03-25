FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add supervisor nginx php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

COPY ./wp-entrypoint.sh /tmp/wp-entrypoint.sh

RUN chmod +x /tmp/wp-entrypoint.sh

COPY /supervisor.conf /etc/supervisord.conf
COPY /wp.conf /etc/nginx/conf.d/default.conf

# WORKDIR /usr/share/webapps/
RUN mkdir -p /www/wordpress


COPY ./wp-config.php /www/wordpress/wp-config.php

WORKDIR /www/
ADD https://wordpress.org/latest.tar.gz latest.tar.gz
RUN tar xzf latest.tar.gz --strip-components=1 -C wordpress && rm latest.tar.gz

RUN chmod 755 /www/*
WORKDIR /
# RUN chmod 755 /usr/share/webapps/ &&\
#  ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

EXPOSE 5050

# ENTRYPOINT ["/tmp/wp-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/supervisord", "-n"]

