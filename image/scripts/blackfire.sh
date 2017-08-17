#!/usr/bin/env bash

# Add Repo
wget -O - https://packagecloud.io/gpg.key | apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list
apt-get update

# Install agent
apt-get install blackfire-agent
version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;")
curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$version
tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp
mv /tmp/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so
printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php/7.1/cli/conf.d/blackfire.ini
printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > /etc/php/7.1/fpm/conf.d/blackfire.ini
