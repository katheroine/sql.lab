# SQL.lab

Laboratory of SQL & most popular SQL databases:
* MySQL
* PostgreSQL
* SQLite

## SQL databases

**When to use MySQL, wen PostrgeSQL and when SQLite?**

There are many factors to consider when choosing a database for your project, including the size of your project, the complexity of your data, and your budget. In general, MySQL is a good choice for small and medium-sized projects, while PostgreSQL is a good choice for large and complex projects. SQLite is a good choice for embedded applications or applications that need to be portable.

Here is a more detailed comparison of the three databases:

* **MySQL**: MySQL is a popular open-source relational database management system (RDBMS). It is known for its *ease of use, performance, and scalability*. MySQL is a good choice for *small and medium-sized projects*.


* **PostgreSQL**: PostgreSQL is a powerful and scalable open-source object-relational database management system (ORDBMS). It is known for its *reliability, security, and support for complex data types*. PostgreSQL is a good choice for *large and complex projects*.


* **SQLite**: SQLite is a lightweight embedded SQL database engine. It is known for its *portability, simplicity, and ease of use*. SQLite is a good choice for *embedded applications or applications that need to be portable*.

## Installation & running

### Installation

**MySQL**

```bash
$ sudo aptitude install mysql-server mysql-client
```

**PostgreSQL**

```bash
$ sudo aptitude install postgresql
```

**SQLite**

```bash
$ sudo aptitude install sqlite
```

### Running client

**MySQL**

```bash
$ sudo mysql -u root
```

**PostgreSQL**

```bash
$ sudo -u postgres psql
```

**SQLite**

```bash
$ sudo aptitude install sqlite
```

## Working with databases

### Displaying databases

**MySQL**

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

**PostgreSQL**

```bash
postgres=# \db
       List of tablespaces
    Name    |  Owner   | Location
------------+----------+----------
 pg_default | postgres |
 pg_global  | postgres |
(2 rows)

postgres=# \list
                                    List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
---------------+----------+----------+-------------+-------------+-----------------------
 postgres      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 template0     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
(3 rows)

```

**SQLite**

```bash
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main
1    temp
```

### Creating and choosing databases

**MySQL**

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

**PostgreSQL**

```bash
postgres=# CREATE DATABASE quote_sql_lab;
CREATE DATABASE
postgres=# \list
                                    List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
---------------+----------+----------+-------------+-------------+-----------------------
 postgres      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 quote_sql_lab | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 template0     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
(4 rows)

postgres=# \connect quote_sql_lab
You are now connected to database "quote_sql_lab" as user "postgres".
```

**SQLite**

```bash
$ sqlite quote_sql_lab.db
SQLite version 2.8.17
Enter ".help" for instructions
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main             /home/katheroine/quote_sql_lab.db
1    temp             /var/tmp/sqlite_4bgECn3Em2x6p9V
```

## Working with tables

### Displaying tables

**MySQL**

```bash
mysql> show tables;
Empty set (0,00 sec)

```

**PostgreSQL**

```bash
quote_sql_lab=# \dt
Did not find any relations.

```

**SQLite**

```bash
sqlite> .tables
```

### Creating tables

#### Simple case

**MySQL**

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

**PostgreSQL**

```bash
quote_sql_lab=# CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
CREATE TABLE
quote_sql_lab=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | cover_type | table | postgres
(1 row)

```

**SQLite**

```bash
sqlite> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
sqlite> .tables
cover_type
```

#### Datatypes

The set of data types available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

**MySQL**

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
* **String**: CHAR, VARCHAR, BINARY, VARBINARY, TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME, TIMESTAMP
* **Other**: ENUM, SET, BIT

**PostgreSQL**

* **Numeric**: SMALLINT, INTEGER, BIGINT, NUMERIC, DECIMAL, REAL, DOUBLE PRECISION
* **String**: CHAR, VARCHAR, TEXT
* **Binary**: BYTEA
* **Date and time**: DATE, TIME, TIMESTAMP, INTERVAL
* **Boolean**: BOOLEAN
* **Geometric**: POINT, LINE, POLYGON, CIRCLE
* **Network**: MACADDR, INET, CIDR
* **Other**: UUID, XML, JSON

**SQLite**

* **Numeric**: INTEGER, REAL, NUMERIC
* **String**: TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME
* **Boolean**: BOOLEAN

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.
