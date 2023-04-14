#!/bin/bash

# Create Database && Securing database engine installation
if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then

    #Change permissions for user access
    chown -R mysql:mysql /var/lib/mysql

    #Star mysql
    service mysql start

    # #Create data-base
    mysql -e "CREATE DATABASE ${MARIADB_DATABASE}"


    # #Select DATABASE
    mysql -e "USE ${MARIADB_DATABASE}"

    #Create user and give privileges
    mysql -e "GRANT ALL ON *.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -e "GRANT ALL ON *.* TO '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"

    #Kill the anonymous users
    mysql -e "DELETE FROM mysql.user WHERE User=''"

    # disallow remote login for root
    mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"

    #Kill off the demo database
    mysql -e "DROP DATABASE IF EXITS test"
    mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

    #Refresh
    mysql -e "FLUSH PRIVILEGES"

    # #Change root password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

    #Update root user to use new password
    sed -i "s/password =/password = ${MARIADB_ROOT_PASSWORD}/" /etc/mysql/debian.cnf

    #Refresh
    mysql --user=root --password=${MARIADB_ROOT_PASSWORD}
    FLUSH PRIVILEGES;
    EXIT;

    #Stop mysql service
    service mysql stop
fi
    
#Restart mysql
mysqld_safe
