# Folder variables
include("${sfmlDir}/Version.cmake")
set(sfmlIncludeDir ${sfmlVersionDir}/include)

# Build folder variables
set(sfmlBuildDir ${buildDir}/External/SFML/v${sfmlVersion})
set(sfmlLibDir ${sfmlBuildDir}/lib)
set(sfmlBinDir ${sfmlBuildDir}/lib)

# SFML projects
set(sfmlProjects
	audio
	graphics
	main
	network
	system
	window)

# SFML solution folder
foreach(sfmlProject ${sfmlProjects})
	set_target_properties(sfml-${sfmlProject} PROPERTIES FOLDER "External/SFML")
endforeach()

# Include directories
include_directories(${sfmlIncludeDir})

# Link SFML libs against target and copy the dll.
function(targetLinkSfmlLibs target)
	foreach(libName ${ARGN})
		# Use the below when building SFML libraries.
		target_link_libraries(${target}	sfml-${libName})

		# Use the below when linking against prebuilt SFML libraries.
		#target_link_libraries(${target}
		#	debug ${sfmlLibDir}/sfml-${libName}-d.lib
		#	optimized ${sfmlLibDir}/sfml-${libName}.lib)

		# Copy SFML DLLs.
		ADD_CUSTOM_COMMAND(TARGET ${target} POST_BUILD
			COMMAND if [$<CONFIGURATION>]==[Debug] (
						${CMAKE_COMMAND} -E copy_if_different "${sfmlLibDir}/$<CONFIGURATION>/sfml-${libName}-d-2.dll" "$<TARGET_FILE_DIR:Game>"
					) else (
						${CMAKE_COMMAND} -E copy_if_different "${sfmlLibDir}/$<CONFIGURATION>/sfml-${libName}-2.dll" "$<TARGET_FILE_DIR:Game>"
					)
			COMMENT "Copying SFML DLL (${libName})..."
			VERBATIM)
	endforeach()
endfunction()
