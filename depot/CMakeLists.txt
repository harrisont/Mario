cmake_minimum_required(VERSION 2.8)

project(Mario)

SET(CMAKE_BUILD_TYPE Debug)

# CMAKE_SOURCE_DIR should be at /[root]/depot/source/.
get_filename_component(repositoryDir ${CMAKE_SOURCE_DIR}/.. ABSOLUTE)

set(depotDir ${repositoryDir}/depot)
set(targetDir ${repositoryDir}/target)
set(externalDir ${depotDir}/external)

set(CMAKE_INSTALL_PREFIX ${targetDir})

include("CMakeBuildFlags.cmake")

add_subdirectory(external)
add_subdirectory(source)
