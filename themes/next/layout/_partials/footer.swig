{%- if theme.footer.beian.enable %}
  <div class="beian">
    {{- next_url('http://www.beian.miit.gov.cn', theme.footer.beian.icp + ' ') }}
    {%- if theme.footer.beian.gongan_icon_url %}
      <img src="{{ theme.footer.beian.gongan_icon_url }}" style="display: inline-block;">
    {%- endif %}
    {{- next_url('http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=' + theme.footer.beian.gongan_id,
    theme.footer.beian.gongan_num + ' ') }}
  </div>
{%- endif %}

<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

<div class="copyright">
  {%- set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright or author }}</span>

  {%- if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{{ symbolsCountTotal(site) }}</span>
  {%- endif %}

  {%- if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total') }} &asymp;</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}</span>
  {%- endif %}
</div>

<!--  页脚   --> 
{%- if theme.footer.powered.enable %}

  <div class="powered-by">
  <i class="fa fa-user-md"></i><span id="busuanzi_container_site_uv">
    本站访客数: <span id="busuanzi_value_site_uv"></span>
  </span>
  </div>

  <span class="post-meta-divider">|</span>

  <div class="theme-info">
  <div class="powered-by"></div>
  <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
  </div>

<!-- hexo 版权
    <div class="powered-by">
      {{- __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}
      {%- if theme.footer.powered.version %} v{{ hexo_env('version') }}{%- endif %}
    </div> 

  {%- endif %}


  {%- if theme.footer.powered.enable and theme.footer.theme.enable %}
    <span class="post-meta-divider">|</span>
  {%- endif %}
-->

<!--  运行时间  -->
<br>
<span id="sitetime"></span>
<script language=javascript>
	function siteTime(){
		window.setTimeout("siteTime()", 1000);
		var seconds = 1000;
		var minutes = seconds * 60;
		var hours = minutes * 60;
		var days = hours * 24;
		var years = days * 365;
		var today = new Date();
		var todayYear = today.getFullYear();
		var todayMonth = today.getMonth()+1;
		var todayDate = today.getDate();
		var todayHour = today.getHours();
		var todayMinute = today.getMinutes();
		var todaySecond = today.getSeconds();
		/* Date.UTC() -- 返回date对象距世界标准时间(UTC)1970年1月1日午夜之间的毫秒数(时间戳)
		year - 作为date对象的年份，为4位年份值
		month - 0-11之间的整数，做为date对象的月份
		day - 1-31之间的整数，做为date对象的天数
		hours - 0(午夜24点)-23之间的整数，做为date对象的小时数
		minutes - 0-59之间的整数，做为date对象的分钟数
		seconds - 0-59之间的整数，做为date对象的秒数
		microseconds - 0-999之间的整数，做为date对象的毫秒数 */
		var t1 = Date.UTC(2019,07,21,00,00,00); //你的建站时间
		var t2 = Date.UTC(todayYear,todayMonth,todayDate,todayHour,todayMinute,todaySecond);
		var diff = t2-t1;
		var diffYears = Math.floor(diff/years);
		var diffDays = Math.floor((diff/days)-diffYears*365);
		var diffHours = Math.floor((diff-(diffYears*365+diffDays)*days)/hours);
		var diffMinutes = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours)/minutes);
		var diffSeconds = Math.floor((diff-(diffYears*365+diffDays)*days-diffHours*hours-diffMinutes*minutes)/seconds);
		document.getElementById("sitetime").innerHTML=" Run for "+/*diffYears+" Year "+*/diffDays+" Days "+diffHours+" Hours "+diffMinutes+" m "+diffSeconds+" s";
	}/*因为建站时间还没有一年，就将之注释掉了。需要的可以取消*/
	siteTime();
</script>




<!-- next版本
  {%- if theme.footer.theme.enable %}

    <div class="theme-info">
      {%- set next_site = 'https://theme-next.org' %}
      {%- if theme.scheme !== 'Gemini' %}
        {%- set next_site = 'https://' + theme.scheme.toLowerCase() + '.theme-next.org' %}
      {%- endif %}
      {{- __('footer.theme') }} – {{ next_url(next_site, 'NexT.' + theme.scheme, {class: 'theme-link'}) }}
      {%- if theme.footer.theme.version %} v{{ version }}{%- endif %}
    </div>

  {%- endif %}

  {%- if theme.add_this_id %}
    <div class="addthis_inline_share_toolbox">
      <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid={{ theme.add_this_id }}" async="async"></script>
    </div>
  {%- endif %}
-->
{{- next_inject('footer') }}




