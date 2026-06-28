source $(dirname "$(readlink -f "$0")")/base.sh
repo-add $LOCAL_REPO_DIR/custom.db.tar.gz $LOCAL_REPO_DIR/*.pkg.tar.zst
