source "$SCRIPT_DIR/theme.sh"
build_theme


sudo mkarchiso -C ./pacman.conf -v -w work/ -o out/ .
