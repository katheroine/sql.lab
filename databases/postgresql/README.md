# PostgreSQL

## Installation and running

### Installation

```bash
$ sudo aptitude install postgresql
```

### Running client

```bash
$ sudo -u postgres psql
```

## Working with databases

### Displaying databases

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

### Creating and choosing databases

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

## Working with tables

### Displaying tables

```bash
quote_sql_lab=# \dt
Did not find any relations.

```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**PostgreSQL Data Types**

* **Boolean**: BOOLEAN
* **Numeric**: SMALLINT, INTEGER, BIGINT, NUMERIC, DECIMAL, REAL, DOUBLE PRECISION
* **String**: CHAR, VARCHAR, TEXT
* **Binary**: BYTEA
* **Date and time**: DATE, TIME, TIMESTAMP, INTERVAL
* **Geometric**: POINT, LINE, POLYGON, CIRCLE
* **Network**: MACADDR, INET, CIDR
* **Other**: UUID, XML, JSON

##### Boolean

* **BOOLEAN** - 1 byte, state of true or false

##### Numeric

* **SMALLING** - 2 bytes, small-range integer, -32768 to +32767
* **INTEGER** - 4 bytes, typical choice for integer, -2147483648 to +2147483647
* **BIGINT** - 8 bytes, large-range integer, -9223372036854775808 to +9223372036854775807
* **DECIMAL** - variable, user-specified precision, exact, up to 131072 digits before the decimal point; up to 16383 digits after the decimal point
* **NUMERIC** - variable, user-specified precision, exact, up to 131072 digits before the decimal point; up to 16383 digits after the decimal point
* **REAL** - 4 bytes, variable-precision, inexact, 6 decimal digits precision
* **DOUBLE PRECISION** - 8 bytes, variable-precision, inexact, 15 decimal digits precision
* **SMALLSERIAL** - 2 bytes, small autoincrementing integer, 1 to 32767
* **SERIAL** - 4 bytes, autoincrementing integer, 1 to 2147483647
* **BIGSERIAL** - 8 bytes, large autoincrementing integer, 1 to 9223372036854775807

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-numeric.html)

##### String

* **CHARACTER VARYING(n)**, **VARCHAR(n)** - variable-length with limit
* **CHARACTER(n)**, **CHAR(n)**, **BPCHAR(n)** - fixed-length, blank-padded
* **BPCHAR** - variable unlimited length, blank-trimmed
* **TEXT** - variable unlimited length

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-character.html)

##### Binary

* **BYTEA** - 1 or 4 bytes plus the actual binary string, variable-length binary string

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-binary.html)

##### Bit String

Bit strings are strings of 1's and 0's. They can be used to store or visualize bit masks. There are two SQL bit types: bit(n) and bit varying(n), where n is a positive integer.

bit type data must match the length n exactly; it is an error to attempt to store shorter or longer bit strings. bit varying data is of variable length up to the maximum length n; longer strings will be rejected. Writing bit without a length is equivalent to bit(1), while bit varying without a length specification means unlimited length.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-bit.html)

##### Date and Time

* **TIMESTAMP[(p)][without time zone]** - 8 bytes, both date and time (no time zone), 4713 BC - 294276 AD, 1 microsecond
* **TIMESTAMP[(p)] with time zone** - 8 bytes, both date and time, with time zone, 4713 BC - 294276 AD, 1 microsecond
* **DATE** - 4 bytes, date (no time of day)	4713 BC	5874897 AD	1 day
* **TIME[(p)][without time zone]** - 8 bytes, time of day (no date), 00:00:00 - 24:00:00, 1 microsecond
* **TIME[(p)] with time zone** - 12 bytes, time of day (no date), with time zone, 00:00:00+1559 - 24:00:00-1559, 1 microsecond
* **INTERVAL[fields][(p)]** - 16 bytes, time interval, -178000000 years - 178000000 years, 1 microsecond

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-datetime.html)

