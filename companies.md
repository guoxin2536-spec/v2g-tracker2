---
layout: default
title: 车企V2G追踪矩阵
---

# 🚗 车企V2G追踪矩阵

全球主要车企V2G技术部署状态与路线图追踪

---

## 📊 概览统计

<div class="stats-grid">
  <div class="stat-card">
    <div class="stat-number">10</div>
    <div class="stat-label">监测车企</div>
  </div>
  <div class="stat-card highlight">
    <div class="stat-number">3</div>
    <div class="stat-label">量产车型</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">4</div>
    <div class="stat-label">试点项目</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">4</div>
    <div class="stat-label">观望中</div>
  </div>
</div>

---

## 🏭 车企追踪表

{% assign companies = site.data.companies.companies | sort: 'priority' %}

<table class="data-table sortable">
  <thead>
    <tr>
      <th>品牌</th>
      <th>状态</th>
      <th>代表车型</th>
      <th>技术路线</th>
      <th>电池供应商</th>
      <th>最新动态</th>
    </tr>
  </thead>
  <tbody>
    {% for company in companies %}
    <tr>
      <td><strong>{{ company.name }}</strong></td>
      <td>
        <span class="status-badge {{ company.status_color }}">
          {{ company.status }}
        </span>
      </td>
      <td>
        {% for model in company.models %}
        <div>{{ model.name }}</div>
        {% endfor %}
      </td>
      <td>
        {% for model in company.models limit:1 %}
        <div>{{ model.voltage }} | {{ model.v2g_support }}</div>
        {% endfor %}
      </td>
      <td>{{ company.battery_supplier }}</td>
      <td>{{ company.latest_update }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

---

## 🎯 重点车企详情

<div class="companies-grid">
{% for company in companies %}
  <div class="company-card">
    <div class="company-header">
      <h3>{{ company.name }}</h3>
      <span class="status-badge {{ company.status_color }}">{{ company.status }}</span>
    </div>
    
    <div class="company-region">{{ company.region }} | 优先级: {{ company.priority }}</div>
    
    <div class="company-models">
      {% for model in company.models %}
      <div class="model">
        <span class="model-name">{{ model.name }}</span>
        <span class="model-specs">{{ model.battery }} | {{ model.voltage }}</span>
      </div>
      {% endfor %}
    </div>
    
    <div class="tech-highlights">
      <strong>技术亮点：</strong>
      <ul>
        {% for highlight in company.tech_highlights %}
        <li>{{ highlight }}</li>
        {% endfor %}
      </ul>
    </div>
    
    <div class="company-update">
      <strong>最新动态：</strong>{{ company.latest_update }}
    </div>
  </div>
{% endfor %}
</div>

---

## 📈 技术路线分析

### 电压平台分布
{% assign tech_summary = site.data.companies.tech_summary %}

- **800V架构**: {{ tech_summary.voltage_800v }} 家车企
- **400V架构**: {{ tech_summary.voltage_400v }} 家车企

### 电池供应商分布

- **CATL**: {{ tech_summary.battery_catl }} 家
- **LG Energy**: {{ tech_summary.battery_lg }} 家
- **SK On**: {{ tech_summary.battery_sk }} 家
- **其他**: {{ tech_summary.battery_other }} 家

---

## 🔮 市场预测

{% assign forecast = site.data.companies.market_forecast %}

| 年份 | V2G车辆数量 | 市场规模 |
|------|------------|----------|
| 2024 | {{ forecast[2024].v2g_vehicles }} | {{ forecast[2024].market_size }} |
| 2025 | {{ forecast[2025].v2g_vehicles }} | {{ forecast[2025].market_size }} |
| 2030 | {{ forecast[2030].v2g_vehicles }} | {{ forecast[2030].market_size }} |

---

## 📝 更新日志

- **2025-01**: 新增Ford、Audi、Mercedes-Benz追踪
- **2024-12**: 更新Volvo EX90交付状态
- **2024-11**: 更新Tesla V2G推迟信息
- **2024-10**: 初始版本发布

---

<div class="footer">
  <p>数据来源: 车企官方公告、行业媒体、技术文档 | 更新频率: 每日</p>
  <p>最后更新: {{ "now" | date: "%Y-%m-%d" }}</p>
</div>
