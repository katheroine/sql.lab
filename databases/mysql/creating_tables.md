[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Displaying tables](displaying_tables.md)

### Creating tables

```
mysql> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
Query OK, 0 rows affected (0,07 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
+-------------------------+
1 row in set (0,01 sec)

```

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**MySQL Data Types**

MySQL supports SQL data types in several categories: numeric types, date and time types, string (character and byte) types, spatial types, and the JSON data type. This chapter provides an overview and more detailed description of the properties of the types in each category, and a summary of the data type storage requirements. The initial overviews are intentionally brief. Consult the more detailed descriptions for additional information about particular data types, such as the permissible formats in which you can specify values.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/data-types.html)

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INTEGER, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
* **String**: CHAR, VARCHAR, BINARY, VARBINARY, TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME, TIMESTAMP
* **Other**: ENUM, SET, BIT

##### Numeric

MySQL supports all standard SQL numeric data types. These types include the exact numeric data types (**INTEGER**, **SMALLINT**, **DECIMAL**, and **NUMERIC**), as well as the approximate numeric data types (**FLOAT**, **REAL**, and **DOUBLE PRECISION**). The keyword *INT* is a synonym for *INTEGER*, and the keywords *DEC* and *FIXED* are synonyms for *DECIMAL*. MySQL treats *DOUBLE* as a synonym for *DOUBLE PRECISION* (a nonstandard extension). MySQL also treats *REAL* as a synonym for *DOUBLE PRECISION* (a nonstandard variation), unless the `REAL_AS_FLOAT` SQL mode is enabled.

The **BIT** data type stores bit values and is supported for *MyISAM*, *MEMORY*, *InnoDB*, and *NDB* tables.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/numeric-types.html)

##### String

The string data types are **CHAR**, **VARCHAR**, **BINARY**, **VARBINARY**, **BLOB**, **TEXT**, **ENUM**, and **SET**.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/numeric-types.html)

##### Date and time

The date and time data types for representing temporal values are **DATE**, **TIME**, **DATETIME**, **TIMESTAMP**, and **YEAR**. Each temporal type has a range of valid values, as well as a “zero” value that may be used when you specify an invalid value that MySQL cannot represent. The *TIMESTAMP* and *DATETIME* types have special automatic updating behavior.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-types.html)

##### JSON

MySQL supports a native **JSON** data type defined by RFC 7159 that enables efficient access to data in JSON (JavaScript Object Notation) documents. The JSON data type provides these advantages over storing JSON-format strings in a string column:

Automatic validation of JSON documents stored in JSON columns. Invalid documents produce an error.

Optimized storage format. JSON documents stored in JSON columns are converted to an internal format that permits quick read access to document elements. When the server later must read a JSON value stored in this binary format, the value need not be parsed from a text representation. The binary format is structured to enable the server to look up subobjects or nested values directly by key or array index without reading all values before or after them in the document.

MySQL 8.4 also supports the JSON Merge Patch format defined in RFC 7396, using the `JSON_MERGE_PATCH()` function. See the description of this function, as well as Normalization, Merging, and Autowrapping of JSON Values, for examples and further information.

The space required to store a *JSON* document is roughly the same as for *LONGBLOB* or *LONGTEXT*; see Section 13.7, “Data Type Storage Requirements”, for more information. It is important to keep in mind that the size of any JSON document stored in a *JSON* column is limited to the value of the `max_allowed_packet` system variable. (When the server is manipulating a JSON value internally in memory, it can be larger than this; the limit applies when the server stores it.) You can obtain the amount of space required to store a JSON document using the `JSON_STORAGE_SIZE()` function; note that for a *JSON* column, the storage size - and thus the value returned by this function - is that used by the column prior to any **partial updates** that may have been performed on it.

Along with the *JSON* data type, a set of SQL functions is available to enable operations on JSON values, such as creation, manipulation, and searching. The following discussion shows examples of these operations.

A set of spatial functions for operating on GeoJSON values is also available.

