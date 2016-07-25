add_subdirectory(SFML)
add_subdirectory(GoogleTest)

add_custom_target(External-CMakeScripts SOURCES
	CMakeLists.txt
	ExternalDirs.cmake)
set_target_properties(External-CMakeScripts PROPERTIES FOLDER "External")
