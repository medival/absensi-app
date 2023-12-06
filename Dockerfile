# Use the official PHP image
FROM php:8.1

# Install system dependencies
# RUN apt-get update && apt-get install -y \
#   libpq-dev \
#   && docker-php-ext-install pdo pdo_pgsql && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN apt-get update && apt-get install -y \
  libpq-dev \
  zip \
  unzip \
  libzip-dev \
  libpng-dev \
  && docker-php-ext-install pdo pdo_pgsql zip gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Copy only the necessary files for installing dependencies
COPY composer.json composer.lock ./

# Install composer dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && composer install --no-scripts --no-autoloader

# Copy the rest of the application
COPY . .

# Generate autoload files and optimize
RUN composer dump-autoload --optimize

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 8000
EXPOSE 8000

# Use a better command for running the application
CMD php artisan serve --host=0.0.0.0 --port=8000
