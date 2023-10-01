#!/bin/sh

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "wp-config.php already exists"
    exec "$@"
    exit 0
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -d "/var/www/html/wordpress" ]; then
        mkdir -p /var/www/html/wordpress
fi

chmod -R 755 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create --allow-root  --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$WP_HOST

wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER_ADMIN --admin_password=$WP_PASSWORD_ADMIN --admin_email=$WP_EMAIL_ADMIN

wp user create --allow-root $WP_USER_ADMIN $WP_EMAIL_ADMIN --role=administrator --user_pass=$WP_PASSWORD_ADMIN --path=/var/www/html/wordpress

wp user create --allow-root $WP_USER $WP_EMAIL --role=editor --user_pass=$WP_PASSWORD --path=/var/www/html/wordpress

exec "$@"
