> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [www.cnblogs.com](https://www.cnblogs.com/emunshe/p/13719778.html) **一、安装须知**

　　Docker CE 支持 64 位版本 CentOS 7，并且要求内核版本不低于 3.10。 CentOS 7 满足最低内核的要求，但由于内核版本比较低，部分功能（如 overlay2 存储层驱动）无法使用，并且部分功能可能不太稳定。

      查看 CentOS 版本及及内核版本

```
$ rpm -q centos-release
$ uname -r

```

 

**二、安装 Docker**

　　1、使用 yum 安装

 

```
1）安装一些必要的依赖包：
   $ sudo yum install -y yum-utils device-mapper-persistent-data lvm2



```

　2）添加 yum 软件源：      $ sudo yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo  

 　3）更新 yum 软件源缓存，并安装 docker-ce： $ sudo yum -y makecache fast      $ sudo yum -y install docker-ce  ) 　 2、使用脚本自动安装

```
$ curl -fsSL get.docker.com -o get-docker.sh 
$ sudo sh get-docker.sh --mirror Aliyun

```

　 **三、启动与检查服务**  )

```
1）启动docker
　　$ sudo systemctl enable docker 
　　$ sudo systemctl start docker

2）检查docker是否正确安装，输入如下测试一个镜像
　　$ docker run hello-word

```

 )   **四、建立 docker 用户组** 　　默认情况下， docker 命令会使用 Unix socket 与 Docker 引擎通讯。而只有 root 用户和 docker 组的用户才可以访问 Docker 引擎的 Unix socket。出于安全考虑，一般 Linux 系统上不会直接使用 root 用户。因此，更好地做法是将需要使用 docker 的用户加入 docker 用户组。  )

```
1）建立 docker 组： 
    $ sudo groupadd docker 

2）将当前用户加入 docker 组： 
　　$ sudo usermod -aG docker $USER 

3）退出当前终端并重新登录，进行测试。

```

 )   **五、问题记录** yum 安装 docker 时遇见如下问题： 　　获取 GPG 密钥失败：[Errno 14] curl#6 - "Could not resolve host: download.docker.com; 未知的错误" 原因是系统没有 yum 的 GPG 密钥 **解决办法：**

```
查看系统版本：
$ cat /etc/redhat-release

从网易开源镜像站导入对应秘钥：
$ rpm --import http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-7

```

参考： 《Docker 技术入门与实践》 网易开源镜像站 [mirrors.163.com](http://mirrors.163.com/) [CentOs 安装 docker 获取 GPG 密钥失败 Errno 14](https://blog.csdn.net/qq_35606010/article/details/104748675)