# The latest stable release is 2.3.2, but it doesn't have support for Visual Studio 2015.
# Cherry pick https://github.com/SFML/SFML/commit/6b97814 to add VS2015 support.
set(sfmlVersion 2.3.2+6b97814)
set(sfmlVersionDir ${sfmlDir}/v${sfmlVersion})
