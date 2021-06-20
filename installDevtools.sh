#!/bin/bash
#https://code.visualstudio.com/docs/setup/linux

sudo apt install curl -y;

echo "Installing visual studio code" ;

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install code # or code-insiders

# install OpenJDK
sudo apt install openjdk-16-jdk-headless

export JAVA_HOME=/usr/lib/jdk-16.0.1+9

curl -s "https://get.sdkman.io" | bash 

sdk install scala

# to uninstall sdk: https://sdkman.io/install: