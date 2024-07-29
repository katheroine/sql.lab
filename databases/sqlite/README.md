# SQLite

## Installation and running

### Installation

```bash
$ sudo aptitude install sqlite
```

### Running client

```bash
$ sqlite
```

## Working with databases

### Displaying databases

```bash
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main
1    temp
```

### Creating and choosing databases

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

```bash
sqlite> .tables
```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

**SQLite Data Types**

INTEGER
REAL
TEXT
BLOB
NULL

* **Numeric**: INTEGER, REAL, NUMERIC
* **String**: TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME
* **Boolean**: BOOLEAN

#### Columns and datatypes

```bash
sqlite> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
sqlite> .tables
cover_type
```

#### Primary key

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
