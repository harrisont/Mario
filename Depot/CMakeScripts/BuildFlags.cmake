# C++ Compile Flags
# -----------------------------------------------------------------------------
# /Wall enable all warnings
# /WX treat warnings as errors
# /EHsc exception handling model (http://msdn.microsoft.com/en-us/library/1deeycx5.aspx)
# /GR enable run-time type information
# /analyze enable static code analysis
set(CMAKE_CXX_FLAGS "/DWIN32 /D_WINDOWS /W4 /WX /EHsc /GR /analyze")

# C++ Debug Compile Flags
# -----------------------------------------------------------------------------
# /MDd selects the runtime library (http://msdn.microsoft.com/en-us/library/2kzt1wy3.aspx)
# /ZI debug information format: generates PDB that supports Edit and Continue
# /Ob0 inline function expansion: disabled
# /Od optimizations disabled
# /RTC1 runtime checks
set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /MDd /ZI /Ob0 /Od /RTC1")

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