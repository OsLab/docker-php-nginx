<p align="center">
    <img src="https://avatars2.githubusercontent.com/u/29777546?s=200&v=4?v=3&s=200">
</p>

Nginx PHP-FPM
========================
> Sandbox for development - container running Nginx + PHP-FPM

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

Acces to the container console easily:

    docker run --rm -ti -v /your/project:/app dockerphp/nginx:7.2-jessie bash

### Configuration of your Docker compose

#### Basic configuration with Symfony

Create a file called docker-compose.yml in your project directory and paste the following:

```yaml
version: "2"

services:
    app:
        image: dockerphp/nginx:7.1-jessie
        depends_on:
            - db
            - memcached
        volumes:
            - .:/app
            - /app/var/
        ports:
            - "8080:443"

    db:
        image: mariadb:10.3
        environment:
            MYSQL_ROOT_PASSWORD: root
        ports:
            - "3301:3306"

    memcached:
        image: memcached:latest
        ports:
          - "11221:11211"
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
$ docker-compose up
```

Enter [http://localhost:8080/](http://localhost:8080/) in a browser to see the application running.

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
