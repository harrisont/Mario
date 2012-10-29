include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")
include("${externalDir}/Sfml.cmake")

project(Game)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

AddGlobbedFiles(game Model)
AddGlobbedFiles(game Model/Network)

set(executableName Game)
add_executable(${executableName} ${gameFiles})

targetLinkSfmlLibs(${executableName}
	system
	window
	graphics)
