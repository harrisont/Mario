@call "%~dp0Config.bat"
setlocal

call "%~dp0CommonDirectoryVars.bat"
call "%~dp0CommonCommands.bat"

:: Is Visual Studio installed?
reg query HKLM\Software\Microsoft\DevDiv\vs\Servicing\11.0 >nul 2>&1
if "%errorlevel%" == "0" set visualStudio11Installed=true

:: Validate the CMake generator
if "%cmakeGenerator%" == "Visual Studio 11" (
	if not "%visualStudio11Installed%" == "true" (
		echo The CMake generator is set to "%cmakeGenerator%" in %~dp0Config.bat, but Visual Studio 11 is not installed.
		exit /b 1
	)
) else (
	if "%cmakeGenerator%" == "NMake Makefiles" (
		REM TODO(HTing): Actually check to see if NMake is installed, instead of just check for Visual Studio.
		if not "%visualStudio11Installed%" == "true" (
			echo The CMake generator is set to "%cmakeGenerator%" in %~dp0Config.bat, but NMake is not installed.
			exit /b 1
		)
	) else (
		echo Invalid CMake generator type "%cmakeGenerator%"
		exit /b 1
	)
)

echo Running CMake
echo ---------------------------------------------------------------------------------------------------
call "%createDirIfMissingCmd%" "%buildDir%"
cd "%buildDir%"
:: CMake args:
::  -Wdev enable developer warnings
call "%executionTimeCmd%" "%cmakeCmd%" -Wdev -G "%cmakeGenerator%" "%sourceDir%"
echo CMake time: %executionTime%