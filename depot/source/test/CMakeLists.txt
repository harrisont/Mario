project(MarioTest)
file(GLOB MARIO_TEST_SOURCES *.cpp )
add_executable(TestExecutable ${MARIO_TEST_SOURCES})

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME})
