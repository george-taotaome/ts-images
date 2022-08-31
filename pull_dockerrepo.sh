#!/bin/bash

# docker-repo.hero3d.net/
list=(
    elasticsearch:6.8.23-1.0.0
    elasticsearch:1.5.2-1.0.1
    clamav:0.103.2-1.0.0
)

for variable in ${list[@]}
do
    echo "准备拉取docker-repo.hero3d.net镜像: 192.168.31.40/$variable"
    docker pull 192.168.31.40/$variable
    docker tag 192.168.31.40/$variable docker-repo.hero3d.net/$variable
    docker rmi 192.168.31.40/$variable
done
