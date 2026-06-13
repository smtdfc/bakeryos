#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="bakeryos"
iso_label="BAKERY_OS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Bakery OS"
iso_application="Bakery OS Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_script="customize_airootfs.sh"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"

  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/compile-schemas.sh"]="0:0:755"

  ["/etc/skel/Desktop/bakery-installer.desktop"]="0:0:755"
    
  ["/usr/bin/bakery-os-installer"]="0:0:755"
  ["/usr/local/bin/bakery_os_patch_script.sh"]="0:0:755"

  ["/etc/issue"]="0:0:644"
  ["/etc/os-release"]="0:0:644"
  ["/etc/nftables.conf"]="0:0:644"


  ["/usr/share/bakery/logo.txt"]="0:0:644"

  ["/etc/sudoers.d/bakeryos"]="0:0:440"
)


