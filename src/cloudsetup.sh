#!/usr/bin/env bash

curl -O https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh

chmod +x android_build_env.sh

./android_build_env.sh

git config --global user.name "Pete Fotheringham"
git config --global user.email petefoth@e.email

sudo mkdir /ccache
sudo chmod a+rwx /ccache/

mkdir work

cd work

git clone https://github.com/petefoth/unofficial-l4m-builds.git l4m-builds

echo "Now follow the commands in l4m-builds/README.md"

