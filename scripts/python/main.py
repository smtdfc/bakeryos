import argparse
import sys
from prepare import prepare
from build import build_iso
from clean import cleanup


def main() -> int:
    parser = argparse.ArgumentParser()

    subparsers = parser.add_subparsers(dest="command", required=True)

    subparsers.add_parser("prepare")
    subparsers.add_parser("build")
    subparsers.add_parser("clean")

    args = parser.parse_args()

    match args.command:
        case "prepare":
            prepare()
        case "build":
            build_iso()
        case "clean":
            cleanup()

    return 0

if __name__ == "__main__":
    sys.exit(main())