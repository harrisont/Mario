include(Data.cmake)

add_custom_target(${dataTarget} SOURCES
	CMakeLists.txt
	Data.cmake
	${dataFiles})
