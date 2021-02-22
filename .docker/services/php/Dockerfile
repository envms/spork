FROM php:8.0-fpm

# get the required pre-built binaries from their respective docker images
COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/

RUN docker-php-source extract \
    && chmod uga+x /usr/local/bin/install-php-extensions /usr/local/bin/composer \
    && sync \
    # build and install additional extensions
    && install-php-extensions bcmath gettext gmp intl pdo_mysql xdebug \
    && docker-php-source delete

# install helpful development tools
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends --no-install-suggests --yes \
    curl net-tools procps unzip vim

# remove package cache and lists
RUN apt autoclean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www

# copy the config files last, on image rebuilds the other steps don't need to be re-run if there are changes
COPY ./config/fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./config/custom.ini /usr/local/etc/php/php.ini
COPY ./config/init.php /usr/local/init.php
COPY ./final.sh /usr/local/final.sh
COPY ./final.dev.sh /usr/local/final.dev.sh

RUN chmod 755 /usr/local/final.sh /usr/local/final.dev.sh

EXPOSE 9001
