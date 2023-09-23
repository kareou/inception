FROM debian:bookworm

RUN apt update && apt install -f -y php8.2-cli php8.2-fpm php8.2-mysql curl  mariadb-client && mkdir -p /run/php/ && sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./conf/wp-config.sh /wp-config.sh

ENTRYPOINT ["sh","wp-config.sh" ]

CMD ["php-fpm8.2", "-F", "-R"]
