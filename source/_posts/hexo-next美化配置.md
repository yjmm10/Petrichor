---
title: hexo next美化配置
tags:
  - hexo
  - next
comments: ture
date: 2019-10-29 13:36:50
categories: 配置
top: 100

---
<div class="note default"><p>default</p></div>

<span id="inline-toc">1.</span>
<div class="note success"><p>success</p></div>

- fork me on github
  代码获取：[图标](http://tholman.com/github-corners/)、[文字](https://github.blog/2008-12-19-github-ribbons/)
  配置：复制的代码需要的样式到themes/next/layout/_layout.swig文件中(放在`<div class="headband"></div>`的下面)，并把href改为你的github地址

- 动态背景
  1. 修改_layout.swig
   打开/next/layout/_layout.swig
   在<body></body>内添加代码
    ```js
    {% if theme.canvas_nest %}
    color="0,0,255" opacity='0.7' zIndex="-2" count="99" <script type="text/javascript" src="//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script>
    {% endif %}
    ```
  2. 修改配置文件
   打开/next/_config.yml,将`canvas_nest:false`改为`canvas_nest:true`(利用搜索)

  3. 自定义参数
     1. `color`: 线条颜色, 默认: '0,0,0'；三个数字分别为(R,G,B)
     2. `opacity`: 线条透明度（0~1）, 默认: 0.5
     3. `count`: 线条的总数量, 默认: 150
     4. `zIndex`: 背景的z-index属性，css属性用于控制所在层的位置, 默认: -1
  4. 精简，搭配3
   在根目录下执行如下命令：
  `$ git clone https://github.com/theme-next/theme-next-canvas-nest themes/next/source/lib/canvas-nest`
  然后在主题配置文件中设置 canvas_nest: true 即可。

- 点击效果(未试验)
  
- 链接样式
  修改`themes\next\source\css\_common\components\post\post.styl`,在末尾添加css样式
  ```css
  // 文章内链接文本样式
  .post-body p a{
    color: #0593d3;
    border-bottom: none;
    border-bottom: 1px solid #0593d3;
    &:hover {
      color: #fc6423;
      border-bottom: none;
      border-bottom: 1px solid #fc6423;
    }
  }
  ```   
  其中选择.post-body 是为了不影响标题，选择 p 是为了不影响首页“阅读全文”的显示样式,颜色可以自己定义。

- 标签logo
  修改`/themes/next/_config.yml`,搜索`tag_icon`，参数改为`true`
  
- 文章阴影效果(未完成)
  
- 访问量
  1. 打开`\themes\next\layout\_partials\footer.swig`文件,在`<div class="copyright" >`前加上添加代码
  ```css
  <div class="powered-by">
  <i class="fa fa-user-md"></i><span id="busuanzi_container_site_uv">
  本站访客数:<span id="busuanzi_value_site_uv"></span>
  </span>
  </div>
  ```
  2. 在合适位置显示统计的代码，在`<div class="powered-by">`前添加代码
  ```css
  <div class="powered-by">
  <i class="fa fa-user-md"></i><span id="busuanzi_container_site_uv">
  本站访客数:<span id="busuanzi_value_site_uv"></span>
  </span>
  </div>
  ```
- 添加热度(未完成)

- 网站字数统计
  1. 在根目录下运行
    ```
    npm install hexo-wordcount --save
    ```
  2. 在`/themes/next/layout/_partials/footer.swig`合适位置文件尾部加上：
    ```css
    <span class="post-meta-divider">|</span>

    <div class="theme-info">
    <div class="powered-by"></div>
    <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
    </div>
    ```

- 统计功能(未完成)
  1. 在根目录下运行
    ```
    npm install hexo-wordcount --save
    ```
  2. 

- 文章加密
  参考链接：[hexo-blog-encrypt](https://github.com/MikeCoder/hexo-blog-encrypt/blob/master/ReadMe.zh.md)

- 字数统计以及阅读时间
  参考链接：[hexo-symbols-count-time](https://github.com/theme-next/hexo-symbols-count-time)

- 置顶
  1. 将`node_modules/hexo-generator-index/lib/generator.js`内代码替换为
    ```   
    'use strict';
    var pagination = require('hexo-pagination');
    module.exports = function(locals){
      var config = this.config;
      var posts = locals.posts;
        posts.data = posts.data.sort(function(a, b) {
            if(a.top && b.top) { // 两篇文章top都有定义
                if(a.top == b.top) return b.date - a.date; // 若top值一样则按照文章日期降序排
                else return b.top - a.top; // 否则按照top值降序排
            }
            else if(a.top && !b.top) { // 以下是只有一篇文章top有定义，那么将有top的排在前面（这里用异或操作居然不行233）
                return -1;
            }
            else if(!a.top && b.top) {
                return 1;
            }
            else return b.date - a.date; // 都没定义按照文章日期降序排
        });
      var paginationDir = config.pagination_dir || 'page';
      return pagination('', posts, {
        perPage: config.index_generator.per_page,
        layout: ['index', 'archive'],
        format: paginationDir + '/%d/',
        data: {
          __index: true
        }
      });
    };
    ```
    2. 在文章中添加`top`,数值越大文章越靠前
