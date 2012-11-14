import CommonCommands as Commands
import CommonDirectories as Directories
import Config
import FunctionTiming

import os
import subprocess
import sys
import winreg

def is_visual_studio_11_installed():
	return is_visual_studio_11_installed_helper(r"Software\Microsoft\DevDiv\vs\Servicing\11.0") \
		or is_visual_studio_11_installed_helper(r"Software\Microsoft\DevDiv\vc\Servicing\11.0")

# We expect there to be at least 1 value under vs11_key_path.
def is_visual_studio_11_installed_helper(vs11_key_path):
	root_key = winreg.HKEY_LOCAL_MACHINE
	try:
		vs11_key = winreg.OpenKey(root_key, vs11_key_path)
		winreg.EnumValue(vs11_key, 0)
		return True
	except OSError:
		return False

def fail_due_to_missing_generator(generator):
	sys.exit("The CMake generator is set to '{}' in '{}/Config.py', but it cannot be found.".format(
		generator,
		Directories.BUILD_SCRIPTS_DIR))

def validate_cmake_generator(generator):
	if generator == Config.CmakeGenerators.VISUAL_STUDIO_11:
		if not is_visual_studio_11_installed():
			fail_due_to_missing_generator(generator)
	elif generator == Config.CmakeGenerators.NMAKE_MAKEFILES:
		# TODO(HTing): actually check for NMake instead of just checking for VS11.
		if not is_visual_studio_11_installed():
			fail_due_to_missing_generator(generator)
	else:
		sys.exit("Invalid CMake generator '{}'".format(generator))

def run_cmake(generator, build_dir, depot_dir):
	validate_cmake_generator(generator)

	# Run from the build directory.
	os.makedirs(build_dir, exist_ok=True)
	os.chdir(build_dir)

	# CMake args:
	#  -Wdev enable developer warnings
	#  -G specifies the generator
	Commands.CMAKE_CMD
	return subprocess.call([Commands.CMAKE_CMD, "-Wdev", "-G", generator, depot_dir])

def generate():
	return run_cmake(Config.CMAKE_GENERATOR, Directories.BUILD_DIR, Directories.DEPOT_DIR)

if __name__ == "__main__":
	print("Running CMake")
	print("-" * 100)
	generation_return_value, generation_time = FunctionTiming.time_function(generate)
	print("CMake duration: {}".format(FunctionTiming.get_duration_str(generation_time)))
	exit(generation_return_value)