# git安装
1. 配置用户信息
    `$ git config --global user.name "yjmm10`  
    `$ git config --global user.email yjmm10@yeah.net`   
2. 查看用户名和密码
        `git config user.name`     
        `git config user.email`   
3. 查看ssh
`cd ~/.ssh`   
`ls`   
如果存在则有两个文件id_rsa(密钥)和id_rsa.pub(公钥)，则跳过第四步
4. 创建ssh key   
`$ ssh-keygen -t rsa -C yjmm10@yeah.net`

5.将ssh添加到github上面
