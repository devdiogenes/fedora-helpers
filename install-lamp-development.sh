#!/bin/bash

# Update the system
sudo dnf update -y

# Install Apache web server
sudo dnf install httpd -y

# Start and enable Apache service
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# Install MariaDB database server
sudo dnf install mariadb-server -y

# Start and enable MariaDB service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

# Secure the MariaDB installation
sudo mysql_secure_installation

# Install PHP and required modules
sudo dnf install php php-mysqlnd php-gd php-xml php-mbstring -y

# Change selinux rules for allow apache run without problems
sudo chcon -R -t httpd_sys_rw_content_t /var/www
sudo setsebool -P httpd_can_network_connect 1
sudo setsebool -P httpd_can_network_connect_db 1

# Restart Apache service to apply changes
sudo systemctl restart httpd.service

echo "LAMP stack installation complete."
