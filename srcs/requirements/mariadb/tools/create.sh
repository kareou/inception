#!/bin/sh
service mysql start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS test;"
mysql -e "CREATE USER IF NOT EXISTS 'mkhairou'@'localhost' IDENTIFIED BY 'mkhairou';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON test.* TO 'mkhairou'@'%' IDENTIFIED BY 'mkhairou';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root password 'mkhairou'
mysqladmin -u root -pmkhairou shutdown
# service mysql stop

exec "$@"
