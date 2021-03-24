#!/bin/sh

mysql_install_db --user=root --datadir=/var/lib/mysql

/usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
CREATE USER 'user_db'@'%' IDENTIFIED BY 'pass_db';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user_db'@'%' IDENTIFIED BY 'pass_db';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
#  --skip-grant-tables
# while true; do ping 8.8.8.8; done