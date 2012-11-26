include("${cmakeScriptsDir}/AddGlobbedFiles.cmake")

project(Core)

set(EXECUTABLE_OUTPUT_PATH ${targetDir}/${PROJECT_NAME})

AddGlobbedFiles(core Assert)
AddGlobbedFiles(core Log)
AddGlobbedFiles(core Macro)

set(libName "Core")
add_library(${libName} STATIC ${coreFiles})
