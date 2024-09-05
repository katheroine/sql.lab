[⌂ Home](../../../README.md)
[⬆ Up: Managing tables](README.md)
[▲ Previous: Creating tables](creating_tables.md)
[▼ Next: Removing tables](removing_tables.md)

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

##### Changing column type

```
sqlite> CREATE TABLE cover_type
   ...> (
   ...>     codename VARCHAR(128),
   ...>     description CHAR(128)
   ...> );
sqlite> CREATE TABLE cover_type_temp
   ...> (
   ...>     codename VARCHAR(128),
   ...>     description VARCHAR(256)
   ...> );
sqlite> INSERT INTO cover_type_temp (codename, description) SELECT codename, description FROM cover_type;
sqlite> DROP TABLE cover_type;
sqlite> CREATE TABLE cover_type AS SELECT * FROM cover_type_temp;
sqlite> DROP TABLE cover_type_temp;
```

##### Adding *not NULL* constraint

```
sqlite> CREATE TABLE quote_usage
   ...> (
   ...>     id BIGINT PRIMARY KEY,
   ...>     quote_id INTEGER NOT NULL,
   ...>     user_id INTEGER NOT NULL,
   ...>     document_id INTEGER
   ...> );
sqlite> CREATE TABLE quote_usage_temp
   ...> (
   ...>     id BIGINT PRIMARY KEY,
   ...>     quote_id INTEGER NOT NULL,
   ...>     user_id INTEGER NOT NULL,
   ...>     document_id INTEGER NOT NULL
   ...> );
sqlite> INSERT INTO quote_usage_temp (id, quote_id, user_id, document_id) SELECT id, quote_id, user_id, document_id FROM quote_usage_temp;
sqlite> DROP TABLE quote_usage;
sqlite> CREATE TABLE quote_usage AS SELECT * FROM quote_usage_temp;
sqlite> DROP TABLE quote_usage_temp;
```

##### Removing *not NULL* constraint

```
sqlite> CREATE TABLE quote_usage
   ...> (
   ...>     id BIGINT PRIMARY KEY,
   ...>     quote_id INTEGER NOT NULL,
   ...>     user_id INTEGER NOT NULL,
   ...>     document_id INTEGER NOT NULL
   ...> );
sqlite> CREATE TABLE quote_usage_temp
   ...> (
   ...>     id BIGINT PRIMARY KEY,
   ...>     quote_id INTEGER NOT NULL,
   ...>     user_id INTEGER NOT NULL,
   ...>     document_id INTEGER
   ...> );
sqlite> INSERT INTO quote_usage_temp (id, quote_id, user_id, document_id) SELECT id, quote_id, user_id, document_id FROM quote_usage_temp;
sqlite> DROP TABLE quote_usage;
sqlite> CREATE TABLE quote_usage AS SELECT * FROM quote_usage_temp;
sqlite> DROP TABLE quote_usage_temp;
```

##### Adding *unique* constraint

```
sqlite> CREATE TABLE quote_collection
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     codename VARCHAR(256),
   ...>     name VARCHAR(256)
   ...> );
sqlite> CREATE TABLE quote_collection_temp
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     codename VARCHAR(256) UNIQUE,
   ...>     name VARCHAR(256)
   ...> );
sqlite> INSERT INTO quote_collection_temp (id, codename, name) SELECT id, codename, name FROM quote_collection;
sqlite> DROP TABLE quote_collection;
sqlite> CREATE TABLE quote_collection AS SELECT * FROM quote_collection_temp;
sqlite> DROP TABLE quote_collection_temp;
```

##### Removing *unique* constraint

```
sqlite> CREATE TABLE quote_collection
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     codename VARCHAR(256) UNIQUE,
   ...>     name VARCHAR(256)
   ...> );
sqlite> CREATE TABLE quote_collection_temp
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     codename VARCHAR(256),
   ...>     name VARCHAR(256)
   ...> );
sqlite> INSERT INTO quote_collection_temp (id, codename, name) SELECT id, codename, name FROM quote_collection;
sqlite> DROP TABLE quote_collection;
sqlite> CREATE TABLE quote_collection AS SELECT * FROM quote_collection_temp;
sqlite> DROP TABLE quote_collection_temp;
```

