# centeros7 安装docker

Docker 从 1.13 版本之后采用时间线的方式作为版本号，分为社区版 CE 和企业版 EE。

社区版是免费提供给个人开发者和小型团体使用的，企业版会提供额外的收费服务，比如经过官方测试认证过的基础设施、容器、插件等。

社区版按照 stable 和 edge 两种方式发布，每个季度更新 stable 版本，如 17.06，17.09；每个月份更新 edge 版本，如 17.09，17.10。

 一、安装 docker
------------

1、Docker 要求 CentOS 系统的内核版本高于 3.10 ，查看本页面的前提条件来验证你的 CentOS 版本是否支持 Docker 。

通过 **uname -r** 命令查看你当前的内核版本

```
yum remove docker docker-common docker-selinux docker-engine -y
/etc/systemd -name '*docker*' -exec rm -f {} ;
find /etc/systemd -name '*docker*' -exec rm -f {} \;
find /lib/systemd -name '*docker*' -exec rm -f {} \;
```

2、使用 `root` 权限登录 Centos。确保 yum 包更新到最新。

```
$ sudo yum update
```

3、卸载旧版本 (如果安装过旧版本的话)

```
$ sudo yum remove docker  docker-common docker-selinux docker-engine
```

4、安装需要的软件包， yum-util 提供 yum-config-manager 功能，另外两个是 devicemapper 驱动依赖的

```
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

5、设置 yum 源

```
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

 ![](https://images2017.cnblogs.com/blog/1107037/201801/1107037-20180128094640209-1433322312.png)

6、可以查看所有仓库中所有 docker 版本，并选择特定版本安装

```
$ yum list docker-ce --showduplicates | sort -r
```

![](https://images2017.cnblogs.com/blog/1107037/201801/1107037-20180128095038600-772177322.png)

7、安装 docker

```
$ sudo yum install docker-ce  #由于repo中默认只开启stable仓库，故这里安装的是最新稳定版17.12.0
$ sudo yum install <FQPN>  # 例如：sudo yum install docker-ce-17.12.0.ce
```

 ![](https://images2017.cnblogs.com/blog/1107037/201801/1107037-20180128103448287-493824081.png)

8、启动并加入开机启动

```
$ sudo systemctl start docker
$ sudo systemctl enable docker
```

9、验证安装是否成功 (有 client 和 service 两部分表示 docker 安装启动都成功了)

```
$ docker version
```

![](https://images2017.cnblogs.com/blog/1107037/201801/1107037-20180128104046600-1053107877.png)

 二、问题
-----

1、因为之前已经安装过旧版本的 docker，在安装的时候报错如下：

```
Transaction check error:
  file /usr/bin/docker from install of docker-ce-17.12.0.ce-1.el7.centos.x86_64 conflicts with file from package docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
  file /usr/bin/docker-containerd from install of docker-ce-17.12.0.ce-1.el7.centos.x86_64 conflicts with file from package docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
  file /usr/bin/docker-containerd-shim from install of docker-ce-17.12.0.ce-1.el7.centos.x86_64 conflicts with file from package docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
  file /usr/bin/dockerd from install of docker-ce-17.12.0.ce-1.el7.centos.x86_64 conflicts with file from package docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
```

2、卸载旧版本的包

```
$ sudo yum erase docker-common-2:1.12.6-68.gitec8512b.el7.centos.x86_64
```

![](https://images2017.cnblogs.com/blog/1107037/201801/1107037-20180128103145287-536100760.png)

3、再次安装 docker

```
$ sudo yum install docker-ce
```