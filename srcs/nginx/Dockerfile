#Pull base image

FROM alpine:3.16

#Install NGINX enviroment

RUN apk update
RUN apk install nginx -y


#EntryPoint

CMD ["nginx", "-g", "deamon off;"]