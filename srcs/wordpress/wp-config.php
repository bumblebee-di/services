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
define( 'DB_USER', 'user_db' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass_db' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         ')kF-Iy=~LOz,!j|5C|]9Km&x<+H,<o/_K{i08R>02hL=[Dk&&sNHfy@_zah>phKs');
define('SECURE_AUTH_KEY',  'l2b$M87b:Lkd7Z_V.US#O_L$L8{SVo 1Tda{3Gw^$}C;Pee|-AP(j,&@-}&x*+a#');
define('LOGGED_IN_KEY',    '%DPnBoL;a-*{{mB@<I>_,F94kpN<s_#i$G(qa8G~^hVb[{)R.&>dv.!%?105a,ho');
define('NONCE_KEY',        '!3!r~;xj:l&R01(rtU~f].5`=_GbZAiVE(]s6u*Pv/0s<OVlR^T;hUw^:!E7~5jY');
define('AUTH_SALT',        'Gy^^=qx;TI T-+EbmB25V|A@e +tA4DtN`}})f*#f3uk8`z1<Hf+ Q1Cg+DeWB5S');
define('SECURE_AUTH_SALT', 'Vyg!V-uM<WN;-cA.tR7M!m>0b-4e^$c+3j/_at3@%U:W+;1w[o>o#=Q8;Ah-b2I}');
define('LOGGED_IN_SALT',   'Fdg@-mDdRS|*M-9VCYN&>USQZ|A !lORiR|4`J|a|~*-8 E ,G=D;dx}H;X%(5zk');
define('NONCE_SALT',       'rDyiYOEekh$0qX+O+NL7[R[H~0$B-^$-)x*<[^REA;D+RY}g3#%R8@zRcS=]~-Yz');

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
