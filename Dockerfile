FROM composer:latest as BASE

# Use the official PHP image
FROM php:8.2-fpm

ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
  libpq-dev \
  && docker-php-ext-install pdo pdo_pgsql && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Upgrade and install package
RUN apt-get update && apt-get install -y \
  libpq-dev \
  zip \
  unzip \
  libzip-dev \
  libpng-dev \
  nginx \
  net-tools \
  && docker-php-ext-install pdo pdo_pgsql zip gd

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Set working directory
WORKDIR /var/www/html

# Copy only the necessary files for installing dependencies
COPY composer.json composer.lock ./

# Install composer dependencies
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application
COPY . /var/www/html

COPY --chown=www:www . /var/www/html

# COPY ./nginx/conf.d/ /etc/nginx/conf.d/

# Generate autoload files and optimize
RUN composer dump-autoload --optimize

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Use a better command for running the application
CMD php artisan serve --host=0.0.0.0 --port=80