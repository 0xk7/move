FROM php:7.4-cli-alpine

RUN apk add \
    libzip-dev \
    oniguruma-dev

RUN docker-php-ext-install \
    zip 

WORKDIR /var/www/html

COPY tinyfilemanager.php index.php

CMD ["sh", "-c", "php -S 0.0.0.0:80"]