cmake_minimum_required(VERSION 2.8)

project(Mario)

SET(CMAKE_BUILD_TYPE Debug)

# CMAKE_SOURCE_DIR should be at /[root]/depot/source/.
get_filename_component(repositoryDir ${CMAKE_SOURCE_DIR}/.. ABSOLUTE)

set(buildDir ${repositoryDir}/Build)
set(targetDir ${repositoryDir}/Target)
set(depotDir ${repositoryDir}/Depot)
set(externalDir ${depotDir}/External)
set(cmakeScriptsDir ${depotDir}/CMakeScripts)
set(sourceDir ${depotDir}/Source)

set(CMAKE_INSTALL_PREFIX ${targetDir})

include_directories(${sourceDir})

# Use solution folders.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(External)
add_subdirectory(Source)