

extract_calamares_snapshot(){
    mkdir -p ./pkgs/calamares
    echo "Extracting Calamares Snapshot ..."
    tar -xzvf ./pkg-snapshots/calamares.tar.gz --strip-components=1 -C ./pkgs/calamares

}


build_calamares(){
    echo "Bulding Calamares ..."
    cd ./pkgs/calamares
    makepkg -si

    cd ../../
}
