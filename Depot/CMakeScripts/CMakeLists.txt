include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")

add_custom_target(CMakeScripts SOURCES
	CMakeLists.txt
	AddGlobbedFiles.cmake
	BuildFlags.cmake
	ConvertSlashes.cmake)
set_target_properties(CMakeScripts PROPERTIES FOLDER "CMake")
