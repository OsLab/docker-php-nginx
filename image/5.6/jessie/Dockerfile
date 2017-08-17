FROM debian:jessie

MAINTAINER Florent DESPIERRES <florent.despierres.ext@francetv.fr>

# Copy all scripts
COPY ./image/scripts/*.sh /tmp/
COPY ./image/5.6/apt.sh /tmp/
RUN chmod +x /tmp/*.sh

# Run all scripts
RUN sh /tmp/env.sh && \
    sh /tmp/apt.sh && \
    sh /tmp/js-tools.sh \
    sh /tmp/composer.sh \

# Config
COPY ./image/config/php.ini /etc/php5/cli/php.ini
COPY ./image/config/pool.conf /etc/php5/fpm/pool.d/www.conf
COPY ./image/config/nginx.conf /etc/nginx/nginx.conf
COPY ./image/config/ssl/ /etc/ssl/nginx/
COPY ./image/5.6/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Run supervisor
EXPOSE 80 443

WORKDIR /app

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
