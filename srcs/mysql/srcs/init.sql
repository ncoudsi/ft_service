--Define mysql as the data base context.
use mysql;
--Modify user and set up its password (root user is set by default, but with no password).
--'@'host_name is the host of the user. If omitted, the host is set as '%' (any).
ALTER USER 'root'@'localhost'
	IDENTIFIED BY 'password';
--Create database (with a security check to avoid duplicates).
CREATE DATABASE IF NOT EXISTS `wordpress`;
--Create user and set up its password.
CREATE USER 'user'
	IDENTIFIED BY 'user' ;
--Grant "all" privileges (see sql doc for specifications), on a database, to an user.
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user';
--Reload grant tables (actualise privileges settings).
FLUSH PRIVILEGES;