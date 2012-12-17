include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")

project(Core)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

# ---- Sources ----------------------------------------------------------------

AddGlobbedFiles(core Assert)
AddGlobbedFiles(core Log)
AddGlobbedFiles(core Macro)

# ---- Include Directories ----------------------------------------------------

include("${boostDir}/Version.cmake")

include_directories(
	${boostVersionDir})

# ---- Library ----------------------------------------------------------------

set(libName "Core")
add_library(${libName} STATIC ${coreFiles})

# -----------------------------------------------------------------------------
# ---- Test Executable --------------------------------------------------------
# -----------------------------------------------------------------------------

include("${googleTestDir}/Version.cmake")

include_directories(
	${googleTestVersionDir}/include)

AddGlobbedFiles(test test)

set(testExectableName "CoreTest")

# /wd6326 Ignore warning "Potential comparison of a constant with another constant".
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd6326")

add_executable(${testExectableName}
	${testFiles})

target_link_libraries(${testExectableName}
	gtest
	gtest_main)

# ---- Copy Google Test ------------------------------------------------------

set(googleTestBuildDir ${buildDir}/External/GoogleTest/v${googleTestVersion})

foreach(libName gtest gtest_main)
	set(libFile "${libName}.dll")
	add_custom_command(TARGET ${testExectableName} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_if_different "${googleTestBuildDir}/$<CONFIGURATION>/${libFile}" "$<TARGET_FILE_DIR:CoreTest>"
		COMMENT "Copying Google Test DLL (${libFile})..."
		VERBATIM)
endforeach()
