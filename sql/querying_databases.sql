-- SQLite

CREATE TABLE quote
(
    ID SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

-- MySQL / MariaDB

CREATE TABLE quote
(
    ID INTEGER PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

-- PostgreSQL

CREATE TABLE quote
(
    ID SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

-- SQLite

INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (1, 101, 1, 'William Shakespeare', 'Hamlet', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);

-- MySQL / MariaDB / PostgreSQL

INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES
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