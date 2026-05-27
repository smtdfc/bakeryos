echo "Creating Live User"
useradd -m -G wheel,video,audio,storage -s /bin/bash bakery
passwd -d bakery

mkinitcpio -k /boot/vmlinuz-linux -g /boot/initramfs-linux.img
