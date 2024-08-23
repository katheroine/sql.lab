[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Creating tables](creating_tables.md)

### Modifying tables

#### Tables

##### Renaming table

**The `ALTER TABLE` statement in SQLite does not support renaming tables.**

```
sqlite> .tables
author              points              quote
sqlite> CREATE TABLE points_granting AS SELECT * FROM points;
sqlite> DROP TABLE points;
sqlite> .tables
author              points_granting     quote
```

#### Columns

##### Adding column

```
sqlite> CREATE TABLE book
   ...> (
   ...>     id INTEGER,
   ...>     title VARCHAR(1024)
   ...> );
sqlite> CREATE TABLE book_temp
   ...> (
   ...>     id INTEGER,
   ...>     title VARCHAR(1024),
   ...>     author_id INTEGER
   ...> );
sqlite> INSERT INTO book_temp (id, title) SELECT id, title FROM book;
sqlite> DROP TABLE book;
sqlite> CREATE TABLE book AS SELECT * FROM book_temp;
sqlite> DROP TABLE book_temp;
```

##### Removing column

```
sqlite> CREATE TABLE article
   ...> (
   ...>     id INTEGER,
   ...>     author VARCHAR(256),
   ...>     title VARCHAR(1024)
   ...> );
sqlite> CREATE TABLE article_temp
   ...> (
   ...>     id INTEGER,
   ...>     title VARCHAR(1024)
);
sqlite> INSERT INTO article_temp (id, title) SELECT id, title FROM article;
sqlite> DROP TABLE article;
sqlite> CREATE TABLE article AS SELECT * FROM article_temp;
sqlite> DROP TABLE article_temp;
```

##### Renaming column

```
sqlite> CREATE TABLE document
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     user INTEGER NOT NULL
   ...> );
sqlite> CREATE TABLE document_temp
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     user_id INTEGER NOT NULL
   ...> );
sqlite> INSERT INTO document_temp (id, user_id) SELECT id, user FROM document;
sqlite> DROP TABLE document;
sqlite> CREATE TABLE document AS SELECT * FROM document_temp;
sqlite> DROP TABLE document_temp;
```
