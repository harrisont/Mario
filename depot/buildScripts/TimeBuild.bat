@echo off
setlocal

call "%~dp0CommonDirectoryVars.bat"

:: Common commands
set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat

::echo Generating Makefiles and Building
::echo ---------------------------------------------------------------------------------------------------

call "%executionTimeCmd%" "%buildScriptsDir%/Build.bat"

echo.
echo.
echo Finished
echo ---------------------------------------------------------------------------------------------------
echo Total time: %executionTime%