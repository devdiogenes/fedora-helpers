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

# Restart Apache service to apply changes
sudo systemctl restart httpd.service

# Change selinux rules for allow apache using www folder
sudo chcon -R -t httpd_sys_rw_content_t /var/www

echo "LAMP stack installation complete."