[⌂ Home](../../README.md)
[⬆ Up: MariaDB](README.md)
[▲ Previous: Managing databases](managing_databases.md)

## Managing tables

### Displaying tables

```
MariaDB [quote_sql_lab]> SHOW TABLES;
Empty set (0,001 sec)

```

### Creating tables

```
MariaDB [quote_sql_lab]> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
Query OK, 0 rows affected (0,052 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
+-------------------------+
1 row in set (0,001 sec)

```

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**MariaDB Data Types**

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INTEGER, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
* **String**: CHAR, VARCHAR, BINARY, VARBINARY, TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME, TIMESTAMP
* **Other**: ENUM, SET, BIT

##### Numeric

* **TINYINT** - Tiny integer, -128 to 127 signed.
* **BOOLEAN** - Synonym for TINYINT(1).
* **SMALLINT** - Small integer from -32768 to 32767 signed.
* **MEDIUMINT** - Medium integer from -8388608 to 8388607 signed.
* **INT** - Integer from -2147483648 to 2147483647 signed.
* **INTEGER** - Synonym for INT
* **BIGINT** - Large integer.
* **DECIMAL** - A packed "exact" fixed-point number.
* **DEC**, **NUMERIC**, **FIXED** - Synonyms for DECIMAL
* **NUMBER** - Synonym for DECIMAL in Oracle mode.
* **FLOAT** - Single-precision floating-point number
* **DOUBLE** - Normal-size (double-precision) floating-point number
* **DOUBLE PRECISION** - REAL and DOUBLE PRECISION are synonyms for DOUBLE.
* **BIT** - Bit field type.
* **INT1** - A synonym for TINYINT.
* **INT2** - Synonym for SMALLINT.
* **INT3** - Synonym for MEDIUMINT.
* **INT4** - Synonym for INT.
* **INT8** - Synonym for BIGINT.

##### String

* **BINARY** - Fixed-length binary byte string.
* **BLOB** - Binary large object up to 65,535 bytes.
* **CHAR** - Fixed-length string.
* **CHAR BYTE** - Alias for BINARY.
* **ENUM** - Enumeration, or string object that can have one value chosen from a list of values.
* **INET4** - For storage of IPv4 addresses.
* **INET6** - For storage of IPv6 addresses.
* **JSON Data Type** - Compatibility data type that is an alias for LONGTEXT.
* **MEDIUMBLOB** - Medium binary large object up to 16,777,215 bytes.
* **MEDIUMTEXT** - A TEXT column with a maximum length of 16,777,215 characters.
* **LONGBLOB** - Long BLOB holding up to 4GB.
* **LONG** and **LONG VARCHAR** - LONG and LONG VARCHAR are synonyms for MEDIUMTEXT.
* **LONGTEXT** - A TEXT column with a maximum length of 4,294,967,295 characters.
* **ROW** - Data type for stored procedure variables.
* **TEXT** - A TEXT column with a maximum length of 65,535 characters.
* **TINYBLOB** - Tiny binary large object up to 255 bytes.
* **TINYTEXT** - A TEXT column with a maximum length of 255 characters.
* **VARBINARY** - Variable-length binary byte string.
* **VARCHAR** - Variable-length string.
* **SET** - Set, or string object that can have 0 or more values chosen from a list of values.
* **UUID** - Data type intended for the storage of UUID data.

##### Date and Time

* **DATE** - The date type YYYY-MM-DD.
* **TIME** - Time format HH:MM:SS.ssssss
* **DATETIME** - Date and time combination displayed as YYYY-MM-DD HH:MM:SS.
* **TIMESTAMP** - YYYY-MM-DD HH:MM:SS
* **YEAR** - A four-digit year.

##### Other

* **NULL** - NULL represents an unknown value.

