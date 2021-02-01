--Define mysql as the data base context.
use mysql;
--Modify user and set up its password (root user is set by default, but with no password).
--@'host_name' is the host of the user. If omitted, the host is set as '%' (any).
ALTER USER 'root'@'localhost'
	IDENTIFIED BY 'root';
--Create database (with a security check to avoid duplicates).
CREATE DATABASE IF NOT EXISTS `wordpress`;
--Create user and set up its password.
CREATE USER 'admin'
	IDENTIFIED BY 'admin' ;
--Grant "all" privileges (see sql doc for specifications), on a database, to an user.
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
--Reload grant tables (actualise privileges settings).
FLUSH PRIVILEGES;

--Still cant find a way to log in phpmyadmin as root.
--ERROR : mysqli::real_connect(): (HY000/1045): Access denied for user 'root'@'172.18.0.1' (using password: YES)