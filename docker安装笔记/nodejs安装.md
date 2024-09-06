先安装源：

curl -sL https://rpm.nodesource.com/setup_14.x | bash -


 

 

然后：

yum -y install nodejs
通过：node -v  和npm -v 查看版本，说明安装成功

 

替换为淘宝NPM镜像

首先我们可以查看原本的镜像地址：

npm get registry
https://registry.npmjs.org/
然后替换成淘宝的：

npm config set registry http://registry.npm.taobao.org/
如果想恢复原来的镜像地址：

npm config set registry https://registry.npmjs.org/
如果用淘宝定制的cnpm工具来代替默认的npm：

 

npm install -g cnpm --registry=https://registry.npm.taobao.org