##### Monetary

* **MONEY** - 8 bytes, currency amount, -92233720368547758.08 to +92233720368547758.07

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-money.html)

##### Geometric

* **POINT** - 16 bytes, Point on a plane, (x,y)
* **LINE** - 32 bytes, Infinite line, {A,B,C}
* **LSEG** - 32 bytes, Finite line segment, ((x1,y1),(x2,y2))
* **BOX** - 32 bytes, Rectangular box, ((x1,y1),(x2,y2))
* **PATH** - 16+16n bytes, Closed path (similar to polygon), ((x1,y1),...)
* **PATH** - 16+16n bytes, Open path, [(x1,y1),...]
* **POLYGON** - 40+16n bytes, Polygon (similar to closed path), ((x1,y1),...)
* **CIRCLE** - 24 bytes	Circle, <(x,y),r> (center point and radius)

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-geometric.html)

##### JSON

JSON data types are for storing JSON (JavaScript Object Notation) data, as specified in RFC 7159. Such data can also be stored as text, but the JSON data types have the advantage of enforcing that each stored value is valid according to the JSON rules. There are also assorted JSON-specific functions and operators available for data stored in these data types; see Section 9.16.

PostgreSQL offers two types for storing JSON data: json and jsonb. To implement efficient query mechanisms for these data types, PostgreSQL also provides the jsonpath data type described in Section 8.14.7.

The json and jsonb data types accept almost identical sets of values as input. The major practical difference is one of efficiency. The json data type stores an exact copy of the input text, which processing functions must reparse on each execution; while jsonb data is stored in a decomposed binary format that makes it slightly slower to input due to added conversion overhead, but significantly faster to process, since no reparsing is needed. jsonb also supports indexing, which can be a significant advantage.

Because the json type stores an exact copy of the input text, it will preserve semantically-insignificant white space between tokens, as well as the order of keys within JSON objects. Also, if a JSON object within the value contains the same key more than once, all the key/value pairs are kept. (The processing functions consider the last value as the operative one.) By contrast, jsonb does not preserve white space, does not preserve the order of object keys, and does not keep duplicate object keys. If duplicate keys are specified in the input, only the last value is kept.

In general, most applications should prefer to store JSON data as jsonb, unless there are quite specialized needs, such as legacy assumptions about ordering of object keys.

RFC 7159 specifies that JSON strings should be encoded in UTF8. It is therefore not possible for the JSON types to conform rigidly to the JSON specification unless the database encoding is UTF8. Attempts to directly include characters that cannot be represented in the database encoding will fail; conversely, characters that can be represented in the database encoding but not in UTF8 will be allowed.

RFC 7159 permits JSON strings to contain Unicode escape sequences denoted by \uXXXX. In the input function for the json type, Unicode escapes are allowed regardless of the database encoding, and are checked only for syntactic correctness (that is, that four hex digits follow \u). However, the input function for jsonb is stricter: it disallows Unicode escapes for characters that cannot be represented in the database encoding. The jsonb type also rejects \u0000 (because that cannot be represented in PostgreSQL's text type), and it insists that any use of Unicode surrogate pairs to designate characters outside the Unicode Basic Multilingual Plane be correct. Valid Unicode escapes are converted to the equivalent single character for storage; this includes folding surrogate pairs into a single character.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-json.html)

##### XML

The xml data type can be used to store XML data. Its advantage over storing XML data in a text field is that it checks the input values for well-formedness, and there are support functions to perform type-safe operations on it; see Section 9.15. Use of this data type requires the installation to have been built with configure --with-libxml.

The xml type can store well-formed “documents”, as defined by the XML standard, as well as “content” fragments, which are defined by reference to the more permissive “document node” of the XQuery and XPath data model. Roughly, this means that content fragments can have more than one top-level element or character node. The expression xmlvalue IS DOCUMENT can be used to evaluate whether a particular xml value is a full document or only a content fragment.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-xml.html)

