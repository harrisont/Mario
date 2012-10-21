@echo off
:: Set the verbosity {true, false}
set verbose=false
if "%verbose%" == "true" echo on

:: Don't use setlocal because we want to export these variables

set projectName=Mario

:: CMake generator {Visual Studio 11, NMake Makefiles}
set cmakeGenerator=Visual Studio 11