include("${CMAKE_SOURCE_DIR}/CMakeAddGlobbedFiles.txt")

project(Game)

AddGlobbedFiles(game model)

include_directories(${sfmlIncludeDir})

add_executable(Game ${gameFiles})

target_link_libraries(Game
	debug ${sfmlLibDir}/sfml-system-d.lib
	optimized ${sfmlLibDir}/sfml-system.lib
	debug ${sfmlLibDir}/sfml-window-d.lib
	optimized ${sfmlLibDir}/sfml-window.lib)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME})
