# Dockerfile
FROM php:8.1-fpm as php

RUN apt-get update -y && apt-get install -y libmcrypt-dev libcurl4-gnutls-dev nginx libonig-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath curl mbstring

WORKDIR /app
COPY . /app

RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000                                                        
