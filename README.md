# 基于 docker 的 thinkphp 的 lnmp 运行环境

基于[ DNMP（Docker + Nginx + MySQL + PHP8/7/5 + Redis）是一款全功能的**LNMP 一键安装程序**],此处适配 thinkphp 可开箱即用!

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
# ThinkPHP项目放在这个文件夹 dnmp/www/localhost/
# 详细文档在dnmp/README.md,在详细文档中可移步原项目地址。
# 修改伪静态,docker配置模板以及PHP的拓展模块等，增加PHP版本。
```
