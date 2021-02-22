#!/bin/bash

set -eux

cd /usr/local || RETURN
php ./init.php

php-fpm
