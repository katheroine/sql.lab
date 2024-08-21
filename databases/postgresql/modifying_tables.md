[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Creating tables](creating_tables.md)

### Modifying tables

#### Tables

##### Renaming table

```
quote_sql_lab=# \dt
               List of relations
 Schema |        Name        | Type  |  Owner
--------+--------------------+-------+----------
 public | author             | table | postgres
 public | points             | table | postgres
 public | quote              | table | postgres
(3 rows)

quote_sql_lab=# ALTER TABLE points
quote_sql_lab-#     RENAME TO points_granting;
ALTER TABLE
quote_sql_lab=# \dt
               List of relations
 Schema |        Name        | Type  |  Owner
--------+--------------------+-------+----------
 public | author             | table | postgres
 public | points_granting    | table | postgres
 public | quote              | table | postgres
(3 rows)

```

#### Columns

##### Adding column

```
quote_sql_lab=# CREATE TABLE book
quote_sql_lab-# (
quote_sql_lab(#     id INTEGER,
quote_sql_lab(#     title VARCHAR(1024)
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \d+ book
                                            Table "public.book"
 Column |          Type           | Collation | Nullable | Default | Storage  | Stats target | Description
--------+-------------------------+-----------+----------+---------+----------+--------------+-------------
 id     | integer                 |           |          |         | plain    |              |
 title  | character varying(1024) |           |          |         | extended |              |
Access method: heap

quote_sql_lab=# ALTER TABLE book
quote_sql_lab-#     ADD COLUMN author_id INTEGER;
ALTER TABLE
quote_sql_lab=# \d+ book
                                             Table "public.book"
  Column   |          Type           | Collation | Nullable | Default | Storage  | Stats target | Description
-----------+-------------------------+-----------+----------+---------+----------+--------------+-------------
 id        | integer                 |           |          |         | plain    |              |
 title     | character varying(1024) |           |          |         | extended |              |
 author_id | integer                 |           |          |         | plain    |              |
Access method: heap

```

##### Removing column

```
quote_sql_lab=# CREATE TABLE article
quote_sql_lab-# (
quote_sql_lab(#     id INTEGER,
quote_sql_lab(#     author VARCHAR(256),
quote_sql_lab(#     title VARCHAR(1024)
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \d+ article
                                          Table "public.article"
 Column |          Type           | Collation | Nullable | Default | Storage  | Stats target | Description
--------+-------------------------+-----------+----------+---------+----------+--------------+-------------
 id     | integer                 |           |          |         | plain    |              |
 author | character varying(256)  |           |          |         | extended |              |
 title  | character varying(1024) |           |          |         | extended |              |
Access method: heap

quote_sql_lab=# ALTER TABLE article
quote_sql_lab-#     DROP COLUMN author;
ALTER TABLE
quote_sql_lab=# \d+ article
                                          Table "public.article"
 Column |          Type           | Collation | Nullable | Default | Storage  | Stats target | Description
--------+-------------------------+-----------+----------+---------+----------+--------------+-------------
 id     | integer                 |           |          |         | plain    |              |
 title  | character varying(1024) |           |          |         | extended |              |
Access method: heap

```

##### Renaming column

```
quote_sql_lab=# CREATE TABLE document
quote_sql_lab-# (
quote_sql_lab(#     id INTEGER PRIMARY KEY,
quote_sql_lab(#     user_account INTEGER NOT NULL
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \d+ document;
                                    Table "public.document"
    Column    |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
--------------+---------+-----------+----------+---------+---------+--------------+-------------
 id           | integer |           | not null |         | plain   |              |
 user_account | integer |           | not null |         | plain   |              |
Indexes:
    "document_pkey" PRIMARY KEY, btree (id)
Access method: heap

quote_sql_lab=# ALTER TABLE document
quote_sql_lab-#     RENAME COLUMN user_account TO user_id;
ALTER TABLE
quote_sql_lab=# \d+ document;
                                  Table "public.document"
 Column  |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
---------+---------+-----------+----------+---------+---------+--------------+-------------
 id      | integer |           | not null |         | plain   |              |
 user_id | integer |           | not null |         | plain   |              |
Indexes:
    "document_pkey" PRIMARY KEY, btree (id)
Access method: heap

```

##### Adding *not NULL* constraint

```
quote_sql_lab=# CREATE TABLE quote_usage
quote_sql_lab-# (
quote_sql_lab(#     id BIGINT PRIMARY KEY,
quote_sql_lab(#     quote_id INTEGER NOT NULL,
quote_sql_lab(#     user_id INTEGER NOT NULL,
quote_sql_lab(#     document_id INTEGER
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \d+ quote_usage;
                                  Table "public.quote_usage"
   Column    |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
-------------+---------+-----------+----------+---------+---------+--------------+-------------
 id          | bigint  |           | not null |         | plain   |              |
 quote_id    | integer |           | not null |         | plain   |              |
 user_id     | integer |           | not null |         | plain   |              |
 document_id | integer |           |          |         | plain   |              |
Indexes:
    "quote_usage_pkey" PRIMARY KEY, btree (id)
Access method: heap

quote_sql_lab=# ALTER TABLE quote_usage
quote_sql_lab-#     ALTER COLUMN document_id SET NOT NULL;
ALTER TABLE
quote_sql_lab=# \d+ quote_usage;
                                  Table "public.quote_usage"
   Column    |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
-------------+---------+-----------+----------+---------+---------+--------------+-------------
 id          | bigint  |           | not null |         | plain   |              |
 quote_id    | integer |           | not null |         | plain   |              |
 user_id     | integer |           | not null |         | plain   |              |
 document_id | integer |           | not null |         | plain   |              |
Indexes:
    "quote_usage_pkey" PRIMARY KEY, btree (id)
Access method: heap

```

##### Removing *not NULL* constraint

```
quote_sql_lab=# CREATE TABLE quote_usage
quote_sql_lab-# (
quote_sql_lab(#     id BIGINT PRIMARY KEY,
quote_sql_lab(#     quote_id INTEGER NOT NULL,
quote_sql_lab(#     user_id INTEGER NOT NULL,
quote_sql_lab(#     document_id INTEGER
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \d+ quote_usage;
                                  Table "public.quote_usage"
   Column    |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
-------------+---------+-----------+----------+---------+---------+--------------+-------------
 id          | bigint  |           | not null |         | plain   |              |
 quote_id    | integer |           | not null |         | plain   |              |
 user_id     | integer |           | not null |         | plain   |              |
 document_id | integer |           | not null |         | plain   |              |
Indexes:
    "quote_usage_pkey" PRIMARY KEY, btree (id)
Access method: heap

quote_sql_lab=# ALTER TABLE quote_usage
quote_sql_lab-#     ALTER COLUMN document_id DROP NOT NULL;
ALTER TABLE
quote_sql_lab=# \d+ quote_usage;
                                  Table "public.quote_usage"
   Column    |  Type   | Collation | Nullable | Default | Storage | Stats target | Description
-------------+---------+-----------+----------+---------+---------+--------------+-------------
 id          | bigint  |           | not null |         | plain   |              |
 quote_id    | integer |           | not null |         | plain   |              |
 user_id     | integer |           | not null |         | plain   |              |
 document_id | integer |           |          |         | plain   |              |
Indexes:
    "quote_usage_pkey" PRIMARY KEY, btree (id)
Access method: heap

```
