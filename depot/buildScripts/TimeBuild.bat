@echo off
if "%verbose%" == "true" echo on
setlocal

call "%~dp0CommonDirectoryVars.bat"

:: Common commands
set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat

call "%executionTimeCmd%" "%buildScriptsDir%/Build.bat"

echo.
echo.
echo Finished
echo ---------------------------------------------------------------------------------------------------
echo Total time: %executionTime%