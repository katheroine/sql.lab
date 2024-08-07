[⌂ Home](../README.md)

# Data types

The SQL standard defines three kinds of data types:
* predefined data types
* constructed types
* user-defined types

**Predefined data types** are intrinsically supported by the implementation.

**Constructed types** are one of `ARRAY`, `MULTISET`, `REF(erence)`, or `ROW`.

**User-defined types** are comparable to classes in object-oriented language with their own constructors, observers, mutators, methods, inheritance, overloading, overwriting, interfaces, and so on.

## Predefined data types

* Boolean
* Numeric types
    * Exact numeric types (NUMERIC, DECIMAL, SMALLINT, INTEGER, BIGINT)
    * Approximate numeric types (FLOAT, REAL, DOUBLE PRECISION)
    * Decimal floating-point type (DECFLOAT)
* Binary types
    * Binary (BINARY)
    * Binary varying (VARBINARY)
    * Binary large object (BLOB)
* Character types
    * Character (CHAR)
    * Character varying (VARCHAR)
    * Character large object (CLOB)
    * National character types
    * National character (NCHAR)
    * National character varying (NCHAR VARYING)
    * National character large object (NCLOB)
* Datetime types (DATE, TIME, TIMESTAMP)
* Interval type (INTERVAL)
* XML
* JSON

