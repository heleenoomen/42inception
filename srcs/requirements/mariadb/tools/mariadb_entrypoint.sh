#!bin/sh

sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
mkdir /var/run/mysqld
chmod 777 /var/run/mysqld

mysql_install_db --user=root --datadir=/var/lib/mysql
