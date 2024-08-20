[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Creating tables](creating_tables.md)

### Modifying tables

#### Tables

##### Renaming table

```
mysql> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| author                  |
| points                  |
| quote                   |
+-------------------------+
3 rows in set (0,006 sec)

mysql> ALTER TABLE points
    ->     RENAME TO points_granting;
Query OK, 0 rows affected (0,039 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| author                  |
| points_granting         |
| quote                   |
+-------------------------+
3 rows in set (0,001 sec)

```

#### Columns

##### Adding column

```
mysql> CREATE TABLE book
    -> (
    ->     id INTEGER,
    ->     title VARCHAR(1024)
    -> );
Query OK, 0 rows affected (0,073 sec)

mysql> DESCRIBE book;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | YES  |     | NULL    |       |
| title | varchar(1024) | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0,009 sec)

mysql> ALTER TABLE book
    ->     ADD column author_id INTEGER;
Query OK, 0 rows affected (0,010 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE book;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| id        | int(11)       | YES  |     | NULL    |       |
| title     | varchar(1024) | YES  |     | NULL    |       |
| author_id | int(11)       | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

```

##### Removing column

```
mysql> CREATE TABLE article
    -> (
    ->     id INTEGER,
    ->     author VARCHAR(256),
    ->     title VARCHAR(1024)
    -> );
Query OK, 0 rows affected (0,017 sec)

mysql> DESCRIBE article;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int(11)       | YES  |     | NULL    |       |
| author | varchar(256)  | YES  |     | NULL    |       |
| title  | varchar(1024) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

mysql> ALTER TABLE article
    ->     DROP COLUMN author;
Query OK, 0 rows affected (0,035 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE article;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | YES  |     | NULL    |       |
| title | varchar(1024) | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Renaming column

```
mysql> CREATE TABLE document
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     user INTEGER NOT NULL
    -> );
Query OK, 0 rows affected (0,019 sec)

mysql> DESCRIBE document;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | PRI | NULL    |       |
| user  | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
2 rows in set (0,009 sec)

mysql> ALTER TABLE document
    ->     RENAME COLUMN user TO user_id;
Query OK, 0 rows affected (0,010 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE document;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| id      | int(11) | NO   | PRI | NULL    |       |
| user_id | int(11) | NO   |     | NULL    |       |
+---------+---------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Adding *not NULL* constraint

```
mysql> CREATE TABLE quote_usage
    -> (
    ->     id BIGINT PRIMARY KEY,
    ->     quote_id INTEGER NOT NULL,
    ->     user_id INTEGER NOT NULL,
    ->     document_id INTEGER
    -> );
Query OK, 0 rows affected (0,017 sec)

mysql> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | YES  |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

mysql> ALTER TABLE quote_usage
    ->     MODIFY COLUMN document_id INTEGER NOT NULL;
Query OK, 0 rows affected (0,043 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | NO   |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

```

##### Removing *not NULL* constraint

```
mysql> CREATE TABLE quote_usage
    -> (
    ->     id BIGINT PRIMARY KEY,
    ->     quote_id INTEGER NOT NULL,
    ->     user_id INTEGER NOT NULL,
    ->     document_id INTEGER NOT NULL
    -> );
Query OK, 0 rows affected (0,017 sec)

mysql> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | NO   |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

mysql> ALTER TABLE quote_usage
    ->     MODIFY COLUMN document_id INTEGER;
Query OK, 0 rows affected (0,031 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | YES  |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

```

##### Adding *unique* constraint

```
mysql> CREATE TABLE quote_collection
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     codename VARCHAR(256),
    ->     name VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,082 sec)

mysql> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  |     | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,014 sec)

mysql> ALTER TABLE quote_collection
    ->     ADD CONSTRAINT codename_uqe UNIQUE (codename);
Query OK, 0 rows affected (0,022 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  | UNI | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

```

##### Removing *unique* constraint

```
mysql> CREATE TABLE quote_collection
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     codename VARCHAR(256) UNIQUE,
    ->     name VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,082 sec)

mysql> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  | UNI | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

mysql> ALTER TABLE quote_collection
    ->     DROP CONSTRAINT codename_uqe;
Query OK, 0 rows affected (0,017 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  |     | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

```

##### Adding *default* constraint

```
mysql> CREATE TABLE favourities
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     author_id INTEGER,
    ->     item_type VARCHAR(128),
    ->     item_id INTEGER
    -> );
Query OK, 0 rows affected (0,024 sec)

mysql> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | NULL    |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,003 sec)

mysql> ALTER TABLE favourities
    ->     ALTER COLUMN item_type SET DEFAULT "quote";
Query OK, 0 rows affected (0,005 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | quote   |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

```

##### Removing *default* constraint

```
mysql> CREATE TABLE favourities
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     author_id INTEGER,
    ->     item_type VARCHAR(128) DEFAULT "quote",
    ->     item_id INTEGER
    -> );
Query OK, 0 rows affected (0,024 sec)

mysql> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | quote   |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

mysql> ALTER TABLE favourities
    ->     ALTER COLUMN item_type DROP DEFAULT;
Query OK, 0 rows affected (0,006 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | NULL    |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

```

##### Adding *primary key* constraint

```
mysql> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | YES  |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

mysql> ALTER TABLE author_popularity
    ->     ADD CONSTRAINT id_pk PRIMARY KEY (author_id);
Query OK, 0 rows affected, 1 warning (0,034 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

```
mysql> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | YES  |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

mysql> ALTER TABLE author_popularity
    ->     ADD PRIMARY KEY (author_id);
Query OK, 0 rows affected (0,030 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Removing *primary key* constraint

```
mysql> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER PRIMARY KEY,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

mysql> ALTER TABLE author_popularity
    ->     DROP PRIMARY KEY;
Query OK, 0 rows affected (0,049 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```
