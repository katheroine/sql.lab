[⌂ Home](../../../README.md)
[⬆ Up: Managing tables](README.md)
[▲ Previous: Creating tables](creating_tables.md)
[▼ Next: Removing tables](removing_tables.md)

### Modifying tables

#### Tables

##### Renaming table

```sql
ALTER TABLE table_name RENAME TO new_table_name;
```

```
MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| author                  |
| points                  |
| quote                   |
+-------------------------+
3 rows in set (0,006 sec)

MariaDB [quote_sql_lab]> ALTER TABLE points
    ->     RENAME TO points_granting;
Query OK, 0 rows affected (0,039 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
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

```sql
ALTER TABLE table_name ADD COLUMN column_name column_type column_attributes;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE book
    -> (
    ->     id INTEGER,
    ->     title VARCHAR(1024)
    -> );
Query OK, 0 rows affected (0,073 sec)

MariaDB [quote_sql_lab]> DESCRIBE book;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | YES  |     | NULL    |       |
| title | varchar(1024) | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0,009 sec)

MariaDB [quote_sql_lab]> ALTER TABLE book
    ->     ADD column author_id INTEGER;
Query OK, 0 rows affected (0,010 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE book;
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

```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE article
    -> (
    ->     id INTEGER,
    ->     author VARCHAR(256),
    ->     title VARCHAR(1024)
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> DESCRIBE article;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| id     | int(11)       | YES  |     | NULL    |       |
| author | varchar(256)  | YES  |     | NULL    |       |
| title  | varchar(1024) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE article
    ->     DROP COLUMN author;
Query OK, 0 rows affected (0,035 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE article;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | YES  |     | NULL    |       |
| title | varchar(1024) | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Renaming column

```sql
ALTER TABLE table_name CHANGE COLUMN column_name new_column_name column_type column_attributes;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE document
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     user INTEGER NOT NULL
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> DESCRIBE document;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | PRI | NULL    |       |
| user  | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
2 rows in set (0,009 sec)

MariaDB [quote_sql_lab]> ALTER TABLE document
    ->     CHANGE COLUMN user user_id INTEGER NOT NULL;
Query OK, 0 rows affected (0,010 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE document;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| id      | int(11) | NO   | PRI | NULL    |       |
| user_id | int(11) | NO   |     | NULL    |       |
+---------+---------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Changing column type

```sql
ALTER TABLE table_name MODIFY COLUMN column_name new_column_type;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE cover_type
    -> (
    ->     codename VARCHAR(128),
    ->     description CHAR(128)
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> DESCRIBE cover_type;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| codename    | varchar(128) | YES  |     | NULL    |       |
| description | char(128)    | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0,005 sec)

MariaDB [quote_sql_lab]> ALTER TABLE cover_type MODIFY COLUMN description VARCHAR(256);
Query OK, 0 rows affected (0,045 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE cover_type;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| codename    | varchar(128) | YES  |     | NULL    |       |
| description | varchar(256) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0,003 sec)

```

##### Adding *not NULL* constraint

```sql
ALTER TABLE table_name MODIFY COLUMN column_name column_type NOT NULL remaining_column_attributes;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE quote_usage
    -> (
    ->     id BIGINT PRIMARY KEY,
    ->     quote_id INTEGER NOT NULL,
    ->     user_id INTEGER NOT NULL,
    ->     document_id INTEGER
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | YES  |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE quote_usage
    ->     MODIFY COLUMN document_id INTEGER NOT NULL;
Query OK, 0 rows affected (0,043 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE quote_usage;
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

```sql
ALTER TABLE table_name MODIFY COLUMN column_name column_type remaining_column_attributes;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE quote_usage
    -> (
    ->     id BIGINT PRIMARY KEY,
    ->     quote_id INTEGER NOT NULL,
    ->     user_id INTEGER NOT NULL,
    ->     document_id INTEGER NOT NULL
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote_usage;
+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| id          | bigint(20) | NO   | PRI | NULL    |       |
| quote_id    | int(11)    | NO   |     | NULL    |       |
| user_id     | int(11)    | NO   |     | NULL    |       |
| document_id | int(11)    | NO   |     | NULL    |       |
+-------------+------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE quote_usage
    ->     MODIFY COLUMN document_id INTEGER;
Query OK, 0 rows affected (0,031 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE quote_usage;
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

```sql
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);
```

```
MariaDB [quote_sql_lab]> CREATE TABLE quote_collection
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     codename VARCHAR(256),
    ->     name VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,082 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  |     | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,014 sec)

MariaDB [quote_sql_lab]> ALTER TABLE quote_collection
    ->     ADD CONSTRAINT codename_uqe UNIQUE (codename);
Query OK, 0 rows affected (0,022 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE quote_collection;
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

```sql
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE quote_collection
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     codename VARCHAR(256) UNIQUE,
    ->     name VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,082 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote_collection;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| codename | varchar(256) | YES  | UNI | NULL    |       |
| name     | varchar(256) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE quote_collection
    ->     DROP CONSTRAINT codename_uqe;
Query OK, 0 rows affected (0,017 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE quote_collection;
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

```sql
ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT default_value;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE favourities
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     author_id INTEGER,
    ->     item_type VARCHAR(128),
    ->     item_id INTEGER
    -> );
Query OK, 0 rows affected (0,024 sec)

MariaDB [quote_sql_lab]> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | NULL    |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,003 sec)

MariaDB [quote_sql_lab]> ALTER TABLE favourities
    ->     ALTER COLUMN item_type SET DEFAULT 'quote';
Query OK, 0 rows affected (0,005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE favourities;
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

```sql
ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE favourities
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     author_id INTEGER,
    ->     item_type VARCHAR(128) DEFAULT 'quote',
    ->     item_id INTEGER
    -> );
Query OK, 0 rows affected (0,024 sec)

MariaDB [quote_sql_lab]> DESCRIBE favourities;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| author_id | int(11)      | YES  |     | NULL    |       |
| item_type | varchar(128) | YES  |     | quote   |       |
| item_id   | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE favourities
    ->     ALTER COLUMN item_type DROP DEFAULT;
Query OK, 0 rows affected (0,006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE favourities;
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

**First version**

```sql
ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column_name);
```

```
MariaDB [quote_sql_lab]> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | YES  |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE author_popularity
    ->     ADD CONSTRAINT id_pk PRIMARY KEY (author_id);
Query OK, 0 rows affected, 1 warning (0,034 sec)
Records: 0  Duplicates: 0  Warnings: 1

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

**Second version**

```sql
ALTER TABLE table_name ADD PRIMARY KEY (column_name);
```

```
MariaDB [quote_sql_lab]> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | YES  |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE author_popularity
    ->     ADD PRIMARY KEY (author_id);
Query OK, 0 rows affected (0,030 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Removing *primary key* constraint

```sql
ALTER TABLE table_name DROP PRIMARY KEY;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE author_popularity
    -> (
    ->     author_id INTEGER PRIMARY KEY,
    ->     popularity_points BIGINT
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   | PRI | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE author_popularity
    ->     DROP PRIMARY KEY;
Query OK, 0 rows affected (0,049 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE author_popularity;
+-------------------+------------+------+-----+---------+-------+
| Field             | Type       | Null | Key | Default | Extra |
+-------------------+------------+------+-----+---------+-------+
| author_id         | int(11)    | NO   |     | NULL    |       |
| popularity_points | bigint(20) | YES  |     | NULL    |       |
+-------------------+------------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Adding *autoincrement*

```sql
ALTER TABLE table_name MODIFY column_name column_type column_attributes AUTO_INCREMENT;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE personal_data
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,024 sec)

MariaDB [quote_sql_lab]> DESCRIBE personal_data;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int(11)      | NO   | PRI | NULL    |       |
| name    | varchar(256) | YES  |     | NULL    |       |
| surname | varchar(256) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0,010 sec)

MariaDB [quote_sql_lab]> ALTER TABLE personal_data MODIFY id INTEGER AUTO_INCREMENT;
Query OK, 0 rows affected (0,056 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE personal_data;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int(11)      | NO   | PRI | NULL    | auto_increment |
| name    | varchar(256) | YES  |     | NULL    |                |
| surname | varchar(256) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,002 sec)

```

##### Removing *autoincrement*

```sql
ALTER TABLE table_name MODIFY column_name column_type column_attributes;
```

```
MariaDB [quote_sql_lab]> CREATE TABLE personal_data
    -> (
    ->     id INTEGER PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> DESCRIBE personal_data;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int(11)      | NO   | PRI | NULL    | auto_increment |
| name    | varchar(256) | YES  |     | NULL    |                |
| surname | varchar(256) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,002 sec)

MariaDB [quote_sql_lab]> ALTER TABLE personal_data MODIFY id INTEGER;
Query OK, 0 rows affected (0,054 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE personal_data;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int(11)      | NO   | PRI | NULL    |       |
| name    | varchar(256) | YES  |     | NULL    |       |
| surname | varchar(256) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

```

##### Creating *index*

```sql
CREATE INDEX index_name ON table_name (column1_name, column_2_name, column_3_name);
```

**Single-column index**

```
MariaDB [quote_sql_lab]> CREATE TABLE author
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256),
    ->     penname VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,023 sec)

MariaDB [quote_sql_lab]> CREATE INDEX penname_idx ON author (penname);
Query OK, 0 rows affected (0,023 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SHOW INDEXES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [quote_sql_lab]> SHOW INDEXES FROM author;
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| author |          0 | PRIMARY     |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| author |          1 | penname_idx |            1 | penname     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0,001 sec)

```

**Multiple-column index**

```
MariaDB [quote_sql_lab]> CREATE TABLE translator
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,019 sec)

MariaDB [quote_sql_lab]> CREATE INDEX fullname_idx ON translator (name, surname);
Query OK, 0 rows affected (0,023 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SHOW INDEXES FROM translator;
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| translator |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| translator |          1 | fullname_idx |            1 | name        | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
| translator |          1 | fullname_idx |            2 | surname     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set (0,001 sec)

```

##### Removing *index*

```sql
DROP INDEX index_name ON table_name;
```

**Single-column index**

```
MariaDB [quote_sql_lab]> DROP INDEX penname_idx ON author;
Query OK, 0 rows affected (0,014 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SHOW INDEXES FROM author;
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| author |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0,001 sec)

```

**Multiple-column index**

```
MariaDB [quote_sql_lab]> DROP INDEX fullname_idx ON translator;
Query OK, 0 rows affected (0,018 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SHOW INDEXES FROM translator;
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| translator |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0,001 sec)

```
