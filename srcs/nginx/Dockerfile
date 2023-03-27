#Pull base image

FROM alpine:3.16


#Install bash
RUN apk update
Run apk add bash

#Install NGINX enviroment
RUN apk update
RUN apk add nginx

#Install ssl
RUN apk add openssl

# Create a file to save the certificate
RUN mkdir /etc/ssl/certificate

#Create a Certificate and a KEY to ssl

#- openssl – activates the OpenSSL software
#- req – indicates that we want a CSR
#- –new –newkey – generate a new key
#- rsa:2048 – generate a 2048-bit RSA mathematical key
#- –nodes – no DES, meaning do not encrypt the private key in a PKCS#12 file
#- –keyout – indicates the domain you’re generating a key for
#- –out – specifies the name of the file your CSR will be saved as
RUN openssl req -new -newkey rsa:2048 -nodes \
-subj "/C=BR/ST=SP/L=City/O=Organization/CN=localhost" \
-keyout /etc/ssl/certificate/fagiusep.42.fr.key -out /etc/ssl/certificate/fagiusep.42.fr.csr

#EntryPoint
CMD ["nginx", "-g", "daemon off;"]