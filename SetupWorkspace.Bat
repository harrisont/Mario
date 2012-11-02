@call Clean.bat
@copy /Y Depot\Git\Hooks\* .git\hooks\
@call GenerateAndBuild.bat