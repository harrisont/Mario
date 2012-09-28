:: Sets common directory variables.

@echo off

pushd ..\..\
set projectDir=%CD%
popd

set depotDir=%projectDir%/depot
set buildDir=%projectDir%/build
set targetDir=%projectDir%/target

set buildScriptsDir=%depotDir%/buildScripts
set sourceDir=%depotDir%/source
set externalDir=%depotDir%/external