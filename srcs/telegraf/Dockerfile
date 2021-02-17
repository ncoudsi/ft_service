FROM		alpine

RUN			apk add wget

RUN			apk add libc6-compat

RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz ; \
			tar xf telegraf-1.14.0-static_linux_amd64.tar.gz ; \
			rm telegraf-1.14.0-static_linux_amd64.tar.gz;

COPY		srcs /root/

WORKDIR		/root/

ENTRYPOINT	["sh", "telegraf_setup.sh"]