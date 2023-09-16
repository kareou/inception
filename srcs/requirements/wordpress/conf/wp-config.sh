#!/bin/sh

chmod -R 755 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create --allow-root  --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST

wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL

wp user create --allow-root $WP_USER $WP_EMAIL1 --role=administrator --user_pass=$WP_PASSWORD

wp user create --allow-root $WP_USER1 $WP_EMAIL2 --role=aditor --user_pass=$WP_PASSWORD

exec "$@"
