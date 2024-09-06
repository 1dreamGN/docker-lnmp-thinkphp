安装git
====

1. 到 github 上 git 的仓库中获取最新版的发行版源码

   地址：https://github.com/git/git/releases

2. 解压到安装目录下

   ```
   tar -zxvf  git-2.30.0.tar.gz
   
   ```

3. 定位到解压的目录下

   ```
   cd git-2.30.0
   make ./configure
   ./configure prefix={安装目录}
   make && make install
   
   ```

4. 配置环境变量

   ```
    # 打开配置文件
    sudo gedit /etc/profile
   
    # 编辑配置文件
    # 添加变量：export GIT_HOME=/home/admin/apps/git
    # 拼接PATH： :{GIT_HOME}/bin
    
    # 刷新环境变量
    source /etc/profile
   
   ```

5. 测试是否安装成功

   ```
   git --version
   
   git clone ...
   
   ```

遇到的问题
=====

1. 编译时遇到 “找不到 zlib.h” 的问题

   这是缺少 zlib-devel 依赖项的问题，通过安装 zlib-devel 解决，只能离线安装的话，可以在这里获取安装包 https://pkgs.org/

2. 安装完成后，执行 git clone、git pull 等命令出现 “git：‘remote-http’ 不是一个 git 命令” 的问题

   这是缺少 libcurl-devel 依赖项导致的问题，离线安装可以在 https://pkgs.org / 获取安装包，也可以直接 yum install libcurl-devel 安装，安装完成后，删掉之前安装的内容，重新执行上述 git 安装过程。