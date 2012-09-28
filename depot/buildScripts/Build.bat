@echo off
setlocal

call "%~dp0CommonDirectoryVars.bat"

:: CMake Generator
set cmakeGenerator=Visual Studio 11
::set cmakeGenerator=NMake Makefiles

:: Common commands
set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat
set createDirIfMissingCmd=%buildScriptsDir%/CreateDirIfMissing.bat
set cmakeCmd=%externalDir%/cmake-2.8.8/bin/cmake.exe

:: Load the VC compiler variables.
set vcBin=C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin
call "%vcBin%/vcvars32.bat"

echo Running CMake
echo ---------------------------------------------------------------------------------------------------
call "%createDirIfMissingCmd%" "%buildDir%"
call cd "%buildDir%"
:: CMake args:
::  -Wdev enable developer warnings
call "%executionTimeCmd%" "%cmakeCmd%" -Wdev -G "%cmakeGenerator%" "%sourceDir%"
echo CMake time: %executionTime%

echo.
echo.
echo Building
echo ---------------------------------------------------------------------------------------------------
if "%cmakeGenerator%" == "NMake Makefiles" (
	call "%executionTimeCmd%" nmake /nologo
) else (
	if "%cmakeGenerator%" == "Visual Studio 11" (
		call "%executionTimeCmd%" MSBuild.exe /nologo Mario.sln
	)
)
echo Build time: %executionTime%

:End