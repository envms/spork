<?php

passthru('chown -R www-data:www-data /var/www');

$directories = [
    ['755', '/var/lib/php'],
    ['750', '/var/lib/php/sessions']
];

foreach ($directories as $dir) {
    passthru("mkdir -p -m{$dir[0]} {$dir[1]}");
    passthru("chown -R www-data:www-data {$dir[1]}");
}
