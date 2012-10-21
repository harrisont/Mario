@call "%~dp0Config.bat"
setlocal

call "%~dp0CommonDirectoryVars.bat"

set deleteDirIfExistsCmd=%buildScriptsDir%/DeleteDirIfExists.bat

call "%deleteDirIfExistsCmd%" "%buildDir%"
call "%deleteDirIfExistsCmd%" "%targetDir%"
