include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")
include("${sfmlDir}/Sfml.cmake")
include("${dataDir}/Data.cmake")

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

set(executableName ${PROJECT_NAME})
add_executable(${executableName} ${gameFiles})

# ---- Dependencies -----------------------------------------------------------

target_link_libraries(${executableName}
	Core)

targetLinkSfmlLibs(${executableName}
	system
	window
	graphics)

# Copy data
foreach(dataFile ${dataFiles})
	add_custom_command(TARGET ${executableName} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_if_different "${dataDir}/${dataFile}" "$<TARGET_FILE_DIR:${executableName}>"
		COMMENT "Copying data file '${dataFile}'."
		VERBATIM)
endforeach()
