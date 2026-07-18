from base import *
from utils import run_command_and_stream


def add_local_repo() -> None:
    pkg_files = list(local_repo_dir.glob("*.pkg.tar.zst"))
    if pkg_files:
        run_command_and_stream(
            ["repo-add", str(local_repo_db_file), *map(str, pkg_files)]
        )
    else:
        print("No packages found.")


def add_cache_repo() -> None:
    pkg_files = list(package_cache_dir.glob("*.pkg.tar.zst"))
    if pkg_files:
        run_command_and_stream(
            ["repo-add", str(package_cache_db), *map(str, pkg_files)]
        )
    else:
        print("No packages found.")
