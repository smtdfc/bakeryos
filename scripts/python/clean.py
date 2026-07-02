from base import *
import shutil

def cleanup() -> None:
    if work_dir.exists(): shutil.rmtree(work_dir)
    if out_dir.exists(): shutil.rmtree(out_dir)