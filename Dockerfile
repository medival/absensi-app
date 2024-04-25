FROM php:latest

# Set working directory
WORKDIR /var/www/html

# Expose port 8080 (default port for Laravel's built-in server)
EXPOSE 8080

# Copy application files
COPY . .

# Define the command to start the server
CMD php artisan serve --host=0.0.0.0 --port=$PORT
