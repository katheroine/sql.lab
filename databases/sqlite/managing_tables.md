[⌂ Home](../../README.md)
[⬆ Up: SQLite](README.md)
[▲ Previous: Managing databases](managing_databases.md)

## Managing tables

### Displaying tables

```
sqlite> .tables
```

### Creating tables

```
sqlite> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
sqlite> .tables
cover_type
```

#### Data types

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**SQLite Data Types**

* **Boolean**: BOOLEAN
* **Numeric**: INTEGER, REAL, NUMERIC
* **String**: TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME

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

##### Boolean & bit

```
sqlite> CREATE TABLE user
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     confirmed BOOLEAN,
   ...>     active BIT
   ...> );
sqlite> .schema user
CREATE TABLE user
(
    ID INTEGER PRIMARY KEY,
    confirmed BOOLEAN,
    active BIT
);
```

##### Integer

```
sqlite> CREATE TABLE rating
   ...> (
   ...>     quote_id INTEGER PRIMARY KEY,
   ...>     rate INTEGER,
   ...>     class SMALLINT,
   ...>     points BIGINT
   ...> );
sqlite> .schema rating
CREATE TABLE rating
(
    quote_id INTEGER PRIMARY KEY,
    rate INTEGER,
    class SMALLINT,
    points BIGINT
);
```

##### Decimal

```
sqlite> CREATE TABLE physical_property
   ...> (
   ...>     medium_id INTEGER PRIMARY KEY,
   ...>     weight DECIMAL,
   ...>     length NUMERIC,
   ...>     height NUMERIC(2),
   ...>     depth NUMERIC(2, 1)
   ...> );
sqlite> .schema physical_property
CREATE TABLE physical_property
(
    medium_id INTEGER PRIMARY KEY,
    weight DECIMAL,
    length NUMERIC,
    height NUMERIC(2),
    depth NUMERIC(2, 1)
);
```

##### Floating point

```
sqlite> CREATE TABLE storage_conditions
   ...> (
   ...>     medium_id INTEGER PRIMARY KEY,
   ...>     humidity FLOAT,
   ...>     temperature FLOAT(4),
   ...>     air_pressure REAL
   ...> );
sqlite> .schema storage_conditions
CREATE TABLE storage_conditions
(
    medium_id INTEGER PRIMARY KEY,
    humidity FLOAT,
    temperature FLOAT(4),
    air_pressure REAL
);
```

###### Binary

```
sqlite> CREATE TABLE file
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     mode BINARY(3)
   ...> );
sqlite> .schema file
CREATE TABLE file
(
    ID INTEGER PRIMARY KEY,
    mode BINARY(3)
);
```

##### Character

```
sqlite> CREATE TABLE medium_type
   ...> (
   ...>     codename CHAR(8) PRIMARY KEY,
   ...>     description VARCHAR(256)
   ...> );
sqlite> .schema medium_type
CREATE TABLE medium_type
(
    codename CHAR(8) PRIMARY KEY,
    description VARCHAR(256)
);
```

###### Date & time

```
sqlite> CREATE TABLE points
   ...> (
   ...>     user_id INTEGER,
   ...>     quote_id INTEGER,
   ...>     quantity INTEGER,
   ...>     date DATE,
   ...>     time TIME,
   ...>     datetime DATETIME,
   ...>     timestamp TIMESTAMP,
   ...>     PRIMARY KEY (user_id, quote_id)
   ...> );
sqlite> .schema points
CREATE TABLE points
(
    user_id INTEGER,
    quote_id INTEGER,
    quantity INTEGER,
    date DATE,
    time TIME,
    datetime DATETIME,
    timestamp TIMESTAMP,
    PRIMARY KEY (user_id, quote_id)
);
```

##### JSON

```
sqlite> CREATE TABLE structured_data
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     content JSON
   ...> );
sqlite> .schema structured_data
CREATE TABLE structured_data
(
    id INTEGER PRIMARY KEY,
    content JSON
);
```

#### Constraints

##### Primary key

**Single-column primary key**

```
sqlite> CREATE TABLE quote
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     owner VARCHAR(256),
   ...>     author VARCHAR(256),
   ...>     source VARCHAR(512),
   ...>     rating INTEGER
   ...> );
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

**Multiple-column primary key**

```
sqlite> CREATE TABLE points
   ...> (
   ...>     user_id INTEGER,
   ...>     quote_id INTEGER,
   ...>     quantity INTEGER,
   ...>     date DATE,
   ...>     time TIME,
   ...>     datetime DATETIME,
   ...>     timestamp TIMESTAMP,
   ...>     PRIMARY KEY (user_id, quote_id)
   ...> );
sqlite> .schema points
CREATE TABLE points
(
    user_id INTEGER,
    quote_id INTEGER,
    quantity INTEGER,
    date DATE,
    time TIME,
    datetime DATETIME,
    timestamp TIMESTAMP,
    PRIMARY KEY (user_id, quote_id)
);
```
