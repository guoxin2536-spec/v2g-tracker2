#!/bin/bash
# V2G Tracker 自动部署脚本 (Linux/Mac)

set -e

echo "=========================================="
echo "   V2G Tracker 自动部署脚本"
echo "=========================================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}[错误] 未检测到Git，请先安装Git${NC}"
    echo "Mac: brew install git"
    echo "Linux: sudo apt-get install git"
    exit 1
fi

# 获取GitHub用户名
GITHUB_USERNAME=$1
REPO_NAME="v2g-tracker"

if [ -z "$GITHUB_USERNAME" ]; then
    echo -e "${RED}[错误] 请提供GitHub用户名${NC}"
    echo "用法: ./deploy.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

echo -e "${GREEN}[1/5] 正在配置GitHub仓库...${NC}"
echo "   用户名: $GITHUB_USERNAME"
echo "   仓库名: $REPO_NAME"
echo ""

# 初始化Git仓库
if [ ! -d .git ]; then
    git init
    git branch -m main
fi

echo -e "${GREEN}[2/5] 正在添加文件到Git...${NC}"
git add .

echo -e "${GREEN}[3/5] 正在提交代码...${NC}"
git commit -m "Initial V2G Tracker deployment - $(date)"

echo -e "${GREEN}[4/5] 正在连接GitHub远程仓库...${NC}"
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo -e "${GREEN}[5/5] 正在推送到GitHub...${NC}"
if git push -u origin main --force; then
    echo ""
    echo "=========================================="
    echo -e "${GREEN}   ✅ 部署成功！${NC}"
    echo "=========================================="
    echo ""
    echo "仓库地址: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "网站地址: https://$GITHUB_USERNAME.github.io/$REPO_NAME"
    echo ""
    echo "下一步操作："
    echo "   1. 访问GitHub仓库 Settings > Pages"
    echo "   2. Source 选择 Deploy from a branch"
    echo "   3. Branch 选择 main / (root)"
    echo "   4. 点击 Save"
    echo "   5. 等待2-3分钟后访问网站"
    echo ""
    echo -e "${YELLOW}自动化已启用：${NC}"
    echo "   - 每天早上8:00自动抓取情报"
    echo "   - 自动生成日报并部署"
    echo ""
else
    echo ""
    echo -e "${RED}[错误] 推送失败，请检查：${NC}"
    echo "   1. 是否已在GitHub创建仓库 $REPO_NAME"
    echo "   2. 是否有权限访问该仓库"
    echo "   3. 是否配置了GitHub凭据"
    echo ""
    echo "手动创建仓库步骤："
    echo "   1. 访问 https://github.com/new"
    echo "   2. 输入 Repository name: $REPO_NAME"
    echo "   3. 选择 Private（内部使用）"
    echo "   4. 不要勾选 Initialize this repository with a README"
    echo "   5. 点击 Create repository"
    echo "   6. 重新运行此脚本"
    exit 1
fi
