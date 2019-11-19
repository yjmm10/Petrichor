---
title: test
tags:
  - null
comments: ture
date: 2019-11-19 11:03:35
categories:
---

- 站内文章   
  
  {% post_link 工具 你们好 %}    

  {% post_link Android/Android学习 Android学习 %}
 
{% centerquote %}blah blah blah{% endcenterquote %}

<!-- 标签别名 -->
{% cq %} blah 顶顶顶顶 blah {% endcq %}

- 代码块进阶
  ``` c++ hello world  http://www.baidu.com 百度
  code lddd
  ```
- note标签
  {% note default %}  文本内容 (支持行内标签)  {% endnote %}
  {% note primary %}  文本内容 (支持行内标签)  {% endnote %}
  {% note success %}  文本内容 (支持行内标签)  {% endnote %}
  {% note info %}  文本内容 (支持行内标签)  {% endnote %}
  {% note warning %}  文本内容 (支持行内标签)  {% endnote %}
  {% note danger %}  文本内容 (支持行内标签)  {% endnote %}

- label标签
  {% label default@你  %}
  {% label primary@哈哈  %}

- button标签
  {% button , 内容, icon [class], title %}

- tab标签
{% tabs Tab标签列表 %}
  <!-- tab 第一个 -->
    标签页1文本内容
  <!-- endtab -->
  <!-- tab 标签页2 -->
    标签页2文本内容
  <!-- endtab -->
  <!-- tab 标签页3 -->
    标签页3文本内容
  <!-- endtab -->
{% endtabs %}