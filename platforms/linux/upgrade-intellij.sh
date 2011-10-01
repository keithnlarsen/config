#!/bin/sh

# --------------------------------------------------
#  Upgrade IntelliJ
# --------------------------------------------------
read -p "Please enter the version number you wish to upgrade to: " version

wget http://download-ln.jetbrains.com/idea/ideaIC-$version.tar.gz

if [ $? -ne 0 ]; then
  echo "Intelli-J: Failed to download package, please check package name."
  exit 1
fi

tar -xvf ideaIC-$version.tar.gz
rm ideaIC-$version.tar.gz

sudo rm /usr/bin/intellij
sudo rm /usr/lib/Intelli-J
sudo rm -rf /usr/lib/Intelli-J-*

sudo mv idea-IC-* /usr/lib/Intelli-J-$version
rm idea-IC-*
sudo ln -s /usr/lib/Intelli-J-$version /usr/lib/Intelli-J
sudo ln -s /usr/lib/Intelli-J-$version/bin/idea.sh /usr/bin/intellij

if [ $?=0 ]
then echo "Intelli-J: upgraded"
else
  echo "Intelli-J: failed"
  exit 1
fi
