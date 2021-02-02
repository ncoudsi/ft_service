<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'LQX32G|#7z]f?B#FZV}zOnQ@h8AW#2a-/03,@7Y[ML25sLY-iEL^&;l[M.3eH84.' );
define( 'SECURE_AUTH_KEY',  ')Y%`[&nC~yio^LiItqd(.JLZDkZp4^WCfx,ZM[b$a4mAu0WvAHWEV7^ 8lJjvjNM' );
define( 'LOGGED_IN_KEY',    '`YSJ=vL~0s-,t~@J#>FSB>lBzrX}-v;iT&Gpw9.cpsVFE?B1[bziaA!-w{#z;>*v' );
define( 'NONCE_KEY',        ']?=(q~~(2j*@vsE<IKfj@8L)GxJ4k&Z5eML{jAToyibC5%Z{HfEM1U31%=?[1+V}' );
define( 'AUTH_SALT',        'muG&OM:H`4e_H? ]& Yk.}021O*T2-WM$gKB(Qx+m.]M!K7VXpmECnP$cDB^[;6b' );
define( 'SECURE_AUTH_SALT', 'LfHJsZgeiE/)7DZ)$g?/4x$fpdq9T<G]ii2J4Wgdhy$(=0p$!f*-ej/0-r~zVK;!' );
define( 'LOGGED_IN_SALT',   ']9v5Q{,[y6[(7/C?,3z-7]kibA{-u/9e+QEkx[%z>_0(7}NaLR2/`w7;SxlPeYX0' );
define( 'NONCE_SALT',       '*WJ&fzc`qZyvqv;|{)XJ#,mE?1R<s2Q^9(xcf*zL~+]-f$SJ,2cTU`GI1^Zj4?z?' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';