@call "%~dp0Config.bat"
setlocal

if exist %* (
	rmdir /S /Q %*
)