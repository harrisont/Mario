set(sfmlDir ${externalDir}/SFML-2.0-rc)
set(sfmlIncludeDir ${sfmlDir}/include)
set(sfmlLibDir ${sfmlDir}/lib)
set(sfmlBinDir ${sfmlDir}/bin)

include_directories(${sfmlIncludeDir})

# Link SFML libs against target and copy the dll.
function(targetLinkSfmlLibs target)
	foreach(libName ${ARGN})
		target_link_libraries(${target}
			debug ${sfmlLibDir}/sfml-${libName}-d.lib
			optimized ${sfmlLibDir}/sfml-${libName}.lib)

		# Copy SFML DLLs.
		ADD_CUSTOM_COMMAND(TARGET ${target} POST_BUILD
			COMMAND if [$<CONFIGURATION>]==[Debug] (
						${CMAKE_COMMAND} -E copy_if_different "${sfmlBinDir}/sfml-${libName}-d-2.dll" "$<TARGET_FILE_DIR:Game>"
					) else (
						${CMAKE_COMMAND} -E copy_if_different "${sfmlBinDir}/sfml-${libName}-2.dll" "$<TARGET_FILE_DIR:Game>"
					)
			COMMENT "Copying SFML DLL (${libName})..."
			VERBATIM)
	endforeach()
endfunction()
