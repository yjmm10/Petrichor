---
title: hah
tags:
  - null
comments: ture
date: 2019-11-27 13:43:09
categories:
---

步骤：
1. 在`proguard-rules.pro`添加`-keepattributes EnclosingMethod`
2. 在资源文件新建xml目录，新建文件
```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true" />
</network-security-config>
```
清单文件配置：
```xml
<application
        android:networkSecurityConfig="@xml/network_security_config">
        <!--9.0加的，哦哦-->
        <uses-library
            android:name="org.apache.http.legacy"
            android:required="false" />
    </application>
```
3. 更新Android 9 API=28 build-tool 28.0.0


- 错误解决
1. [Ignoring InnerClasses attribute for an anonymous inner class](https://www.jb51.net/article/152672.htm)
2. [错误: 找不到符号 符号:   变量 CLIP_SAVE_FLAG 位置: 类 Canvas](https://blog.csdn.net/caobin_study/article/details/89023554)



