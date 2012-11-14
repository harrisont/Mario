@echo off
setlocal

:: Generate
set errorlevel=
call "Depot/External/Python/Python-3.3.0/python.exe" Depot/BuildScripts/Generate.py
if %errorlevel% NEQ 0 exit /b %errorlevel%

echo.
echo.

:: Build
call Depot/BuildScripts/Build.bat

:End