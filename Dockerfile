# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/22 13:01:59 by Sbroderi          #+#    #+#              #
#    Updated: 2020/06/22 13:02:02 by Sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vim wget nginx mariadb-server php php-mysql php-fpm php-mbstring

RUN mkdir -p ../var/www/html/phpmyadmin && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -zxvf latest.tar.gz -C ../var/www/html && \
    rm latest.tar.gz && \
    wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
    tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz -C ../var/www/html/phpmyadmin --strip-components 1 && \
    rm phpMyAdmin-5.0.2-all-languages.tar.gz

COPY srcs srcs

CMD bash srcs/configuration.sh