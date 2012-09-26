@echo off
setlocal

call "%~dp0CommonDirectoryVars.bat"

call rmdir /S /Q "%buildDir%"