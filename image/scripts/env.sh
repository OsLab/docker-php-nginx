#!/bin/bash
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export DEBIAN_FRONTED="noninteractive"
export NODE_VERSION="8.9.4"

mkdir -p /var/run/php

useradd --uid 1000 -U php --shell /bin/bash --no-create-home

echo "/etc/motd" >> /etc/bash.bashrc
echo "alias php-xdebug='/usr/bin/php -dzend_extension=xdebug.so -dxdebug.remote_enable=1'" >> /etc/bash.bashrc
