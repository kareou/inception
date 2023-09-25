FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/


RUN chmod 755 /etc/ssl/private

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/mkhairou.key \
		-out /etc/ssl/certs/mkhairou.crt \
		-subj "/C=MR/ST=Tetouan/L=Tetouan/O=42/OU=42Paris/CN=ft_server"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
