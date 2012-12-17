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