##### Range

Range types are data types representing a range of values of some element type (called the range's subtype). For instance, ranges of timestamp might be used to represent the ranges of time that a meeting room is reserved. In this case the data type is tsrange (short for “timestamp range”), and timestamp is the subtype. The subtype must have a total order so that it is well-defined whether element values are within, before, or after a range of values.

Range types are useful because they represent many element values in a single range value, and because concepts such as overlapping ranges can be expressed clearly. The use of time and date ranges for scheduling purposes is the clearest example; but price ranges, measurement ranges from an instrument, and so forth can also be useful.

Every range type has a corresponding multirange type. A multirange is an ordered list of non-contiguous, non-empty, non-null ranges. Most range operators also work on multiranges, and they have a few functions of their own.

PostgreSQL comes with the following built-in range types:

* **INT4RANGE** — Range of integer, int4multirange — corresponding Multirange
* **INT8RANGE** — Range of bigint, int8multirange — corresponding Multirange
* **NUMRANGE** — Range of numeric, nummultirange — corresponding Multirange
* **TSRANGE** — Range of timestamp without time zone, tsmultirange — corresponding Multirange
* **TSTZRANGE** — Range of timestamp with time zone, tstzmultirange — corresponding Multirange
* **DATERANGE** — Range of date, datemultirange — corresponding Multirange

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/rangetypes.html)

##### Arrays

PostgreSQL allows columns of a table to be defined as variable-length multidimensional arrays. Arrays of any built-in or user-defined base type, enum type, composite type, range type, or domain can be created.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/arrays.html)

##### Composite

A composite type represents the structure of a row or record; it is essentially just a list of field names and their data types. PostgreSQL allows composite types to be used in many of the same ways that simple types can be used. For example, a column of a table can be declared to be of a composite type.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/rowtypes.html)

##### UUID

The data type uuid stores Universally Unique Identifiers (UUID) as defined by RFC 4122, ISO/IEC 9834-8:2005, and related standards. (Some systems refer to this data type as a globally unique identifier, or GUID, instead.) This identifier is a 128-bit quantity that is generated by an algorithm chosen to make it very unlikely that the same identifier will be generated by anyone else in the known universe using the same algorithm. Therefore, for distributed systems, these identifiers provide a better uniqueness guarantee than sequence generators, which are only unique within a single database.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-uuid.html)

##### Network Address

* **CIDR** - 7 or 19 bytes, IPv4 and IPv6 networks
* **INET** - 7 or 19 bytes, IPv4 and IPv6 hosts and networks
* **MACADDR** - 6 bytes	MAC addresses
* **MACADDR8** - 8 bytes, MAC addresses (EUI-64 format)

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-net-types.html)

##### Text Search

PostgreSQL provides two data types that are designed to support full text search, which is the activity of searching through a collection of natural-language documents to locate those that best match a query. The tsvector type represents a document in a form optimized for text search; the tsquery type similarly represents a text query. Chapter 12 provides a detailed explanation of this facility, and Section 9.13 summarizes the related functions and operators.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-textsearch.html)

##### Domain

A domain is a user-defined data type that is based on another underlying type. Optionally, it can have constraints that restrict its valid values to a subset of what the underlying type would allow. Otherwise it behaves like the underlying type — for example, any operator or function that can be applied to the underlying type will work on the domain type. The underlying type can be any built-in or user-defined base type, enum type, array type, composite type, range type, or another domain.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/domains.html)

##### Object Identifier

Object identifiers (OIDs) are used internally by PostgreSQL as primary keys for various system tables. Type oid represents an object identifier. There are also several alias types for oid, each named regsomething. Table 8.26 shows an overview.

The oid type is currently implemented as an unsigned four-byte integer. Therefore, it is not large enough to provide database-wide uniqueness in large databases, or even in large individual tables.

