import argparse
import sys
from prepare import prepare
from build_iso import build_iso
from clean import cleanup
from extensions import setup_gnome_extensions


def main() -> int:
    parser = argparse.ArgumentParser()

    subparsers = parser.add_subparsers(dest="command", required=True)

    subparsers.add_parser("prepare")
    subparsers.add_parser("build")
    subparsers.add_parser("gnome-ext")
    subparsers.add_parser("clean")

    args = parser.parse_args()

    match args.command:
        case "prepare":
            prepare()
        case "build":
            build_iso()
        case "clean":
            cleanup()
        case "gnome-ext":
            setup_gnome_extensions()

    return 0


if __name__ == "__main__":
    sys.exit(main())
