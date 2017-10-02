#!/bin/bash

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

phpdismod -s cli xdebug
