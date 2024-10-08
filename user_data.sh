#!/bin/bash
HOSTNAME=$(hostname)
sudo apt update -y
sudo apt install -y apache2
sudo rm /var/www/html/index.html
echo "<html><head><title>Terraform Practice</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Host is: <br>$HOSTNAME</br> and IP is: <br>$(curl -4 -s ifconfig.me)</br></span></span></p></body></html>" | sudo tee /var/www/html/index.html
sudo systemctl enable apache2
sudo systemctl start apache2
sudo ufw allow 80