import CMake
import CommonDirectories as Directories
import FunctionTiming

def build():
	""" Returns 0 on success, non-0 on failure.
	"""
	return build_helper(Directories.BUILD_DIR)

def build_helper(build_dir):
	""" Returns 0 on success, non-0 on failure.
	"""
	# TODO(HTing): Add support for:
	#   - building differnt configurations ("--config <cfg>")
	#   - cleaning first ("--clean-first")
	return CMake.run_cmake(["--build", build_dir])

if __name__ == "__main__":
	print("Building")
	print("-" * 100)
	result, duration = FunctionTiming.time_function(build)
	duration_str = FunctionTiming.get_duration_str(duration)
	print("Build duration: {}".format(duration_str))
	exit(result)
