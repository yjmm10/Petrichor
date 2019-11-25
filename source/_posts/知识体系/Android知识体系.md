---
title: Android知识体系
tags:
  - 知识体系
  - Android
comments: ture
date: 2019-11-19 13:14:36
categories: 知识体系
---

{% centerquote %}
jkjk
{% endcenterquote %}
# 基础知识

{% note defalut %}
1. [回调函数](https://blog.csdn.net/a78270528/article/details/46918601)

{% endnote %}
# 四大组件

{% note defalut %}
- IPC 
  《Android开发艺术探索_任玉刚_2015》2.3 IPC基础概念介绍

- Binder
> 步骤：注册服务->获取服务->使用服务   
> 编程指导：  
> a. 在服务端创建BinderService服务类，继承自Service，并在类中创建IBinder接口的实例对象，并提供公共方法给客户端使用、在onBind()回调函数返回Binder实例   
> b. 在客户端，创建监听函数接收Binder,调用绑定的服务提供的方法
  
1. [Android 进阶7：进程通信之 AIDL 的使用](https://blog.csdn.net/u011240877/article/details/72765136)
2. [Android面试系列文章2018之Android部分Service篇](https://blog.csdn.net/clandellen/article/details/79276411)
----
3. 阅[Android跨进程通信：图文详解 Binder机制 原理](https://blog.csdn.net/carson_ho/article/details/73560642)
4. [一篇文章了解相见恨晚的 Android Binder 进程间通讯机制](https://blog.csdn.net/freekiteyu/article/details/70082302)
5. [BinderSample](https://github.com/yuanhuihui/BinderSample/blob/master/AppBinderDemo/app/src/main/java/com/yuanhh/appbinderdemo/ClientActivity.java)
{% endnote %}


{% note defalut %}
- Fragment

  - 开源项目
  [BuzzerBeater](https://github.com/itsMelo/BuzzerBeater)

{% endnote %}


  
   包含：AIDL Binder Service
   
-------------------
# 配置文件
1. [android 如何创建配置文件和读配置文件](https://blog.csdn.net/louyxlovess/article/details/50581216)
2. *[Android读写properties配置文件](https://www.cnblogs.com/jpfss/p/9914888.html)*


--------------------------
# 调试
> 一开始就启动调试
1. [Android Studio调试设置的断点无效](https://blog.csdn.net/wsgqp/article/details/51946760)
> 运行过程启动调试
1. 《第一行代码:Android(第二版)_郭霖_2014》13.4调试Android程序

------------------------------
# 反汇编
1. [android apk反编译(获取源码，资源文件等)](https://blog.csdn.net/Afanbaby/article/details/76756109)



---------------------


# 参考文献
----
- **文章**
1. [Android知识体系总结(全方面覆盖Android知识结构，面试&进阶)](https://www.jianshu.com/p/289f4881102e)
2. [Android面试系列2018总结(全方面覆盖Android知识结构)](http://www.androidchina.net/9038.html)
3. [Android - 收藏集](https://www.jianshu.com/p/dad51f6c9c4d)
4. [Android知识体系总结2019年5月份(初级到中级再到高级，你值得拥有)](https://blog.csdn.net/ClAndEllen/article/details/89886833)
5. [那两年炼就的Android内功修养](https://blog.csdn.net/luoshengyang/article/details/8923485)
6. [如何自学Android](http://gityuan.com/2016/04/24/how-to-study-android/)
7. [Android 操作系统架构开篇](http://gityuan.com/android/)

- **牛人**
1. [阿拉神农-《深入理解Android JVM ART》](https://me.csdn.net/Innost)
2. [任玉刚-《Android开发艺术探索》](https://blog.csdn.net/singwhatiwanna) -《Android开发艺术探索》
3. [罗升阳-《Android系统源代码情景分析》](https://blog.csdn.net/Luoshengyang)
4. [徐宜生-《Android群英传》](https://blog.csdn.net/eclipsexys)