import CMake
import CommonDirectories as Directories
import Config
import FunctionTiming

import os
import sys

def fail_due_to_missing_generator(generator):
	sys.exit("The CMake generator is set to '{}' in '{}/Config.py', but it cannot be found.".format(
		generator,
		Directories.BUILD_SCRIPTS_DIR))

def run_cmake(generator, build_dir, depot_dir):
	generator_validity = CMake.get_cmake_generator_validity(generator)
	if generator_validity == CMake.GeneratorValidity.INVALID:
		sys.exit("The CMake generator '{}', set in '{}/Config.py', is invalid.".format(
			generator, Directories.BUILD_SCRIPTS_DIR))
	elif generator_validity == CMake.GeneratorValidity.MISSING:
		sys.exit("The CMake generator '{}', set in '{}/Config.py', cannot be found.".format(
			generator, Directories.BUILD_SCRIPTS_DIR))

	# Run from the build directory.
	os.makedirs(build_dir, exist_ok=True)
	os.chdir(build_dir)

	# CMake args:
	#  -Wdev enable developer warnings
	#  -G specifies the generator
	return CMake.run_cmake(["-Wdev", "-G", generator, depot_dir])

def generate():
	return run_cmake(Config.CMAKE_GENERATOR, Directories.BUILD_DIR, Directories.DEPOT_DIR)

if __name__ == "__main__":
	print("Running CMake")
	print("-" * 100)
	generation_return_value, generation_time = FunctionTiming.time_function(generate)
	print("CMake duration: {}".format(FunctionTiming.get_duration_str(generation_time)))
	exit(generation_return_value)
