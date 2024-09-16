[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Queries](queries.md)
[▼ Next: Combining queries](combining_queries.md)

### Aggregations

#### Aggregate functions

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

#### Groupings

```sql
SELECT columns
FROM table_name
WHERE column_conditions
GROUP BY column_1, column_2, column_3
ORDER BY columns_with_orders
HAVING aggregate_conditions;
```

**Grouping by chosen column**

```
MariaDB [quote_sql_lab]> SELECT group_name, COUNT(*) FROM user
    -> GROUP BY group_name;
+-------------+----------+
| group_name  | COUNT(*) |
+-------------+----------+
| bloggers    |        4 |
| hobbyists   |        3 |
| journalists |        3 |
| researchers |        3 |
| scientists  |        4 |
| students    |        3 |
+-------------+----------+
6 rows in set (0,000 sec)

```

**Using alias for aggregate column**

```
MariaDB [quote_sql_lab]> SELECT group_name, AVG(credits) AS "average credits" FROM user
    -> GROUP BY group_name
    -> ORDER BY AVG(credits);
+-------------+-----------------+
| group_name  | average credits |
+-------------+-----------------+
| students    |         40.0000 |
| hobbyists   |         75.0000 |
| bloggers    |        102.5000 |
| journalists |        163.3333 |
| researchers |        220.0000 |
| scientists  |        275.0000 |
+-------------+-----------------+
6 rows in set (0,001 sec)

```

**Using many aggregete functions**

```
MariaDB [quote_sql_lab]> SELECT
    ->     group_name,
    ->     MIN(credits) AS "minimal credits",
    ->     MAX(credits) AS "maximal credits"
    -> FROM user
    -> GROUP BY group_name;
+-------------+-----------------+-----------------+
| group_name  | minimal credits | maximal credits |
+-------------+-----------------+-----------------+
| bloggers    |              80 |             120 |
| hobbyists   |              60 |              90 |
| journalists |             150 |             180 |
| researchers |             200 |             240 |
| scientists  |             250 |             300 |
| students    |              30 |              50 |
+-------------+-----------------+-----------------+
6 rows in set (0,005 sec)

```

**Selecting records with chosen aggregate values**

```
MariaDB [quote_sql_lab]> SELECT
    ->     group_name,
    ->     MIN(credits) AS "minimal credits",
    ->     MAX(credits) AS "maximal credits"
    -> FROM user
    -> GROUP BY group_name
    -> HAVING AVG(credits) > 50;
+-------------+-----------------+-----------------+
| group_name  | minimal credits | maximal credits |
+-------------+-----------------+-----------------+
| bloggers    |              80 |             120 |
| hobbyists   |              60 |              90 |
| journalists |             150 |             180 |
| researchers |             200 |             240 |
| scientists  |             250 |             300 |
+-------------+-----------------+-----------------+
5 rows in set (0,005 sec)

```
