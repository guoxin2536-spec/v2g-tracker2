---
layout: default
title: 情报日报
---

# 📰 V2G情报日报

每日自动抓取全球V2G行业最新动态

---

## 📊 今日概览

<div class="stats-grid">
  <div class="stat-card">
    <div class="stat-number">{{ site.posts | size }}</div>
    <div class="stat-label">总情报数</div>
  </div>
  <div class="stat-card highlight">
    <div class="stat-number">{{ site.posts | where: "categories", "daily-report" | size }}</div>
    <div class="stat-label">日报数量</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">65+</div>
    <div class="stat-label">情报源</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">4</div>
    <div class="stat-label">语言覆盖</div>
  </div>
</div>

---

## 📅 最新日报

{% assign daily_reports = site.posts | where: "categories", "daily-report" %}

{% if daily_reports.size > 0 %}
<div class="daily-list">
{% for post in daily_reports limit:10 %}
  <article class="daily-item">
    <div class="daily-date">
      {{ post.date | date: "%Y年%m月%d日" }}
    </div>
    <h2 class="daily-title">
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h2>
    <div class="daily-summary">
      {{ post.excerpt | strip_html | truncate: 200 }}
    </div>
    <div class="daily-meta">
      {% if post.tags %}
      <span class="daily-tags">
        {% for tag in post.tags limit:3 %}
        <span class="tag">{{ tag }}</span>
        {% endfor %}
      </span>
      {% endif %}
      <a href="{{ post.url | relative_url }}" class="read-more">阅读全文 →</a>
    </div>
  </article>
{% endfor %}
</div>

{% if daily_reports.size > 10 %}
<div class="pagination">
  <p>显示前10篇日报，共 {{ daily_reports.size }} 篇</p>
  <a href="/archive" class="btn">查看历史归档</a>
</div>
{% endif %}

{% else %}
<div class="empty-state">
  <div class="empty-icon">📭</div>
  <h3>暂无日报</h3>
  <p>日报将由GitHub Actions每日自动生成</p>
  <p>预计首次运行时间：明天08:00（北京时间）</p>
  
  <div class="quick-start">
    <h4>快速开始</h4>
    <ol>
      <li>将项目推送到GitHub仓库</li>
      <li>启用GitHub Actions</li>
      <li>等待每日自动更新</li>
    </ol>
    <a href="{{ '/QUICKSTART.md' | relative_url }}" class="btn">查看完整指南</a>
  </div>
</div>
{% endif %}

---

## 📡 情报来源

我们的情报系统每天监控以下类型的来源：

### 车企官方
- BMW、VW、Volvo、Renault等车企新闻室
- 官方技术博客和公告

### 行业媒体
- Electrek、InsideEVs、Green Car Reports
- 36氪、高工锂电、电动汽车观察家

### 技术与能源
- 充电基础设施新闻
- 电网与能源政策动态
- 学术研究进展

### 多语言覆盖
- 🇨🇳 中文源
- 🇺🇸 英文源  
- 🇩🇪 德文源
- 🇯🇵 日文源

---

## 🔔 订阅更新

- **RSS订阅**: [订阅Feed]({{ '/feed.xml' | relative_url }})
- **Telegram**: 即将推出
- **邮件简报**: 即将推出

---

<div class="footer">
  <p>更新频率: 每日08:00 (北京时间) | 数据保留: 永久归档</p>
  <p>自动化系统: GitHub Actions + Python</p>
</div>
