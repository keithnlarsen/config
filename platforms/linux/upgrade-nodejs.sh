#!/bin/sh

# --------------------------------------------------
#  Upgrade NodeJS
# --------------------------------------------------
read -p "Please enter the tag number you wish to upgrade to: " version

mkdir -p .nodejssetup
cd .nodejssetup

git clone git://github.com/joyent/node.git
cd node
git checkout $version
export GCC_VERSION=44
./configure
make
sudo make install

cd ..

echo "Removing temporary files"
cd ..
rm -rf .nodejssetup

if [ $?=0 ]
then echo "NodeJS: upgraded"
else
  echo "NodeJS: failed"
  exit 1
fi
