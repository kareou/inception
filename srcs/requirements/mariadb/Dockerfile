FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s|#port                   = 3306|port                   = 3306|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/create.sh /

RUN chmod 777 /create.sh

RUN ./create.sh

CMD ["mysqld_safe"]



