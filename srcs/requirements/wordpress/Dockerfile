#Base image
FROM debian:buster

#INSTALL PHP
RUN apt update && apt upgrade -y

RUN apt install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common \
php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring php7.3-xml \
php7.3-gd php7.3-curl mariadb-client -y

#DOWNLOAD WORDPRESS wp-cli.phar
#https://make.wordpress.org/cli/handbook/guides/installing/
 
#A Phar archive is used to distribute a complete PHP application or library in a single file
RUN apt install wget -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#To be able to type just wp, instead of php wp-cli.phar,you need to make
#the file executable and move it to somewhere in your PATH.

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh /tmp/script.sh
RUN chmod 777 /tmp/script.sh

#CONFIGURE PHP ENVIRONMENT

#CREATE RUN DIRECTORY TO RUN PHP
RUN mkdir -p /run/php

#CREATE RUN DIRECTORY TO RUN WORDPRESS
RUN mkdir -p /var/www/wordpress

#PERMISSIONS TO www-data DEFAULT USER
RUN chown -R www-data:www-data /var/www/wordpress    
RUN chown -R www-data:www-data /etc/php/7.3/fpm/pool.d
RUN chown -R www-data:www-data /run/php

#CHANGE FILE TO LISTEN PORT 9000(.0.0.0.0 means that any IP can connect to port 9000)
RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf

#####################################################################################
#BONUS PART

#Install redis plugin
RUN apt install php7.3-redis -y

RUN echo "env[REDIS_HOST] = redis" >>/etc/php/7.3/fpm/pool.d/www.conf
RUN echo "env[REDIS_PORT] = 6379" >>/etc/php/7.3/fpm/pool.d/www.conf
#####################################################################################

#DEFINE WORK DIRECTORY AND EXPOSE PORT
WORKDIR /var/www/wordpress

EXPOSE 9000

#INSTALL WORDPRESS AND CONFIGURE ENVIRONMENT
ENTRYPOINT ["/bin/sh", "/tmp/script.sh"]
