#!/bin/bash

set -eux

cd /usr/local || RETURN
php ./init.php

cd /var/www || RETURN
su - www-data -s /bin/bash -c 'composer install'

php-fpm
