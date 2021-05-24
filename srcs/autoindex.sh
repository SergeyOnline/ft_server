#!/bin/bash

file='/etc/nginx/sites-available/localhost'

if grep --silent 'autoindex on' $file
then
sed -i '/autoindex/s/on/off/g' $file
sed -i '/index index.php index.html index.htm/s/index index.php index.html index.htm/index index.php index.html index.htm index.nginx-debian.html/g' $file
echo -e "\e[33mautoindex \e[31m[off]\e[39m"
elif grep --silent 'autoindex off' $file
then
sed -i '/autoindex/s/off/on/g' $file
sed -i '/index index.php index.html index.htm index.nginx-debian.html/s/index index.php index.html index.htm index.nginx-debian.html/index index.php index.html index.htm/g' $file
echo -e "\e[33mautoindex \e[32m[on]\e[39m"
fi

service nginx restart