The oid type itself has few operations beyond comparison. It can be cast to integer, however, and then manipulated using the standard integer operators. (Beware of possible signed-versus-unsigned confusion if you do this.)

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-oid.html)

##### PG_LNS

The pg_lsn data type can be used to store LSN (Log Sequence Number) data which is a pointer to a location in the WAL. This type is a representation of XLogRecPtr and an internal system type of PostgreSQL.

Internally, an LSN is a 64-bit integer, representing a byte position in the write-ahead log stream. It is printed as two hexadecimal numbers of up to 8 digits each, separated by a slash; for example, 16/B374D848. The pg_lsn type supports the standard comparison operators, like = and >. Two LSNs can be subtracted using the - operator; the result is the number of bytes separating those write-ahead log locations. Also the number of bytes can be added into and subtracted from LSN using the +(pg_lsn,numeric) and -(pg_lsn,numeric) operators, respectively. Note that the calculated LSN should be in the range of pg_lsn type, i.e., between 0/0 and FFFFFFFF/FFFFFFFF.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-pg-lsn.html)

##### Pseudo types

The PostgreSQL type system contains a number of special-purpose entries that are collectively called pseudo-types. A pseudo-type cannot be used as a column data type, but it can be used to declare a function's argument or result type. Each of the available pseudo-types is useful in situations where a function's behavior does not correspond to simply taking or returning a value of a specific SQL data type. Table 8.27 lists the existing pseudo-types.

* **ANY** - Indicates that a function accepts any input data type.
* **ANYELEMENT** - Indicates that a function accepts any data type.
* **ANYARRAY** - Indicates that a function accepts any array data type.
* **ANYNONARRAY** - Indicates that a function accepts any non-array data type.
* **ANYENUM** - Indicates that a function accepts any enum data type.
* **ANYRANGE** - Indicates that a function accepts any range data type.
* **ANYMULTIRANGE** - Indicates that a function accepts any multirange data type.
* **ANYCOMPATIBLE** - Indicates that a function accepts any data type, with automatic promotion of multiple arguments to a common data type.
* **ANYCOMPATIBLEARRAY** - Indicates that a function accepts any array data type, with automatic promotion of multiple arguments to a common data type.
* **ANYCOMPATIBLENONARRAY** - Indicates that a function accepts any non-array data type, with automatic promotion of multiple arguments to a common data type.
* **ANYCOMPATIBLERANGE** - Indicates that a function accepts any range data type, with automatic promotion of multiple arguments to a common data type.
* **ANYCOMPATIBLEMULTIRANGE** - Indicates that a function accepts any multirange data type, with automatic promotion of multiple arguments to a common data type.
* **CSTRING** - Indicates that a function accepts or returns a null-terminated C string.
* **INTERNAL** - Indicates that a function accepts or returns a server-internal data type.
* **LANGUAGE_HANDLER** - A procedural language call handler is declared to return language_handler.
* **FDW_HANDLER** - A foreign-data wrapper handler is declared to return fdw_handler.
* **TABLE_AM_HANDELR** - A table access method handler is declared to return table_am_handler.
* **INDEX_AM_HANDLER** - An index access method handler is declared to return index_am_handler.
* **TSM_HANDLER** - A tablesample method handler is declared to return tsm_handler.
* **RECORD** - Identifies a function taking or returning an unspecified row type.
* **TRIGGER** - A trigger function is declared to return trigger.
* **EVENT_TRIGGER** - An event trigger function is declared to return event_trigger.
* **PG_DLL_COMMAND** - Identifies a representation of DDL commands that is available to event triggers.
* **VOID** -Indicates that a function returns no value.
* **UNKNOWN** - Identifies a not-yet-resolved type, e.g., of an undecorated string literal.

-- [PostgreSQL documentation](https://www.postgresql.org/docs/current/datatype-pseudo.html)

#### Columns and datatypes

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

#### Primary key

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
