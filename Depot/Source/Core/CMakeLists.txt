include("${boostDir}/Version.cmake")
include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")
include("${googleTestDir}/GoogleTest.cmake")

project(Core)

# ---- Sources ----------------------------------------------------------------

AddGlobbedFiles(core Assert)
AddGlobbedFiles(core Log)
AddGlobbedFiles(core Macro)

# ---- Include Directories ----------------------------------------------------

include_directories(
	${boostVersionDir})

# ---- Library ----------------------------------------------------------------

add_library(${PROJECT_NAME} STATIC ${coreFiles})

# ---- Test Executable --------------------------------------------------------

AddTestProject(${PROJECT_NAME})
