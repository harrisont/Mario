import winreg

class Generators:
	VISUAL_STUDIO_11 = "Visual Studio 11"
	NMAKE_MAKEFILES = "NMake Makefiles"

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

class GeneratorValidity:
	VALID = "valid"
	INVALID = "invalid"
	MISSING = "missing"

def get_cmake_generator_validity(generator):
	if generator == Generators.VISUAL_STUDIO_11:
		if is_visual_studio_11_installed():
			return GeneratorValidity.VALID
		else:
			return GeneratorValidity.MISSING
	elif generator == Generators.NMAKE_MAKEFILES:
		# TODO(HTing): actually check for NMake instead of just checking for VS11.
		if is_visual_studio_11_installed():
			return GeneratorValidity.VALID
		else:
			return GeneratorValidity.MISSING
	else:
		return GeneratorValidity.INVALID