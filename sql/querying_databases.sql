-- SQLite

CREATE TABLE quote
(
    id INTEGER PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

CREATE TABLE owner
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    login VARCHAR(256) NOT NULL UNIQUE
);

-- MySQL / MariaDB

CREATE TABLE quote
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

CREATE TABLE owner
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256),
    surname VARCHAR(256),
    login VARCHAR(256) NOT NULL UNIQUE
);

-- PostgreSQL

CREATE TABLE quote
(
    id SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

CREATE TABLE owner
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    login VARCHAR(256) NOT NULL UNIQUE
);

-- SQLite

INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (1, 101, 1, 'William Shakespeare', 'Hamlet', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);

-- MySQL / MariaDB / PostgreSQL

INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES
    (1, 101, 1, 'William Shakespeare', 'Hamlet', 5),
    (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4),
    (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5),
    (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4),
    (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3),
    (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4),
    (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5),
    (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 3),
    (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3),
    (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);

INSERT INTO owner (id, name, surname, login) VALUES
    (101, 'John', 'Doe', 'johnd'),
    (102, 'Jane', 'Smith', 'janes'),
    (103, NULL, 'Johnson', 'anonymous_j'),
    (104, 'Michael', NULL, 'mike_m'),
    (105, 'Emily', 'Brown', 'emily_b'),
    (106, NULL, NULL, 'mystery_user'),
    (107, 'David', 'Wilson', 'david_w'),
    (108, 'Sarah', 'Taylor', 'sarah_t'),
    (109, 'Robert', NULL, 'rob_123'),
    (110, 'Lisa', 'Anderson', 'lisa_a');

SELECT * FROM quote;

SELECT author, source
FROM quote;

SELECT * FROM quote
WHERE owner_id = 106;

SELECT author, source, rating
FROM quote
WHERE rating >= 4;

SELECT author AS creator, source, rating AS popularity
FROM quote;

SELECT author, source, rating FROM quote WHERE rating = 5;
SELECT author, source, rating FROM quote WHERE rating <> 5;
SELECT author, source, rating FROM quote WHERE rating != 5;
SELECT author, source, rating FROM quote WHERE rating < 4;
SELECT author, source, rating FROM quote WHERE rating <= 4;
SELECT author, source, rating FROM quote WHERE rating > 4;
SELECT author, source, rating FROM quote WHERE rating >= 4;

SELECT surname, login FROM owner WHERE name IS NULL;
SELECT surname, login FROM owner WHERE surname IS NOT NULL;

SELECT author, source, rating
FROM quote
WHERE rating BETWEEN 3 AND 4;

SELECT author, source, rating
FROM quote
WHERE rating NOT BETWEEN 3 AND 4;

SELECT author, source, rating
FROM quote
WHERE rating IN (3, 5);

SELECT author, source, rating
FROM quote
WHERE rating NOT IN (3, 5);

SELECT name, surname, login
FROM owner
WHERE name IS NOT NULL AND surname IS NOT NULL;

SELECT author, source, rating
FROM quote
WHERE rating > 2 AND rating < 5;

SELECT login
FROM owner
WHERE name IS NULL OR surname IS NULL;

SELECT author, source, rating
FROM quote
WHERE rating < 3 OR rating > 4;

SELECT name, surname, login
FROM owner
WHERE name IS NULL XOR surname IS NULL;

SELECT id, author, source, rating
FROM quote
WHERE NOT id = 106;
