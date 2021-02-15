#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install wget.
RUN			apk add wget

#Install
RUN			apk add libc6-compat

#Download, extract and rename grafana.
RUN			wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz ;\
			tar zxvf grafana-7.4.1.linux-amd64.tar.gz; \
			rm grafana-7.4.1.linux-amd64.tar.gz; \
			mv grafana-7.4.1 /root/grafana

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose port.
EXPOSE		3000

#Run grafana_setup.sh when the container boots.
ENTRYPOINT	["sh", "grafana_setup.sh"]