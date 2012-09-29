:: Sets common commands.

@call "%~dp0Config.bat"

:: Don't use setlocal because we want to export these variables

call "%~dp0CommonDirectoryVars.bat"

set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat
set createDirIfMissingCmd=%buildScriptsDir%/CreateDirIfMissing.bat
set cmakeCmd=%externalDir%/cmake-2.8.8/bin/cmake.exe
