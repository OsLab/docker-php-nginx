#!/bin/bash

apt-get install --no-install-recommends -qy \
    php5 \
    php5-common \
    php5-cli \
    php5-curl \
    php5-fpm \
    php5-gd \
    php5-intl \
    php5-json \
    php5-mcrypt \
    php5-mysql \
    php5-sqlite \
    php5-xdebug \
    php5-memcached \
    php5-dev \
    php-pear \

# https://docs.mongodb.com/ecosystem/drivers/driver-compatibility-reference/#php-driver-compatibility
pecl install mongo
pecl install mongodb redis

php5dismod -s cli xdebug
