:: Sets common directory variables.

@call "%~dp0Config.bat"

:: Don't use setlocal because we want to export these variables

pushd "%~dp0..\..\"
set projectDir=%CD%
popd

set depotDir=%projectDir%/Depot
set buildDir=%projectDir%/Build
set targetDir=%projectDir%/Target

set buildScriptsDir=%depotDir%/BuildScripts
set sourceDir=%depotDir%/Source
set externalDir=%depotDir%/External