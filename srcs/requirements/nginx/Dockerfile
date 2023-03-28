#Pull base image
FROM debian:buster

#Install NGINX enviroment
RUN apt-get update
RUN apt-get install nginx -y

#Copy html page to nginx root directory
COPY index.html /var/www/index.html

COPY ./wagraton/index2.html /var/www/wagraton/index2.html

COPY conf/my_nginx.conf /etc/nginx/conf.d/

#EntryPoint

CMD ["nginx", "-g", "daemon off;"]


#EntryPoint
CMD ["nginx", "-g", "daemon off;"]