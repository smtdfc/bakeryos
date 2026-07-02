source $(dirname "$(readlink -f "$0")")/base.sh

export LANG=C
sudo pacman -Syu

mkdir -p $DATA_DIR
mkdir -p $SNAPSHOT_TARGET_DIR
mkdir -p $LOCAL_REPO_DIR
mkdir -p $GNOME_EXTENSION_DIR
source "$SCRIPT_DIR/extensions.sh"


# Create pacman config file
sed "s|__PROJECT_DIR__|$PROJECT_DIR|g" pacman.conf.template > pacman.conf

# Build package from snapshot
source "$SCRIPT_DIR/snapshot.sh"
extract_all_snapshot
build_all_pkg


# Add local repo
repo-add $LOCAL_REPO_DIR/custom.db.tar.gz $LOCAL_REPO_DIR/*.pkg.tar.zst


