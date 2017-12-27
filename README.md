<p align="center">
    <img src="https://avatars2.githubusercontent.com/u/29777546?s=200&v=4?v=3&s=200">
</p>

Nginx PHP-FPM
========================
> Sandbox for development - container running Nginx + PHP-FPM

> Adapt for any type of project (Framework, CMS, legacy ..)

 [![Docker Pulls](https://img.shields.io/docker/pulls/dockerphp/nginx.svg)](#)  [![Build Status](https://api.travis-ci.org/OsLab/docker-php-nginx.svg?branch=master)](#) 

## Official docker repository

Docker Hub: https://hub.docker.com/r/dockerphp/nginx/

## Supported tags
| Os                 | PHP | Image                       | Layers |
|--------------------|-----|-----------------------------|--------|
| Debian 8 (Jessie)  | 7.2 | dockerphp/nginx:7.2-jessie  | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.2-jessie.svg)](https://microbadger.com/images/dockerphp/nginx:7.2-jessie) |
| Debian 9 (Stretch) | 7.2 | dockerphp/nginx:7.2-stretch | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.2-stretch.svg)](https://microbadger.com/images/dockerphp/nginx:7.2-stretch) |
| Debian 8 (Jessie)  | 7.1 | dockerphp/nginx:7.1-jessie  | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.1-jessie.svg)](https://microbadger.com/images/dockerphp/nginx:7.1-jessie) |
| Debian 9 (Stretch) | 7.1 | dockerphp/nginx:7.1-stretch | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.1-stretch.svg)](https://microbadger.com/images/dockerphp/nginx:7.1-stretch) |
| Debian 8 (Jessie)  | 7.0 | dockerphp/nginx:7.0-jessie  | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.0-jessie.svg)](https://microbadger.com/images/dockerphp/nginx:7.0-jessie) |
| Debian 9 (Stretch) | 7.0 | dockerphp/nginx:7.0-stretch | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:7.0-stretch.svg)](https://microbadger.com/images/dockerphp/nginx:7.0-stretch)
| Debian 8 (Jessie)  | 5.6 | dockerphp/nginx:5.6-jessie  | [![](https://images.microbadger.com/badges/image/dockerphp/nginx:5.6-jessie.svg)](https://microbadger.com/images/dockerphp/nginx:5.6-jessie) |
> Based on [Official PHP images Debian](https://hub.docker.com/_/debian/) and all versions come with:

* Dependency Manager:
    * [Composer]
* [Nginx]
* [PHP]
* [Ruby]
* [Sass]
* [Yarn]
* [Git]

## Required

The sandbox uses [Docker][docker], a container tool for setting up a rapid development environment. The project has only two prerequisites:

- [Docker][docker] (1.12+)
- [Docker-composer][docker-compose] (1.10+)

## Usage

### Simple usage

Access to the container console easily:

    docker run --rm -ti -v $(pwd):/app dockerphp/nginx:7.2-stretch bash

### Configuration of your Docker compose

#### Basic configuration

Create a file called `docker-compose.yml` in your project directory and paste the following:

```yaml
version: "2"

services:
    app:
        image: dockerphp/nginx:7.2-stretch
        depends_on:
            - db
            - memcached
        volumes:
            - .:/app
        ports:
            - "8080:443"

    db:
        image: mariadb:10.3
        environment:
            MYSQL_ROOT_PASSWORD: root
  
    memcached:
        image: memcached:latest
        mem_limit: 1g

    pma:
        image: phpmyadmin/phpmyadmin
        depends_on:
            - db
        environment:
            PMA_HOST: db
            PMA_USER: root
            PMA_PASSWORD: root
        ports:
            - "127.0.0.1:8081:80"
```

Build and run your app with Compose:

```
$ docker-compose up -d --remove-orphans
```

Enter [http://localhost:8080/](http://localhost:8080/) in a browser to see the application running.

#### Overloading configurations

You can override the nginx or PHP configuration easily as well:

```yaml
services:
    app:
        image: dockerphp/nginx:7.2-stretch
        volumes:
            - .:/app
            - ./docker/etc/nginx/nginx.conf:/etc/nginx/nginx.conf
            - ./docker/php.ini:/etc/php5/fpm/php.ini
```

Example for Symfony Flex, overload `nginx.conf`:

```
daemon off;
user www-data;
worker_processes 5;
pid /run/nginx.pid;

error_log /dev/stdout info;

events {
    worker_connections 1024;
    # multi_accept on;
}

http {
    access_log /dev/stdout;

    ##
    # Basic Settings
    ##

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    types {
        font/woff2 woff2;
    }
    client_max_body_size 10M;

    ##
    # Virtual Host Configs
    ##

    server {
        listen 443 ssl;
        server_name oslab.demo.net;

        ssl on;
        ssl_certificate /etc/ssl/nginx/nginx.crt;
        ssl_certificate_key /etc/ssl/nginx/nginx.key;

        root /app/public;
        index index.php;

        location / {
            try_files $uri /index.php$is_args$args;
        }

        location ~ \.php(/|$) {
            internal;

            fastcgi_pass 127.0.0.1:9000;
            fastcgi_split_path_info ^(.+\.php)(/.*)$;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param SYMFONY_ENV dev;
            fastcgi_param HTTPS on;

            fastcgi_buffers 16 16k;
            fastcgi_buffer_size 32k;
        }
    }
}
```

An example of `php.ini` overload for writing sessions in memcached.

```
; Add here the parameters that you want to override

short_open_tag = Off
date.timezone = Europe/Paris
error_log = /proc/self/fd/2
upload_max_filesize = 10M
post_max_size = 10M
memory_limit=1024M

; https://symfony.com/doc/3.4/performance.html
opcache.max_accelerated_files = 20000
realpath_cache_size=4096K
realpath_cache_ttl=600

; xdebug
xdebug.remote_enable=on
xdebug.remote_autostart=off
xdebug.remote_port=9000
xdebug.remote_handler=dbgp
xdebug.remote_connect_back=0

;session.save_handler=memcached
memcached session.save_path = 'tcp://memcached_1:11211,tcp://memcached_2:11211'
```

---

## License

This project is released under the MIT License, you agree to license your code under the [MIT license](LICENSE)

[docker]: https://www.docker.com
[docker-compose]: https://docs.docker.com/compose/install/
[Sass]: http://sass-lang.com/
[Yarn]: https://yarnpkg.com
[Git]: https://git-scm.com/
[PHP]: https://secure.php.net/
[Ruby]: https://www.ruby-lang.org/
[Nginx]: https://nginx.org/
[Composer]: https://getcomposer.org/
