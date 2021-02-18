#Define Alpine Linux as the container's OS
FROM		alpine

#Update server.
RUN			apk update

#Install wget.
RUN			apk add wget

#Install libc6, needed for telegraf.
RUN			apk add libc6-compat

#Get and extract telegraf.
RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ; \
			tar xf telegraf-1.14.0-static_linux_amd64.tar.gz ; \
			rm telegraf-1.14.0-static_linux_amd64.tar.gz;

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root/

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Run telegraf_setup.sh when the container boots.
ENTRYPOINT	["sh", "telegraf_setup.sh"]