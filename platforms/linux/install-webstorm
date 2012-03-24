#!/bin/sh

# sudo sh -c "echo $data >>$logfile"

# --------------------------------------------------
#  Setup Webstorm 2
# --------------------------------------------------
echo "Installing Webstorm..."

wget http://download-ln.jetbrains.com/webide/WebStorm-3.0.3.tar.gz
if [ $? -ne 0 ]; then
  echo "Webstorm: Failed to download package, please check package name."
  exit 1
fi

tar -xvf WebStorm-3.0.3.tar.gz
rm WebStorm-3.0.3.tar.gz

sudo mv WebStorm-111.344 /usr/lib/Webstorm-3.0.3
sudo ln -s /usr/lib/Webstorm-3.0.3 /usr/lib/Webstorm
sudo ln -s /usr/lib/Webstorm-3.0.3/bin/webstorm.sh /usr/bin/webstorm
sudo cp /usr/lib/Webstorm/bin/webide.png /usr/share/pixmaps/webstorm.png

sudo sh -c 'echo "[Desktop Entry]" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Encoding=UTF-8" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Version=1.0" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Name=Webstorm" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Comment=IDE for web development" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Categories=Development;" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Exec=/usr/bin/webstorm" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Icon=/usr/share/pixmaps/webstorm.png" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Terminal=false" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'
sudo sh -c 'echo "Type=Application" | tee -a /usr/share/applications/jetbrains-webstorm.desktop'

xdg-desktop-menu install /usr/share/applications/jetbrains-webstorm.desktop

tar -xvf dotfiles/.WebIde10.tar.gz
mv .WebIde10 ~/.WebIde10

# --------------------------------------------------
#  Setup Webstorm Upgrade
# --------------------------------------------------
echo "Setting up upgradewebstorm..."

mkdir ~/.local
cp platforms/linux/upgrade-webstorm.sh ~/.local/upgrade-webstorm.sh
echo 'alias upgradewebstorm="$HOME/.local/upgrade-webstorm.sh"' | tee -a ~/.bash_aliases

chmod 755 ~/.local/upgrade-webstorm.sh

if [ $?=0 ]
then echo "Webstorm: installed"
else
  echo "Webstorm: failed"
  exit 1
fi
