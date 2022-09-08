#!/bin/bash

# local build
list=(
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

# getops, test: ./pull_local.sh docket_web docket_crawler
if [ $# -gt 0 ]; then list=($*); fi

for variable in ${list[@]}
do
    echo "准备拉取镜像: 192.168.31.40/george/$variable"
    docker pull 192.168.31.40/george/$variable
    docker tag 192.168.31.40/george/$variable $variable
    docker rmi 192.168.31.40/george/$variable
done
