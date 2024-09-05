[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▼ Next: Updating records](updating_records.md)

### Inserting records

#### Inserting into all columns

```sql
INSERT INTO table_name VALUES
    (value_1_of_column_1, value_1_of_column_2, value_1_of_column_3),
    (value_2_of_column_1, value_2_of_column_2, value_2_of_column_3),
    (value_3_of_column_1, value_3_of_column_2, value_3_of_column_3);
```

```
MariaDB [quote_sql_lab]> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8) PRIMARY KEY,
    ->     description VARCHAR(256) NOT NULL
    -> );
Query OK, 0 rows affected (0,017 sec)

MariaDB [quote_sql_lab]> INSERT INTO medium_type VALUES
    ->     ('BOOK', 'A book'),
    ->     ('CD', 'A CD'),
    ->     ('VHS', 'A VHS tape');
Query OK, 3 rows affected (0,009 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM medium_type;
+----------+-------------+
| codename | description |
+----------+-------------+
| BOOK     | A book      |
| CD       | A CD        |
| VHS      | A VHS tape  |
+----------+-------------+
3 rows in set (0,001 sec)

```

#### Inserting into chosen columns

**First version**

```sql
INSERT INTO table_name (column_1_name, column_3_name) VALUES
    (value_1_of_column_1, value_1_of_column_3),
    (value_2_of_column_1, value_2_of_column_3),
    (value_3_of_column_1, value_3_of_column_3);
```

```
MariaDB [quote_sql_lab]> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     personal_data_id INTEGER UNIQUE,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,037 sec)

MariaDB [quote_sql_lab]> INSERT INTO user (ID, personal_data_id) VALUES
    ->     (1, 1),
    ->     (2, 2),
    ->     (3, 3);
Query OK, 3 rows affected (0,005 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [quote_sql_lab]> SELECT * FROM user;
+----+------------------+-----------+--------+
| ID | personal_data_id | confirmed | active |
+----+------------------+-----------+--------+
|  1 |                1 |      NULL | NULL   |
|  2 |                2 |      NULL | NULL   |
|  3 |                3 |      NULL | NULL   |
+----+------------------+-----------+--------+
3 rows in set (0,001 sec)

```

**Second version**

**In this version inserting multiple rows is not possible.**

```sql
INSERT INTO table_name SET
    column_1_name = value_of_column_1,
    column_3_name = value_of_column_3;
```

```
MariaDB [quote_sql_lab]> INSERT INTO user SET ID = 4, personal_data_id = 4;
Query OK, 1 row affected (0,006 sec)

MariaDB [quote_sql_lab]> SELECT * FROM user;
+----+------------------+-----------+--------+
| ID | personal_data_id | confirmed | active |
+----+------------------+-----------+--------+
|  1 |                1 |      NULL | NULL   |
|  2 |                2 |      NULL | NULL   |
|  3 |                3 |      NULL | NULL   |
|  4 |                4 |      NULL | NULL   |
+----+------------------+-----------+--------+
4 rows in set (0,001 sec)

```