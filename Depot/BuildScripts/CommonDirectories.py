import os

# This file is assumed to be under <root>/Depot/BuildScripts/.
ROOT_DIR = os.path.realpath(os.path.dirname(__file__) + "/../..")

DEPOT_DIR = ROOT_DIR + "/Depot"
BUILD_DIR = ROOT_DIR + "/Build"
TARGET_DIR = ROOT_DIR + "/Target"

BUILD_SCRIPTS_DIR = DEPOT_DIR + "/BuildScripts"
SOURCE_DIR = DEPOT_DIR + "/Source"
EXTERNAL_DIR = DEPOT_DIR + "/External"

GIT_DIR = DEPOT_DIR + "/Git"
GIT_HOOKS_DEPOT_DIR = GIT_DIR + "/Hooks"
GIT_HOOKS_ROOT_DIR = ROOT_DIR + "/.git/hooks"