##### Adding *default* constraint

```
sqlite> CREATE TABLE favourities
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     author_id INTEGER,
   ...>     item_type VARCHAR(128),
   ...>     item_id INTEGER
   ...> );
sqlite> CREATE TABLE favourities_temp
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     author_id INTEGER,
   ...>     item_type VARCHAR(128) DEFAULT 'quote',
   ...>     item_id INTEGER
   ...> );
sqlite> INSERT INTO favourities_temp (id, author_id, item_type, item_id) SELECT id, author_id, item_type, item_id FROM favourities;
sqlite> DROP TABLE favourities;
sqlite> CREATE TABLE favourities AS SELECT * FROM favourities_temp;
sqlite> DROP TABLE favourities_temp;
```

##### Removing *default* constraint

```
sqlite> CREATE TABLE favourities
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     author_id INTEGER,
   ...>     item_type VARCHAR(128) DEFAULT 'quote',
   ...>     item_id INTEGER
   ...> );
sqlite> CREATE TABLE favourities_temp
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     author_id INTEGER,
   ...>     item_type VARCHAR(128) DEFAULT 'quote',
   ...>     item_id INTEGER
   ...> );
sqlite> INSERT INTO favourities_temp (id, author_id, item_type, item_id) SELECT id, author_id, item_type, item_id FROM favourities;
sqlite> DROP TABLE favourities;
sqlite> CREATE TABLE favourities AS SELECT * FROM favourities_temp;
sqlite> DROP TABLE favourities_temp;
```

##### Adding *primary key* constraint

```
sqlite> CREATE TABLE author_popularity
   ...> (
   ...>     author_id INTEGER,
   ...>     popularity_points BIGINT
   ...> );
sqlite> CREATE TABLE author_popularity_temp
   ...> (
   ...>     author_id INTEGER PRIMARY KEY,
   ...>     popularity_points BIGINT
   ...> );
sqlite> INSERT INTO author_popularity_temp (author_id, popularity_points) SELECT author_id, popularity_points FROM author_popularity;
sqlite> DROP TABLE author_popularity;
sqlite> CREATE TABLE author_popularity AS SELECT * FROM author_popularity_temp;
sqlite> DROP TABLE author_popularity_temp;
```

##### Removing *primary key* constraint

```
sqlite> CREATE TABLE author_popularity
   ...> (
   ...>     author_id INTEGER PRIMARY KEY,
   ...>     popularity_points BIGINT
   ...> );
sqlite> CREATE TABLE author_popularity_temp
   ...> (
   ...>     author_id INTEGER,
   ...>     popularity_points BIGINT
   ...> );
sqlite> INSERT INTO author_popularity_temp (author_id, popularity_points) SELECT author_id, popularity_points FROM author_popularity;
sqlite> DROP TABLE author_popularity;
sqlite> CREATE TABLE author_popularity AS SELECT * FROM author_popularity_temp;
sqlite> DROP TABLE author_popularity_temp;
```

##### Creating *index*

```sql
CREATE INDEX index_name ON table_name (column1_name, column_2_name, column_3_name);
```

**Single-column index**

```
sqlite> CREATE TABLE author
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     name VARCHAR(256),
   ...>     surname VARCHAR(256),
   ...>     penname VARCHAR(256)
   ...> );
sqlite> CREATE INDEX penname_idx ON author (penname);
sqlite> .schema author
CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    penname VARCHAR(256)
);
CREATE INDEX penname_idx ON author (penname);
```

**Multiple-column index**

```
sqlite> CREATE TABLE translator
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     name VARCHAR(256),
   ...>     surname VARCHAR(256)
   ...> );
sqlite> CREATE INDEX fullname_idx ON translator (name, surname);
sqlite> .schema translator
CREATE TABLE translator
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256)
);
CREATE INDEX fullname_idx ON translator (name, surname);
```

##### Removing *index*


```sql
DROP INDEX index_name;
```

**Single-column index**

```
sqlite> DROP INDEX penname_idx;
sqlite> .schema author
CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    penname VARCHAR(256)
);
```

**Multiple-column index**

```
sqlite> DROP INDEX fullname_idx;
sqlite> .schema translator
CREATE TABLE translator
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256)
);
```
