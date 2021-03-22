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
define( 'DB_NAME', getenv('DB_NAME') );
//define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', getenv('DB_USER') );
//define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );
//define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', getenv('DB_HOST') );
//define( 'DB_HOST', 'mysql-entrypoint.default.svc.cluster.local' );

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
define('AUTH_KEY',         '%uEk{6*RQ:cg:lxo{{ZlBPViD<=.7uRD(dK?P!^?`7UdsV0*&6s?5ld|ewpqWMok');
define('SECURE_AUTH_KEY',  'c=hS#9:;hw-6g4rW*!Kku{dTG(KKcN.+OgJm!N(6+w6$-U:]8!|%[M6>g%Nnx-Qq');
define('LOGGED_IN_KEY',    '+@FLB-34E62LQG<F]K*Z+}qn|UkQ3F0OgFOJ`.hR5fo~eC+sKk(qC#T]Kk3GMT+j');
define('NONCE_KEY',        '0OkO-eJo{5f|ClLsJ$KR +]bm$Em9;h0h<AgNHl:WXB>Dz*<}W28NR9pmzl/`;]Y');
define('AUTH_SALT',        '+:se3s?6OWM>K-8[%9Oq@yG_4+%&|wGv|C76.Tzo8^`y.EEaiR{-;9/C^FWM>Mic');
define('SECURE_AUTH_SALT', 'nI 5OJvcN_E4-+5Lk|Li>Ea-Whjl)-ut@twGp,J.sKXbuaASKJx:7r@n3s-mT*>)');
define('LOGGED_IN_SALT',   '=:M11Y5eBZ9Cenjo ,=*?;qzjMkG1){ERgO$V +w4nX6nv_0c;L0|{S]{$.1a:_W');
define('NONCE_SALT',       '*Y}kWiEB2#V+zMz1`91k45xTX; (yv7rIXb^jf6M(o=a)Pnuf!%M!Bt{: lecoYp');

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