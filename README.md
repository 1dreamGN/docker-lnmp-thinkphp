# 基于 docker 的 thinkphp 的 lnmp 运行环境

基于[ DNMP（Docker + Nginx + MySQL + PHP7/5 + Redis）是一款全功能的**LNMP 一键安装程序**],此处适配 thinkphp 可开箱即用!

> 开箱即用(需要安装完成 docker 和 doker-compose)

```




 打开当前目录:   cd dnmp

初次运行: docker-compose up
后台运行: docker-compose up -d
停止    : docker-compose down


```

> 修改的部分

**修改部分**

```
# 主要是修改伪静态规则
#  dnmp/services/nginx/conf.d/localhost.conf
root   /www/localhost/app/public/;

    index  index.php index.html index.htm;
    include /www/localhost/app/public/nginx.htaccess;
    #charset koi8-r;


```
