FROM php:7.4-apache

ENV TERM xterm-256color
WORKDIR /var/www/html

# Install Composer & Docker PHP extension installer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

# Enable Apache2 mod_rewrite and install PHP extensions
RUN a2enmod rewrite \
    && install-php-extensions exif gd imagick intl pdo_mysql pdo_pgsql xdebug xsl zip

# Import PHP files
COPY ./app .

EXPOSE 80 443