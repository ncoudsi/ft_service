<?php

#Encrypted password for cookie authentification.
$cfg['blowfish_secret'] = 'gNsWq$%#%$#%EDFSsfXs*gbVp6LCJw6w';

// Override the first entry of 'Servers' array with new values.
$cfg['Servers'][1] =
[ 
	#If set as 'cookie', user is prompted and can log in with any valid MySQL user.
	#If set as 'config', automaticly user 'user' and 'password' entries to log in.
	#Other possible values (see : https://docs.phpmyadmin.net/en/latest/config.html).
    'auth_type' => 'config',
	#Hostname or IP address of the MySQL server.
    'host' => 'mysql',
    #3306 is default value. Define the port of your MySQL server.
	'port' => 3306,
	#False is default value. Prevent from someone connecting as 'root' without password.
	'AllowNoPassword' => false,
	#User and password are usefull only if 'auth_type' is 'config'. In that case, they will be user
	#to log in phpmyadmin without prompt.
	'user' => 'admin',
	'password' => 'admin',
];