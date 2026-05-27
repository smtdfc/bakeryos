#!/bin/bash


echo "Creating Live User"
useradd -m -G wheel,video,audio,storage -s /bin/bash bakery-live-user
passwd -d bakery-live-user

echo "Compiling GSettings schemas..."
glib-compile-schemas /usr/share/glib-2.0/schemas/

sudo -u bakery-live-user dbus-launch gsettings set org.gnome.shell.extensions.ding show-trash false
sudo -u bakery-live-user dbus-launch gsettings set org.gnome.shell.extensions.ding show-home false
