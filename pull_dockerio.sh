#!/bin/bash

# docker.io
list=(
    jwilder/nginx-proxy:latest
    mailhog/mailhog:latest
    memcached:latest
    postgres:10.16
    redis:latest
    zookeeper:latest
)

for variable in ${list[@]}
do
    echo "准备拉取docker.io镜像: 192.168.31.40/$variable"
    docker pull 192.168.31.40/$variable
    docker tag 192.168.31.40/$variable $variable
    docker rmi 192.168.31.40/$variable
done
