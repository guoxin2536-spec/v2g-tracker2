@echo off
chcp 65001 >nul
echo ======================================
echo   V2G Tracker - Git 安装助手
echo ======================================
echo.

REM 检查是否已安装Git
echo [1/3] 检查Git是否已安装...
git --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ Git 已安装！
    git --version
    echo.
    echo 正在跳转到部署步骤...
    timeout /t 2 >nul
    call "2-DEPLOY.bat"
    exit /b
)

echo ❌ Git 未安装
echo.

REM 下载Git
echo [2/3] 准备下载Git...
echo Git for Windows 官方下载地址：
echo https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe
echo.

set /p choice="是否现在下载Git? (Y/N): "
if /I "%choice%"=="Y" (
    echo 正在打开下载页面...
    start https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe
    echo.
    echo ======================================
    echo 请完成以下步骤：
    echo ======================================
    echo 1. 等待下载完成
    echo 2. 运行下载的 Git-2.43.0-64-bit.exe
    echo 3. 按照安装向导安装（保持默认选项即可）
    echo 4. 安装完成后，关闭并重新打开命令行
    echo 5. 再次运行 2-DEPLOY.bat
    echo.
    echo 安装完成后，请按任意键退出...
    pause >nul
) else (
    echo 跳过Git安装
    echo 你可以使用手动部署方式（见 MANUAL-DEPLOY.md）
    echo.
    pause
)
