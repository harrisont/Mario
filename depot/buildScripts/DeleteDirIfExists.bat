@echo off
if "%verbose%" == "true" echo on
setlocal

if exist %* (
	rmdir /S /Q %*
)