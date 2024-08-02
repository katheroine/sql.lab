# SQL.lab

Laboratory of SQL & most popular SQL databases:
* [SQLite](databases/sqlite/README.md)
* [MySQL](databases/mysql/README.md)
* [MariaDB](databases/mariadb/README.md)
* [PostgreSQL](databases/postgresql/README.md)

## Index

1. [Databases](databases/databases.md)
2. [Installation and running](#installation-and-running)
    1. Installation
    2. Running client
3. [Working with databases](#working-with-databases)
    1. Displaying databases
    2. Creating and choosing databases
4. [Working with tables](#working-with-tables)
    1. Displaying tables
    2. Creating tables
        1. Datatypes
        2. Columns and datatypes
        3. Primary key

### Installation and running

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Installation**|[✤](databases/sqlite/README.md#installation)|[✤](databases/mysql/README.md#installation)|[✤](databases/mariadb/README.md#installation)|[✤](databases/postgresql/README.md#installation)|

### Working with databases

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying databases**|[✤](databases/sqlite/README.md#displaying-databases)|[✤](databases/mysql/README.md#displaying-databases)|[✤](databases/mariadb/README.md#displaying-databases)|[✤](databases/postgresql/README.md#displaying-databases)|
|**Creating and choosing databases**|[✤](databases/sqlite/README.md#creating-and-choosing-databases)|[✤](databases/mysql/README.md#creating-and-choosing-databases)|[✤](databases/mariadb/README.md#creating-and-choosing-databases)|[✤](databases/postgresql/README.md#creating-and-choosing-databases)|

### Working with tables

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying tables**|[✤](databases/sqlite/README.md#displaying-tables)|[✤](databases/mysql/README.md#displaying-tables)|[✤](databases/mariadb/README.md#displaying-tables)|[✤](databases/postgresql/README.md#displaying-tables)|
|**Creating tables**|
|Datatypes|[✤](databases/sqlite/README.md#datatypes)|[✤](databases/mysql/README.md#datatypes)|[✤](databases/mariadb/README.md#datatypes)|[✤](databases/postgresql/README.md#datatypes)|
|Columns and datatypes|[✤](databases/sqlite/README.md#columns-and-datatypes)|[✤](databases/mysql/README.md#columns-and-datatypes)|[✤](databases/mariadb/README.md#columns-and-datatypes)|[✤](databases/postgresql/README.md#columns-and-datatypes)|
|Primary key|[✤](databases/sqlite/README.md#primary-key)|[✤](databases/mysql/README.md#primary-key)|[✤](databases/mariadb/README.md#primary-key)|[✤](databases/postgresql/README.md#primary-key)|

## Basic commands

Prompts:
* `$` - system console
* `>` - SQLite/MySQL/MariaDB console
* `=#` - PostgreSQL console

**Remember to omit the prompt when copying the command.**

|-----------------------------------------------|SQLite -------------------|MySQL -------------------|MariaDB -------------------|PostgreSQL -------------------|
|--|--|--|--|--|
|**Choosing database**|`$ sqlite quote_sql_lab.db`|`> USE quote_sql_lab;`|`> USE quote_sql_lab;`|`=# \connect quote_sql_lab`|
|**Displaying databases**|`> .databases`|`> SHOW DATABASES;`|`> SHOW DATABASES;`|`=# \list`|
|**Displaying tablespaces**||||`=# \db`|
|**Displaying tables**|`> .tables`|`> SHOW TABLES;`|`> SHOW TABLES;`|`=# \dt`|
|**Describing table**|`> .schema quote`|`> DESCRIBE quote;`|`> DESCRIBE quote;`|`=# \d+ quote`|
