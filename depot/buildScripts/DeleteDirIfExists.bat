@echo off
setlocal

if exist %* (
	rmdir /S /Q %*
)