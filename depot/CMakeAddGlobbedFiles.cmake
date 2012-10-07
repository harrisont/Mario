# Stores the files in the given directory into:
#   headers: "${outGlobbedFilesPrefixVar}Headers"
#   source: "${outGlobbedFilesPrefixVar}Sources"
#	combined: "${outGlobbedFilesPrefixVar}Files"
#
# directory can be either relative or absolute.
#
# Also creates a source group with the files.
# The source group's name is the directory.
#
# Example usage:
#   AddGlobbedFiles(foo dir)
#   add_executable(MyExecutable ${fooFiles})
function(AddGlobbedFiles outGlobbedFilesPrefixVar directory)
	#message("AddGlobbedFiles: outGlobbedFilesPrefixVar=${outGlobbedFilesPrefixVar}, directory=${directory}")

	file(GLOB headerFiles ${directory}/*.h ${directory}/*.hpp)
	file(GLOB sourceFiles ${directory}/*.cpp ${directory}/*.c)
	set(allFiles ${headerFiles} ${sourceFiles})
	set(${outGlobbedFilesPrefixVar}Headers ${headerFiles} PARENT_SCOPE)
	set(${outGlobbedFilesPrefixVar}Sources ${sourceFiles} PARENT_SCOPE)
	set(${outGlobbedFilesPrefixVar}Files ${allFiles} PARENT_SCOPE)
	#message("AddGlobbedFiles: headerFiles=${headerFiles}")
	#message("AddGlobbedFiles: sourceFiles=${sourceFiles}")

	# Create a source group with the globbed files.  The name of the group is
	# the directory.
	get_filename_component(directoryAbsolute ${directory} ABSOLUTE)
	if(NOT ${directoryAbsolute} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
		get_filename_component(directoryName ${directoryAbsolute} NAME)
		set(sourceGroupName ${directoryName})
		#message("AddGlobbedFiles: sourceGroupName=${sourceGroupName}")
		source_group(${sourceGroupName} FILES ${allFiles})
	endif()
endfunction()