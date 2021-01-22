#!/bin/sh

#Move files to needed locations.
mv init.sql /init.sql
mv my.cnf /etc/my.cnf

#Install MariaDB --user specifies the login to use for running mysqld.
#datadir specifies the path to the MariaDB data directory.
mysql_install_db --user=root --datadir=/var/lib/mysql

#Run mysqld, specifying user and --init indicates to read SQL commands
#from init.sql file at startup.
mysqld --init_file=/init.sql