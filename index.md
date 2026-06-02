---
layout: default
title: V2G战略情报站
---

# 🔋 V2G战略情报站

**Vehicle-to-Grid 行业每日情报追踪与分析系统**

---

## 📊 今日概览 ({{ "now" | date: "%Y-%m-%d" }})

<div class="stats-grid">
  <div class="stat-card">
    <div class="stat-number">{{ site.data.daily.last.news_count | default: "8" }}</div>
    <div class="stat-label">今日新闻</div>
  </div>
  <div class="stat-card highlight">
    <div class="stat-number">{{ site.data.daily.last.oem_updates | default: "2" }}</div>
    <div class="stat-label">车企动态</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">{{ site.data.daily.last.tech_breakthroughs | default: "1" }}</div>
    <div class="stat-label">技术突破</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">{{ site.data.daily.last.policy_changes | default: "0" }}</div>
    <div class="stat-label">政策更新</div>
  </div>
</div>

---

## 🚗 车企V2G追踪矩阵

| 品牌 | 状态 | 代表车型 | 技术路线 | 供应商 | 最新动态 |
|------|------|----------|----------|--------|----------|
| **BMW** | 🟢 量产 | iX3 NA5 | 800V + V2H/V2G/V2L | EVE Energy | 欧洲上市 |
| **Volvo** | 🟢 量产 | EX90 | 双向充电 400V | CATL | 全球交付中 |
| **VW** | 🟡 试点 | ID.系列 | 准备阶段 | CATL/LG/SDI | 软件升级中 |
| **Renault** | 🟡 试点 | Megane/R5 | V2L先行 | LG Chem | 2025年计划 |
| **Hyundai** | 🟡 试点 | Ioniq 5/9 | V2L 3.6kW | SK On | 功能已部署 |
| **Tesla** | 🔴 延迟 | - | 推迟计划 | 自研 | 无明确时间表 |
| **Ford** | 🔴 观望 | Explorer EV | 硬件就绪 | CATL | 等待生态成熟 |

[查看完整车企追踪 →](./companies)

---

## 📈 关键趋势

### 本周热点
- **宝马iX3 NA5**: 首款量产800V V2G车型欧洲交付
- **沃尔沃EX90**: 双向充电功能正式启用
- **欧盟新规**: 2026年起新车型需具备V2G准备能力

### 市场规模预测
```
2024: 12亿美元
2025: 18亿美元 (+50%)
2026: 28亿美元 (+56%)
2027: 45亿美元 (+61%)
2030: 150亿美元 (+233% CAGR)
```

---

## 📰 最新情报

{% for post in site.posts limit:5 %}
### [{{ post.title }}]({{ post.url }})
**{{ post.date | date: "%Y-%m-%d" }}** | {{ post.category }} | {{ post.tags | join: ", " }}

{{ post.excerpt }}

{% endfor %}

[查看完整日报 →](./daily)

---

## 🗺️ 全球V2G部署地图

<div class="map-container">
  <iframe src="./assets/world-map.html" width="100%" height="400" frameborder="0"></iframe>
</div>

---

## 📊 数据看板

- [市场规模趋势](./dataviz/market-size)
- [技术成熟度曲线](./dataviz/tech-readiness)
- [政策时间轴](./dataviz/policy-timeline)
- [投资流向图](./dataviz/investment-flow)

---

## 🔍 快速导航

| 分类 | 链接 | 说明 |
|------|------|------|
| **每日情报** | [日报列表](./daily) | 每日自动汇总 |
| **车企追踪** | [车企矩阵](./companies) | 22家重点监测 |
| **技术进展** | [技术库](./tech) | 电池/充电/软件 |
| **政策标准** | [政策追踪](./policy) | 各国法规进展 |
| **市场数据** | [数据可视化](./dataviz) | 图表分析 |

---

## 📮 订阅更新

- **Telegram**: [加入频道](https://t.me/v2gtracker)
- **邮件简报**: [每日/每周](mailto:subscribe@v2gtracker.local)
- **RSS订阅**: [Feed](./feed.xml)

---

<div class="footer">
  <p>最后更新: {{ "now" | date: "%Y-%m-%d %H:%M" }} UTC</p>
  <p>数据来源: RSS聚合 | 更新频率: 每日08:00 UTC</p>
  <p><a href="https://github.com/yourusername/v2g-tracker">查看源码</a></p>
</div>
