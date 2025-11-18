@echo off
echo ==========================================
echo Yaomi App - Upload to GitHub
echo ==========================================
echo.

REM Check if Git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed!
    echo.
    echo Please install Git from: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo [1/5] Initializing Git repository...
git init

echo.
echo [2/5] Adding all files...
git add .

echo.
echo [3/5] Creating first commit...
git commit -m "Initial commit - Yaomi Smart Kitchen Assistant"

echo.
echo ==========================================
echo IMPORTANT: Enter your GitHub repository URL
echo Example: https://github.com/YOUR_USERNAME/yaomi-app.git
echo ==========================================
echo.
set /p REPO_URL="Enter repository URL: "

if "%REPO_URL%"=="" (
    echo [ERROR] Repository URL is required!
    pause
    exit /b 1
)

echo.
echo [4/5] Adding remote origin...
git remote add origin %REPO_URL%

echo.
echo [5/5] Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ==========================================
echo SUCCESS! Project uploaded to GitHub
echo ==========================================
echo.
echo Now:
echo 1. Go to your GitHub repository
echo 2. Click on "Actions" tab
echo 3. Wait for APK build to complete (10-15 min)
echo 4. Download APK from "Artifacts" section
echo.
echo Full instructions in: GITHUB_APK_BUILD.md
echo.
pause
