FROM 		alpine:3.16.3

ARG			DB_NAME \
    		DB_USER \
    		DB_PASS \
			DB_ROOT

RUN 		apk update && apk add --no-cache mariadb mariadb-client

COPY 		./conf/mariadb.sh .

RUN 		chmod +x mariadb.sh && sh mariadb.sh && rm mariadb.sh

USER 		mysql

CMD 		["mysqld"]
