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

* [Boolean](###boolean)
* [Numeric types](###numeric)
    * [Exact numeric types (NUMERIC, DECIMAL, SMALLINT, INTEGER, BIGINT)](####exact-numeric)
    * [Approximate numeric types (FLOAT, REAL, DOUBLE PRECISION)](###approximate-numeric)
    * Decimal floating-point type (DECFLOAT)
* [Binary types](###binary)
    * [Binary (BINARY)](####binary)
    * [Binary varying (VARBINARY)](####binary-varying)
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

#### Exact numeric

##### Bit

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

##### Integer

Exact-number data types that use **`INTEGER`** data. To save space in the database, use the smallest data type that can reliably contain all possible values. For example, `TINYINT` would be sufficient for a person's age, because no one lives to be more than 255 years old. But tinyint isn't sufficient for a building's age, because a building can be more than 255 years old.

| Data type | Range | Range expression | Storage |
|--|--|--|--|
| **`BIGINT`** | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | -2^63 to 2^63-1 | 8 bytes |
| **`INT`** | -2,147,483,648 to 2,147,483,647 | -2^31 to 2^31-1 | 4 bytes |
| **`SMALLINT`** | -32,768 to 32,767 | -2^15 to 2^15-1 | 2 bytes |
| **`TINYINT`** | 0 to 255 | 2^0-1 to 2^8-1 | 1 byte |

The **`INT`** data type is the primary integer data type in SQL Server. The **`BIGINT`** data type is intended for use when integer values might exceed the range that is supported by the int data type.

**`BIGINT`** fits between `SMALLMONEY` and `INT` in the data type precedence chart.

Functions return `BIGINT` only if the parameter expression is a bigint data type. SQL Server doesn't automatically promote other integer data types (``TINYINT`, `SMALLINT`, and `INT`) to `BIGINT`.

When you use the `+`, `-`, `*`, `/`, or `%` arithmetic operators to perform implicit or explicit conversion of `INT`, `SMALLINT`, `TINYINT`, or `BIGINT` constant values to the `FLOAT`, `FLOAT`, `DECIMAL` or `NUMERIC` data types, the rules that SQL Server applies when it calculates the data type and precision of the expression results differ depending on whether the query is autoparameterized or not.

Therefore, similar expressions in queries can sometimes produce different results. When a query isn't autoparameterized, the constant value is first converted to `DECIMAL`, whose precision is just large enough to hold the value of the constant, before converting to the specified data type. For example, the constant value `1` is converted to `DECIMAL(1,0)`, and the constant value `250` is converted to `DECIMAL(3,0)`.

When a query is autoparameterized, the constant value is always converted to decimal(10,0) before converting to the final data type. When the / operator is involved, not only can the result type's precision differ among similar queries, but the result value can differ also. For example, the result value of an autoparameterized query that includes the expression `SELECT CAST (1.0 / 7 AS float)`, differs from the result value of the same query that isn't autoparameterized, because the results of the autoparameterized query, are truncated to fit into the `DECIMAL(10,0)` data type.

The tinyint data type isn't supported in Microsoft Fabric.

When integers are implicitly converted to a character data type, if the integer is too large to fit into the character field, SQL Server uses ASCII character `42`, the asterisk (`*`).

Integer constants greater than 2,147,483,647 are converted to the decimal data type, not the bigint data type. The following example shows that when the threshold value is exceeded, the data type of the result changes from an int to a decimal.

-- [SQL Server documentation](https://learn.microsoft.com/en-us/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql)

```sql
CREATE TABLE rating
(
    quote_id INTEGER PRIMARY KEY,
    rate INTEGER,
    class SMALLINT,
    points BIGINT
);
```

```
> DESCRIBE rating;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| quote_id | int(11)     | NO   | PRI | NULL    |       |
| rate     | int(11)     | YES  |     | NULL    |       |
| class    | smallint(6) | YES  |     | NULL    |       |
| points   | bigint(20)  | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set
```

```sql
INSERT INTO rating VALUES
    (1, 1, 3, 1356),
    (2, 3, 2, 2741),
    (3, 5, 1, 6420);
```

```
> SELECT * FROM rating;
+----------+------+-------+--------+
| quote_id | rate | class | points |
+----------+------+-------+--------+
|        1 |    1 |     3 |   1356 |
|        2 |    3 |     2 |   2741 |
|        3 |    5 |     1 |   6420 |
+----------+------+-------+--------+
3 rows in set

> SELECT * FROM rating WHERE class >= 2;
+----------+------+-------+--------+
| quote_id | rate | class | points |
+----------+------+-------+--------+
|        1 |    1 |     3 |   1356 |
|        2 |    3 |     2 |   2741 |
+----------+------+-------+--------+
2 rows in set

> SELECT * FROM rating WHERE points > (10000 / 3);
+----------+------+-------+--------+
| quote_id | rate | class | points |
+----------+------+-------+--------+
|        3 |    5 |     1 |   6420 |
+----------+------+-------+--------+
1 row in set
```

##### Decimal

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

#### Approximate numeric

**Approximate-number** data types for use with *floating point* numeric data. **Floating point** data is approximate; therefore, not all values in the data type range can be represented exactly. The ISO synonym for `REAL` is `FLOAT`.

**`FLOAT[(n)]`** where `n` is the number of bits that are used to store the mantissa of the float number in scientific notation and, therefore, dictates the precision and storage size. If `n` is specified, it must be a value between `1` and `53`. The default value of n is `53`.

| `n` value | Precision | Storage size |
|--|--|--|
| 1-24 | 7 digits | 4 bytes |
| 25-53 | 15 digits | 8 bytes |

SQL Server treats `n` as one of two possible values. If `1 <= n <= 24`, `n` is treated as `24`. If `25 <= n <= 53`, `n` is treated as `53`.

**`FLOAT[(n)]`** data type complies with the ISO standard for all values of n from `1` through `53`. The synonym for *double precision* is `FLOAT(53)`.

| Data type | Range | Storage |
|--|--|--|
| `FLOAT` | - 1.79E+308 to -2.23E-308, 0 and 2.23E-308 to 1.79E+308 | Depends on the value of `n` |
| `REAL` | - 3.40E + 38 to -1.18E - 38, 0 and 1.18E - 38 to 3.40E + 38 | 4 Bytes |

The `FLOAT` and `REAL` data types are known as *approximate data types*.

**Approximate numeric** data types don't store the exact values specified for many numbers; they store a close approximation of the value. For some applications, the tiny difference between the specified value and the stored approximation isn't relevant. For others though, the difference is important. Because of the approximate nature of the `FLOAT` and `REAL` data types, don't use these data types when exact numeric behavior is required. Examples that require precise numeric values are financial or business data, operations involving rounding, or equality checks. In those cases, use the `INTEGER`, `DECIMAL`, `NUMERIC`, `MONEY`, or `SMALLMONEY` data types.

Avoid using `FLOAT` or `REAL` columns in `WHERE` clause search conditions, especially the `=` and `<>` operators. It's best to limit `FLOAT` and `REAL` columns to `>` or `<` comparisons.

Values of `FLOAT` are truncated when they're converted to any integer type.

When you want to convert from `FLOAT` or `REAL` to character data, using the `STR` string function is typically more useful than `CAST()`. The reason is that `STR()` enables more control over formatting.

```sql
CREATE TABLE storage_conditions
(
    medium_id INTEGER PRIMARY KEY,
    humidity FLOAT,
    temperature FLOAT(4),
    air_pressure REAL
);
```

```
> DESCRIBE storage_conditions;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| medium_id    | int(11) | NO   | PRI | NULL    |       |
| humidity     | float   | YES  |     | NULL    |       |
| temperature  | float   | YES  |     | NULL    |       |
| air_pressure | double  | YES  |     | NULL    |       |
+--------------+---------+------+-----+---------+-------+
4 rows in set
```

```sql
INSERT INTO storage_conditions VALUES
    (1, 40.532, 19.75, 1054.5),
    (2, 30.95, 15.6, 1020),
    (3, 35, 16, 1036.455);
```

```
> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |   40.532 |       19.75 |       1054.5 |
|         2 |    30.95 |        15.6 |         1020 |
|         3 |       35 |          16 |     1036.455 |
+-----------+----------+-------------+--------------+
3 rows in set
```

### Binary

#### Binary

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

#### Binary varying


