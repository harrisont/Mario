include("${depotDir}/CMakeAddGlobbedFiles.txt")
include("${externalDir}/CMakeSfml.txt")

project(Game)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

AddGlobbedFiles(game model)

add_executable(Game ${gameFiles})

targetLinkSfmlLibs(Game
	system
	window
	graphics)
