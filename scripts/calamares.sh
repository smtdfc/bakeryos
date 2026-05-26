

extract_calamares_snapshot(){
    mkdir -p ./calamares
    echo "Extracting Calamares Snapshot ..."
    tar -xzvf ./assets/calamares.tar.gz --strip-components=1 -C ./calamares

}


build_calamares(){
    echo "Bulding Calamares ..."
    cd ./calamares
    makepkg -si

    cd ../
}
