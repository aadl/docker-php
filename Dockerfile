ARG php_version
FROM php:${php_version}-fpm-alpine

# install the PHP extensions we need
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# curl, json, mbstring, sqlite, xml are included in the base php image
RUN chmod +x /usr/local/bin/install-php-extensions && \
    IPE_GD_WITHOUTAVIF=1 install-php-extensions bcmath exif gd igbinary imagick/imagick imap intl ldap memcached mysqli opcache pcntl pdo_mysql pdo_pgsql pgsql redis ssh2 xdebug zip @composer

# Use the default production configuration and mod to match our production
RUN apk add --no-cache git && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
ADD aadl.ini "$PHP_INI_DIR/conf.d/"
