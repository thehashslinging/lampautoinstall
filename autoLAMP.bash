#!/bin/bash

# Perbarui dan upgrade sistem
echo "Memperbarui dan meningkatkan sistem..."
sudo apt update && sudo apt upgrade -y

# Instal Apache2
echo "Menginstal Apache2..."
sudo apt install -y apache2

# Ubah konfigurasi Apache untuk menggunakan port 2002
echo "Mengubah konfigurasi Apache ke port 2002..."
sudo sed -i 's/80/2002/g' /etc/apache2/ports.conf
sudo sed -i 's/:80/:2002/g' /etc/apache2/sites-enabled/000-default.conf
sudo sed -i 's/:80/:2002/g' /etc/apache2/sites-available/000-default.conf

# Restart Apache untuk menerapkan perubahan
echo "Restarting Apache..."
sudo systemctl restart apache2

# Instal PHP dan modul-modulnya
echo "Menginstal PHP dan modul-modul yang diperlukan..."
sudo apt install -y php libapache2-mod-php php-mysql php-mbstring php-xml php-curl php-gd php-zip

# Instal phpMyAdmin
echo "Menginstal phpMyAdmin..."
sudo apt install -y phpmyadmin

# Nonaktifkan strict mode di MariaDB
echo "Menonaktifkan strict mode di MariaDB..."
sudo sed -i '/\[mysqld\]/a sql_mode=""' /etc/mysql/mariadb.conf.d/50-server.cnf

# Restart MariaDB untuk menerapkan perubahan
echo "Restarting MariaDB..."
sudo systemctl restart mariadb

# Restart Apache lagi untuk memastikan semua konfigurasi diterapkan
echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Semua paket berhasil diinstal dan Apache menggunakan port 2002!"
