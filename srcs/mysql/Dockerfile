FROM alpine:3.12.4

# install
RUN apk update && apk upgrade && \
 apk add mysql mysql-client openrc

COPY ./mysql-entrypoint.sh /tmp/mysql-entrypoint.sh

RUN chmod +x tmp/mysql-entrypoint.sh && \
 mkdir -p /run/mysqld && mkdir -p /var/lib/mysql \
 && chmod 755 /run/mysqld

COPY ./mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./my.cnf /etc/my.cnf

EXPOSE 3306

ENTRYPOINT ["tmp/mysql-entrypoint.sh"]
