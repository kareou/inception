FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

# RUN sed -i "s|#port                   = 3306|port                   = 3306|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/create.sh /create.sh

ENTRYPOINT ["sh", "create.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]



