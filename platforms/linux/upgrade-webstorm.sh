#!/bin/sh

# --------------------------------------------------
#  Upgrade IntelliJ
# --------------------------------------------------
read -p "Please enter the version number you wish to upgrade to: " version

wget http://download-ln.jetbrains.com/webide/WebStorm-$version.tar.gz

if [ $? -ne 0 ]; then
  echo "Webstorm: Failed to download package, please check package name."
  exit 1
fi

tar -xvf WebStorm-$version.tar.gz
rm WebStorm-$version.tar.gz

sudo rm /usr/bin/webstorm
sudo rm /usr/lib/Webstorm
sudo rm -rf /usr/lib/Webstorm-*

sudo mv WebStorm-* /usr/lib/Webstorm-$version
rm WebStorm-*
sudo ln -s /usr/lib/Webstorm-$version /usr/lib/Webstorm
sudo ln -s /usr/lib/Webstorm-$version/bin/WebStorm.sh /usr/bin/webstorm

if [ $?=0 ]
then echo "Webstorm: upgraded"
else
  echo "Webstorm: failed"
  exit 1
fi
