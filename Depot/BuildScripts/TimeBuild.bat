@call "%~dp0Config.bat"
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