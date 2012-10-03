set(sfmlDir ${externalDir}/SFML-2.0-rc)
set(sfmlIncludeDir ${sfmlDir}/include)
set(sfmlLibDir ${sfmlDir}/lib)

# Link SFML libs against target.
function(targetLinkSfmlLibs target)
	foreach(libName ${ARGN})
		target_link_libraries(${target}
			debug ${sfmlLibDir}/sfml-${libName}-d.lib
			optimized ${sfmlLibDir}/sfml-${libName}.lib)
	endforeach()
endfunction()