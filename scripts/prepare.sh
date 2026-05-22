# Get script dir
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_DIR=$(pwd)


sudo pacman -Syu

# Create pacman config file
sed "s|__PROJECT_DIR__|$PROJECT_DIR|g" pacman.conf.template > pacman.conf

# Build Calamares
source "$SCRIPT_DIR/calamares.sh"
extract_calamares_snapshot
build_calamares

# Add local repo
mkdir -p ./local-repo
cp ./calamares/calamares-*.pkg.tar.zst ./local-repo
repo-add ./local-repo/custom.db.tar.gz ./local-repo/*.pkg.tar.zst


