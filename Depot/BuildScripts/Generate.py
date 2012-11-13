import CommonCommands as Commands
import CommonDirectories as Directories
import Config

import sys
import timeit
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

def run_cmake(generator):
	validate_cmake_generator(generator)

	# call "%createDirIfMissingCmd%" "%buildDir%"
	# cd "%buildDir%"
	#
	# :: CMake args:
	# ::  -Wdev enable developer warnings
	# call "%cmakeCmd%" -Wdev -G "%cmakeGenerator%" "%depotDir%"

def generate():
	run_cmake(Config.CMAKE_GENERATOR)

def time_generate():
	return timeit.timeit("generate()", setup="from __main__ import generate", number=1)

if __name__ == "__main__":
	print("Running CMake")
	print("-" * 100)
	generationTime = time_generate()
	print("CMake duration: {:.2n}".format(generationTime))