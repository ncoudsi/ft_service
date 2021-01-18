
FROM		alpine:latest

RUN			apk update
RUN			apk add nginx

COPY		srcs /root

WORKDIR		/root/

EXPOSE		80 443

ENTRYPOINT	["sh", "nginx_setup.sh"]