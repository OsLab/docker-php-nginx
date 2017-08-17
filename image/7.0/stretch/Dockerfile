FROM debian:stretch

MAINTAINER Florent DESPIERRES <florent.despierres.ext@francetv.fr>

# Copy all scripts
COPY ./image/scripts/*.sh /tmp/
COPY ./image/7.0/*.sh /tmp/
RUN chmod +x /tmp/*.sh

# Run all scripts
RUN sh /tmp/env.sh && \
    sh /tmp/apt-common.sh && \
    sh /tmp/apt-php.sh && \
    sh /tmp/composer.sh \

# Config
COPY ./image/config/php.ini /etc/php/7.0/cli/php.ini
COPY ./image/config/pool.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY ./image/config/nginx.conf /etc/nginx/nginx.conf
COPY ./image/7.0/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./image/config/ssl/ /etc/ssl/nginx/

# Run supervisor
EXPOSE 80 443

WORKDIR /app

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
