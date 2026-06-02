# 📦 手动部署指南（无需Git命令行）

如果你没有Git命令行或者不想使用Git，可以通过GitHub网页直接部署。

## 🚀 快速部署（5分钟）

### 步骤 1: 创建GitHub账号
1. 访问 https://github.com
2. 点击 **Sign up**
3. 填写用户名、邮箱、密码
4. 完成验证和邮箱确认

### 步骤 2: 创建仓库
1. 登录GitHub
2. 点击右上角 **+** 号 → **New repository**
3. 填写信息：
   - **Repository name**: `v2g-tracker`
   - **Description**: `V2G战略情报站 - Vehicle-to-Grid行业每日情报追踪`
   - 选择 **Public**（免费使用GitHub Pages）
   - ✅ 勾选 **Add a README file**
4. 点击 **Create repository**

### 步骤 3: 上传项目文件

#### 方法一：拖拽上传（推荐）
1. 在你的仓库页面，点击 **Add file** → **Upload files**
2. 打开文件夹：`v2g-tracker`
3. 选择所有文件和文件夹（Ctrl+A）
4. 拖拽到GitHub网页的上传区域
5. 等待上传完成
6. Commit message 填写：`Initial commit`
7. 点击 **Commit changes**

#### 方法二：逐个上传
如果文件太多，可以分批上传：
1. 先上传所有文件（不包括文件夹）
2. 然后逐个创建文件夹并上传其中的文件

**注意**：不要上传以下文件/文件夹
- `scripts/` - Python脚本（GitHub Actions会自动运行）
- `node_modules/` - 依赖文件夹
- `.git/` - Git历史（如果有）

### 步骤 4: 启用GitHub Pages
1. 在你的仓库页面，点击 **Settings** 标签
2. 左侧菜单选择 **Pages**
3. **Source** 选择：**Deploy from a branch**
4. **Branch**：
   - 选择 `main` 或 `master`
   - 选择 `/(root)`
5. 点击 **Save**
6. 等待2-3分钟（系统会自动构建网站）

### 步骤 5: 验证网站
1. 刷新页面
2. 你会看到提示：**Your site is published at https://yourusername.github.io/v2g-tracker**
3. 点击链接访问网站
4. 如果看到404，再等2分钟重试

### 步骤 6: 启用自动化日报
1. 在你的仓库页面，点击 **Actions** 标签
2. 点击绿色按钮：**I understand my workflows, go ahead and enable them**
3. 你应该能看到：**Daily V2G Intelligence Update** 工作流

✅ **完成！** 明天北京时间08:00，系统会自动抓取第一份V2G情报日报！

---

## 📋 部署后检查清单

- [ ] GitHub仓库已创建（名为 v2g-tracker）
- [ ] 所有文件已上传到仓库
- [ ] GitHub Pages已启用（Settings → Pages）
- [ ] 网站可以访问（https://yourusername.github.io/v2g-tracker）
- [ ] GitHub Actions已启用（Actions 标签页）
- [ ] 首页显示正常
- [ ] 导航链接可以正常跳转

---

## 🔧 常见问题

### Q1: 网站显示404怎么办？
**A**: 
- 等待5-10分钟，GitHub Pages需要时间部署
- 检查Settings → Pages中的设置是否正确
- 确保仓库是Public（Private仓库Pages功能受限）

### Q2: 样式没有加载？
**A**:
- 检查 `_config.yml` 中的 `baseurl` 设置
- 如果使用自定义域名，改为 `baseurl: ""`
- 如果使用默认域名，保持 `baseurl: "/v2g-tracker"`

### Q3: 如何修改网站标题？
**A**:
- 在GitHub上编辑 `_config.yml` 文件
- 修改 `title` 和 `description`
- 提交更改，网站会自动更新

### Q4: 日报没有自动生成？
**A**:
- 确认Actions已启用
- 查看Actions标签页是否有运行记录
- 第一次运行可能需要手动触发：Actions → Daily V2G Intelligence Update → Run workflow

### Q5: 如何添加自己的RSS源？
**A**:
- 编辑 `_data/rss_sources.yml` 文件
- 按照已有格式添加新的RSS源
- 提交更改即可

---

## 🎨 自定义网站

### 修改站点信息
编辑 `_config.yml`:
```yaml
title: "你的V2G情报站"
description: "自定义描述"
```

### 修改颜色主题
编辑 `assets/css/style.scss`:
```scss
:root {
  --primary-color: #你的颜色;
}
```

### 添加Logo
1. 上传logo图片到 `assets/images/`
2. 编辑 `_config.yml` 添加：`logo: /assets/images/logo.png`

---

## 📞 获取帮助

- GitHub Pages文档：https://pages.github.com/
- Jekyll文档：https://jekyllrb.com/docs/
- 项目问题反馈：在你的仓库页面点击 Issues 标签

---

## ✅ 完成！

现在你已经拥有了一个功能完整的V2G战略情报站网站，它会：
- 🔄 每天自动抓取65+ RSS情报源
- 📰 自动生成Markdown日报
- 📊 展示数据可视化和趋势分析
- 🚗 追踪10家重点车企V2G进展
- 📜 汇总全球V2G政策法规

**明天08:00（北京时间），等待第一份自动生成的情报日报吧！** 🎉
