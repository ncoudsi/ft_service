#!/bin/sh

#Move files to needed locations.
mv init.sql /init.sql
mv my.cnf /etc/my.cnf
mkdir -p /run/mysqld

#Install MariaDB no need for options since we have them in the .cnf file.
mysql_install_db

#Run mysqld. Again, options are in the .cnf file.
#Here come tricks ! Mysqld is ran in backgroud (with &) because if not,
#its process loops and prevent other commands to be ran. So we couldn't
#run the mysql command bellow. But when ran in background, mysqld seems
#to corrupt the pods integrity, so we kill the process later and restart
#it in foreground.
mysqld &

MYSQLD_RUNNING=0
#Mysqld can take several seconds befor it runs. So here we check if it runs, if it does not,
#wait 5 seconds and check again. When it finaly runs, go for the mysql command.
while [ $MYSQLD_RUNNING -eq 0 ]
do
	sleep 5
	ps aux | grep -v "grep" | grep "mysqld"
	if [ $? -eq 0 ]
	then
		MYSQLD_RUNNING=1
		#Copy all the datas from wordpress.sql in wordpress database.
		mysql --password=root wordpress < wordpress.sql
	fi
done

#Kill the mysqld process, to prevent pod from crashing.
pkill mysqld

#Start mysqld again, but this time in foreground.
mysqld