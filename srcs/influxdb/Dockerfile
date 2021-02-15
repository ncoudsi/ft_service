#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install InfluxDB.
RUN			apk add influxdb

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Run influxdb_setup.sh when the container boots.
ENTRYPOINT	["sh", "influxdb_setup.sh"]