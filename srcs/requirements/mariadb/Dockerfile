FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY conf/create_db.sh .

RUN chmod +x create_db.sh && sh create_db.sh && rm create_db.sh

ENTRYPOINT ["mysqld_safe", "--user=root"]
