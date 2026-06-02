@echo off
chcp 65001 >nul
echo ==========================================
echo    V2G Tracker 自动部署脚本
echo ==========================================
echo.

REM 检查Git是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Git，请先安装Git
    echo 下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM 设置变量
set "GITHUB_USERNAME=%1"
set "REPO_NAME=v2g-tracker"

if "%GITHUB_USERNAME%"=="" (
    echo [错误] 请提供GitHub用户名
    echo 用法: deploy.bat YOUR_GITHUB_USERNAME
    pause
    exit /b 1
)

echo [1/5] 正在配置GitHub仓库...
echo    用户名: %GITHUB_USERNAME%
echo    仓库名: %REPO_NAME%
echo.

REM 初始化Git仓库
if not exist .git (
    git init
    git branch -m main
)

echo [2/5] 正在添加文件到Git...
git add .

echo [3/5] 正在提交代码...
git commit -m "Initial V2G Tracker deployment - %date% %time%"

echo [4/5] 正在连接GitHub远程仓库...
git remote remove origin 2>nul
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo [5/5] 正在推送到GitHub...
git push -u origin main --force

if errorlevel 1 (
    echo.
    echo [错误] 推送失败，请检查：
    echo    1. 是否已在GitHub创建仓库 %REPO_NAME%
    echo    2. 是否有权限访问该仓库
    echo    3. 是否配置了GitHub凭据
    echo.
    echo 手动创建仓库步骤：
    echo    1. 访问 https://github.com/new
    echo    2. 输入 Repository name: %REPO_NAME%
    echo    3. 选择 Private（内部使用）
    echo    4. 不要勾选 Initialize this repository with a README
    echo    5. 点击 Create repository
    echo    6. 重新运行此脚本
    pause
    exit /b 1
)

echo.
echo ==========================================
echo    ✅ 部署成功！
echo ==========================================
echo.
echo 仓库地址: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo 网站地址: https://%GITHUB_USERNAME%.github.io/%REPO_NAME%
echo.
echo 下一步操作：
echo    1. 访问GitHub仓库 Settings ^> Pages
echo    2. Source 选择 Deploy from a branch
echo    3. Branch 选择 main / (root)
echo    4. 点击 Save
echo    5. 等待2-3分钟后访问网站
echo.
echo 自动化已启用：
echo    - 每天早上8:00自动抓取情报
echo    - 自动生成日报并部署
echo.
pause
