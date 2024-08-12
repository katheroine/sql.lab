# SQL.lab

Laboratory of SQL & most popular SQL databases:
* [SQLite](databases/sqlite/README.md)
* [MySQL](databases/mysql/README.md)
* [MariaDB](databases/mariadb/README.md)
* [PostgreSQL](databases/postgresql/README.md)

## Index

1. [Databases](databases/databases.md)
2. [SQL](sql/sql.md)
3. [Installation and running databases](#installation-and-running)
    1. Installation
    2. Running client
4. [Managing databases](#managing-databases)
    1. Displaying databases
    2. Creating and choosing databases
5. [Managing tables](#managing-tables)
    1. Displaying tables
    2. Creating tables
        1. [Data types](sql/data_types.md)
        2. Columns and data types
        3. Primary key

### Installation and running

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Installation**|[✤](databases/sqlite/installation_and_running.md)|[✤](databases/mysql/installation_and_running.md)|[✤](databases/mariadb/installation_and_running.md)|[✤](databases/postgresql/installation_and_running.md)|

### Managing databases

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying databases**|[✤](databases/sqlite/managing_databases.md#displaying-databases)|[✤](databases/mysql/managing_databases.md#displaying-databases)|[✤](databases/mariadb/managing_databases.md#displaying-databases)|[✤](databases/postgresql/managing_databases.md#displaying-databases)|
|**Creating and choosing databases**|[✤](databases/sqlite/managing_databases.md#creating-and-choosing-databases)|[✤](databases/mysql/managing_databases.md#creating-and-choosing-databases)|[✤](databases/mariadb/managing_databases.md#creating-and-choosing-databases)|[✤](databases/postgresql/managing_databases.md#creating-and-choosing-databases)|

### Managing tables

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying tables**|[✤](databases/sqlite/managing_tables.md#displaying-tables)|[✤](databases/mysql/managing_tables.md#displaying-tables)|[✤](databases/mariadb/managing_tables.md#displaying-tables)|[✤](databases/postgresql/managing_tables.md#displaying-tables)|
|**Creating tables**|
|Datatypes|[✤](databases/sqlite/managing_tables.md#datatypes)|[✤](databases/mysql/managing_tables.md#datatypes)|[✤](databases/mariadb/managing_tables.md#datatypes)|[✤](databases/postgresql/managing_tables.md#datatypes)|
|Columns and datatypes|[✤](databases/sqlite/managing_tables.md#columns-and-datatypes)|[✤](databases/mysql/managing_tables.md#columns-and-datatypes)|[✤](databases/mariadb/managing_tables.md#columns-and-datatypes)|[✤](databases/postgresql/managing_tables.md#columns-and-datatypes)|
|Primary key|[✤](databases/sqlite/managing_tables.md#primary-key)|[✤](databases/mysql/managing_tables.md#primary-key)|[✤](databases/mariadb/managing_tables.md#primary-key)|[✤](databases/postgresql/managing_tables.md#primary-key)|

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
