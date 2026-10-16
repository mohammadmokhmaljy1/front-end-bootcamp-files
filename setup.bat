@echo off
setlocal
cd /d "%~dp0"
echo.
echo === DEVMMND Frontend Bootcamp - setup ===
echo.
echo [1/2] Applying folder icons...
powershell -NoProfile -ExecutionPolicy Bypass -File "_tools\apply-icons.ps1"
echo.
echo [2/2] Enabling automatic icon refresh after "git pull"...
git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 goto nogit
git config core.hooksPath .githooks
echo Done. Icons will be re-applied automatically after every git pull.
goto end
:nogit
echo Git repository not detected - icons were applied, but auto refresh is off.
:end
echo.
pause
