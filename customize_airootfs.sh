#!/bin/bash



echo "Creating Live User"
useradd -m -G wheel,video,audio,storage -s /bin/bash bakery-live-user
passwd -d bakery-live-user


echo "Configuring KDE Plasma for Live User..."

# sudo -u bakery-live-user kwriteconfig6 --file kwinrc --group Effect-blur --key Enabled false
# sudo -u bakery-live-user kwriteconfig6 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Wallpaper --group org.kde.image --group General 


rm -f /etc/pacman.d/hooks/bakery_hook.hook
