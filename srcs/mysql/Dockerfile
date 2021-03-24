FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

# RUN openrc && touch /run/openrc/softlevel
# RUN service mariadb setup
# RUN /etc/init.d/mariadb setup
# RUN service mariadb restart

RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
RUN chmod 755 /run/mysqld
# RUN chown -R mysql:root /var/lib/mysql/

COPY ./mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./my.cnf /etc/my.cnf

COPY ./mysql-entrypoint.sh /tmp/mysql-entrypoint.sh
RUN chmod +x tmp/mysql-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["tmp/mysql-entrypoint.sh"]
