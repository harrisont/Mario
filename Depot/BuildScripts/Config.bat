@echo off
:: Set the verbosity {true, false}
if "%verboseBuildScript%" == "true" echo on

:: Don't use setlocal because we want to export these variables

set projectName=Mario

:: CMake generator {Visual Studio 11, NMake Makefiles}
set cmakeGenerator=Visual Studio 11