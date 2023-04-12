FROM 		alpine:3.16

ENV 		DOMAIN_NAME \
    		DB_HOST \
    		DB_NAME \
    		DB_USER \
			DB_ROOT \
    		DB_PASS \
			WP_ADMIN_USER \
			WP_ADMIN_PASSWORD \
			WP_ADMIN_MAIL \
			WP_CONTRIBUTOR_USER \
    		WP_CONTRIBUTOR_PASS \
    		WP_CONTRIBUTOR_EMAIL

# INSTALLING PHP8 + TOOLS
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
COPY		./conf/wp-config-create.sh .

RUN 		chmod +x wp-config-create.sh

WORKDIR 	/var/www/

ENTRYPOINT	["sh", "../../wp-config-create.sh"]
