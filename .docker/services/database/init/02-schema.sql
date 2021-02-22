USE fluentdb;

CREATE TABLE `Country` (
    `id`      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`    VARCHAR(30)  NOT NULL,
    `details` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `User` (
    `id`        INT UNSIGNED             NOT NULL AUTO_INCREMENT,
    `countryId` INT UNSIGNED             NOT NULL,
    `type`      ENUM ('admin', 'author') NOT NULL,
    `name`      VARCHAR(20)              NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_User_countryId`(`countryId`),
    CONSTRAINT `fk_User_Country_countryId` FOREIGN KEY (`countryId`) REFERENCES `Country`(`id`)
);

CREATE TABLE `Article` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `userId`        INT UNSIGNED    NOT NULL DEFAULT 0,
    `timePublished` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `title`         VARCHAR(100)    NOT NULL DEFAULT '',
    `content`       TEXT            NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `idx_Article_userId`(`userId`),
    CONSTRAINT `fk_Article_User_userId` FOREIGN KEY (`userId`) REFERENCES `User`(`id`)
);

CREATE TABLE `Comment` (
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `articleId` INT UNSIGNED NOT NULL,
    `userId`    INT UNSIGNED NOT NULL,
    `content`   VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_Comment_articleId`(`articleId`),
    KEY `idx_Comment_userId`(`userId`),
    CONSTRAINT `fk_Comment_Article_articleId` FOREIGN KEY (`articleId`) REFERENCES `Article`(`id`),
    CONSTRAINT `fk_Comment_User_userId` FOREIGN KEY (`userId`) REFERENCES `User`(`id`)
);
