# Check if the wp-config.php file exists
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	# DOWNLOAD WORDPRESS
	wp core download --allow-root

	# CONFIGURE WORDPRESS
	wp core config \
		--dbname=$MARIADB_DATABASE \
		--dbuser=$MARIADB_USER \
		--dbpass=$MARIADB_PASSWORD \
		--dbhost=$MARIADB_ROOT_HOST \
		--dbprefix='wp_' \
		--dbcharset="utf8" \
		--dbcollate="utf8_general_ci" --allow-root

	# INSTALL WORDPRESS # CREATE ADMIN ACCOUNT # EXCLUDE FROM NEW USER NOTIFICATION EMAILS
	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email --allow-root

	# Create a WordPress user with the specified details
	#https://developer.wordpress.org/cli/commands/user/create/
	wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --role=subscriber --porcelain --allow-root

	# BONUS PART
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp plugin update --all --allow-root 
	wp redis enable --allow-root 
fi

php-fpm7.3 -F