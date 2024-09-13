-- SQLite

-- MySQL / MariaDB

CREATE TABLE user
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(128) NOT NULL UNIQUE,
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

-- MySQL / MariaDB / PostgreSQL

INSERT INTO user (login, group_name, credits) VALUES
    ('john_doe', 'bloggers', 100),
    ('science_gal', 'scientists', 250),
    ('news_hound', 'journalists', 150),
    ('study_buddy', 'students', 50),
    ('data_miner', 'researchers', 200),
    ('craft_master', 'hobbyists', 75),
    ('tech_blogger', 'bloggers', 120),
    ('quantum_guy', 'scientists', 300),
    ('truth_seeker', 'journalists', 180),
    ('college_kid', 'students', 30),
    ('lab_rat', 'researchers', 220),
    ('diy_enthusiast', 'hobbyists', 90),
    ('food_critic', 'bloggers', 80),
    ('rocket_woman', 'scientists', 280),
    ('roving_reporter', 'journalists', 160),
    ('grad_student', 'students', 40),
    ('book_worm', 'researchers', 240),
    ('stamp_collector', 'hobbyists', 60),
    ('travel_guru', 'bloggers', 110),
    ('chem_whiz', 'scientists', 270);


SELECT COUNT(*) FROM user;
SELECT COUNT(*) FROM user WHERE group_name = "researchers";
SELECT COUNT(*) AS "users number" FROM user;
SELECT MIN(credits) FROM user;
SELECT MIN(credits) FROM user WHERE group_name = "bloggers";
SELECT MAX(credits) FROM user;
SELECT MAX(credits) FROM user WHERE group_name = "journalists";
SELECT SUM(credits) FROM user;
SELECT SUM(credits) FROM user WHERE group_name = "scientists";
SELECT AVG(credits) FROM user;
SELECT AVG(credits) FROM user WHERE group_name = "students";
SELECT STD(credits) FROM user;
SELECT VARIANCE(credits) FROM user;

SELECT COUNT(*) FROM user_account;
SELECT COUNT(*) FROM user_account WHERE group_name = 'researchers';
SELECT COUNT(*) AS "users number" FROM user_account;
SELECT MIN(credits) FROM user_account;
SELECT MIN(credits) FROM user_account WHERE group_name = 'bloggers';
SELECT MAX(credits) FROM user_account;
SELECT MAX(credits) FROM user_account WHERE group_name = 'journalists';
SELECT SUM(credits) FROM user_account;
SELECT SUM(credits) FROM user_account WHERE group_name = 'scientists';
SELECT STDDEV(credits) FROM user_account;
SELECT VARIANCE(credits) FROM user_account;
