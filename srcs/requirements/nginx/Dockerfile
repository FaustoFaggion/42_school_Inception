#Pull base image
FROM debian:buster

#Install NGINX enviroment
RUN apt-get update
RUN apt-get install nginx -y

#Install openssl

RUN apt-get install openssl

# Create an RSA Private Key and CSR

#openssl – activates the OpenSSL software
#req – indicates that we want a CSR
#-x509 - auto signed.
#–new –newkey – generate a new key
#rsa:2048 – generate a 2048-bit RSA mathematical key
#–nodes – no DES, meaning do not encrypt the private key in a PKCS#12 file
#–keyout – indicates the domain you’re generating a key for
#–out – specifies the name of the file your CSR will be saved as
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=BR/ST=SP/L=São Paulo/O=42FR/OU=42SP/CN=fagiusep.42.sp" \
-keyout /etc/ssl/nginx.key \
-out /etc/ssl/nginx.crt

#Copy html page to nginx root directory
COPY index.html /var/www/index.html
COPY ./wagraton/index2.html /var/www/wagraton/index2.html

#Copy .conf nginx file
COPY conf/my_nginx.conf /etc/nginx/conf.d/

#EntryPoint

CMD ["nginx", "-g", "daemon off;"]