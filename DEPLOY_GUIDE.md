# 🚀 V2G Tracker 部署指南

## 快速部署步骤（5分钟完成）

### 步骤 1: 创建GitHub仓库

1. 访问 https://github.com/new
2. 仓库名称: `v2g-tracker`
3. 选择 **Public**（免费使用GitHub Pages）
4. 勾选 **Add a README file**
5. 点击 **Create repository**

### 步骤 2: 上传项目文件

#### 方法A: 使用GitHub网页上传
1. 在你的仓库页面，点击 **Add file** → **Upload files**
2. 拖拽整个 `v2g-tracker` 文件夹中的所有文件
3. 提交信息填写: `Initial commit`
4. 点击 **Commit changes**

#### 方法B: 使用Git命令行
```bash
# 进入项目目录
cd v2g-tracker

# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial V2G Tracker website"

# 连接到你的GitHub仓库（替换YOUR_USERNAME）
git remote add origin https://github.com/YOUR_USERNAME/v2g-tracker.git

# 推送
git push -u origin main
```

### 步骤 3: 启用GitHub Pages

1. 进入仓库的 **Settings** 标签
2. 左侧菜单选择 **Pages**
3. **Source** 选择: **Deploy from a branch**
4. **Branch**: 选择 `main` / `/(root)`
5. 点击 **Save**
6. 等待2-3分钟

### 步骤 4: 启用GitHub Actions（自动日报）

1. 进入仓库的 **Actions** 标签
2. 点击 **I understand my workflows, go ahead and enable them**
3. 确认看到 `Daily V2G Intelligence Update` 工作流

### 步骤 5: 验证网站

- 网站地址: `https://YOUR_USERNAME.github.io/v2g-tracker`
- 访问查看是否正常显示

---

## ⏰ 自动化设置

### 日报自动生成时间
- **北京时间**: 每天上午 08:00
- **UTC时间**: 每天 00:00

### 首次运行
- 明天08:00会自动抓取第一条日报
- 或者手动触发：Actions → Daily V2G Intelligence Update → Run workflow

---

## 🔧 可选配置

### 自定义域名（可选）
1. 购买域名（如：v2gtracker.com）
2. 在仓库根目录创建 `CNAME` 文件，内容为: `v2gtracker.com`
3. 在域名DNS设置中添加CNAME记录指向 `YOUR_USERNAME.github.io`
4. 在GitHub Pages设置中启用 **Enforce HTTPS**

### 修改站点信息
编辑 `_config.yml`:
```yaml
title: "你的V2G情报站名称"
description: "自定义描述"
url: "https://yourdomain.com"  # 如果使用自定义域名
```

### 添加自己的RSS源
编辑 `_data/rss_sources.yml`，添加新的情报源

---

## 📋 部署检查清单

- [ ] GitHub仓库已创建
- [ ] 所有文件已上传
- [ ] GitHub Pages已启用
- [ ] GitHub Actions已启用
- [ ] 网站可以正常访问
- [ ] 首页显示正常
- [ ] 导航链接工作正常
- [ ] （可选）自定义域名配置完成

---

## 🆘 故障排除

### 问题1: 网站显示404
**解决**: 等待5-10分钟，GitHub Pages需要时间来部署

### 问题2: 样式没有加载
**解决**: 
1. 检查 `_config.yml` 中的 `baseurl` 设置
2. 如果使用自定义域名，设置 `baseurl: ""`

### 问题3: Actions运行失败
**解决**:
1. 检查 `requirements.txt` 文件是否存在
2. 确认RSS源URL是否可访问
3. 查看Actions日志获取详细错误信息

---

## 📞 获取帮助

- GitHub Pages文档: https://pages.github.com/
- Jekyll文档: https://jekyllrb.com/docs/
- 项目Issue: https://github.com/YOUR_USERNAME/v2g-tracker/issues

---

**完成部署后，明天08:00（北京时间）系统将自动抓取第一条V2G情报日报！** 🎉
