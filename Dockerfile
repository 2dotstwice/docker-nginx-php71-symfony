FROM 2dotstwice/nginx-php71-starter

# nginx Symfony configuration for php-fpm
# based on http://symfony.com/doc/current/setup/web_server_configuration.html#web-server-nginx
ADD ./files/etc/nginx/sites-available/default /etc/nginx/sites-available/default
ADD ./files/etc/nginx/symfony/000-base.conf /etc/nginx/symfony/000-base.conf
ADD ./files/etc/nginx/symfony/999-end.conf /etc/nginx/symfony/999-end.conf

# keep system environment variables in php-fpm
RUN sed -i '$ a\
clear_env=no' ${PHP_CONFIG_DIR}/fpm/pool.d/www.conf

WORKDIR /usr/share/nginx/html