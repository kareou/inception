#!/bin/sh

if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Database already exists"
    exec "$@"
    exit 0
fi

cat << EOF > /tmp/db.sql

use mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;

EOF
	mariadbd --user=mysql --bootstrap < /tmp/db.sql
    rm -f /tmp/db.sql


exec "$@"
