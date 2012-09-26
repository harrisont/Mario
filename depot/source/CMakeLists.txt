cmake_minimum_required(VERSION 2.8)

SET(CMAKE_BUILD_TYPE Debug)

# Set the repository directory.
# CMAKE_SOURCE_DIR should be at /[root]/depot/source/.
set(REPOSITORY_DIR ${CMAKE_SOURCE_DIR}/../..)

set(CMAKE_INSTALL_PREFIX ${REPOSITORY_DIR}/target)

add_subdirectory(test)