[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▲ Previous: Inserting records](inserting_records.md)

### Updating records

#### Updating multiple columns in single record

```
MariaDB [quote_sql_lab]> CREATE TABLE storage_conditions
    -> (
    ->     medium_id INTEGER PRIMARY KEY,
    ->     humidity FLOAT DEFAULT 40,
    ->     temperature FLOAT(4) DEFAULT 23,
    ->     air_pressure REAL DEFAULT 1013.25
    -> );
Query OK, 0 rows affected (0,020 sec)

MariaDB [quote_sql_lab]> INSERT INTO storage_conditions VALUES
    ->     (1, 38, 22, 1013.5),
    ->     (2, 42, 20, 1014),
    ->     (4, 41, 18, 1012.25);
Query OK, 3 rows affected (0,010 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |          22 |       1013.5 |
|         2 |       42 |          20 |         1014 |
|         4 |       41 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
3 rows in set (0,001 sec)

MariaDB [quote_sql_lab]> UPDATE storage_conditions SET
    ->     temperature = 22.3,
    ->     air_pressure = 1013
    -> WHERE medium_id = 1;
Query OK, 1 row affected (0,008 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |        22.3 |         1013 |
|         2 |       42 |          20 |         1014 |
|         4 |       41 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
3 rows in set (0,001 sec)

```

#### Updating single column in multiple records

```
MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |          22 |       1013.5 |
|         2 |       42 |          20 |         1014 |
|         4 |       41 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
3 rows in set (0,001 sec)

MariaDB [quote_sql_lab]> UPDATE storage_conditions SET
    ->     humidity = 41.5
    -> WHERE humidity >= 40 AND humidity < 43;
Query OK, 2 rows affected (0,093 sec)
Rows matched: 2  Changed: 2  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |        22.3 |         1013 |
|         2 |     41.5 |          20 |         1014 |
|         4 |     41.5 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
3 rows in set (0,001 sec)

```
