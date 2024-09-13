[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Queries](queries.md)

### Aggregate functions

**Database preparation**

```sql
CREATE TABLE user
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

INSERT INTO user (login, group_name, credits) VALUES
    ('john_doe', 'bloggers', 100),
    ('science_gal', 'scientists', 250),
    ('news_hound', 'journalists', 150),
    ('study_buddy', 'students', 50),
    ('data_miner', 'researchers', 200),
    ('craft_master', 'hobbyists', 75),
    ('tech_blogger', 'bloggers', 120),
    ('quantum_guy', 'scientists', 300),
    ('truth_seeker', 'journalists', 180),
    ('college_kid', 'students', 30),
    ('lab_rat', 'researchers', 220),
    ('diy_enthusiast', 'hobbyists', 90),
    ('food_critic', 'bloggers', 80),
    ('rocket_woman', 'scientists', 280),
    ('roving_reporter', 'journalists', 160),
    ('grad_student', 'students', 40),
    ('book_worm', 'researchers', 240),
    ('stamp_collector', 'hobbyists', 60),
    ('travel_guru', 'bloggers', 110),
    ('chem_whiz', 'scientists', 270);
```

**Results count `COUNT`**

```sql
SELECT COUNT(columns) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT COUNT(*) FROM user;
+----------+
| COUNT(*) |
+----------+
|       20 |
+----------+
1 row in set (0,001 sec)

```

```
MariaDB [quote_sql_lab]> SELECT COUNT(*) FROM user WHERE group_name = "researchers";
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0,001 sec)

```

**Aliases** can be used.

```
MariaDB [quote_sql_lab]> SELECT COUNT(*) AS "users number" FROM user;
+--------------+
| users number |
+--------------+
|           20 |
+--------------+
1 row in set (0,004 sec)

```

**Minimum value `MIN`**

```sql
SELECT MIN(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT MIN(credits) FROM user;
+--------------+
| MIN(credits) |
+--------------+
|           30 |
+--------------+
1 row in set (0,005 sec)

```

```
MariaDB [quote_sql_lab]> SELECT MIN(credits) FROM user WHERE group_name = "bloggers";
+--------------+
| MIN(credits) |
+--------------+
|           80 |
+--------------+
1 row in set (0,005 sec)

```

**Maximum value `MAX`**

```sql
SELECT MAX(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT MAX(credits) FROM user;
+--------------+
| MAX(credits) |
+--------------+
|          300 |
+--------------+
1 row in set (0,004 sec)

```

```
MariaDB [quote_sql_lab]> SELECT MAX(credits) FROM user WHERE group_name = "journalists";
+--------------+
| MAX(credits) |
+--------------+
|          180 |
+--------------+
1 row in set (0,001 sec)

```

**Total `SUM`**

```sql
SELECT SUM(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT SUM(credits) FROM user;
+--------------+
| SUM(credits) |
+--------------+
|         3005 |
+--------------+
1 row in set (0,005 sec)

```

```
MariaDB [quote_sql_lab]> SELECT SUM(credits) FROM user WHERE group_name = "scientists";
+--------------+
| SUM(credits) |
+--------------+
|         1100 |
+--------------+
1 row in set (0,001 sec)

```

**Average `AVG`**

```sql
SELECT AVG(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT AVG(credits) FROM user;
+--------------+
| AVG(credits) |
+--------------+
|     150.2500 |
+--------------+
1 row in set (0,001 sec)

```

```
MariaDB [quote_sql_lab]> SELECT AVG(credits) FROM user WHERE group_name = "students";
+--------------+
| AVG(credits) |
+--------------+
|      40.0000 |
+--------------+
1 row in set (0,001 sec)

```

**Standard deviation `STDDEV` / `STD`**

```sql
SELECT STD(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT STD(credits) FROM user;
+--------------+
| STD(credits) |
+--------------+
|      84.8598 |
+--------------+
1 row in set (0,002 sec)

```

**Variance `VARIANCE`**

```sql
SELECT VARIANCE(column) FROM table_name;
```

```
MariaDB [quote_sql_lab]> SELECT VARIANCE(credits) FROM user;
+-------------------+
| VARIANCE(credits) |
+-------------------+
|         7201.1875 |
+-------------------+
1 row in set (0,001 sec)

```
