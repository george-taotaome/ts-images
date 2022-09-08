#!/bin/bash

# docker-repo images
# IMAGES_LIST=($(docker images | grep 'docker-repo' | awk '{print $1':'$2}'))
# IMAGES_NUM=${#IMAGES_LIST[*]}
# for((i=0;i<$IMAGES_NUM;i++))
# do
#     echo '${IMAGES_LIST[$i]}' 
#     docker push '${IMAGES_LIST[$i]}' 
# done

# First login to Docker: docker login -u admin -p xxxxxxxx 192.168.31.40
# push containers
C_LIST=(
    backends-all_squid-files
    backends-all_selenium-chrome
    backends-all_nginx-proxy
)

# getops, test: ./push_local.sh docket_web docket_crawler
if [ $# -gt 0 ]; then C_LIST=($*); fi

C_NUM=${#C_LIST[*]}
for((i=0;i<$C_NUM;i++))
do
    echo "准备推送: ${C_LIST[$i]}_1"
    docker commit ${C_LIST[$i]}_1 192.168.31.40/george/${C_LIST[$i]}:latest
    docker push 192.168.31.40/george/${C_LIST[$i]}:latest
    docker rmi 192.168.31.40/george/${C_LIST[$i]}:latest

    # old list with _1
    # docker commit ${C_LIST[$i]} docker-repo.hero3d.net/george/${C_LIST[$i]%_1}:latest
    # docker push docker-repo.hero3d.net/george/${C_LIST[$i]%_1}:latest
    # docker rmi docker-repo.hero3d.net/george/${C_LIST[$i]%_1}:latest
done