:: Sets common directory variables.

@call "%~dp0Config.bat"

:: Don't use setlocal because we want to export these variables

pushd "%~dp0..\..\"
set projectDir=%CD%
popd

set depotDir=%projectDir%/depot
set buildDir=%projectDir%/build
set targetDir=%projectDir%/target

set buildScriptsDir=%depotDir%/buildScripts
set sourceDir=%depotDir%/source
set externalDir=%depotDir%/external