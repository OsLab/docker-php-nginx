#!/bin/bash

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update -q

apt-get install --no-install-recommends -qy \
    php7.1 \
    php7.1-bcmath \
    php7.1-common \
    php7.1-curl \
    php7.1-dom \
    php7.1-fpm \
    php7.1-gd \
    php7.1-iconv \
    php7.1-intl \
    php7.1-json \
    php7.1-memcached \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-pdo \
    php7.1-phar \
    php7.1-sqlite \
    php7.1-xdebug \
    php7.1-xml \
    php7.1-zip \

phpdismod -s cli xdebug