JSON columns, like columns of other binary types, are not indexed directly; instead, you can create an index on a generated column that extracts a scalar value from the JSON column.

The MySQL optimizer also looks for compatible indexes on virtual columns that match JSON expressions.

The *InnoDB* storage engine supports multi-valued indexes on JSON arrays. See Multi-Valued Indexes.

MySQL *NDB* Cluster supports *JSON* columns and MySQL JSON functions, including creation of an index on a column generated from a *JSON* column as a workaround for being unable to index a *JSON* column. A maximum of 3 *JSON* columns per *NDB* table is supported.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/json.html)

##### Spatial

The Open Geospatial Consortium (OGC) is an international consortium of more than 250 companies, agencies, and universities participating in the development of publicly available conceptual solutions that can be useful with all kinds of applications that manage **spatial data**.

The Open Geospatial Consortium publishes the OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 2: SQL option, a document that proposes several conceptual ways for extending an SQL RDBMS to support spatial data. This specification is available from the OGC website at [http://www.opengeospatial.org/standards/sfs](http://www.opengeospatial.org/standards/sfs).

Following the OGC specification, MySQL implements spatial extensions as a subset of the SQL with Geometry Types environment. This term refers to an SQL environment that has been extended with a set of geometry types. A geometry-valued SQL column is implemented as a column that has a geometry type. The specification describes a set of SQL geometry types, as well as functions on those types to create and analyze geometry values.

MySQL spatial extensions enable the generation, storage, and analysis of geographic features:

* Data types for representing spatial values
* Functions for manipulating spatial values
* Spatial indexing for improved access times to spatial columns

The spatial data types and functions are available for MyISAM, InnoDB, NDB, and ARCHIVE tables. For indexing spatial columns, *MyISAM* and *InnoDB* support both SPATIAL and non-SPATIAL indexes. The other storage engines support non-SPATIAL indexes.

-- [MySQL documentation](https://dev.mysql.com/doc/refman/8.4/en/spatial-types.html)

##### Boolean & bit

```
mysql> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,036 sec)

mysql> DESCRIBE user;
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| ID        | int(11)    | NO   | PRI | NULL    |       |
| confirmed | tinyint(1) | YES  |     | NULL    |       |
| active    | bit(1)     | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
3 rows in set (0,008 sec)

```

##### Integer

```
mysql> CREATE TABLE rating
    -> (
    ->     quote_id INTEGER PRIMARY KEY,
    ->     rate INTEGER,
    ->     class SMALLINT,
    ->     points BIGINT
    -> );
Query OK, 0 rows affected (0,037 sec)

mysql> DESCRIBE rating;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| quote_id | int(11)     | NO   | PRI | NULL    |       |
| rate     | int(11)     | YES  |     | NULL    |       |
| class    | smallint(6) | YES  |     | NULL    |       |
| points   | bigint(20)  | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0,005 sec)

```

##### Decimal

```
mysql> CREATE TABLE physical_property
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     weight DECIMAL,
    ->     length NUMERIC,
    ->     height NUMERIC(2),
    ->     depth NUMERIC(2, 1)
    -> );
Query OK, 0 rows affected (0,018 sec)

mysql> DESCRIBE physical_property;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| medium_id | int(11)       | NO   | PRI | NULL    |       |
| weight    | decimal(10,0) | YES  |     | NULL    |       |
| length    | decimal(10,0) | YES  |     | NULL    |       |
| height    | decimal(2,0)  | YES  |     | NULL    |       |
| depth     | decimal(2,1)  | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
5 rows in set (0,008 sec)

```

##### Floating point

```
mysql> CREATE TABLE storage_conditions
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     humidity FLOAT,
    ->     temperature FLOAT(4),
    ->     air_pressure REAL
    -> );
Query OK, 0 rows affected (0,068 sec)

mysql> DESCRIBE storage_conditions;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| medium_id    | int(11) | NO   | PRI | NULL    |       |
| humidity     | float   | YES  |     | NULL    |       |
| temperature  | float   | YES  |     | NULL    |       |
| air_pressure | double  | YES  |     | NULL    |       |
+--------------+---------+------+-----+---------+-------+
4 rows in set (0,018 sec)

```

##### Binary

```
mysql> CREATE TABLE file
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     mode BINARY(3)
    -> );
Query OK, 0 rows affected (0,020 sec)

mysql> DESCRIBE file;
+-------+-----------+------+-----+---------+-------+
| Field | Type      | Null | Key | Default | Extra |
+-------+-----------+------+-----+---------+-------+
| ID    | int(11)   | NO   | PRI | NULL    |       |
| mode  | binary(3) | YES  |     | NULL    |       |
+-------+-----------+------+-----+---------+-------+
2 rows in set (0,002 sec)

```

##### Character

```
mysql> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8),
    ->     description VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,070 sec)

mysql> DESCRIBE medium_type;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| codename    | char(8)      | YES  |     | NULL    |       |
| description | varchar(256) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0,012 sec)

```

###### Date & time

```
mysql> CREATE TABLE points
    -> (
    ->     user_id INTEGER,
    ->     quote_id INTEGER,
    ->     date DATE,
    ->     time TIME,
    ->     datetime DATETIME,
    ->     timestamp TIMESTAMP,
    ->     PRIMARY KEY (user_id, quote_id)
    -> );
Query OK, 0 rows affected (0,100 sec)

mysql> DESCRIBE points;
+-----------+-----------+------+-----+---------------------+-------------------------------+
| Field     | Type      | Null | Key | Default             | Extra                         |
+-----------+-----------+------+-----+---------------------+-------------------------------+
| user_id   | int(11)   | NO   | PRI | NULL                |                               |
| quote_id  | int(11)   | NO   | PRI | NULL                |                               |
| date      | date      | YES  |     | NULL                |                               |
| time      | time      | YES  |     | NULL                |                               |
| datetime  | datetime  | YES  |     | NULL                |                               |
| timestamp | timestamp | NO   |     | current_timestamp() | on update current_timestamp() |
+-----------+-----------+------+-----+---------------------+-------------------------------+
6 rows in set (0,011 sec)

```

##### JSON

```
mysql> INSERT INTO structured_data VALUES
    ->     (1, '{"genre": "thriller", "rating": 5}'),
    ->     (2, '{"hobby": "painting"}'),
    ->     (3, '{"interests": ["programming", "rock music"]}');
Query OK, 3 rows affected (0,012 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DESCRIBE structured_data;
+---------+----------+------+-----+---------+-------+
| Field   | Type     | Null | Key | Default | Extra |
+---------+----------+------+-----+---------+-------+
| id      | int(11)  | NO   | PRI | NULL    |       |
| content | longtext | YES  |     | NULL    |       |
+---------+----------+------+-----+---------+-------+
2 rows in set (0,010 sec)

```

#### Constraints

##### Not NULL

```
mysql> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8) PRIMARY KEY,
    ->     description VARCHAR(256) NOT NULL
    -> );
Query OK, 0 rows affected (0,033 sec)

mysql> DESCRIBE medium_type;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| codename    | char(8)      | NO   | PRI | NULL    |       |
| description | varchar(256) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0,019 sec)

mysql> INSERT INTO medium_type VALUES
    ->     ('BOOK', 'A book'),
    ->     ('CD', 'A CD'),
    ->     ('VHS', 'A VHS tape');
Query OK, 3 rows affected (0,007 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM medium_type;
+----------+-------------+
| codename | description |
+----------+-------------+
| BOOK     | A book      |
| CD       | A CD        |
| VHS      | A VHS tape  |
+----------+-------------+
3 rows in set (0,001 sec)

mysql> INSERT INTO medium_type VALUES
    ->     ('DVD', '');
Query OK, 1 row affected (0,008 sec)

mysql> INSERT INTO medium_type VALUES
    ->     ('AUDIOCST', NULL);
ERROR 1048 (23000) at line 17: Column 'description' cannot be null
mysql> INSERT INTO medium_type (codename) VALUES
    ->     ('AUDIOCST');
ERROR 1364 (HY000) at line 17: Field 'description' doesn't have a default value

mysql> SELECT * FROM medium_type;
+----------+-------------+
| codename | description |
+----------+-------------+
| BOOK     | A book      |
| CD       | A CD        |
| DVD      |             |
| VHS      | A VHS tape  |
+----------+-------------+
4 rows in set (0,002 sec)

```

##### Unique

```
mysql> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     personal_data_id INTEGER UNIQUE,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,026 sec)

mysql> DESCRIBE user;
+------------------+------------+------+-----+---------+-------+
| Field            | Type       | Null | Key | Default | Extra |
+------------------+------------+------+-----+---------+-------+
| ID               | int(11)    | NO   | PRI | NULL    |       |
| personal_data_id | int(11)    | YES  | UNI | NULL    |       |
| confirmed        | tinyint(1) | YES  |     | NULL    |       |
| active           | bit(1)     | YES  |     | NULL    |       |
+------------------+------------+------+-----+---------+-------+
4 rows in set (0,006 sec)

mysql> SELECT * FROM user;
Empty set (0,001 sec)

mysql> INSERT INTO user (ID, personal_data_id) VALUES (1, 1);
Query OK, 1 row affected (0,006 sec)

mysql> INSERT INTO user (ID, personal_data_id) VALUES (2, 1);
ERROR 1062 (23000) at line 12: Duplicate entry '1' for key 'user.personal_data_id'
mysql> INSERT INTO user (ID, personal_data_id) VALUES (2, 2);
Query OK, 1 row affected (0,006 sec)

mysql> SELECT * FROM user;
+----+------------------+-----------+--------+
| ID | personal_data_id | confirmed | active |
+----+------------------+-----------+--------+
|  1 |                1 |      NULL | NULL   |
|  2 |                2 |      NULL | NULL   |
+----+------------------+-----------+--------+
2 rows in set (0,001 sec)

```

##### Default

```
mysql> CREATE TABLE storage_conditions
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     humidity FLOAT DEFAULT 40,
    ->     temperature FLOAT(4) DEFAULT 23,
    ->     air_pressure REAL DEFAULT 1013.25
    -> );
Query OK, 0 rows affected (0,023 sec)

mysql> DESCRIBE storage_conditions;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| medium_id    | int(11) | NO   | PRI | NULL    |       |
| humidity     | float   | YES  |     | 40      |       |
| temperature  | float   | YES  |     | 23      |       |
| air_pressure | double  | YES  |     | 1013.25 |       |
+--------------+---------+------+-----+---------+-------+
4 rows in set (0,013 sec)

mysql> INSERT INTO storage_conditions (medium_id) VALUES (1);
Query OK, 1 row affected (0,005 sec)

mysql> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       40 |          23 |      1013.25 |
+-----------+----------+-------------+--------------+
1 row in set (0,001 sec)

```

##### Check

**It doesn't work in MySQL when reference other column.**

```
mysql> CREATE TABLE physical_property
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     weight DECIMAL CHECK (weight >= 0),
    ->     length NUMERIC,
    ->     height NUMERIC(2) CHECK (height <= length),
    ->     depth NUMERIC(2, 1) CHECK (depth <= height)
    -> );
ERROR 3813 (HY000) at line 1: Column check constraint 'physical_property_chk_2' references other column.

CREATE TABLE physical_property
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     weight DECIMAL CHECK (weight >= 0),
    ->     length NUMERIC,
    ->     height NUMERIC(2),
    ->     depth NUMERIC(2, 1)
    -> );

mysql> DESCRIBE physical_property;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| medium_id | int(11)       | NO   | PRI | NULL    |       |
| weight    | decimal(10,0) | YES  |     | NULL    |       |
| length    | decimal(10,0) | YES  |     | NULL    |       |
| height    | decimal(2,0)  | YES  |     | NULL    |       |
| depth     | decimal(2,1)  | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
5 rows in set (0,002 sec)

mysql> INSERT INTO physical_property VALUES (1, 0.5, 3, 2, 1);
Query OK, 1 row affected, 1 warning (0,008 sec)

mysql> INSERT INTO physical_property VALUES (2, -0.5, 3, 2, 1);
ERROR 3819 (HY000) at line 13: Check constraint 'physical_property_chk_1' is violated.
mysql> SELECT * FROM physical_property;
+-----------+--------+--------+--------+-------+
| medium_id | weight | length | height | depth |
+-----------+--------+--------+--------+-------+
|         1 |      1 |      3 |      2 |   1.0 |
+-----------+--------+--------+--------+-------+
1 row in set (0,001 sec)

```

##### Primary key

**Single-column primary key**

```
mysql> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,09 sec)

```

**Multiple-column primary key**

```
mysql> CREATE TABLE points
    -> (
    ->     user_id INTEGER,
    ->     quote_id INTEGER,
    ->     quantity INTEGER,
    ->     date DATE,
    ->     time TIME,
    ->     datetime DATETIME,
    ->     timestamp TIMESTAMP,
    ->     PRIMARY KEY (user_id, quote_id)
    -> );
Query OK, 0 rows affected (0,021 sec)

```

##### Foreign key

```
mysql> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,09 sec)

mysql> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,036 sec)

mysql> CREATE TABLE points
    -> (
    ->     user_id INTEGER,
    ->     quote_id INTEGER,
    ->     quantity INTEGER,
    ->     date DATE,
    ->     time TIME,
    ->     datetime DATETIME,
    ->     timestamp TIMESTAMP,
    ->     PRIMARY KEY (user_id, quote_id)
    -> );
Query OK, 0 rows affected (0,021 sec)

```

##### Autoincrement

```
mysql> CREATE TABLE personal_data
    -> (
    ->     id INTEGER PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,017 sec)

mysql> DESCRIBE personal_data;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int(11)      | NO   | PRI | NULL    | auto_increment |
| name    | varchar(256) | YES  |     | NULL    |                |
| surname | varchar(256) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0,002 sec)

mysql> INSERT INTO personal_data (name, surname) VALUES
    ->     ('John', 'Kowalsky'),
    ->     ('Vivienne', 'Morgenstein'),
    ->     ('Lisa', 'Pumpkinshire');
Query OK, 3 rows affected (0,007 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM personal_data;
+----+----------+--------------+
| id | name     | surname      |
+----+----------+--------------+
|  1 | John     | Kowalsky     |
|  2 | Vivienne | Morgenstein  |
|  3 | Lisa     | Pumpkinshire |
+----+----------+--------------+
3 rows in set (0,001 sec)

```

##### Indexes

**Single-column index**

```
mysql> CREATE TABLE author
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256),
    ->     penname VARCHAR(256),
    ->     INDEX penname_idx (penname)
    -> );
Query OK, 0 rows affected (0,103 sec)

mysql> DESCRIBE author;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int(11)      | NO   | PRI | NULL    |       |
| name    | varchar(256) | YES  |     | NULL    |       |
| surname | varchar(256) | YES  |     | NULL    |       |
| penname | varchar(256) | YES  | MUL | NULL    |       |
+---------+--------------+------+-----+---------+-------+
4 rows in set (0,002 sec)

mysql> SHOW INDEXES FROM author;
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| author |          0 | PRIMARY     |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| author |          1 | penname_idx |            1 | penname     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0,004 sec)

```

**Multiple-column-index**

```
mysql> CREATE TABLE translator
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     name VARCHAR(256),
    ->     surname VARCHAR(256),
    ->     INDEX fullname_idx (name, surname)
    -> );
Query OK, 0 rows affected (0,019 sec)

mysql> DESCRIBE translator;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int(11)      | NO   | PRI | NULL    |       |
| name    | varchar(256) | YES  | MUL | NULL    |       |
| surname | varchar(256) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0,002 sec)

mysql> SHOW INDEXES FROM translator;
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| translator |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| translator |          1 | fullname_idx |            1 | name        | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
| translator |          1 | fullname_idx |            2 | surname     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set (0,001 sec)

```
