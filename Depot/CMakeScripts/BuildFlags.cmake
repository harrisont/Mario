# C++ Compile Flags (All Configurations)
# -----------------------------------------------------------------------------
# /D_VARIADIC_MAX
#   Visual Studio does not yet have support for variadic templates.
#   It enables them by having support for 5 to 10 parameters, defaulting to 5.
#   This option makes it use the maximum number of parameters (10).
#   It is enbabled to support Google Test, which uses variadic templates.
# /Wall enable all warnings
# /WX treat warnings as errors
# /EHsc exception handling model (http://msdn.microsoft.com/en-us/library/1deeycx5.aspx)
# /GR enable run-time type information
# /analyze enable static code analysis
set(CMAKE_CXX_FLAGS "/DWIN32 /D_WINDOWS /D_VARIADIC_MAX=10 /W4 /WX /EHsc /GR /analyze")

# C++ Debug Preprocessor Defines Flags
# -----------------------------------------------------------------------------
# _DEBUG Visual Studio debug macro
# TING_ASSERTS_ENABLED enable asserts
set(CMAKE_CXX_PREPROCESSOR_DEFINES_DEBUG "/D_DEBUG /DTING_ASSERTS_ENABLED")

# C++ Debug Compile Flags
# -----------------------------------------------------------------------------
# /MDd selects the runtime library (http://msdn.microsoft.com/en-us/library/2kzt1wy3.aspx)
# /ZI debug information format: generates PDB that supports Edit and Continue
# /Ob0 inline function expansion: disabled
# /Od optimizations disabled
# /RTC1 runtime checks
set(CMAKE_CXX_COMPILER_FLAGS_DEBUG "/MDd /ZI /Ob0 /Od /RTC1")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_PREPROCESSOR_DEFINES_DEBUG} ${CMAKE_CXX_COMPILER_FLAGS_DEBUG}")

#CMAKE_CXX_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /D NDEBUG
#CMAKE_CXX_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /D NDEBUG
#CMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /D NDEBUG

# Linker Flags
# -----------------------------------------------------------------------------
# /WX tret warnings as errors
set(CMAKE_EXE_LINKER_FLAGS "/WX")

# Executable Debug Linker Flags
# -----------------------------------------------------------------------------
# /SAFESEH:NO does not check for safe exception handling.
#     When not disabled, SAFESEH will disable Edit and Continue.
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/debug /INCREMENTAL /SAFESEH:NO")

#CMAKE_EXE_LINKER_FLAGS_MINSIZEREL:STRING=/INCREMENTAL:NO
#CMAKE_EXE_LINKER_FLAGS_RELEASE:STRING=/INCREMENTAL:NO
#CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO:STRING=/debug /INCREMENTAL

# Module (lib) and Shared (DLL) Debug Linker Flags
# -----------------------------------------------------------------------------
set(CMAKE_MODULE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
set(CMAKE_MODULE_LINKER_FLAGS_DEBUG ${CMAKE_EXE_LINKER_FLAGS_DEBUG})
set(CMAKE_SHARED_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG ${CMAKE_EXE_LINKER_FLAGS_DEBUG})