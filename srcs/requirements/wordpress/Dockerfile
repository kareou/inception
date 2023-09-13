FROM debian:buster

RUN apt-get update
RUN apt-get install -y php
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install -y wget
RUN apt-get install -y unzip

RUN wget https://wordpress.org/latest.zip

RUN unzip latest.zip -d /var/www/html/

RUN rm latest.zip

COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php

CMD [ "cat", "/var/www/html/wordpress/wp-config.php"]
