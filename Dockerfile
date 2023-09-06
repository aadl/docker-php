ARG php_version
FROM php:${php_version}-fpm-alpine

# install the PHP extensions we need
RUN set -eux; \
	\
	apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS && \
	apk add --no-cache --virtual .build-deps \
		coreutils \
		curl-dev \
		freetype-dev \
		imap-dev \
		krb5-dev \
		libcurl \
		libjpeg-turbo-dev \
        libmemcached-dev \
		libpng-dev \
		libwebp-dev \
		libxml2-dev \
		libzip-dev \
		openldap-dev \
		openssl-dev \
		postgresql-dev \
	; \
	\
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
		--with-webp \
	;
	RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
	RUN docker-php-ext-install -j "$(nproc)" \
        curl \
		gd \
        imap \
        ldap \
		opcache \
		pdo_mysql \
		pdo_pgsql \
        xml \
		zip \
    ;
    RUN pecl install memcached
    #docker-php-ext-enable memcached
    #apk del --no-network .build-deps
