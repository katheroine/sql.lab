[⌂ Home](../../README.md)
[⬆ Up: MariaDB](README.md)
[▲ Previous: Managing databases](managing_databases.md)

## Managing tables

### Displaying tables

```bash
MariaDB [quote_sql_lab]> SHOW TABLES;
Empty set (0,001 sec)

```

### Creating tables

#### Datatypes

The set of datatypes available depends on the particular database. Different databases support different data types, and some databases support more data types than others.

The set of data types available in MySQL, PostgreSQL, and SQLite is different. This is because the three databases have different underlying architectures and different design goals.

**MariaDB Data Types**

* **Numeric**: TINYINT, SMALLINT, MEDIUMINT, INTEGER, INT, BIGINT, FLOAT, DOUBLE, DECIMAL
* **String**: CHAR, VARCHAR, BINARY, VARBINARY, TEXT, BLOB
* **Date and time**: DATE, TIME, DATETIME, TIMESTAMP
* **Other**: ENUM, SET, BIT

##### Numeric

* **TINYINT** - Tiny integer, -128 to 127 signed.
* **BOOLEAN** - Synonym for TINYINT(1).
* **SMALLINT** - Small integer from -32768 to 32767 signed.
* **MEDIUMINT** - Medium integer from -8388608 to 8388607 signed.
* **INT** - Integer from -2147483648 to 2147483647 signed.
* **INTEGER** - Synonym for INT
* **BIGINT** - Large integer.
* **DECIMAL** - A packed "exact" fixed-point number.
* **DEC**, **NUMERIC**, **FIXED** - Synonyms for DECIMAL
* **NUMBER** - Synonym for DECIMAL in Oracle mode.
* **FLOAT** - Single-precision floating-point number
* **DOUBLE** - Normal-size (double-precision) floating-point number
* **DOUBLE PRECISION** - REAL and DOUBLE PRECISION are synonyms for DOUBLE.
* **BIT** - Bit field type.
* **INT1** - A synonym for TINYINT.
* **INT2** - Synonym for SMALLINT.
* **INT3** - Synonym for MEDIUMINT.
* **INT4** - Synonym for INT.
* **INT8** - Synonym for BIGINT.

##### String

* **BINARY** - Fixed-length binary byte string.
* **BLOB** - Binary large object up to 65,535 bytes.
* **CHAR** - Fixed-length string.
* **CHAR BYTE** - Alias for BINARY.
* **ENUM** - Enumeration, or string object that can have one value chosen from a list of values.
* **INET4** - For storage of IPv4 addresses.
* **INET6** - For storage of IPv6 addresses.
* **JSON Data Type** - Compatibility data type that is an alias for LONGTEXT.
* **MEDIUMBLOB** - Medium binary large object up to 16,777,215 bytes.
* **MEDIUMTEXT** - A TEXT column with a maximum length of 16,777,215 characters.
* **LONGBLOB** - Long BLOB holding up to 4GB.
* **LONG** and **LONG VARCHAR** - LONG and LONG VARCHAR are synonyms for MEDIUMTEXT.
* **LONGTEXT** - A TEXT column with a maximum length of 4,294,967,295 characters.
* **ROW** - Data type for stored procedure variables.
* **TEXT** - A TEXT column with a maximum length of 65,535 characters.
* **TINYBLOB** - Tiny binary large object up to 255 bytes.
* **TINYTEXT** - A TEXT column with a maximum length of 255 characters.
* **VARBINARY** - Variable-length binary byte string.
* **VARCHAR** - Variable-length string.
* **SET** - Set, or string object that can have 0 or more values chosen from a list of values.
* **UUID** - Data type intended for the storage of UUID data.

##### Date and Time

* **DATE** - The date type YYYY-MM-DD.
* **TIME** - Time format HH:MM:SS.ssssss
* **DATETIME** - Date and time combination displayed as YYYY-MM-DD HH:MM:SS.
* **TIMESTAMP** - YYYY-MM-DD HH:MM:SS
* **YEAR** - A four-digit year.

##### Other

* **NULL** - NULL represents an unknown value.

-- [MariaDB documentation](https://mariadb.com/kb/en/data-types/)

#### Columns and datatypes

```bash
MariaDB [quote_sql_lab]> CREATE TABLE cover_type (codename VARCHAR(128), description VARCHAR(256));
Query OK, 0 rows affected (0,052 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
+-------------------------+
1 row in set (0,001 sec)

```

#### Primary key

```bash
MariaDB [quote_sql_lab]> CREATE TABLE quote
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     owner VARCHAR(256),
    ->     author VARCHAR(256),
    ->     source VARCHAR(512),
    ->     rating INTEGER
    -> );
Query OK, 0 rows affected (0,081 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| cover_type              |
| quote                   |
+-------------------------+
2 rows in set (0,009 sec)

MariaDB [quote_sql_lab]> DESCRIBE quote;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| ID     | int(11)      | NO   | PRI | NULL    |       |
| owner  | varchar(256) | YES  |     | NULL    |       |
| author | varchar(256) | YES  |     | NULL    |       |
| source | varchar(512) | YES  |     | NULL    |       |
| rating | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
5 rows in set (0,012 sec)

```
