from repository import add_local_repo
from utils import run_command_and_stream
from base import *
from extensions import *
from package import *
import configparser
import os


class CaseConfigParser(configparser.ConfigParser):
    def optionxform(self, optionstr: str) -> str:
        return optionstr


def update_system() -> None:
    print("Updating .... ")
    run_command_and_stream(["sudo", "pacman", "-Syu"])
    run_command_and_stream(["sudo", "pacman", "-S", "--needed", "base-devel"])
    run_command_and_stream(["sudo", "pacman", "-S", "--needed", "squashfs-tools", "dosfstools", "mtools", "arch-install-scripts", "xorriso"])
def ensure_files() -> None:
    print("Creating files and dirs .... ")
    os.makedirs(data_dir, exist_ok=True)
    os.makedirs(snapshot_dir, exist_ok=True)
    os.makedirs(local_repo_dir, exist_ok=True)
    os.makedirs(gnome_extension_dir, exist_ok=True)

def config_pacman() -> None:
    print("Config pacman .... ")
    config = CaseConfigParser()
    if pacman_config_file.exists():
        config.read(pacman_config_file)
        
        config["custom"]["Server"] = f"file://{local_repo_dir}"
        config["bakery-os"]["Server"] = bakeryos_repository

        with open(pacman_config_file, 'w') as configfile:
            config.write(configfile)

def prepare() -> None:
    update_system()
    ensure_files()
    config_pacman()
    setup_gnome_extensions()
    extract_all_snapshot()
    build_all_pkg()
    add_local_repo()

