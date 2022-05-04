FROM webdevops/php-nginx-dev:8.1

MAINTAINER Igor Goltsov <igor@ecomgems.com>

ENV WEB_DOCUMENT_ROOT=/phpapp
RUN sed -i 's/user www-data;/user application;/g' /etc/nginx/nginx.conf
RUN set -x \
    && apt update \
    && apt install --assume-yes pv unzip htop mc lsof default-mysql-client nodejs npm \
    && docker-image-cleanup

RUN echo 'Install n98-magerun2.phar' \
    && curl -sS -o n98-magerun2.phar https://files.magerun.net/n98-magerun2.phar \
    && curl -sS -o n98-magerun2.phar.sha256 https://files.magerun.net/sha256.php?file=n98-magerun2.phar \
    && shasum -a 256 -c n98-magerun2.phar.sha256 \
    && rm n98-magerun2.phar.sha256 \
    && chmod +x n98-magerun2.phar \
    && mv n98-magerun2.phar /usr/local/bin/n98-magerun2.phar

COPY conf/etc/nginx/vhost.conf /opt/docker/etc/nginx/vhost.conf
COPY conf/etc/nginx/conf.d/10-php.conf /opt/docker/etc/nginx/conf.d/10-php.conf
COPY conf/etc/nginx/vhost.common.d/10-php.conf /opt/docker/etc/nginx/vhost.common.d/10-php.conf
COPY conf/etc/nginx/vhost.common.d/10-location-root.conf /opt/docker/etc/nginx/vhost.common.d/10-location-root.conf
COPY conf/etc/php/fpm/pool.d/application.conf /opt/docker/etc/php/fpm/pool.d/application.conf

WORKDIR /phpapp
