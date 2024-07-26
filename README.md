# SQL.lab

Laboratory of SQL & most popular SQL databases:
* MySQL
* PostgreSQL
* MariaDB
* SQLite

## SQL databases

**When to use MySQL, when PostrgeSQL, when MariaDB and when SQLite?**

* **SQLite** is a *lightweight, embedded* database that's often used for *smaller applications* or when you need a database that *doesn't require a separate server*. It's a good choice for *mobile apps, desktop applications*, and other scenarios where you need a *simple and efficient database*.

* **MySQL** is a widely used, open-source relational database management system (RDBMS) known for its *speed and reliability*. It's a good choice for applications that require *robust transaction support and complex querying capabilities* with relational data.

* **MariaDB** is a fork of MySQL, designed to be a *fully compatible and enhanced* version. It's a good choice for applications that require *high availability, security, interoperability, and performance capabilities*.

* **PostgreSQL** is another popular open-source RDBMS that excels in *complex data models and high-traffic scenarios*. It's often preferred for applications that demand *high data integrity and advanced features like foreign key constraints and triggers*.

Ultimately, the best choice for you will depend on your specific needs and requirements. Consider factors like the size and complexity of your data, the performance requirements of your application, and the level of support you need.

-- Aria

Choosing the right database for your application can significantly impact performance, scalability, and development efficiency. Let's break down when to use each of these popular options:  

**SQLite**

Best for: Embedded systems, small desktop applications, mobile apps, and prototyping.  

Why:

* Lightweight and self-contained: No separate server process required.
* ACID compliance: Ensures data integrity.
* Fast: Very efficient for small datasets.

Limitations:

* Not suitable for high concurrency or large datasets.  
* No built-in replication or clustering.

**MySQL**

Best for: Web applications, e-commerce platforms, content management systems, and high-traffic websites.  

Why:

* Fast and efficient for read-heavy workloads.  
* Easy to use and manage.  
* Strong community support and extensive ecosystem.
* Good performance for medium-sized datasets.  

Limitations:

* Less advanced features compared to PostgreSQL.  
* Can struggle with complex queries and large datasets.  

**MariaDB**

Best for: High-performance applications, cloud-based deployments, and migrating from MySQL.

Why:

* Fork of MySQL with performance improvements and additional features.
* Compatible with MySQL, making migration easier.  
* Strong focus on scalability and performance.  
* Offers columnar storage for analytical workloads.  

Limitations:

* Smaller community compared to MySQL.
* Some features might be less mature than PostgreSQL.

**PostgreSQL**

Best for: Complex applications, data warehousing, geospatial data, and real-time analytics.  

Why:

* Advanced features like JSONB, full-text search, and advanced querying.  
* Strong ACID compliance and data integrity.  
* Scalable and supports large datasets.  
* Active development and strong community.  

Limitations:

* Can be more resource-intensive than MySQL or MariaDB.
* Steeper learning curve for complex features.

**Key Considerations**

* **Data volume and complexity**: Small datasets are ideal for SQLite, while large and complex datasets favor PostgreSQL.  

* **Performance**: MySQL and MariaDB excel in read-heavy workloads, while PostgreSQL offers better performance for complex queries.  

* **Features**: PostgreSQL provides a rich feature set, including advanced data types and functions.  

* **Scalability**: MariaDB and PostgreSQL are better suited for scaling than MySQL and SQLite.

* **Cost**: SQLite is free and self-contained, while others require server infrastructure.  

* **Community and support**: MySQL and PostgreSQL have larger communities and more resources available.

Remember: There's no one-size-fits-all answer. The best database depends on your specific application requirements. It's often helpful to prototype with different options to make an informed decision.

-- [Gemini](https://g.co/gemini/share/6412becd3dd9)

## Installation & running

### Installation

**SQLite**

```bash
$ sudo aptitude install sqlite
```

**MySQL**

```bash
$ sudo aptitude install mysql-server mysql-client
```

**MariaDB**

```bash
$ sudo aptitude install mariadb-server mariadb-client
```

**PostgreSQL**

```bash
$ sudo aptitude install postgresql
```

### Running client

**SQLite**

```bash
$ sudo aptitude install sqlite
```

**MySQL**

```bash
$ sudo mysql -u root
```

**PostgreSQL**

```bash
$ sudo -u postgres psql
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

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

**MySQL**

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INTEGER, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
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

#### Columns & datatypes

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

#### Primary key

**MySQL**

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

**SQLite**

```bash
sqlite> .tables
cover_type
sqlite> CREATE TABLE quote
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     owner VARCHAR(256),
   ...>     author VARCHAR(256),
   ...>     source VARCHAR(512),
   ...>     rating INTEGER
   ...> );
sqlite> .tables
cover_type  quote
sqlite> .schema quote
CREATE TABLE quote
(
    ID INTEGER PRIMARY KEY,
    owner VARCHAR(256),
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);
```
