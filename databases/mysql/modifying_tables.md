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
