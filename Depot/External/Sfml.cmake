# Folder variables
set(sfmlDir ${externalDir}/SFML-2.0-rc)
set(sfmlIncludeDir ${sfmlDir}/include)
set(sfmlBuildDir ${buildDir}/External/SFML-2.0-rc)
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
	set_target_properties(sfml-${sfmlProject} PROPERTIES FOLDER "SFML")
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
