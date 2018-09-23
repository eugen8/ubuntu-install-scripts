#for noip.com - How to Install the Dynamic Update Client (DUC) on Linux
#http://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/
#https://my.noip.com/#!/dynamic-dns/duc


#echo
# github authentication without password
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/


# https://help.github.com/articles/connecting-to-github-with-ssh/
# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
sudo apt-get install xclip
# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)
xclip -sel clip < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
#need to follow the instructions there
# https://help.github.com/articles/testing-your-ssh-connection/


#this is how to set the URL in local to connect to github
# https://stackoverflow.com/questions/14762034/push-to-github-without-password-using-ssh-key
git remote set-url origin git@github.com:eugen8/ubuntu-install-scripts.git


#ubuntu firewall
# https://help.ubuntu.com/lts/serverguide/firewall.html.en
