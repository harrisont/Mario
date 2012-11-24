import Build
import FunctionTiming
import Generate

def generate_and_build():
	""" Returns 0 on success, non-0 on failure.
	"""
	generate_result = Generate.generate()
	if generate_result != 0:
		print("Generate failed with return value '{}'".format(generate_result))
		return generate_result

	build_result = Build.build()
	if build_result != 0:
		print("Build failed with return value '{}'".format(build_result))
		return build_result

	return 0

if __name__ == "__main__":
	result, duration = FunctionTiming.time_function(generate_and_build)
	duration_str = FunctionTiming.get_duration_str(duration)
	print("Generate and build duration: {}".format(duration_str))
	exit(result)