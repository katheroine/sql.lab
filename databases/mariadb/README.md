# MariaDB

## Installation and running

### Installation

```bash
$ sudo aptitude install mariadb-server mariadb-client
```

### Running client

```bash
$ sudo mariadb -u root
```

## Working with databases

### Displaying databases

```bash
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0,068 sec)

```

### Creating and choosing databases

```bash
MariaDB [(none)]> CREATE DATABASE quote_sql_lab;
Query OK, 1 row affected (0,005 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| quote_sql_lab      |
| test               |
+--------------------+
5 rows in set (0,010 sec)

MariaDB [(none)]> USE quote_sql_lab;
Database changed
```

## Working with tables

### Displaying tables

```bash
MariaDB [quote_sql_lab]> SHOW TABLES;
Empty set (0,001 sec)

```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.
