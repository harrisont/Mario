include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")
include("${sfmlDir}/Sfml.cmake")

project(Game)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

# ---- Sources ----------------------------------------------------------------

AddGlobbedFiles(game Model)
AddGlobbedFiles(game Model/Network)

# ---- Include Directories ----------------------------------------------------

include("${boostDir}/Version.cmake")

include_directories(
	${boostVersionDir})

# ---- Executable -------------------------------------------------------------

set(executableName "Game")
add_executable(${executableName} ${gameFiles})

# ---- Dependencies -----------------------------------------------------------

target_link_libraries(${executableName}
	Core)

targetLinkSfmlLibs(${executableName}
	system
	window
	graphics)
