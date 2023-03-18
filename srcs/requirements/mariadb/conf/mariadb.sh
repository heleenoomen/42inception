#!bin/sh

# make a directory where mariadb can acces the myssqld.sock socket file
mkdir /var/run/mysqld

# change the config file so TCP/IP is no longer disabled
sed -i "s/skip-networking/skip-networking=0/g" /etc/my.cnf.d/mariadb-server.cnf

# change the config file so that bind-address=0.0.0.0 is no longer commented out (this means mariadb can now bind to any address)
sed -i "s/#bind-address/bind-address/g" /ect/my.cnf.d/mariadb-server.cnf

# check if the database was already initialized. (In that case, the directory /var/lib/mysql/mysql will exist. If not, initialize the database and tell it to stort its tables in /var/lib/mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then

        # init database
        mysql_install_db --datadir=/var/lib/mysqld

fi

# check if the wordpress database exists. If not yet, make a create_db.sql script to (1) secure the database and (2) add the wordpress database.
if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        # run init.sql
        # make sure the create_db.sql file has execution rights
        chmod +x tmp/create_db.sql

        # run the mysql daemon with bootstrap so that it executes the .sql file
        /usr/bin/mysqld --user=root --bootstrap --skip-grant-tables=0 < /tmp/create_db.sql

        # remove the .sql file
        rm -f /tmp/create_db.sql
fi
