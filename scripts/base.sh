
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_DIR="$(dirname "$SCRIPT_DIR")" 


DATA_DIR="${PROJECT_DIR}/data"
SNAPSHOT_DIR="${PROJECT_DIR}/pkg-snapshots"
SNAPSHOT_TARGET_DIR="${DATA_DIR}/pkgs"
LOCAL_REPO_DIR="${DATA_DIR}/local-repo"
GNOME_EXTENSION_DIR="${DATA_DIR}/gnome-extensions"
GNOME_EXTENSION_INSTALL_DIR="${PROJECT_DIR}/airootfs/usr/share/gnome-shell/extensions"
