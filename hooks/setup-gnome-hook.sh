echo "Compiling Gschema 2.0 ..."
glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "Setup Gnome extensions ... "

for dir in /usr/share/gnome-shell/extensions/*; do
    if [ -d "$dir/schemas" ]; then
        echo "Compiling  $dir"
        sudo glib-compile-schemas "$dir/schemas"
    fi
done

dconf compile /etc/dconf/db/local /etc/dconf/db/local.d/

echo "Done"
