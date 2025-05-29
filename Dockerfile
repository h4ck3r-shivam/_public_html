FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    default-mysql-client

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Copy existing application directory contents
COPY . .

# Make entrypoint script executable
RUN chmod +x docker/entrypoint.sh

# Install dependencies
RUN composer install --no-interaction --no-dev --optimize-autoloader

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Copy Apache configuration
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# Update ports.conf to listen on the non-standard port
RUN sed -i 's/Listen 80$/Listen 8765/g' /etc/apache2/ports.conf

# Make healthcheck script executable
RUN chmod +x docker/healthcheck.sh

# Set up healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 CMD ["/var/www/html/docker/healthcheck.sh"]

# Expose port
EXPOSE 8765

# Set entrypoint
ENTRYPOINT ["/var/www/html/docker/entrypoint.sh"] 