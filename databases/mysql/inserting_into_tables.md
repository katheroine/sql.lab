[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Removing](removing_tables.md)

### Inserting into tables

#### Inserting into all columns

```
mysql> CREATE TABLE medium_type
    -> (
    ->     codename CHAR(8) PRIMARY KEY,
    ->     description VARCHAR(256) NOT NULL
    -> );
Query OK, 0 rows affected (0,017 sec)

mysql> INSERT INTO medium_type VALUES
    ->     ('BOOK', 'A book'),
    ->     ('CD', 'A CD'),
    ->     ('VHS', 'A VHS tape');
Query OK, 3 rows affected (0,009 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM medium_type;
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

```
mysql> CREATE TABLE user
    -> (
    ->     ID INTEGER PRIMARY KEY,
    ->     personal_data_id INTEGER UNIQUE,
    ->     confirmed BOOLEAN,
    ->     active BIT
    -> );
Query OK, 0 rows affected (0,037 sec)

mysql> INSERT INTO user (ID, personal_data_id) VALUES
    ->     (1, 1),
    ->     (2, 2),
    ->     (3, 3);
Query OK, 3 rows affected (0,005 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM user;
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

```
mysql> INSERT INTO user SET ID = 4, personal_data_id = 4;
Query OK, 1 row affected (0,006 sec)

mysql> SELECT * FROM user;
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
