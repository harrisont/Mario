include("${depotDir}/CMakeAddGlobbedFiles.txt")
include("${externalDir}/CMakeSfml.txt")

project(Game)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

AddGlobbedFiles(game model)

set(executableName Game)
add_executable(${executableName} ${gameFiles})

targetLinkSfmlLibs(${executableName}
	system
	window
	graphics)
