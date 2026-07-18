import tarfile
import shutil
from pathlib import Path
from base import *
from utils import run_command_and_stream


def download_all_core_packages() -> None:
    with open(packagex64_file, "r") as f:
        packages = [line.strip() for line in f if line.strip()]

    cmd = ["sudo", "pacman", "-Sy", "--noconfirm",
           "--downloadonly", "--cachedir", package_cache_dir, "--config", pacman_config_file] + packages
    run_command_and_stream(cmd)


def extract_all_snapshot() -> None:
    for package in package_snapshots:
        print("-----------------------------------")

        matches = list(snapshot_dir.glob(f"{package}.tar.*"))

        if not matches:
            print(f"Snapshot not found: {package}")
            continue

        file_path = matches[0]
        target_dir = snapshot_target_dir / package

        target_dir.mkdir(parents=True, exist_ok=True)

        print(f"Extracting {file_path.name} -> {target_dir}")

        try:
            with tarfile.open(file_path, "r:*") as tar:
                for member in tar.getmembers():
                    parts = Path(member.name).parts

                    if len(parts) <= 1:
                        continue

                    member.name = str(Path(*parts[1:]))
                    tar.extract(member, path=target_dir)

        except Exception as e:
            print(f"Failed: {package}: {e}")


def build_all_pkg() -> None:
    local_repo_dir.mkdir(parents=True, exist_ok=True)

    for package in package_snapshots:
        folder = snapshot_target_dir / package

        print("-----------------------------------")

        if not folder.exists():
            print(f"{package} has not been extracted.")
            continue

        print(f"Building {package}")

        exit_code = run_command_and_stream(
            ["makepkg", "-s", "--noconfirm"],
            cwd=str(folder)
        )

        if exit_code != 0:
            print(f"Build failed: {package}")
            continue

        pkg_files = list(folder.glob("*.pkg.tar.zst"))

        if not pkg_files:
            print(f"No package generated for {package}")
            continue

        for pkg in pkg_files:
            print(f"Copying {pkg.name}")
            shutil.copy2(pkg, local_repo_dir)

        print(f"Finished {package}")
