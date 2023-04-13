FROM 		alpine:3.16

# install php8 + tools
RUN 		apk update && apk upgrade && \
			apk add --no-cache \
			php8 \
			php8-fpm \
			php8-mysqli \
		 	php8-json \
			php8-curl \
    		php8-dom \
			php8-exif \
			php8-fileinfo \ 
			php8-mbstring \
    		php8-openssl \
			php8-xml \
			php8-zip \
			php8-cli \
			php8-phar \
			mariadb-client \
			wget \
			ranger

# install wordpress CLI
ARG         WP_CLI_URL=https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN         wget $WP_CLI_URL; \
            chmod +x wp-cli.phar; \
            mv wp-cli.phar /usr/local/bin/wp

COPY		conf/wp-config-create.sh .

RUN 		chmod +x wp-config-create.sh

ENTRYPOINT	["sh", "wp-config-create.sh"]

# force to stay in foreground and ignore daemonize option from config file
# see: https://linux.die.net/man/8/php-fpm
CMD ["/usr/sbin/php-fpm8", "-F"]

