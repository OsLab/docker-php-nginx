FROM debian:jessie

MAINTAINER Florent DESPIERRES <florent.despierres.ext@francetv.fr>

# Copy all scripts
COPY ./image/scripts/*.sh /tmp/
COPY ./image/7.1/*.sh /tmp/
RUN chmod +x /tmp/*.sh

# Run all scripts
RUN sh /tmp/env.sh && \
    sh /tmp/apt.sh && \
    sh /tmp/composer.sh \

# Config
COPY ./image/config/php.ini /etc/php/7.1/cli/conf.d/50-setting.ini
COPY ./image/config/pool.conf /etc/php/7.1/fpm/pool.d/www.conf
COPY ./image/config/nginx.conf /etc/nginx/nginx.conf
COPY ./image/7.1/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./image/config/ssl/ /etc/ssl/nginx/

# Run supervisor
EXPOSE 80 443

WORKDIR /app

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
