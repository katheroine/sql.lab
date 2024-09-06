CREATE TABLE quote
(
    ID INTEGER PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

CREATE TABLE quote
(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    owner_id INTEGER NOT NULL,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

CREATE TABLE quote
(
    ID SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (1, 101, 'William Shakespeare', 'Hamlet', 5);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (2, 102, 'Jane Austen', 'Pride and Prejudice', 4);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (3, 103, 'Albert Einstein', 'Speech to the German Physical Society', 5);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (4, 104, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (5, 105, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (6, 106, 'Oscar Wilde', 'The Picture of Dorian Gray', 4);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (7, 107, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (8, 108, 'Virginia Woolf', 'A Room of One''s Own', 4);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (9, 109, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3);
INSERT INTO quote (ID, owner_id, author, source, rating) VALUES (10, 110, 'Aristotle', 'Nicomachean Ethics', 5);

INSERT INTO quote (ID, owner_id, author, source, rating) VALUES
    (1, 101, 'William Shakespeare', 'Hamlet', 5),
    (2, 102, 'Jane Austen', 'Pride and Prejudice', 4),
    (3, 103, 'Albert Einstein', 'Speech to the German Physical Society', 5),
    (4, 104, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4),
    (5, 105, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3),
    (6, 106, 'Oscar Wilde', 'The Picture of Dorian Gray', 4),
    (7, 107, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5),
    (8, 108, 'Virginia Woolf', 'A Room of One''s Own', 4),
    (9, 109, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3),
    (10, 110, 'Aristotle', 'Nicomachean Ethics', 5);

SELECT * FROM quote;

SELECT author, source
FROM quote;

SELECT * FROM quote
WHERE owner_id = 106;

SELECT author, source, rating
FROM quote
WHERE rating >= 4;
