FROM php:fpm-alpine3.17

ARG UID
ARG GID
ENV GNAME=php
ENV UNAME=php

RUN addgroup \
    --gid $GID \
    -S \
    "$GNAME"

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$GNAME" \
    --no-create-home \
    --uid "$UID" \
    "$UNAME"

USER root

RUN apk --no-cache add curl
RUN apk --no-cache add git

# MYSQL PDO DRIVER:
RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-install -j "$(nproc)" pdo_mysql
#RUN apt-get update && apt-get install -y \
#        curl \
#        wget \
#        git \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#	libpng-dev \
#	libonig-dev \
#	libzip-dev \
#	libmcrypt-dev \
#        && pecl install mcrypt-1.0.3 \
#	&& docker-php-ext-enable mcrypt \
#        && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip \
#	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
#        && docker-php-ext-install -j$(nproc) gd


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

WORKDIR /var/www

USER "$UNAME"
# Запускаем контейнер
# Из документации: The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable,
# or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
CMD ["php-fpm"]
