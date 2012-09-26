@echo off
setlocal

call "%~dp0CommonDirectoryVars.bat"

:: Common commands
set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat
set createDirIfMissingCmd=%buildScriptsDir%/CreateDirIfMissing.bat

:: Load the VC compiler variables.
set vcBin=C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin
call "%vcBin%/vcvars32.bat"

echo Running CMake
echo ---------------------------------------------------------------------------------------------------
set cmakeCmd=%externalDir%/cmake-2.8.8/bin/cmake.exe
call "%createDirIfMissingCmd%" "%buildDir%"
call cd "%buildDir%"
call "%executionTimeCmd%" "%cmakeCmd%" "%sourceDir%"
echo CMake time: %executionTime%

echo.
echo.
echo Building
echo ---------------------------------------------------------------------------------------------------
call "%executionTimeCmd%" nmake /NOLOGO
echo Build time: %executionTime%
