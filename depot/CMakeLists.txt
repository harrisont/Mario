cmake_minimum_required(VERSION 2.8)

project(Mario)

SET(CMAKE_BUILD_TYPE Debug)

# Set the repository directory.
# CMAKE_SOURCE_DIR should be at /[root]/depot/source/.
set(repositoryDir ${CMAKE_SOURCE_DIR}/..)

# External
set(externalDir ${CMAKE_SOURCE_DIR}/external)
set(sfmlDir ${externalDir}/SFML-2.0-rc)
set(sfmlIncludeDir ${sfmlDir}/include)
set(sfmlLibDir ${sfmlDir}/lib)

set(CMAKE_INSTALL_PREFIX ${repositoryDir}/target)

include("CMakeBuildFlags.txt")

add_subdirectory(external)
add_subdirectory(source)
