Mario
=====
A Mario game clone

Setup
-----
Run `/SetupWorkspace.bat` which:
* cleans
* copies Git hooks
* runs CMake to generate make/project files
* builds.

> Visual Studio 14 (2015) is the default CMake generator.  You can change this in `/Depot/BuildScripts/Config.bat`.

Subsequent Builds
-----------------
* To run CMake to generate make/project files and do a build, run `/GenerateAndBuild.bat`.
* To just run CMake, run `/Generate.bat`.
* To clean, run `/Clean.bat`.

Running
--------------------
* When running from Visual Studio, set "Working Directory" to ```$(OutputPath)```

Author
------
Harrison Ting
