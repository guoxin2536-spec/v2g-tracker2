@echo off
chcp 65001 >nul
echo ======================================
echo   V2G Tracker - 自动部署脚本
echo ======================================
echo.

REM 检查Git
echo [1/5] 检查Git安装...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git 未安装！请先运行 1-INSTALL-GIT.bat
    pause
    exit /b 1
)
echo ✅ Git 已安装
git --version
echo.

REM 获取GitHub用户名
echo [2/5] 配置GitHub信息
set /p username="请输入你的GitHub用户名: "
if "%username%"=="" (
    echo ❌ 用户名不能为空！
    pause
    exit /b 1
)

set /p email="请输入你的GitHub邮箱: "
if "%email%"=="" (
    echo ❌ 邮箱不能为空！
    pause
    exit /b 1
)

REM 配置Git
git config --global user.name "%username%"
git config --global user.email "%email%"
echo ✅ Git配置完成
echo.

REM 检查仓库是否存在
echo [3/5] 检查GitHub仓库...
echo 正在检查 https://github.com/%username%/v2g-tracker ...

REM 使用curl检查（如果可用）
curl -s -o nul -w "%%{http_code}" https://github.com/%username%/v2g-tracker > temp_http_code.txt 2>nul
set /p http_code=<temp_http_code.txt
del temp_http_code.txt 2>nul

if "%http_code%"=="404" (
    echo ⚠️  仓库不存在，请先创建！
    echo.
    echo 创建步骤：
    echo 1. 访问 https://github.com/new
    echo 2. Repository name: v2g-tracker
    echo 3. 选择 Public
    echo 4. 点击 Create repository
    echo.
    echo 创建完成后，按任意键继续...
    pause >nul
) else (
    echo ✅ 仓库已存在
)

REM 初始化Git仓库
echo [4/5] 初始化本地仓库...
if exist ".git" (
    echo 已存在Git仓库，跳过初始化
) else (
    git init
    echo ✅ 本地仓库初始化完成
)

REM 添加文件
echo.
echo [5/5] 提交并推送代码...
git add .

REM 提交
git commit -m "Initial V2G Tracker website - %date% %time%"
if %errorlevel% neq 0 (
    echo ⚠️  提交失败，可能没有变更或已提交过
)

REM 设置远程仓库
git remote remove origin 2>nul
git remote add origin https://github.com/%username%/v2g-tracker.git

REM 推送
echo 正在推送到GitHub...
git push -u origin main 2>nul || git push -u origin master 2>nul || (
    echo.
    echo ⚠️  推送失败，可能原因：
    echo 1. 仓库不存在 - 请先创建仓库
    echo 2. 网络问题 - 请检查网络连接
    echo 3. 认证问题 - 可能需要输入GitHub凭据
    echo.
    echo 手动推送命令：
    echo git push -u origin main
    echo.
    pause
    exit /b 1
)

echo.
echo ======================================
echo   🎉 部署完成！
echo ======================================
echo.
echo 下一步：
echo 1. 访问: https://github.com/%username%/v2g-tracker/settings/pages
   
echo 2. 在 Source 下选择 "Deploy from a branch"
echo 3. Branch 选择 "main" 或 "master"
echo 4. 点击 Save
echo 5. 等待2-3分钟
echo.
echo 网站地址：https://%username%.github.io/v2g-tracker
echo.
echo 启用Actions自动化：
echo 1. 访问: https://github.com/%username%/v2g-tracker/actions
echo 2. 点击 "I understand my workflows..."
echo 3. 完成！明天08:00将自动生成第一份日报
echo.
pause
