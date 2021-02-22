SET GLOBAL max_allowed_packet=33554432; # 32M

SET NAMES utf8;
SET time_zone = 'SYSTEM';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `osseusdb`;
CREATE DATABASE `osseusdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;
DROP DATABASE IF EXISTS `fluentdb`;
CREATE DATABASE `fluentdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

CREATE USER IF NOT EXISTS 'dbuser'@'%' IDENTIFIED BY 'userpass';
CREATE USER IF NOT EXISTS 'dbreader'@'%' IDENTIFIED BY 'readerpass';
CREATE USER IF NOT EXISTS 'dbwriter'@'%' IDENTIFIED BY 'writerpass';

GRANT ALL PRIVILEGES ON `osseusdb`.* TO 'dbuser'@'%';
GRANT ALL PRIVILEGES ON `fluentdb`.* TO 'dbuser'@'%';
GRANT SELECT ON `osseusdb`.* TO 'dbreader'@'%';
GRANT SELECT ON `fluentdb`.* TO 'dbreader'@'%';
GRANT INSERT, UPDATE, DELETE ON `osseusdb`.* TO 'dbwriter'@'%';
GRANT INSERT, UPDATE, DELETE ON `fluentdb`.* TO 'dbwriter'@'%';

FLUSH PRIVILEGES;
