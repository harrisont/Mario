@echo off
setlocal

:: Generate
set errorlevel=
call depot/BuildScripts/Generate.bat
if %errorlevel% NEQ 0 exit /b %errorlevel%

echo.
echo.

:: Build
call depot/BuildScripts/Build.bat

:End