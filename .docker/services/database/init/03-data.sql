USE fluentdb;

INSERT INTO `Country` (`id`, `name`, `details`)
VALUES (1, 'Slovakia', '{"name": "Slovensko", "pop": 5546300, "gdp": 91.44}'),
       (2, 'Canada', '{"name": "Canada", "pop": 38239700, "gdp": 1672.17}'),
       (3, 'Germany', '{"name": "Deutschland", "pop": 82682200, "gdp": 3500.79}');

INSERT INTO `User` (`id`, `countryId`, `type`, `name`)
VALUES (1, 1, 'admin', 'Marek'),
       (2, 2, 'author', 'Sachieko'),
       (3, 2, 'admin', 'Chris'),
       (4, 2, 'author', 'Kevin');

INSERT INTO `Article` (`id`, `userId`, `timePublished`, `title`, `content`)
VALUES (1, 1, 1613367400, 'article 1', 'content 1'),
       (2, 2, 1613467400, 'article 2', 'content 2'),
       (3, 1, 1613567400, 'article 3', 'content 3'),
       (4, 4, 1613667400, 'article 4', 'content 4'),
       (5, 3, 1613767400, 'ärtïclë 5', 'côntênt 5'),
       (6, 3, 1613867400, 'სარედაქციო 6', '기사 6');

INSERT INTO `Comment` (`id`, `articleId`, `userId`, `content`)
VALUES (1, 1, 1, 'comment for a1u1'),
       (2, 1, 2, 'comment for a1u2'),
       (3, 2, 1, 'comment for a2u1'),
       (4, 5, 4, 'cømmėnt før a5u4'),
       (5, 6, 2, 'ਟਿसाठी टिप्पणी a6u2');
