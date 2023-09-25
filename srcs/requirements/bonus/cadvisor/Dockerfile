FROM debian:bookworm


RUN apt update -y
RUN apt install wget -y && wget https://github.com/google/cadvisor/releases/tag/v0.47.2/download/v0.47.2/cadvisor && chmod +x cadvisor

EXPOSE 8000

CMD ["./cadvisor"]