FROM composer:latest

# Set environment variables
ARG NGINX_VERSION=1.21.5
ARG PHP_VERSION=8.1.0
ARG SUPERVISOR_VERSION=4.2.2

# Install necessary packages
RUN apk --no-cache add \
  nginx \
  curl \
  git \
  grep \
  build-base \
  libmemcached-dev \
  libmcrypt-dev \
  libxml2-dev \
  imagemagick-dev \
  pcre-dev \
  libtool \
  make \
  autoconf \
  g++ \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor \
  php81 \
  php81-dev \
  php81-common \
  php81-gd \
  php81-xmlreader \
  php81-bcmath \
  php81-ctype \
  php81-curl \
  php81-exif \
  php81-iconv \
  php81-intl \
  php81-mbstring \
  php81-opcache \
  php81-openssl \
  php81-pcntl \
  php81-phar \
  php81-session \
  php81-xml \
  php81-xsl \
  php81-zip \
  php81-zlib \
  php81-dom \
  php81-fpm \
  php81-sodium \
  php81-tokenizer \
  php81-pecl-apcu \
  && ln -sf /usr/bin/php81 /usr/bin/php

# Set up directories and permissions
RUN mkdir -p /run/nginx && \
  mkdir -p /var/www/html && \
  chown -R nginx:nginx /var/www/html && \
  chown -R nginx:nginx /run/nginx

COPY . /var/www/html

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisord.conf

# Expose ports
# EXPOSE 8080

# Define the entry point for Supervisor
# CMD ["supervisord", "-c", "/etc/supervisord.conf"]

CMD php artisan serve --host=0.0.0.0 --port=$PORT