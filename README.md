# ts-images

* push_local.sh：备份本地正常运行的容器到 192.168.41.40 上的容器库
* pull_dockerio.sh：拉取用到的 hub.docker.io 部分库
* pull_dockerrepo.sh：拉取用到的 docker-repo.hero3d.net 部分库
* pull_local.sh：拉取 push_local.sh 备份上去的库到本地

本地环境如有损坏可以用上面脚本快速重建下，如遇到一些rails app中不正常，直接执行下：bundle pristine， 这个用cache恢复，不用去ts那边获取gem。

注意将IP放入可信名单中
```
  "insecure-registries": [
    "192.168.31.40"
  ]
```

启动步骤
1. cd 到 docker-backends/compose/all 目录下，执行 s up -d， 这些是先启动 backend 下的服务
2. 然后再到各个 app 目录下，s up -d， 启动各自的 app

后续如更新
1. docker-backends: 
```
# 如有更新 service 下的 yml，最好重建
s up -d --build service-name
# 如更新 settings/organization_settings 下的 settings.yml
s exec zookeeper /zk-seed
```
2. 其它系统如有更新
```
# 如更新Gemfile，进入容器执行
bundle install
# 如更新 settings.example.yml, 对比配置到 settings.yml
# 如有 migrate，进入容器执行
bundle exec rake db:migrate
# 如有 seeds，进入容器执行
bundle exec rake db:seed
# 如涉及索引数据，进入容器执行重建 index
# 如不想进入容器执行，可以删除当前应用目录下的 scratch 目录，重启让其自行执行 prepare
```