# Get script dir
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_DIR=$(pwd)
SNAPSHOT_DIR="./pkg-snapshots"
SNAPSHOT_TARGET_DIR="./pkgs"

export LANG=C
sudo pacman -Syu
sudo pacman -S dart-sass
mkdir -p ./local-repo
mkdir -p ./pkgs


# Create pacman config file
sed "s|__PROJECT_DIR__|$PROJECT_DIR|g" pacman.conf.template > pacman.conf

# Build package from snapshot
source "$SCRIPT_DIR/snapshot.sh"
extract_all_snapshot
build_all_pkg



# Add local repo
repo-add ./local-repo/custom.db.tar.gz ./local-repo/*.pkg.tar.zst


