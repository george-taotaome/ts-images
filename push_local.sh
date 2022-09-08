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
    backends-all_squid-uploads
    backends-all_clamav
    backends-all_ts-power-ring
    backends-all_squid-files-resque
    backends-all_squid-files-sneakers
    backends-all_squid-files-resque-web
    backends-all_atlas-power-ring-resque-web
    backends-all_atlas-power-ring-resque
    backends-all_keymaster-resque
    backends-all_ts-power-ring-resque
    backends-all_reference-power-ring-resque
    backends-all_reference-power-ring
    backends-all_squid-products-sneakers
    backends-all_squid-products-resque
    backends-all_keymaster-resque-scheduler
    backends-all_squid-products
    backends-all_green-lantern-sneakers
    backends-all_keymaster
    backends-all_atlas-power-ring
    backends-all_green-lantern
    backends-all_squid-files
    backends-all_selenium-chrome
    backends-all_nginx-proxy
    backends-all_zookeeper
    backends-all_elasticsearch6
    backends-all_db
    backends-all_redis
    backends-all_mailhog
    backends-all_elasticsearch
    backends-all_amqp
    turbosquid_cf_turbosquid-cf
    turbosquid_cf_apache
    turbosquid_cf_memcached
    turbosquid_api_turbosquid-api-sneakers
    turbosquid_api_turbosquid-api-resque
    turbosquid_api_turbosquid-api
    turbosquid_artist_turbosquid-artist-webpacker
    turbosquid_artist_turbosquid-artist
    turbosquid_artist_turbosquid-artist-resque
    turbosquid_rails_turbosquid-rails-storybook
    turbosquid_rails_turbosquid-rails-esbuild
    turbosquid_rails_turbosquid-rails
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