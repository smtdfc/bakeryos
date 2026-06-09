
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
    find $SNAPSHOT_TARGET_DIR -maxdepth 1 -mindepth 1 -type d | while read -r folder; do
        echo "-----------------------------------"
        echo "Building: $folder ..."
        
        cd "$folder" || continue
        
        makepkg -s --noconfirm
        
       if ls ./*.pkg.tar.zst >/dev/null 2>&1; then
            cp ./*.pkg.tar.zst "$LOCAL_REPO_DIR/"
            echo "Copied"
        else
            echo "No package found. Skipped!"
        fi
        
        cd - > /dev/null || exit
        echo "Done: $folder"
    done
}
