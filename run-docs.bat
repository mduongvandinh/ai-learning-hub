@echo off
echo.
echo ================================================================
echo          AI Learning Hub 2025 - Documentation Server
echo          Microsoft - Google - Amazon AI Roadmaps
echo ================================================================
echo.
echo Starting server on port 3003...
echo.
echo URL: http://localhost:3003
echo.
echo Press Ctrl+C to stop server
echo.
echo ----------------------------------------------------------------
echo.

cd /d "%~dp0"

where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Using Python HTTP Server...
    echo.
    timeout /t 2 /nobreak >nul
    start http://localhost:3003
    python -m http.server 3003
    goto :end
)

where python3 >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Using Python3 HTTP Server...
    echo.
    timeout /t 2 /nobreak >nul
    start http://localhost:3003
    python3 -m http.server 3003
    goto :end
)

where npx >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Using Docsify CLI...
    echo.
    timeout /t 2 /nobreak >nul
    start http://localhost:3003
    npx docsify-cli serve . -p 3003
    goto :end
)

where http-server >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Using Node HTTP Server...
    echo.
    timeout /t 2 /nobreak >nul
    start http://localhost:3003
    http-server -p 3003
    goto :end
)

echo.
echo ERROR: Python or Node.js not found!
echo.
echo Please install one of these:
echo.
echo    1. Python: https://python.org
echo       (Recommended - simplest)
echo.
echo    2. Node.js: https://nodejs.org
echo       Then run: npm install -g docsify-cli
echo.
echo ----------------------------------------------------------------
echo.
pause
goto :end

:end
