# AADL Docker PHP Image

This repo takes the official PHP docker images and adds the extensions and settings we use in production, so everyone has the same setup.

### Images

The following images are built:

- ghcr.io/aadl/php:7.4 - End of Life
- ghcr.io/aadl/php:8.0 - End of Life
- ghcr.io/aadl/php:8.1 - EOL | Security till 12/31/25
- ghcr.io/aadl/php:8.2 - EOL on 12/31/24 | Security till 12/31/26
- ghcr.io/aadl/php:8.3 - Active

### Extensions

The following additional extensions are installed (stock image contains curl, json, mbstring, sqlite, xml)

- bcmath
- gd
- exif
- igbinary
- imagick
- imap
- intl
- ldap
- memcached
- mysqli
- opcache
- pcntl
- pdo_mysql
- pdo_pgsql
- pgsql
- redis
- ssh2
- xdebug
- zip

### Settings

The images use PHP's recommended production ini file [with the following changes](aadl.ini):

```ini
date.timezone = 'America/Detroit'
expose_php = Off
max_execution_time = 300
max_input_time = 600
memory_limit = 512M
post_max_size = 10G
upload_max_filesize = 10G
```

### Composer

The latest stable composer is installed (2.x)
