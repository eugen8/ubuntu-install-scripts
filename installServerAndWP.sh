#!/bin/bash
#https://www.tecmint.com/install-wordpress-on-ubuntu-16-04-with-lamp/

sudo apt-get install apache2 apache2-utils 

sudo systemctl enable apache2
sudo systemctl start apache2


sudo apt-get install php7.2 php7.2-mysql libapache2-mod-php7.2 php7.2-cli php7.2-cgi php7.2-gd 

#https://stackoverflow.com/questions/13633638/create-file-with-contents-from-shell-script
sudo cat > /var/www/html/info.php << EOF
<?php
phpinfo();
?>
EOF

wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo rsync -av wordpress/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/


#https://stackoverflow.com/questions/6150675/how-to-feed-mysql-queries-from-bash
sudo mysql --user=root --host=localhost << END
CREATE DATABASE wp_tidier;
GRANT ALL PRIVILEGES ON wp_tidier.* TO 'tidier'@'localhost' IDENTIFIED BY 'tidier';
FLUSH PRIVILEGES;
END
#also could feed queries from file: https://stackoverflow.com/questions/8940230/how-can-i-run-an-sql-script-in-mysql



#https://gist.github.com/bgallagh3r/2853221
echo setting database details with perl find and replace
cd /var/www/html
#sudo mv wp-config-sample.php wp-config.php

echo $PWD
#ls -al

dbname="wp_tidier"
dbuser="tidier"
dbpass="tidier"
echo "db=$dbname - user=$dbuser - pass=$dbpass"

#set database details with perl find and replace


sudo perl -pi -e "s/'DB_USER', ''/'DB_USER', '$dbuser'/g" wp-config.php
sudo perl -pi -e "s/'DB_NAME', ''/'DB_NAME', '$dbname'/g" wp-config.php
sudo perl -pi -e "s/'DB_PASSWORD', ''/'DB_PASSWORD', '$dbpass'/g" wp-config.php
cat wp-config.php | grep DB_

cd ~/Desktop



sudo systemctl restart apache2.service 
sudo systemctl restart mysql.service

sudo mv /var/www/html/index.html /var/www/html/index-back.html

echo Now open the browser and point to localhost


echo Install wordpress utilities (wp cli)
#https://www.linode.com/docs/websites/cms/install-wordpress-using-wp-cli-on-ubuntu-14-04/
#https://make.wordpress.org/cli/handbook/installing/
#https://deliciousbrains.com/creating-custom-table-php-wordpress/
#https://www.businessinsider.com/job-interview-questions-best-and-worst-2018-7#ask-whats-your-staff-turnover-rate-and-what-are-you-doing-to-reduce-it-41
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

wp --info



echo "writing configuration file"
#mkdir ~/.wp-cli
cat > ~/.wp-cli/config.yml <<EOF
path: /var/www/html
url: localhost
EOF

wp user list --debug

echo "Making wp cli able to provide autocomplete"
wget https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash
mv wp-completion.bash ~/.wp-cli/
source ~/.wp-cli/wp-completion.bash


touch ~/.bash_aliases
echo "source ~/.wp-cli/wp-completion.bash" >> ~/.bash_aliases

#https://superuser.com/questions/386885/creating-files-and-directories-with-a-certain-owner-user-group-while-sudoing
#https://unix.stackexchange.com/questions/182212/chmod-gs-command
sudo chmod g+s /var/www/html  #to be creating files with the group of html folder (i.e. www-data)

# don't do this on the production or some actual server, but it's good for localhost development!
sudo chmod -R 777 /var/www/html

#https://nodejs.org/en/download/package-manager/
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

