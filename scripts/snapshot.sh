
extract_all_snapshot(){
    for file in "$SNAPSHOT_DIR"/*.tar.*; do
        echo "-----------------------------------"
        [ -e "$file" ] || continue

        filename=$(basename "$file" | cut -d. -f1)
        target_dir="$SNAPSHOT_TARGET_DIR/$filename"

        mkdir -p "$target_dir"

        echo "Extracting $filename to $target_dir ..."
        tar -xvf "$file" -C "$target_dir" --strip-components=1
    done
}

build_all_pkg(){
    find ./pkgs -maxdepth 1 -mindepth 1 -type d | while read -r folder; do
        echo "-----------------------------------"
        echo "Building: $folder ..."
        
        cd "$folder" || continue
        
        makepkg -s --noconfirm
        
        cp ./*.pkg.tar.zst ../../local-repo/ 2>/dev/null || echo "No package found. Skipped!"
        cd - > /dev/null || exit
        echo "Done: $folder"
    done
}
