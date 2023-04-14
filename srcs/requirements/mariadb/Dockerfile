#Base image
FROM debian:buster

#Install mariadb environment
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

#Update configuration file
#   line 28 - bind-address to all IPv4 adresses (IP 0.0.0.0)
#   line 19 - listen port 3306
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

#script to configure mariadb users, password, 
COPY /tools/script.sh /tmp/

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/tmp/script.sh"]
