# PostgreSQL

## Installation and running

### Installation

```bash
$ sudo aptitude install postgresql
```

### Running client

```bash
$ sudo -u postgres psql
```

## Working with databases

### Displaying databases

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

### Creating and choosing databases

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

## Working with tables

### Displaying tables

```bash
quote_sql_lab=# \dt
Did not find any relations.

```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

* **Numeric**: SMALLINT, INTEGER, BIGINT, NUMERIC, DECIMAL, REAL, DOUBLE PRECISION
* **String**: CHAR, VARCHAR, TEXT
* **Binary**: BYTEA
* **Date and time**: DATE, TIME, TIMESTAMP, INTERVAL
* **Boolean**: BOOLEAN
* **Geometric**: POINT, LINE, POLYGON, CIRCLE
* **Network**: MACADDR, INET, CIDR
* **Other**: UUID, XML, JSON

#### Columns and datatypes

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

#### Primary key

```bash
quote_sql_lab=# CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
CREATE TABLE
quote_sql_lab=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | cover_type | table | postgres
(1 row)

quote_sql_lab=# CREATE TABLE quote
quote_sql_lab-# (
quote_sql_lab(#     ID INTEGER PRIMARY KEY,
quote_sql_lab(#     owner VARCHAR(256),
quote_sql_lab(#     author VARCHAR(256),
quote_sql_lab(#     source VARCHAR(512),
quote_sql_lab(#     rating INTEGER
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | cover_type | table | postgres
 public | quote      | table | postgres
(2 rows)

quote_sql_lab=# \d+ quote
                                           Table "public.quote"
 Column |          Type          | Collation | Nullable | Default | Storage  | Stats target | Description
--------+------------------------+-----------+----------+---------+----------+--------------+-------------
 id     | integer                |           | not null |         | plain    |              |
 owner  | character varying(256) |           |          |         | extended |              |
 author | character varying(256) |           |          |         | extended |              |
 source | character varying(512) |           |          |         | extended |              |
 rating | integer                |           |          |         | plain    |              |
Indexes:
    "quote_pkey" PRIMARY KEY, btree (id)
Access method: heap

```
