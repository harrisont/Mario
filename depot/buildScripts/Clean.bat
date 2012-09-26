@echo off
setlocal

call "%~dp0CommonDirectoryVars.bat"

set deleteDirIfExistsCmd=%buildScriptsDir%/DeleteDirIfExists.bat

call "%deleteDirIfExistsCmd%" "%buildDir%"
call "%deleteDirIfExistsCmd%" "%targetDir%"
