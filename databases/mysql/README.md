# MySQL

## Installation and running

### Installation

```bash
$ sudo aptitude install mysql-server mysql-client
```

### Running client

```bash
$ sudo mysql -u root
```

## Working with databases

### Displaying databases

```bash
mysql> SHOW DATABASES;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| sys                     |
+-------------------------+
4 rows in set (0,00 sec)

```

### Creating and choosing databases

```bash
mysql> CREATE DATABASE quote_sql_lab;
Query OK, 1 row affected (0,03 sec)

mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| quote_sql_lab           |
| sys                     |
+-------------------------+
5 rows in set (0,01 sec)

mysql> USE quote_sql_lab;
Database changed
```

## Working with tables

### Displaying tables

```bash
mysql> SHOW TABLES;
Empty set (0,00 sec)

```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INTEGER, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
* **String**: CHAR, VARCHAR, BINARY, VARBINARY, TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME, TIMESTAMP
* **Other**: ENUM, SET, BIT

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

#### Columns and datatypes

```bash
mysql> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
Query OK, 0 rows affected (0,07 sec)

mysql> show tables;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
+-------------------------+
1 row in set (0,01 sec)

```

#### Primary key

```bash
mysql> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,09 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
| quote                   |
+-------------------------+
2 rows in set (0,01 sec)

mysql> DESCRIBE quote;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| ID     | int          | NO   | PRI | NULL    |       |
| owner  | varchar(256) | YES  |     | NULL    |       |
| author | varchar(256) | YES  |     | NULL    |       |
| source | varchar(512) | YES  |     | NULL    |       |
| rating | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
5 rows in set (0,01 sec)

```