-- [MariaDB documentation](https://mariadb.com/kb/en/data-types/)

##### Boolean & bit

```
MariaDB [quote_sql_lab]> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,036 sec)

MariaDB [quote_sql_lab]> DESCRIBE user;
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
MariaDB [quote_sql_lab]> CREATE TABLE rating
    -> (
    ->     quote_id INTEGER PRIMARY KEY,
    ->     rate INTEGER,
    ->     class SMALLINT,
    ->     points BIGINT
    -> );
Query OK, 0 rows affected (0,037 sec)

MariaDB [quote_sql_lab]> DESCRIBE rating;
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
MariaDB [quote_sql_lab]> CREATE TABLE physical_property
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     weight DECIMAL,
    ->     length NUMERIC,
    ->     height NUMERIC(2),
    ->     depth NUMERIC(2, 1)
    -> );
Query OK, 0 rows affected (0,018 sec)

MariaDB [quote_sql_lab]> DESCRIBE physical_property;
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
MariaDB [quote_sql_lab]> CREATE TABLE storage_conditions
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     humidity FLOAT,
    ->     temperature FLOAT(4),
    ->     air_pressure REAL
    -> );
Query OK, 0 rows affected (0,068 sec)

MariaDB [quote_sql_lab]> DESCRIBE storage_conditions;
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
MariaDB [quote_sql_lab]> CREATE TABLE file
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     mode BINARY(3)
    -> );
Query OK, 0 rows affected (0,020 sec)

MariaDB [quote_sql_lab]> DESCRIBE file;
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
MariaDB [quote_sql_lab]> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8),
    ->     description VARCHAR(256)
    -> );
Query OK, 0 rows affected (0,070 sec)

MariaDB [quote_sql_lab]> DESCRIBE medium_type;
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
MariaDB [quote_sql_lab]> CREATE TABLE points
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

MariaDB [quote_sql_lab]> DESCRIBE points;
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
MariaDB [quote_sql_lab]> INSERT INTO structured_data VALUES
    ->     (1, '{"genre": "thriller", "rating": 5}'),
    ->     (2, '{"hobby": "painting"}'),
    ->     (3, '{"interests": ["programming", "rock music"]}');
Query OK, 3 rows affected (0,012 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> DESCRIBE structured_data;
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
MariaDB [quote_sql_lab]> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8) PRIMARY KEY,
    ->     description VARCHAR(256) NOT NULL
    -> );
Query OK, 0 rows affected (0,033 sec)

MariaDB [quote_sql_lab]> DESCRIBE medium_type;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| codename    | char(8)      | NO   | PRI | NULL    |       |
| description | varchar(256) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0,019 sec)

MariaDB [quote_sql_lab]> INSERT INTO medium_type VALUES
    ->     ('BOOK', 'A book'),
    ->     ('CD', 'A CD'),
    ->     ('VHS', 'A VHS tape');
Query OK, 3 rows affected (0,007 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM medium_type;
+----------+-------------+
| codename | description |
+----------+-------------+
| BOOK     | A book      |
| CD       | A CD        |
| VHS      | A VHS tape  |
+----------+-------------+
3 rows in set (0,001 sec)

MariaDB [quote_sql_lab]> INSERT INTO medium_type VALUES
    ->     ('DVD', '');
Query OK, 1 row affected (0,008 sec)

MariaDB [quote_sql_lab]> INSERT INTO medium_type VALUES
    ->     ('AUDIOCST', NULL);
ERROR 1048 (23000): Column 'description' cannot be null
MariaDB [quote_sql_lab]> INSERT INTO medium_type (codename) VALUES
    ->     ('AUDIOCST');
ERROR 1364 (HY000): Field 'description' doesn't have a default value

MariaDB [quote_sql_lab]> SELECT * FROM medium_type;
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
MariaDB [quote_sql_lab]> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     personal_data_id INTEGER UNIQUE,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,026 sec)

MariaDB [quote_sql_lab]> DESCRIBE user;
+------------------+------------+------+-----+---------+-------+
| Field            | Type       | Null | Key | Default | Extra |
+------------------+------------+------+-----+---------+-------+
| ID               | int(11)    | NO   | PRI | NULL    |       |
| personal_data_id | int(11)    | YES  | UNI | NULL    |       |
| confirmed        | tinyint(1) | YES  |     | NULL    |       |
| active           | bit(1)     | YES  |     | NULL    |       |
+------------------+------------+------+-----+---------+-------+
4 rows in set (0,006 sec)

MariaDB [quote_sql_lab]> SELECT * FROM user;
Empty set (0,001 sec)

MariaDB [quote_sql_lab]> INSERT INTO user (ID, personal_data_id) VALUES (1, 1);
Query OK, 1 row affected (0,006 sec)

MariaDB [quote_sql_lab]> INSERT INTO user (ID, personal_data_id) VALUES (2, 1);
ERROR 1062 (23000): Duplicate entry '1' for key 'personal_data_id'
MariaDB [quote_sql_lab]> INSERT INTO user (ID, personal_data_id) VALUES (2, 2);
Query OK, 1 row affected (0,006 sec)

MariaDB [quote_sql_lab]> SELECT * FROM user;
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
MariaDB [quote_sql_lab]> CREATE TABLE storage_conditions
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     humidity FLOAT DEFAULT 40,
    ->     temperature FLOAT(4) DEFAULT 23,
    ->     air_pressure REAL DEFAULT 1013.25
    -> );
Query OK, 0 rows affected (0,023 sec)

MariaDB [quote_sql_lab]> DESCRIBE storage_conditions;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| medium_id    | int(11) | NO   | PRI | NULL    |       |
| humidity     | float   | YES  |     | 40      |       |
| temperature  | float   | YES  |     | 23      |       |
| air_pressure | double  | YES  |     | 1013.25 |       |
+--------------+---------+------+-----+---------+-------+
4 rows in set (0,013 sec)

MariaDB [quote_sql_lab]> INSERT INTO storage_conditions (medium_id) VALUES (1);
Query OK, 1 row affected (0,005 sec)

MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       40 |          23 |      1013.25 |
+-----------+----------+-------------+--------------+
1 row in set (0,001 sec)

```

##### Check

```
MariaDB [quote_sql_lab]> CREATE TABLE physical_property
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     weight DECIMAL CHECK (weight >= 0),
    ->     length NUMERIC,
    ->     height NUMERIC(2) CHECK (height <= length),
    ->     depth NUMERIC(2, 1) CHECK (depth <= height)
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> DESCRIBE physical_property;
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

MariaDB [quote_sql_lab]> INSERT INTO physical_property VALUES (1, 0.5, 3, 2, 1);
Query OK, 1 row affected, 1 warning (0,008 sec)

MariaDB [quote_sql_lab]> INSERT INTO physical_property VALUES (2, -0.5, 3, 2, 1);
ERROR 4025 (23000): CONSTRAINT `physical_property.weight` failed for `quote_sql_lab`.`physical_property`
MariaDB [quote_sql_lab]> INSERT INTO physical_property VALUES (3, 0.5, 3, 3.5, 1);
ERROR 4025 (23000): CONSTRAINT `physical_property.height` failed for `quote_sql_lab`.`physical_property`
MariaDB [quote_sql_lab]> INSERT INTO physical_property VALUES (4, 0.5, 3, 2, 3);
ERROR 4025 (23000): CONSTRAINT `physical_property.depth` failed for `quote_sql_lab`.`physical_property`
MariaDB [quote_sql_lab]> SELECT * FROM physical_property;
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
MariaDB [quote_sql_lab]> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,081 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| ID     | int(11)      | NO   | PRI | NULL    |       |
| owner  | varchar(256) | YES  |     | NULL    |       |
| author | varchar(256) | YES  |     | NULL    |       |
| source | varchar(512) | YES  |     | NULL    |       |
| rating | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
5 rows in set (0,012 sec)

```

**Multiple-column primary key**

```
MariaDB [quote_sql_lab]> CREATE TABLE points
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

MariaDB [quote_sql_lab]> DESCRIBE points;
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

**Conditions**

Primary key cannot be `NULL`.

```
MariaDB [quote_sql_lab]> INSERT INTO user (confirmed, active) VALUES (1, 1);
ERROR 1364 (HY000): Field 'ID' doesn't have a default value
```

Primary key must be *unique*.

```
MariaDB [quote_sql_lab]> INSERT INTO user (ID, confirmed, active) VALUES (1, 1, 1);
ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
```

##### Foreign key

```
MariaDB [quote_sql_lab]> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,09 sec)

MariaDB [quote_sql_lab]> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,036 sec)

MariaDB [quote_sql_lab]> CREATE TABLE points
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

MariaDB [quote_sql_lab]> INSERT INTO personal_data (name, surname) VALUES
    ->     ('John', 'Kowalsky'),
    ->     ('Vivienne', 'Morgenstein'),
    ->     ('Lisa', 'Pumpkinshire');
Query OK, 3 rows affected (0,007 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM personal_data;
+----+----------+--------------+
| id | name     | surname      |
+----+----------+--------------+
|  1 | John     | Kowalsky     |
|  2 | Vivienne | Morgenstein  |
|  3 | Lisa     | Pumpkinshire |
+----+----------+--------------+
3 rows in set (0,001 sec)

```
