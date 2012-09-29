@call "%~dp0Config.bat"
setlocal

call "%~dp0CommonDirectoryVars.bat"
call "%~dp0CommonCommands.bat"

echo Building
echo ---------------------------------------------------------------------------------------------------

cd "%buildDir%"

:: Load the VC compiler variables.
set vcBin=C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/bin
call "%vcBin%/vcvars32.bat"

:: Call the build program, depending on the generator.
if "%cmakeGenerator%" == "Visual Studio 11" (
	call "%executionTimeCmd%" MSBuild.exe /nologo %projectName%.sln
) else (
	if "%cmakeGenerator%" == "NMake Makefiles" (
		call "%executionTimeCmd%" NMake /nologo
	) else (
		echo Invalid CMake generator type "%cmakeGenerator%"
		exit /b 1
	)
)
echo Build time: %executionTime%

:End