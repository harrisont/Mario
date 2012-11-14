import CommonDirectories as Directories
import FunctionTiming

import os

def build():
	""" Returns 0 on success, non-0 on failure.
	"""
	return build_helper(Directories.BUILD_DIR)

def build_helper(build_dir):
	""" Returns 0 on success, non-0 on failure.
	"""
	try:
		os.chdir(build_dir)
	except FileNotFoundError:
		print("Could not find the build directory ('{}')".format(build_dir))
		return 1

	# CMake --build

	return 0

if __name__ == "__main__":
	print("Building")
	print("-" * 100)
	build_return_value, build_time = FunctionTiming.time_function(build)
	print("Build duration: {}".format(FunctionTiming.get_duration_str(build_time)))
	exit(build_return_value)