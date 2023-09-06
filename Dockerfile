ARG php_version
FROM php:${php_version}-fpm-alpine

# install the PHP extensions we need
RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
		coreutils \
		freetype-dev \
		libjpeg-turbo-dev \
        libmemcached-dev \
		libpng-dev \
		libwebp-dev \
		libzip-dev \
		postgresql-dev \
	; \
	\
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
		--with-webp \
	; \
	\
	docker-php-ext-install -j "$(nproc)" \
        curl \
		gd \
        imap \
        ldap \
		opcache \
        readline \
        xml \
		zip \
    ; \
    pecl install memcached \
    docker-php-ext-enable memcached \
    apk del --no-network .build-deps
