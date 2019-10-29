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
