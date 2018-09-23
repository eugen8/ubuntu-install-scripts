#!/bin/bash

echo Installing GNU Octave
sudo apt-get install octave -y
echo Octave installed, to start run: octave --force-gui


echo Installing vim
sudo apt remove -y vim-tiny
sudo apt install -y vim


#installing chromium
#https://www.simplified.guide/ubuntu/install-chromium-browser
sudo apt install -y chromium-browser
chromium-browser



#installing atom
#https://flight-manual.atom.io/getting-started/sections/installing-atom/
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update
sudo apt-get install atom -y
sudo apt-get install atom-beta -y



