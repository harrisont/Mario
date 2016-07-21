import shutil

import Clean
import CommonDirectories as Directories
import FunctionTiming
import GenerateAndBuild


def copy_git_hooks():
    try:
        # First, remove any existing hooks.
        shutil.rmtree(Directories.GIT_HOOKS_ROOT_DIR, ignore_errors=True)

        # Next, use the hooks specified in the depot.
        shutil.copytree(src=Directories.GIT_HOOKS_DEPOT_DIR, dst=Directories.GIT_HOOKS_ROOT_DIR)
    except Exception as err:
        print("Error copying Git hooks: '{}'.".format(err))


def setup_workspace():
    """ Returns 0 on success, non-0 on failure."""
    Clean.clean()

    copy_git_hooks()

    # Generate and build
    result = GenerateAndBuild.generate_and_build()
    if result != 0:
        print("generate_and_build failed with return value '{}'".format(result))
        return result

    return 0


def main():
    result, duration = FunctionTiming.time_function(setup_workspace)
    duration_str = FunctionTiming.get_duration_str(duration)
    print("Setup workspace duration: {}".format(duration_str))
    exit(result)


if __name__ == "__main__":
    main()
