#!/bin/bash

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update -q

apt-get install --no-install-recommends -qy \
    php7.2 \
    php7.2-bcmath \
    php7.2-common \
    php7.2-curl \
    php7.2-dom \
    php7.2-fpm \
    php7.2-gd \
    php7.2-iconv \
    php7.2-intl \
    php7.2-json \
    php7.2-memcached \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-pdo \
    php7.2-phar \
    php7.2-sqlite \
    php7.2-xml \
    php7.2-zip \
    php7.2-dev \
    php-pear \

pecl install mongodb

phpdismod -s cli xdebug

git clone https://github.com/xdebug/xdebug.git
cd xdebug
./rebuild.sh
cd ..
rm -rf xdebug
