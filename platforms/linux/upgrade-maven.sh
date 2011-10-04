#!/bin/bash

# --------------------------------------------------
#  Maven-Upgrade
# --------------------------------------------------
read -p "Please enter the version number you wish to upgrade to: " version

wget http://apache.sunsite.ualberta.ca/maven/binaries/apache-maven-$version-bin.tar.gz
if [ $? -ne 0 ]; then
  echo "Maven: Failed to download package, please check package name."
  exit 1
fi

tar -xvf apache-maven-$version-bin.tar.gz
rm apache-maven-$version-bin.tar.gz

sudo rm /usr/bin/mvn
sudo rm /usr/lib/apache-maven

sudo mv apache-maven-$version /usr/lib/apache-maven-$version
sudo ln -s /usr/lib/apache-maven-$version /usr/lib/apache-maven
sudo ln -s /usr/lib/apache-maven-$version/bin/mvn /usr/bin/mvn

if [ $?=0 ]
then echo "Maven: upgraded"
else
  echo "Maven: failed"
  exit 1
fi

