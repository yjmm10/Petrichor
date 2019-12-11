---
title: Hexo 入门完全教程
date: 2019-10-24 14:39:16
tags:
- hexo
- git
- 教程
categories: 工具
---

# 官方资料
1. [next配置文档](https://theme-next.iissnan.com/getting-started.html)

# git安装配置
> **流程：配置github信息 -> 生成rsa文件 -> 添加SSH**   
> 
1. 配置用户信息  
    `$ git config --global user.name "yjmm10`  
    `$ git config --global user.email yjmm10@yeah.net`
*注:*yjmm10@yeah.net 不加**引号**

   查看用户名和密码
    `git config user.name`     
    `git config user.email`   

2. 生成rsa文件  
   - 查看rsa文件  
        `cd ~/.ssh`   
        `ls`   
    *注：存在则跳过该步骤*
   - 创建rsa文件   
        `$ ssh-keygen -t rsa -C yjmm10@yeah.net`  
        得到*id_rsa*和*id_rsa.pub*  两个文件

   - 复制ssh

5.将ssh添加到github上面




- 服务器配置
1. 安装git 
   sudo apt-get install git-core
2.安装nodejs(低版本有问题)
    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
    sudo apt-get install -y nodejs
    测试nodejs版本
    nodejs -v
3. 安装npm
    第一步：在你的用户文件下新建一个文件夹，这个.npm-global 名字可以用你自己喜欢的名字替换，推荐直接使用这个名字。
    mkdir ~/.npm-global

    第二步：更改node的安装连接
    npm config set prefix '~/.npm-global'

    第三步：在用户的profile下增加path，为的是系统能够找到可执行文件的目录
    export PATH=~/.npm-global/bin:$PATH

    #第四步：update profile。使其生效
    source ~/.profile

安装hexo
    npm install -g hexo
    npm install hexo --save

安装nginx

配置nginx
[nginx配置](http://zyy1217.com/2018/10/01/%E4%BD%BF%E7%94%A8Git%E9%83%A8%E7%BD%B2Hexo%E5%8D%9A%E5%AE%A2%E5%88%B0Ubuntu%E6%9C%8D%E5%8A%A1%E5%99%A8/)


    此时打开浏览器访问自己【主机的ip：4000】就可以看到我们搭建成功的博客页面。

但是这仅仅是本地的，接下来把博客部署到 GitHub 上面我们就可以脱离本地访问了。
   

   
