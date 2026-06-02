# V2G Tracker - 战略情报站

V2G（Vehicle-to-Grid）行业每日情报追踪系统

## 🎯 项目定位
- **用途**: 内部战略决策支持
- **更新频率**: 每日自动汇总
- **语言**: 中英德日多语言
- **成本**: ¥0（完全免费）

## 📁 项目结构
```
v2g-tracker/
├── _config.yml          # Jekyll配置
├── _layouts/            # 页面模板
├── _includes/           # 组件
├── _data/              # 数据文件
├── assets/             # 静态资源
├── scripts/            # 自动化脚本
└── docs/               # 生成的情报文档
```

## 🔄 自动化流程
1. **每日 08:00 UTC**: 抓取RSS源（中英德日）
2. **每日 09:00 UTC**: AI分类+翻译+摘要
3. **每日 10:00 UTC**: 生成日报+部署网站

## 📊 核心看板
- 车企V2G路线图追踪
- 电池技术进展
- 充电基础设施地图
- 政策时间轴
- 市场规模趋势

## 🚀 快速开始
```bash
# 本地预览
bundle install
bundle exec jekyll serve

# 访问 http://localhost:4000
```

---
*最后更新: 2025-01*
