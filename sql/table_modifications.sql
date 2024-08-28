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

ALTER TABLE quote_usage
    ALTER COLUMN document_id DROP NOT NULL;

ALTER TABLE quote_usage
    MODIFY COLUMN document_id INTEGER;

DESCRIBE quote_usage;

CREATE TABLE quote_collection
(
    id INTEGER PRIMARY KEY,
    codename VARCHAR(256),
    name VARCHAR(256)
);

DESCRIBE quote_collection;

ALTER TABLE quote_collection
    ADD CONSTRAINT codename_uqe UNIQUE (codename);

DESCRIBE quote_collection;

ALTER TABLE quote_collection
    DROP CONSTRAINT codename_uqe;

DESCRIBE quote_collection;

CREATE TABLE favourities
(
    id INTEGER PRIMARY KEY,
    author_id INTEGER,
    item_type VARCHAR(128),
    item_id INTEGER
);

DESCRIBE favourities;

ALTER TABLE favourities
    ALTER COLUMN item_type SET DEFAULT 'quote';

DESCRIBE favourities;

ALTER TABLE favourities
    ALTER COLUMN item_type DROP DEFAULT;

DESCRIBE favourities;

CREATE TABLE author_popularity
(
    author_id INTEGER,
    popularity_points BIGINT
);

DESCRIBE author_popularity;

ALTER TABLE author_popularity
    ADD PRIMARY KEY (author_id);

ALTER TABLE author_popularity
    ADD CONSTRAINT id_pk PRIMARY KEY (author_id);

DESCRIBE author_popularity;

ALTER TABLE author_popularity
    DROP PRIMARY KEY;

ALTER TABLE author_popularity
    DROP CONSTRAINT id_pk;

DESCRIBE author_popularity;

CREATE TABLE personal_data
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256)
);

DESCRIBE personal_data;

ALTER TABLE personal_data MODIFY id INTEGER AUTO_INCREMENT;

CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    penname VARCHAR(256)
);

CREATE INDEX penname_idx ON author (penname);

SHOW INDEXES FROM author;

DROP INDEX penname_idx ON author;
DROP INDEX penname_idx;

SHOW INDEXES FROM author;

CREATE TABLE translator
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256)
);

CREATE INDEX fullname_idx ON translator (name, surname);

SHOW INDEXES FROM translator;

DROP INDEX fullname_idx ON translator;
DROP INDEX fullname_idx;

SHOW INDEXES FROM translator;
