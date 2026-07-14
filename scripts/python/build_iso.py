from utils import run_command_and_stream
from base import *

def build_iso() -> None:
    run_command_and_stream([
        "sudo",
        "bash",
        str(bakeryos_mkiso_tool),
        "-v",
        "-C",
        str(pacman_config_file),
        "-w",
        str(work_dir),
        "-o",
        str(out_dir),
        str(project_dir)
    ])