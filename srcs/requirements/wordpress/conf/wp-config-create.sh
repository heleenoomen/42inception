#!/bin/sh

# Modify PHP-FPM configuration to listen on port 9000
sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf
sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf
sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf

# Download WP-CLI
WP_CLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
wget ${WP_CLI_URL}
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/wp-config.php" ]; then
      wp core download --path=. --allow-root

      wp config create  --dbhost=$DB_HOST \
                        --dbname=$DB_NAME \
                        --dbuser=$DB_USER \
                        --dbpass=$DB_PASS \
                        --allow-root

      wp config set ABSPATH "__DIR__ . '/'"

      wp core install   --url=$DOMAIN_NAME \
                        --title="Example" \
                        --admin_user=$WP_ADMIN_USER \
                        --admin_password=$WP_ADMIN_PASSWORD \
                        --admin_email=$WP_ADMIN_MAIL \

      wp user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=$WP_USER_PASS
fi

echo "WordPress has been installed."

exec /usr/sbin/php-fpm8 -F
