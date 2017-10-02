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

npm install yarn -g
