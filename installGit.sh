#!/bin/bash
# installing git @eugen

sudo apt-get install git -y
echo "Git installed, configuring.."

echo 'enter git global user:';
read GITUSR;
git config --global user.name "${GITUSR}"

echo 'enter git global email:';
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo "Done configuring GIT, good luck!"

git config --list

