#!/bin/bash

{
    curl -sL https://deb.nodesource.com/setup_8.x | bash -
} || {
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
}

apt-get install -y \
    nodejs \
    ruby-full \
    ruby-sass \

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update && apt-get install yarn -y
