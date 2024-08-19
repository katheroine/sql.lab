ALTER TABLE points
    RENAME TO points_granting;

CREATE TABLE book
(
    id INTEGER,
    title VARCHAR(1024)
);

DESCRIBE book;

ALTER TABLE book
    ADD COLUMN author_id INTEGER;

DESCRIBE book;

CREATE TABLE article
(
    id INTEGER,
    author VARCHAR(256),
    title VARCHAR(1024)
);

DESCRIBE article;

ALTER TABLE article
    DROP COLUMN author;

DESCRIBE article;

CREATE TABLE document
(
    id INTEGER PRIMARY KEY,
    user INTEGER NOT NULL
);

DESCRIBE document;

ALTER TABLE document
    RENAME COLUMN user TO user_id;

ALTER TABLE document
    CHANGE COLUMN user user_id INTEGER NOT NULL;

DESCRIBE document;

CREATE TABLE quote_usage
(
    id BIGINT PRIMARY KEY,
    quote_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    document_id INTEGER
);

DESCRIBE quote_usage;

ALTER TABLE quote_usage
    ALTER COLUMN document_id SET NOT NULL;

ALTER TABLE quote_usage
    MODIFY COLUMN document_id INTEGER NOT NULL;

DESCRIBE quote_usage;


