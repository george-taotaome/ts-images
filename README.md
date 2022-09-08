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
1. cd 到docker-backends/compose/all目录下，执行s up -d， 这些是先启动backend下的服务
2. 然后再到各个app目录下，s up -d， 启动各自的app
