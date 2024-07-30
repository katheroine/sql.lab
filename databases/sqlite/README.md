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

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**SQLite Data Types**

* **Numeric**: INTEGER, REAL, NUMERIC
* **String**: TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME
* **Boolean**: BOOLEAN

Most SQL database engines (every SQL database engine other than SQLite, as far as we know) uses static, rigid typing. With static typing, the datatype of a value is determined by its container - the particular column in which the value is stored.

*SQLite uses a more general **dynamic type system**. In SQLite, the datatype of a value is associated with the value itself, not with its container.* The dynamic type system of SQLite is backwards compatible with the more common static type systems of other database engines in the sense that SQL statements that work on statically typed databases work the same way in SQLite. However, the dynamic typing in SQLite allows it to do things which are not possible in traditional rigidly typed databases. Flexible typing is a feature of SQLite, not a bug.

As of version 3.37.0 (2021-11-27), SQLite provides STRICT tables that do rigid type enforcement, for developers who prefer that kind of thing.

Each value stored in an SQLite database (or manipulated by the database engine) has one of the following storage classes:

* **NULL** - The value is a NULL value.

* **INTEGER** - The value is a signed integer, stored in 0, 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.

* **REAL** - The value is a floating point value, stored as an 8-byte IEEE floating point number.

* **TEXT** - The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).

* **BLOB** - The value is a blob of data, stored exactly as it was input.

A storage class is more general than a datatype. The INTEGER storage class, for example, includes 7 different integer datatypes of different lengths. This makes a difference on disk. But as soon as INTEGER values are read off of disk and into memory for processing, they are converted to the most general datatype (8-byte signed integer). And so for the most part, "storage class" is indistinguishable from "datatype" and the two terms can be used interchangeably.

-- [SQLite documentation](https://www.sqlite.org/datatype3.html)

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
