#!/bin/bash

# Common tools
apt-get update -q
apt-get install -qy \
    software-properties-common \
    apt-utils \
    ca-certificates \
    make \
    gcc \
    wget \
    curl \
    nano \
    git \
    tar \

## PHP
apt-get install --no-install-recommends -qy \
    nginx \
    graphviz \
    ruby-full \
    tzdata \
    memcached \
    mysql-client \
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
    supervisor \

## Clear APT
apt-get clean
rm -rf /var/lib/apt/lists/*