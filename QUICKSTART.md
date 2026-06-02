# 🚀 V2G Tracker 快速启动指南

## 零成本部署您的V2G情报站

---

## ✅ 前置条件

- GitHub账号（免费注册）
- 约10分钟时间
- 可选：自定义域名（约￥60/年）

---

## 📦 步骤1: Fork项目（2分钟）

### 方法A: 直接Fork（推荐）
1. 访问 https://github.com/yourusername/v2g-tracker
2. 点击右上角 **Fork** 按钮
3. 等待Fork完成

### 方法B: 本地创建后推送
```bash
# 创建新仓库
git init v2g-tracker
cd v2g-tracker

# 复制本项目文件
# ...复制所有文件...

# 推送到GitHub
git add .
git commit -m "Initial V2G tracker"
git remote add origin https://github.com/YOUR_USERNAME/v2g-tracker.git
git push -u origin main
```

---

## ⚙️ 步骤2: 启用GitHub Pages（2分钟）

1. 进入您的仓库 Settings
2. 左侧菜单选择 **Pages**
3. **Source** 选择 "Deploy from a branch"
4. **Branch** 选择 "main" / "/ (root)"
5. 点击 **Save**
6. 等待2-3分钟，访问 `https://yourusername.github.io/v2g-tracker`

---

## 🤖 步骤3: 配置自动化（3分钟）

### 启用GitHub Actions
1. 进入仓库的 **Actions** 标签
2. 点击 "I understand my workflows, go ahead and enable them"
3. 确认 `daily-update.yml` 工作流已启用

### 测试运行
1. 进入 **Actions** → **Daily V2G Intelligence Update**
2. 点击 **Run workflow** → **Run workflow**
3. 等待3-5分钟完成
4. 检查是否生成 `_posts/YYYY-MM-DD-daily-report.md`

---

## 📊 步骤4: 验证部署（2分钟）

### 检查清单
- [ ] 网站可访问: `https://yourusername.github.io/v2g-tracker`
- [ ] 首页显示正常
- [ ] 车企追踪表格加载
- [ ] 日报已生成（首次运行后）

### 每日自动化验证
每天早上8:00（北京时间）自动检查：
1. 查看Actions运行状态
2. 检查新提交的日报
3. 确认网站已更新

---

## 🔧 步骤5: 自定义配置（可选）

### 修改站点基本信息
编辑 `_config.yml`:
```yaml
title: "您的V2G情报站名称"
description: "自定义描述"
url: "https://yourdomain.com"  # 如果使用自定义域名
```

### 添加/删除RSS源
编辑 `_data/rss_sources.yml`:
```yaml
sources:
  - name: "您的新闻源"
    url: "https://example.com/feed"
    lang: "zh"
    category: ["OEM"]
    priority: 1
```

### 更新车企数据
编辑 `_data/companies.yml`:
添加或修改车企追踪信息

---

## 📱 步骤6: 设置通知（可选）

### Telegram Bot通知
1. 创建Telegram Bot (@BotFather)
2. 获取Chat ID
3. 在GitHub仓库设置 Secrets:
   - `TELEGRAM_BOT_TOKEN`
   - `TELEGRAM_CHAT_ID`
4. 修改 `.github/workflows/daily-update.yml` 添加通知步骤

### 邮件通知
1. 注册Resend.com（免费3000封/天）
2. 添加API Key到GitHub Secrets
3. 配置收件人列表

---

## 🎨 步骤7: 自定义主题（可选）

### 修改样式
编辑 `assets/css/style.scss`:
```scss
---
---
@import "{{ site.theme }}";

// 自定义样式
body {
  font-family: "您的字体", sans-serif;
}

.stat-card {
  background: #您的颜色;
}
```

### 添加Logo
1. 上传logo到 `assets/images/logo.png`
2. 修改 `_config.yml`:
```yaml
logo: /assets/images/logo.png
```

---

## 🔒 步骤8: 设为私有（内部使用）

1. 进入仓库 **Settings**
2. 底部 **Danger Zone** → **Change visibility**
3. 选择 **Make private**
4. 确认并输入仓库名

⚠️ **注意**: 设为私有后，GitHub Pages仍可免费使用，但功能受限

---

## 📝 日常使用流程

### 查看情报（每天）
1. 访问网站首页
2. 阅读今日概览
3. 查看详细日报
4. 检查车企追踪矩阵

### 手动更新（按需）
```bash
# 本地编辑
git pull
# 编辑文件
git add .
git commit -m "更新内容"
git push

# 网站自动更新（约2分钟）
```

### 添加重要情报（手动）
```bash
# 创建新文章
cat > _posts/$(date +%Y-%m-%d)-special-report.md << 'EOF'
---
layout: post
title: "特别报道：标题"
date: $(date +%Y-%m-%d)
categories: special-report
tags: [BMW, V2G, 量产]
---

## 内容

您的特别报道内容...
EOF

git add _posts/
git commit -m "添加特别报道"
git push
```

---

## 🐛 故障排除

### 问题1: Actions运行失败
**症状**: 红色叉号
**解决**:
```bash
# 检查日志
# Actions → Daily V2G Intelligence Update → 失败的运行

# 常见原因
1. RSS源URL失效 → 更新 _data/rss_sources.yml
2. Python依赖问题 → 检查 requirements.txt
3. 权限问题 → 检查 GITHUB_TOKEN 权限
```

### 问题2: 网站不更新
**症状**: 内容没有变化
**解决**:
1. 检查 `_site` 分支是否有新提交
2. 检查GitHub Pages设置
3. 清除浏览器缓存（Ctrl+F5）
4. 等待5-10分钟（CDN缓存）

### 问题3: 中文显示乱码
**症状**: 中文变问号
**解决**:
1. 确保所有文件使用UTF-8编码
2. 在 `_config.yml` 添加:
```yaml
encoding: utf-8
```

---

## 📊 预期效果

部署完成后，您将获得：

✅ **每日自动更新** - 早上8点自动抓取65+情报源  
✅ **多语言支持** - 中英德日四语言情报  
✅ **分类整理** - 车企/技术/充电/能源/政策/市场  
✅ **数据可视化** - 趋势图表、热力图  
✅ **历史归档** - 所有情报永久保存  
✅ **搜索功能** - 全文检索历史情报  
✅ **免费托管** - GitHub Pages零成本  

---

## 🎯 下一步优化

### 第1周：基础优化
- [ ] 完善RSS源列表
- [ ] 调整关键词过滤
- [ ] 优化分类算法

### 第2周：功能增强
- [ ] 添加数据可视化图表
- [ ] 设置Telegram推送
- [ ] 添加邮件订阅

### 第3周：高级功能
- [ ] AI摘要生成（OpenAI API）
- [ ] 竞品对比分析
- [ ] 市场预测模型

---

## 📞 获取帮助

- 📧 问题反馈: 提交GitHub Issue
- 📖 文档: https://github.com/yourusername/v2g-tracker/wiki
- 💬 讨论: GitHub Discussions

---

**恭喜！您的V2G战略情报站已就绪！** 🎉

现在每天自动获取全球V2G行业情报，为战略决策提供数据支持。
