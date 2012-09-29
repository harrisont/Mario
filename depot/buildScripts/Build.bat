@call "%~dp0Config.bat"
setlocal

call "%~dp0Config.bat"
call "%~dp0CommonDirectoryVars.bat"

:: Common commands
set executionTimeCmd=%buildScriptsDir%/ExecutionTime.bat
set createDirIfMissingCmd=%buildScriptsDir%/CreateDirIfMissing.bat
set cmakeCmd=%externalDir%/cmake-2.8.8/bin/cmake.exe

:: Is Visual Studio installed?
reg query HKLM\Software\Microsoft\DevDiv\vs\Servicing\11.0 >nul 2>&1
if "%errorlevel%" == "0" set visualStudio11Installed=true

:: Validate the CMake generator
if "%cmakeGenerator%" == "Visual Studio 11" (
	if not "%visualStudio11Installed%" == "true" (
		echo The CMake generator is set to "%cmakeGenerator%" in %~dp0Config.bat, but Visual Studio 11 is not installed.
		goto End
	)
) else (
	if "%cmakeGenerator%" == "NMake Makefiles" (
		REM TODO(HTing): Check to see if NMake is installed.
	) else (
		echo Invalid CMake generator type "%cmakeGenerator%"
		goto End
	)
)

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
if "%cmakeGenerator%" == "Visual Studio 11" (
	call "%executionTimeCmd%" MSBuild.exe /nologo Mario.sln
) else (
	if "%cmakeGenerator%" == "NMake Makefiles" (
		call "%executionTimeCmd%" nmake /nologo
	) else (
		echo Invalid CMake generator type "%cmakeGenerator%"
		goto End
	)
)
echo Build time: %executionTime%

:End