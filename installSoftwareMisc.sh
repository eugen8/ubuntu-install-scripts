#!/bin/bash

echo Installing GNU Octave
sudo apt-get install octave -y
echo Octave installed, to start run: octave --force-gui


echo Installing vim
sudo apt remove -y vim-tiny
sudo apt install -y vim





