@echo off
setlocal enabledelayedexpansion

:: ������Ϣ���޸��������
set "GITHUB_USER=hrb802"
set "REPO_NAME=images"

color 0A
echo GitHubͼ���ϴ�����
echo -------------------
:start
set /p "file=��קͼƬ�������ں󰴻س�: "

:: ��ȡ�ļ��������Ƶ��ֿ�
for %%A in ("%file%") do (
    set "filename=%%~nxA"
    copy "%%~A" .\ >nul
)

:: �ϴ���GitHub
git add "!filename!"
git commit -m "Add !filename!" --quiet
git push origin main --quiet

:: ��������
echo.
echo CDN����: https://cdn.jsdelivr.net/gh/%GITHUB_USER%/%REPO_NAME%@main/!filename!
echo ԭʼ����: https://raw.githubusercontent.com/%GITHUB_USER%/%REPO_NAME%/main/!filename!
echo | set /p=![image](https://cdn.jsdelivr.net/gh/%GITHUB_USER%/%REPO_NAME%@main/!filename!) | clip
echo.
echo �Ѹ���Markdown���뵽�����壡
timeout /t 5
goto start