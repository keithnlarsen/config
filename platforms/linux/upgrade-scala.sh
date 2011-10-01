#!/bin/bash

# --------------------------------------------------
#  Scala-Upgrade
# --------------------------------------------------
read -p "Please enter the version number you wish to upgrade to: " version

wget http://www.scala-lang.org/sites/default/files/linuxsoft_archives/downloads/distrib/files/scala-$version.tgz
if [ $? -ne 0 ]; then
  echo "Scala: Failed to download package, please check package name."
  exit 1
fi

tar -xvf scala-$version.tgz
rm scala-$version.tgz

sudo mv scala-$version /usr/lib/scala-$version
sudo rm /usr/bin/scala
sudo rm /usr/bin/scalac
sudo rm /usr/lib/scala
sudo ln -s /usr/lib/scala-$version/bin/scala /usr/bin/scala
sudo ln -s /usr/lib/scala-$version/bin/scalac /usr/bin/scalac
sudo ln -s /usr/lib/scala-$version /usr/lib/scala

if [ $?=0 ]
then echo "Scala: upgraded"
else
  echo "Scala: failed"
  exit 1
fi

