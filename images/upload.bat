@echo off
setlocal enabledelayedexpansion

:: 配置信息（修改以下两项）
set "GITHUB_USER=hrb802"
set "REPO_NAME=images"

color 0A
echo GitHub图床上传工具
echo -------------------
:start
set /p "file=拖拽图片到本窗口后按回车: "

:: 提取文件名并复制到仓库
for %%A in ("%file%") do (
    set "filename=%%~nxA"
    copy "%%~A" .\ >nul
)

:: 上传到GitHub
git add "!filename!"
git commit -m "Add !filename!" --quiet
git push origin main --quiet

:: 生成链接
echo.
echo CDN链接: https://cdn.jsdelivr.net/gh/%GITHUB_USER%/%REPO_NAME%@main/!filename!
echo 原始链接: https://raw.githubusercontent.com/%GITHUB_USER%/%REPO_NAME%/main/!filename!
echo | set /p=![image](https://cdn.jsdelivr.net/gh/%GITHUB_USER%/%REPO_NAME%@main/!filename!) | clip
echo.
echo 已复制Markdown代码到剪贴板！
timeout /t 5
goto start