--[Wikipedia](https://en.wikipedia.org/wiki/SQL#SQL_data_types)

### Boolean

**`BOOLEAN`** type, across the IT technologies, allows to store values `true` or `false`.
In SQL it can be used as a type in the process of table creation but in fact it is realised as another type - usually `TINYINT(1)`.

```sql
CREATE TABLE user
(
    ID INTEGER PRIMARY KEY,
    confirmed BOOLEAN
);
```

```
> DESCRIBE user;
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| ID        | int        | NO   | PRI | NULL    |       |
| confirmed | tinyint(1) | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
2 rows in set
```

```sql
INSERT INTO user VALUES
    (1, true),
    (2, false),
    (3, 1),
    (4, 0),
    (5, NULL);
```

```
> SELECT * FROM user;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  1 |         1 |
|  2 |         0 |
|  3 |         1 |
|  4 |         0 |
|  5 |      NULL |
+----+-----------+
5 rows in set

> SELECT * FROM user WHERE confirmed = true;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  1 |         1 |
|  3 |         1 |
+----+-----------+
2 rows in set

> SELECT * FROM user WHERE confirmed = false;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  2 |         0 |
|  4 |         0 |
+----+-----------+
2 rows in set

> SELECT * FROM user WHERE confirmed = 1;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  1 |         1 |
|  3 |         1 |
+----+-----------+
2 rows in set

> SELECT * FROM user WHERE confirmed = 0;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  2 |         0 |
|  4 |         0 |
+----+-----------+
2 rows in set

> SELECT * FROM user WHERE confirmed IS NULL;
+----+-----------+
| ID | confirmed |
+----+-----------+
|  5 |      NULL |
+----+-----------+
2 rows in set
```

### Numeric

**`BIT`** is an integer data type that can take a value of `1`, `0`, or `NULL`.

The bit data type can be used to store Boolean values. The string values TRUE and FALSE can be converted to bit values: TRUE is converted to 1, and FALSE is converted to 0. Converting to bit promotes any nonzero value to 1.

-- [SQL Server documentation](https://learn.microsoft.com/en-us/sql/t-sql/data-types/bit-transact-sql)

```sql
CREATE TABLE user
(
    ID INTEGER PRIMARY KEY,
    active BIT
);
```

```
> DESCRIBE user;
+--------+---------+------+-----+---------+-------+
| Field  | Type    | Null | Key | Default | Extra |
+--------+---------+------+-----+---------+-------+
| ID     | int(11) | NO   | PRI | NULL    |       |
| active | bit(1)  | YES  |     | NULL    |       |
+--------+---------+------+-----+---------+-------+
2 rows in set
```

```sql
INSERT INTO user VALUES
    (1, true),
    (2, false),
    (3, 1),
    (4, 0),
    (5, null);
```

```
> SELECT * FROM user;
+----+--------+
| ID | active |
+----+--------+
|  1 |       |
|  2 |        |
|  3 |       |
|  4 |        |
|  5 | NULL   |
+----+--------+
5 rows in set

> SELECT * FROM user WHERE active = true;
+----+--------+
| ID | active |
+----+--------+
|  1 |       |
|  3 |       |
+----+--------+
2 rows in set

> SELECT * FROM user WHERE active = false;
+----+--------+
| ID | active |
+----+--------+
|  2 |        |
|  4 |        |
+----+--------+

> SELECT * FROM user WHERE active = 1;
+----+--------+
| ID | active |
+----+--------+
|  1 |       |
|  3 |       |
+----+--------+
2 rows in set

> SELECT * FROM user WHERE active = 0;
+----+--------+
| ID | active |
+----+--------+
|  2 |        |
|  4 |        |
+----+--------+
2 rows in set

> SELECT * FROM user WHERE active IS NULL;
+----+--------+
| ID | active |
+----+--------+
|  5 | NULL   |
+----+--------+
1 rows in set
```

**`DECIMAL`** and **`NUMERIC`** are numeric data types that have a fixed precision and scale; *they are synonyms and can be used interchangeably*.

**`DECIMAL[(p[,s])]`**, **`NUMERIC[(p[,s])]`** - fixed precision and scale numbers. When maximum precision is used, valid values are from `-10^38 + 1` through `10^38 - 1`. The ISO synonyms for `DECIMAL` are `DEC` and `DEC(p,s)`. *`NUMERIC` is functionally identical to `DECIMAL`*.

*`p`* (precision) - the maximum total number of decimal digits to be stored. This number includes both the left and the right sides of the decimal point. The precision must be a value from `1` through the maximum precision of `38`. The default precision is `18`.

*`s`* (scale) - the number of decimal digits that are stored to the right of the decimal point. This number is subtracted from `p` to determine the maximum number of digits to the left of the decimal point. Scale must be a value from `0` through `p`, and can only be specified if precision is specified. The default scale is `0`, and so `0 <= s <= p`. Maximum storage sizes vary, based on the precision.

```sql
CREATE TABLE physical_property
(
    medium_id INTEGER PRIMARY KEY,
    weight DECIMAL,
    length NUMERIC,
    height NUMERIC(2),
    depth NUMERIC(2, 1)
);
```

```
> DESCRIBE physical_property;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| medium_id | int(11)       | NO   | PRI | NULL    |       |
| weight    | decimal(10,0) | YES  |     | NULL    |       |
| length    | decimal(10,0) | YES  |     | NULL    |       |
| height    | decimal(2,0)  | YES  |     | NULL    |       |
| depth     | decimal(2,1)  | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
5 rows in set
```

```sql
INSERT INTO physical_property VALUES
    (1, 2, 1, 2, 3),
    (2, 2.5, 1.2, 2.3, 3.4);
```

```
> SELECT * FROM physical_property;
+-----------+--------+--------+--------+-------+
| medium_id | weight | length | height | depth |
+-----------+--------+--------+--------+-------+
|         1 |      2 |      1 |      2 |   3.0 |
|         2 |      3 |      1 |      2 |   3.4 |
+-----------+--------+--------+--------+-------+
2 rows in set

> SELECT * FROM physical_property WHERE weight = 2.5;
Empty set

> SELECT * FROM physical_property WHERE weight > 2;
+-----------+--------+--------+--------+-------+
| medium_id | weight | length | height | depth |
+-----------+--------+--------+--------+-------+
|         2 |      3 |      1 |      2 |   3.4 |
+-----------+--------+--------+--------+-------+
1 row in set
```

### Binary

**`BINARY[(n)]`** is fixed-length binary data with a length of `n` bytes, where `n` is a value from `1` through `8,000`. The storage size is `n` bytes.

**`VARBINARY[(n|max)]`** variable-length binary data. n can be a value from `1` through `8,000`. `max` indicates that the maximum storage size is `2^31-1` bytes. The storage size is the actual length of the data entered + 2 bytes. The data that is entered can be 0 bytes in length. The ANSI SQL synonym for varbinary is binary varying.

```sql
CREATE TABLE file
(
    ID INTEGER PRIMARY KEY,
    mode BINARY(3)
);
```

```
> DESCRIBE file;
+-------+-----------+------+-----+---------+-------+
| Field | Type      | Null | Key | Default | Extra |
+-------+-----------+------+-----+---------+-------+
| ID    | int(11)   | NO   | PRI | NULL    |       |
| mode  | binary(3) | YES  |     | NULL    |       |
+-------+-----------+------+-----+---------+-------+
2 rows in set
```

```sql
INSERT INTO file VALUES
    (1, 777),
    (2, 755),
    (3, 740);
```

```
> SELECT * FROM file;
+----+------+
| ID | mode |
+----+------+
|  1 | 777  |
|  2 | 755  |
|  3 | 740  |
+----+------+
3 rows in set
```




