[⌂ Home](../../../README.md)
[⬆ Up: Managing tables](README.md)
[▲ Previous: Displaying tables](displaying_tables.md)
[▼ Next: Modifying tables](modifying_tables.md)

### Creating tables

```sql
CREATE TABLE table_name (
    column_1_name column_1_type column_1_attributes,
    column_2_name column_2_type column_2_attributes,
    column_3_name column_3_type column_3_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name BOOLEAN column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name BIT column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name INTEGER column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name DECIMAL column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name NUMERIC column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name DECIMAL(precision) column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name NUMERIC(precision) column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name DECIMAL(precision, scale) column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name NUMERIC(precision, scale) column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name FLOAT column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name FLOAT(precision) column_attributes
);
```

**Precision** is the number of digits in a number.

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

```sql
CREATE TABLE table_name (
    column_name BINARY(digits_number) column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name CHAR(characters_number) column_attributes
);
```

```sql
CREATE TABLE table_name (
    column_name VARCHAR(characters_number) column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name DATETIME column_attributes
);
```

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

```sql
CREATE TABLE table_name (
    column_name JSON column_attributes
);
```

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

##### NOT NULL

```sql
CREATE TABLE table_name (
    column_name column_type NOT NULL
);
```

```
sqlite> CREATE TABLE medium_type
   ...> (
   ...>     codename CHAR(8) PRIMARY KEY,
   ...>     description VARCHAR(256) NOT NULL
   ...> );
sqlite> INSERT INTO medium_type VALUES ('BOOK', 'A book');
sqlite> INSERT INTO medium_type VALUES ('CD', 'A CD');
sqlite> SELECT * FROM medium_type;
BOOK|A book
CD|A CD
VHS|A VHS tape
sqlite> INSERT INTO medium_type VALUES ('DVD', '');
sqlite> INSERT INTO medium_type VALUES ('AUDIOCST', NULL);
SQL error: medium_type.description may not be NULL
sqlite> INSERT INTO medium_type (codename) VALUES ('AUDIOCST');
SQL error: medium_type.description may not be NULL
BOOK|A book
CD|A CD
VHS|A VHS tape
DVD|
```

##### Unique

```sql
CREATE TABLE table_name (
    column_name column_type UNIQUE
);
```

```
sqlite> CREATE TABLE user
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     personal_data_id INTEGER UNIQUE,
   ...>     confirmed BOOLEAN,
   ...>     active BIT
   ...> );
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (1, 1);
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (2, 1);
SQL error: column personal_data_id is not unique
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (2, 2);
sqlite> SELECT * FROM user;
1|1||
2|2||
```

##### Default

```sql
CREATE TABLE table_name (
    column_name column_type DEFAULT default_value
);
```

```
sqlite> CREATE TABLE storage_conditions
   ...> (
   ...>     medium_id INTEGER PRIMARY KEY,
   ...>     humidity FLOAT DEFAULT 40,
   ...>     temperature FLOAT(4) DEFAULT 23,
   ...>     air_pressure REAL DEFAULT 1013.25
   ...> );
sqlite> INSERT INTO storage_conditions (medium_id) VALUES (1);
sqlite> SELECT * FROM storage_conditions;
1|40|23|1013.25
```

##### Check

**It doesn't work in SQLite.**

```
sqlite> CREATE TABLE physical_property
   ...> (
   ...>     medium_id INTEGER PRIMARY KEY,
   ...>     weight DECIMAL CHECK (weight >= 0),
   ...>     length NUMERIC,
   ...>     height NUMERIC(2) CHECK (height <= length),
   ...>     depth NUMERIC(2, 1) CHECK (depth <= height)
   ...> );
sqlite> INSERT INTO physical_property VALUES (1, 0.5, 3, 2, 1);
sqlite> INSERT INTO physical_property VALUES (2, -0.5, 3, 2, 1);
sqlite> INSERT INTO physical_property VALUES (3, 0.5, 3, 3.5, 1);
sqlite> INSERT INTO physical_property VALUES (4, 0.5, 3, 2, 3);
sqlite> SELECT * FROM physical_property;
1|0.5|3|2|1
2|-0.5|3|2|1
3|0.5|3|3.5|1
4|0.5|3|2|3
```

##### Primary key

**Single-column primary key**

```sql
CREATE TABLE table_name (
    column_name column_type PRIMARY KEY
);
```

```
sqlite> CREATE TABLE quote
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     owner VARCHAR(256),
   ...>     author VARCHAR(256),
   ...>     source VARCHAR(512),
   ...>     rating INTEGER
   ...> );
```

**Multiple-column primary key**

```sql
CREATE TABLE table_name (
    column_1_name column_1_type,
    column_2_name column_2_type,
    PRIMARY KEY (column_1_name, column_2_name)
);
```

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
```

##### Foreign key

```
sqlite> CREATE TABLE quote
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     owner VARCHAR(256),
   ...>     author VARCHAR(256),
   ...>     source VARCHAR(512),
   ...>     rating INTEGER
   ...> );
sqlite> CREATE TABLE user
   ...> (
   ...>     ID INTEGER PRIMARY KEY,
   ...>     confirmed BOOLEAN,
   ...>     active BIT
   ...> );
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
```

##### Autoincrement

**There's no autoincrement in SQLite but PRIMARY KEY coulmn is autoincremented if the value is given as NULL.**

```
sqlite> CREATE TABLE personal_data
   ...> (
   ...>     id INTEGER PRIMARY KEY AUTO_INCREMENT,
   ...>     name VARCHAR(256),
   ...>     surname VARCHAR(256)
   ...> );
SQL error: near "AUTO_INCREMENT": syntax error
sqlite> CREATE TABLE personal_data
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     name VARCHAR(256),
   ...>     surname VARCHAR(256)
   ...> );
sqlite> INSERT INTO personal_data VALUES (NULL, 'John', 'Kowalsky');
sqlite> INSERT INTO personal_data VALUES (NULL, 'Vivienne', 'Morgenstein');
sqlite> INSERT INTO personal_data VALUES (NULL, 'Lisa', 'Pumpkinshire');
sqlite> SELECT * FROM personal_data;
1|John|Kowalsky
2|Vivienne|Morgenstein
3|Lisa|Pumpkinshire
```

##### Indexes

**There is no possibility of adding indexes in SQLite during the database creation.**
