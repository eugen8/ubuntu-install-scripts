#How to Open Ports in Ubuntu and CentOS using IPtables
#https://www.rosehosting.com/blog/how-to-open-ports-in-ubuntu-and-centos-using-iptables/
sudo iptables -L
#sudo iptables -F
# basically tells your firewall to accept your current SSH connection
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# allow traffic on your loopback interface and to open some basic ports like 22 for SSH and 80 for HTTP.
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "List current rules again"
sudo iptables -L

echo "For more detailed output:"
sudo iptables -nvL

#impelment DROP rules to block incomming packages that don't match ACCEPT rules
sudo iptables -P INPUT DROP

#to persist the changes (Ubuntu)
sudo apt-get install iptables-persistent
sudo netfilter-persistent save
sudo netfilter-persistent reload
