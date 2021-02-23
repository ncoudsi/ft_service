#Define Alpine Linux as the container's OS
FROM	alpine:latest

#Update server.
RUN		apk update

#Install Influxdb.
RUN		apk add influxdb

#Define the directory you will be in when the container boots.
WORKDIR	/root/

#Run influxd command when the container boots.
CMD		influxd run -config /etc/influxdb.conf