@call "%~dp0Config.bat"
setlocal

if not exist %* (
    mkdir %*
)