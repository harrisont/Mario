include(Version.cmake)

add_subdirectory(${sfmlVersionDir})

add_custom_target(SFML-CMakeScripts SOURCES
	CMakeLists.txt
	Sfml.cmake
	Version.cmake)
set_target_properties(SFML-CMakeScripts PROPERTIES FOLDER "External/SFML")
