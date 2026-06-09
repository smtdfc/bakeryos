source $(dirname "$(readlink -f "$0")")/base.sh

# source "$SCRIPT_DIR/theme.sh"
# build_theme


sudo bash $PROJECT_DIR/tools/bakeryos-mkiso/run.sh -C ./pacman.conf -v -w work/ -o out/ .
