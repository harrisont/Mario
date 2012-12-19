include("${googleTestDir}/Version.cmake")

# Creates a Google Test project to run the tests for target.
# Searches for test sources (*.test.cpp) from the current directory recursively
function(AddTestProject target)
	include_directories(${googleTestVersionDir}/include)

	set(testTarget "${target}Test")

	# /wd6326 Ignore warning "Potential comparison of a constant with another constant".
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd6326" PARENT_SCOPE)

	file(GLOB_RECURSE testFiles *.test.cpp)
	if(NOT testFiles)
		message(WARNING "AddTestProject called for target \"${target}\" cannot find any tests so no test project will be created.")
		return()
	endif()

	add_executable(${testTarget} ${testFiles})

	# ---- Link and copy the Google Test libraries --------------------------------

	set(googleTestLibraries gtest gtest_main)

	target_link_libraries(${testTarget}
		${target}
		${googleTestLibraries})

	CopyGoogleTestLibraries(${testTarget} ${googleTestLibraries})

	# -----------------------------------------------------------------------------

	RunTestAsPostBuildStep(${testTarget})
endfunction()

# Usage:
#   CopyGoogleTestLibraries(MyTarget gtest gtest_main)
function(CopyGoogleTestLibraries target)
	set(googleTestBuildDir ${buildDir}/External/GoogleTest/v${googleTestVersion})

	foreach(libName ${ARGN})
		set(libFile "${libName}.dll")

		add_custom_command(TARGET ${target} POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E copy_if_different "${googleTestBuildDir}/$<CONFIGURATION>/${libFile}" "$<TARGET_FILE_DIR:${target}>"
			COMMENT "Copying Google Test DLL '${libFile}'."
			VERBATIM)
	endforeach()
endfunction()

function(RunTestAsPostBuildStep target)
	add_custom_command(TARGET ${target} POST_BUILD
		COMMAND ${target}
		COMMENT "Running tests in ${target}."
		VERBATIM)
endfunction()
