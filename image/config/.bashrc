[ ! -z "$TERM" -a -r /etc/motd ] && /etc/motd

# Alias
alias php-xdebug='/usr/bin/php -dzend_extension=xdebug.so -dxdebug.remote_enable=1'
