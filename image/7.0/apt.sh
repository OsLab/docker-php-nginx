#!/bin/bash

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update -q

apt-get install --no-install-recommends -qy \
    php7.0 \
    php7.0-common \
    php7.0-cli \
    php7.0-curl \
    php7.0-fpm \
    php7.0-gd \
    php7.0-intl \
    php7.0-json \
    php7.0-memcached \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-sqlite \
    php7.0-xdebug \
    php7.0-zip \
    php7.0-dev \
    php7.0-mbstring \
    php-pear \

phpdismod -s cli xdebug

pecl install mongodb redis
