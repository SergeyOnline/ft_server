#!/bin/bash

echo -e "\e[32mWelcome to the ft_server container\e[39m"

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

openssl req -x509 -days 30 -newkey rsa:2048 -keyout сca.key -nodes -out ca.crt -subj '/C=RU/L=Ufa/CN=sbroderi' -out /etc/ssl/certs/ft_server.crt -keyout /etc/ssl/certs/ft_server.key

service mysql start && sleep 1 && mysqladmin -u root password 'root' && mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION; flush privileges; create database wordpress;"
echo -e "\e[34mThe database is running.\nThe password for the root user has been changed.\e[39m"

#echo "create database wordpress; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION; flush privileges;" | mysql

mv srcs/nginx.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/default
mv srcs/wp-config.php /var/www/html/wordpress/

mv srcs/config.inc.php /var/www/html/phpmyadmin/

service php7.3-fpm start
service nginx start

bash
