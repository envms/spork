# Project Spork

**A docker development environment and toolset, taking inspiration from the legendary utensil.**

## Get Up and Running!

    cd <your-project-dir>/spork
    docker-compose build

This will download the images necessary and build your containers. Once they're finished building,
run

    docker-compose up -d

That's all there is to it! This will start three containers named `spork_db_1`, `spork_php_1`
and `spork_nginx_1`. The three primary images these containers are currently built upon are
`mariadb:10`, `php:8.0-fpm` and `nginx:mainline`.

Head to `localhost` in your browser and you should see the welcome page. This code is
located in `web/index.php`. To start your own application, clear the contents of the index
file and get coding!

### Stopping the Containers

When you're finished for the day, simply stop your containers

    docker-compose down

You can also pause or unpause the containers, which places them in a suspended state

    docker-compose pause
    docker-compose unpause

### Debugging with XDebug

PHP is preconfigured to display all errors, with XDebug 3 enabled in `debug,develop` mode.
By default, it listens on port 9003, simply set this in your IDE, and you're done!

## Using Spork to develop for FluentPDO and Osseus

To develop for, or test envms repositories, use the `docker-compose.dev.yml` in addition to the
main `docker-compose.yml` file.

    docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

This will add two volumes to your containers (`fluentpdo` and `osseus`), and run
`composer install`. Ensure you have _both_ repositories cloned beforehand, and that they are
siblings. Your directory structure should look like

    your-project-dir/
    ├── fluentpdo/
    ├── osseus/
    └── spork/

Both repositories are already added to the composer autoloader. You're good to go!
