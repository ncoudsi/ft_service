#!/bin/sh

#Move files to needed locations.
mv init.sql /init.sql
# mv my.cnf /etc/my.cnf
rm my.cnf
mkdir -p /run/mysqld

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
#Install MariaDB --user specifies the login to use for running mysqld.
#datadir specifies the path to the MariaDB data directory.
mysql_install_db --user=root --datadir=/var/lib/mysql

# #Run mysqld, specifying user and --init indicates to read SQL commands
# #from init.sql file at startup.
/usr/bin/mysqld --user=root --datadir="/var/lib/mysql" --init-file="/init.sql" &

MYSQL_IS_UP=0
# Needed since the mysql daemon have some trouble to start and will take few seconds
while [ $MYSQL_IS_UP == 0 ]
do
	sleep 5
	ps aux | grep -v "grep" | grep "/usr/bin/mysqld"
	if [ $? == 0 ]
	then
		MYSQL_IS_UP=1
		mysql --user=root --password=root wordpress < wordpress.sql
	fi
done

pkill mysqld

/usr/bin/mysqld --user=root --datadir="/var/lib/mysql"