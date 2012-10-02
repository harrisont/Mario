include("${CMAKE_SOURCE_DIR}/CMakeAddGlobbedFiles.txt")

project(Game)

AddGlobbedFiles(game model)

add_executable(Game ${gameFiles})

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME})
