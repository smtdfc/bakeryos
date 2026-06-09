source $(dirname "$(readlink -f "$0")")/base.sh


echo "Installing Dash to panel extension"
sudo wget -O $GNOME_EXTENSION_DIR/dash-to-panel@jderose9.github.com.zip  https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v73.shell-extension.zip 
sudo unzip $GNOME_EXTENSION_DIR/dash-to-panel@jderose9.github.com.zip -d $GNOME_EXTENSION_INSTALL_DIR/dash-to-panel@jderose9.github.com

echo "Installing Blur my shell extension"
sudo wget -O $GNOME_EXTENSION_DIR/blur-my-shell@aunetx.zip  https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v71.shell-extension.zip
sudo unzip $GNOME_EXTENSION_DIR/blur-my-shell@aunetx.zip -d $GNOME_EXTENSION_INSTALL_DIR/blur-my-shell@aunetx/

echo "Installing Tiling Shell extension"
sudo wget -O $GNOME_EXTENSION_DIR/tilingshell@ferrarodomenico.com.zip  https://extensions.gnome.org/extension-data/tilingshellferrarodomenico.com.v76.shell-extension.zip
sudo unzip $GNOME_EXTENSION_DIR/tilingshell@ferrarodomenico.com.zip -d $GNOME_EXTENSION_INSTALL_DIR/tilingshell@ferrarodomenico.com/
