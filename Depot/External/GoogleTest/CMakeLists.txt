include(Version.cmake)

# C++ Compile Flags (All Configurations)
# -----------------------------------------------------------------------------
# /D_VARIADIC_MAX
#   Visual Studio does not yet have support for variadic templates.
#   It enables them by having support for 5 to 10 parameters, defaulting to 5.
#   This option makes it use the maximum number of parameters (10).
#   It is enbabled to support Google Test, which uses variadic templates.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /D_VARIADIC_MAX=10")

add_subdirectory(${googleTestVersionDir})
