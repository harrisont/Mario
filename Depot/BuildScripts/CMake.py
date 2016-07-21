import CommonCommands as Commands

import subprocess
import winreg


class Generators:
    VISUAL_STUDIO_14 = "Visual Studio 14"
    NMAKE_MAKEFILES = "NMake Makefiles"


def is_visual_studio_14_installed():
    return is_visual_studio_14_installed_helper(r"Software\Microsoft\DevDiv\vs\Servicing\11.0") \
        or is_visual_studio_14_installed_helper(r"Software\Microsoft\DevDiv\vc\Servicing\11.0")


def is_visual_studio_14_installed_helper(vs14_key_path):
    """We expect there to be at least 1 value under vs14_key_path."""
    root_key = winreg.HKEY_LOCAL_MACHINE
    try:
        vs11_key = winreg.OpenKey(root_key, vs14_key_path)
        winreg.EnumValue(vs11_key, 0)
        return True
    except OSError:
        return False


class GeneratorValidity:
    VALID = "valid"
    INVALID = "invalid"
    MISSING = "missing"


def get_cmake_generator_validity(generator):
    if generator == Generators.VISUAL_STUDIO_14:
        if is_visual_studio_14_installed():
            return GeneratorValidity.VALID
        else:
            return GeneratorValidity.MISSING
    elif generator == Generators.NMAKE_MAKEFILES:
        # TODO(HTing): actually check for NMake instead of just checking for VS14.
        if is_visual_studio_14_installed():
            return GeneratorValidity.VALID
        else:
            return GeneratorValidity.MISSING
    else:
        return GeneratorValidity.INVALID


def run_cmake(args):
    """ args: a list of arguments to pass to CMake.
    e.g. run_cmake(["-G", "Visual Studio 14"])
    """
    return subprocess.call([Commands.CMAKE_CMD] + args)
