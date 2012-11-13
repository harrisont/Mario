import Config
import CommonDirectories as Directories

import shutil

def rmtree_if_exists(path):
	shutil.rmtree(path, ignore_errors=True)

def clean():
	rmtree_if_exists(Directories.BUILD_DIR)
	rmtree_if_exists(Directories.TARGET_DIR)

if __name__ == "__main__":
	clean()