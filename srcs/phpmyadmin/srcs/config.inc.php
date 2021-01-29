<?php

#Encrypted password for cookie authentification.
$cfg['blowfish_secret'] = 'gNsWq$%#%$#%EDFSsfXs*gbVp6LCJw6w';

// Override the first entry of 'Servers' array with new values.
$cfg['Servers'][1] =
[ 
    'auth_type' => 'cookie',
    'host' => 'mysql',
    'port' => 3306,
	'AllowNoPassword' => false,
	'extension' => 'mysqli',
	'compress' => false,
];