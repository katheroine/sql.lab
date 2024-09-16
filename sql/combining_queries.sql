-- SQLite

CREATE TABLE user
(
    id INTEGER PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

-- MySQL / MariaDB

CREATE TABLE user
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

-- PostgreSQL

CREATE TABLE user_account
(
    id SERIAL PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

-- SQLite

INSERT INTO user (login, group_name, credits) VALUES ('john_doe', 'bloggers', 100);
INSERT INTO user (login, group_name, credits) VALUES ('science_gal', 'scientists', 250);
INSERT INTO user (login, group_name, credits) VALUES ('news_hound', 'journalists', 150);
INSERT INTO user (login, group_name, credits) VALUES ('study_buddy', 'students', 50);
INSERT INTO user (login, group_name, credits) VALUES ('data_miner', 'researchers', 200);
INSERT INTO user (login, group_name, credits) VALUES ('craft_master', 'hobbyists', 75);
INSERT INTO user (login, group_name, credits) VALUES ('tech_blogger', 'bloggers', 120);
INSERT INTO user (login, group_name, credits) VALUES ('quantum_guy', 'scientists', 300);
INSERT INTO user (login, group_name, credits) VALUES ('truth_seeker', 'journalists', 180);
INSERT INTO user (login, group_name, credits) VALUES ('college_kid', 'students', 30);
INSERT INTO user (login, group_name, credits) VALUES ('lab_rat', 'researchers', 220);
INSERT INTO user (login, group_name, credits) VALUES ('diy_enthusiast', 'hobbyists', 90);
INSERT INTO user (login, group_name, credits) VALUES ('food_critic', 'bloggers', 80);
INSERT INTO user (login, group_name, credits) VALUES ('rocket_woman', 'scientists', 280);
INSERT INTO user (login, group_name, credits) VALUES ('roving_reporter', 'journalists', 160);
INSERT INTO user (login, group_name, credits) VALUES ('grad_student', 'students', 40);
INSERT INTO user (login, group_name, credits) VALUES ('book_worm', 'researchers', 240);
INSERT INTO user (login, group_name, credits) VALUES ('stamp_collector', 'hobbyists', 60);
INSERT INTO user (login, group_name, credits) VALUES ('travel_guru', 'bloggers', 110);
INSERT INTO user (login, group_name, credits) VALUES ('chem_whiz', 'scientists', 270);

-- MySQL / MariaDB

INSERT INTO user (id, login, group_name, credits) VALUES
    (1, 'john_doe', 'bloggers', 100),
    (2, 'science_gal', 'scientists', 250),
    (3, 'news_hound', 'journalists', 150),
    (4, 'study_buddy', 'students', 50),
    (5, 'data_miner', 'researchers', 200),
    (6, 'craft_master', 'hobbyists', 75),
    (7, 'tech_blogger', 'bloggers', 120),
    (8, 'quantum_guy', 'scientists', 300),
    (9, 'truth_seeker', 'journalists', 180),
    (10, 'college_kid', 'students', 30),
    (11, 'lab_rat', 'researchers', 220),
    (12, 'diy_enthusiast', 'hobbyists', 90),
    (13, 'food_critic', 'bloggers', 80),
    (14, 'rocket_woman', 'scientists', 280),
    (15, 'roving_reporter', 'journalists', 160),
    (16, 'grad_student', 'students', 40),
    (17, 'book_worm', 'researchers', 240),
    (18, 'stamp_collector', 'hobbyists', 60),
    (19, 'travel_guru', 'bloggers', 110),
    (20, 'chem_whiz', 'scientists', 270);

-- PostgreSQL

INSERT INTO user_account (id, login, group_name, credits) VALUES
    (1, 'john_doe', 'bloggers', 100),
    (2, 'science_gal', 'scientists', 250),
    (3, 'news_hound', 'journalists', 150),
    (4, 'study_buddy', 'students', 50),
    (5, 'data_miner', 'researchers', 200),
    (6, 'craft_master', 'hobbyists', 75),
    (7, 'tech_blogger', 'bloggers', 120),
    (8, 'quantum_guy', 'scientists', 300),
    (9, 'truth_seeker', 'journalists', 180),
    (10, 'college_kid', 'students', 30),
    (11, 'lab_rat', 'researchers', 220),
    (12, 'diy_enthusiast', 'hobbyists', 90),
    (13, 'food_critic', 'bloggers', 80),
    (14, 'rocket_woman', 'scientists', 280),
    (15, 'roving_reporter', 'journalists', 160),
    (16, 'grad_student', 'students', 40),
    (17, 'book_worm', 'researchers', 240),
    (18, 'stamp_collector', 'hobbyists', 60),
    (19, 'travel_guru', 'bloggers', 110),
    (20, 'chem_whiz', 'scientists', 270);

-- SQLite

INSERT INTO author (user_id, nick, group_name, credits) VALUES (1, 'john_doe', 'bloggers', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (1, 'john_doe', 'bloggers', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pinecone', 'bloggers', 5);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (3, 'news_hound', 'journalists', 15);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pumpkin', 'entrant', 5);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (5, 'data_miner', 'academics', 15);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (7, 'nerd', 'bloggers', 10);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'quarky', 'academics', 30);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'yola', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'amelie', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (11, 'penguin', 'academics', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'newton', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pepper', 'journalists', 50);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'jonny', 'writer', 40);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'agate', 'writer', 25);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (19, 'erwin', 'writer', 10);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'mateo', 'blogger', 0);

-- MySQL / MariaDB / PostgreSQL

INSERT INTO author (user_id, nick, group_name, credits) VALUES
    (1, 'john_doe', 'bloggers', 20),
    (NULL, 'pinecone', 'bloggers', 5),
    (3, 'news_hound', 'journalists', 15),
    (NULL, 'pumpkin', 'entrant', 5),
    (5, 'data_miner', 'academics', 15),
    (7, 'nerd', 'bloggers', 10),
    (NULL, 'quarky', 'academics', 30),
    (NULL, 'yola', 'entrant', 0),
    (NULL, 'amelie', 'entrant', 0),
    (11, 'penguin', 'academics', 20),
    (NULL, 'newton', 'entrant', 0),
    (NULL, 'pepper', 'journalists', 50),
    (NULL, 'jonny', 'writer', 40),
    (NULL, 'agate', 'writer', 25),
    (19, 'erwin', 'writer', 10),
    (NULL, 'mateo', 'blogger', 0);

-- MySQL / MariaDB / SQLite

SELECT login AS "nick", group_name FROM user
UNION
SELECT nick, group_name FROM author WHERE user_id IS NULL;

SELECT id, login AS "nick", group_name FROM user
UNION
SELECT user_id AS "id", nick, group_name FROM author;

SELECT id, login AS "nick", group_name FROM user
UNION ALL
SELECT user_id AS "id", nick, group_name FROM author;

-- PostgreSQL

SELECT login AS "nick", group_name FROM user_account
UNION
SELECT nick, group_name FROM author WHERE user_id IS NULL;

SELECT id, login AS "nick", group_name FROM user_account
UNION
SELECT user_id AS "id", nick, group_name FROM author;

SELECT id, login AS "nick", group_name FROM user_account
UNION ALL
SELECT user_id AS "id", nick, group_name FROM author;
