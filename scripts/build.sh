source $(dirname "$(readlink -f "$0")")/base.sh

source "$SCRIPT_DIR/theme.sh"
build_theme


sudo mkarchiso -C ./pacman.conf -v -w work/ -o out/ .
