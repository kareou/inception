FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld


COPY tools/create.sh /create.sh

ENTRYPOINT ["sh", "create.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]



