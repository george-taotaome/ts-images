# ts-images

* push_local.sh：备份本地正常运行的容器到192.168.41.40上的容器库
* pull_dockerio.sh：拉取用到的 hub.docker.io 部分库
* pull_dockerrepo.sh：拉取用到的d ocker-repo.hero3d.net 部分库
* pull_local.sh：拉取push_local.sh备份上去的库到本地

本地环境如有损坏可以用上面脚本快速重建下，如遇到一些rails app中不正常，直接执行下：bundle pristine， 这个用cache恢复，不用去ts那边获取gem 