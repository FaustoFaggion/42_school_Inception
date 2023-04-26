#Base image
FROM debian:buster

#Install REDIS
RUN apt update
RUN apt install redis -y

#Configure REDIS
RUN echo "\nbind 0.0.0.0\nport 6379\n" > /etc/redis/redis.conf
RUN echo "protected-mode no\n" >> /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]