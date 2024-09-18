-- SQLite

CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    group_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author_group
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(128)
);

-- MySQL / MariaDB

CREATE TABLE author
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    group_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author_group
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128)
);

-- PostgreSQL

CREATE TABLE author
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    group_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author_group
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128)
);

-- SQLite

INSERT INTO author_group VALUES (1, 'bloggers');
INSERT INTO author_group VALUES (2, 'journalists');
INSERT INTO author_group VALUES (3, 'writers');
INSERT INTO author_group VALUES (4, 'academics');
INSERT INTO author_group VALUES (5, 'entrants');

INSERT INTO author (user_id, group_id, nick, credits) VALUES (1, 1, 'john_doe', 20);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 1, 'pinecone', 5);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (3, 2, 'news_hound', 15);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 5, 'pumpkin', 5);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (5, 4, 'data_miner', 15);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (7, 1, 'nerd', 10);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 4, 'quarky', 30);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 5, 'yola', 0);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 5, 'amelie', 0);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (11, 4, 'penguin', 20);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 5, 'newton', 0);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 2, 'pepper', 50);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 3, 'jonny', 40);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 3, 'agate', 25);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (19, 3, 'erwin', 10);
INSERT INTO author (user_id, group_id, nick, credits) VALUES (NULL, 1, 'mateo', 0);

-- MySQL / MariaDB / PostgreSQL

INSERT INTO author_group VALUES
    (1, 'bloggers'),
    (2, 'journalists'),
    (3, 'writers'),
    (4, 'academics'),
    (5, 'entrants');

INSERT INTO author (user_id, group_id, nick, credits) VALUES
    (1, 1, 'john_doe', 20),
    (NULL, 1, 'pinecone', 5),
    (3, 2, 'news_hound', 15),
    (NULL, 5, 'pumpkin', 5),
    (5, 4, 'data_miner', 15),
    (7, 1, 'nerd', 10),
    (NULL, 4, 'quarky', 30),
    (NULL, 5, 'yola', 0),
    (NULL, 5, 'amelie', 0),
    (11, 4, 'penguin', 20),
    (NULL, 5, 'newton', 0),
    (NULL, 2, 'pepper', 50),
    (NULL, 3, 'jonny', 40),
    (NULL, 3, 'agate', 25),
    (19, 3, 'erwin', 10),
    (NULL, 1, 'mateo', 0);

SELECT * FROM (
    SELECT nick, name as group_name, credits
    FROM author LEFT JOIN author_group
    ON author.group_id = author_group.id
) AS author_with_group
WHERE group_name = "bloggers";

SELECT * FROM author
WHERE group_id = (
    SELECT id FROM author_group
    WHERE name = "writers"
);
