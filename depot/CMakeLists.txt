cmake_minimum_required(VERSION 2.8)

project(Mario)

SET(CMAKE_BUILD_TYPE Debug)

# CMAKE_SOURCE_DIR should be at /[root]/depot/source/.
get_filename_component(repositoryDir ${CMAKE_SOURCE_DIR}/.. ABSOLUTE)

set(buildDir ${repositoryDir}/build)
set(targetDir ${repositoryDir}/target)
set(depotDir ${repositoryDir}/depot)
set(externalDir ${depotDir}/external)

set(CMAKE_INSTALL_PREFIX ${targetDir})

# Use solution folders.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(external)
add_subdirectory(source)