[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Queries](queries.md)

### Aggregations

#### Aggregate functions

**Database preparation**

```sql
CREATE TABLE user_account
(
    id SERIAL PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

INSERT INTO user_account (login, group_name, credits) VALUES
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
postgres=# SELECT COUNT(*) FROM user_account;
 count
-------
    20
(1 row)

```

```
postgres=# SELECT COUNT(*) FROM user_account WHERE group_name = 'researchers';
 count
-------
     3
(1 row)

```

**Aliases** can be used.

```
postgres=# SELECT COUNT(*) AS "users number" FROM user_account;
 users number
--------------
           20
(1 row)

```

**Minimum value `MIN`**

```sql
SELECT MIN(column) FROM table_name;
```

```
postgres=# SELECT MIN(credits) FROM user_account;
 min
-----
  30
(1 row)

```

```
postgres=# SELECT MIN(credits) FROM user_account WHERE group_name = 'bloggers';
 min
-----
  80
(1 row)

```

**Maximum value `MAX`**

```sql
SELECT MAX(column) FROM table_name;
```

```
postgres=# SELECT MAX(credits) FROM user_account;
 max
-----
 300
(1 row)

```

```
postgres=# SELECT MAX(credits) FROM user_account WHERE group_name = 'journalists';
 max
-----
 180
(1 row)

```

**Total `SUM`**

```sql
SELECT SUM(column) FROM table_name;
```

```
postgres=# SELECT SUM(credits) FROM user_account;
 sum
------
 3005
(1 row)

```

```
postgres=# SELECT SUM(credits) FROM user_account WHERE group_name = 'scientists';
 sum
------
 1100
(1 row)

```

**Average `AVG`**

```sql
SELECT AVG(column) FROM table_name;
```

```
postgres=# SELECT AVG(credits) FROM user_account;
         avg
----------------------
 150.2500000000000000
(1 row)

```

```
postgres=# SELECT AVG(credits) FROM user_account WHERE group_name = 'students';
         avg
---------------------
 40.0000000000000000
(1 row)

```

**Standard deviation `STDDEV`**

```sql
SELECT STDDEV(column) FROM table_name;
```

```
postgres=# SELECT STDDEV(credits) FROM user_account;
       stddev
---------------------
 87.0643289092671559
(1 row)

```

**Variance `VARIANCE`**

```sql
SELECT VARIANCE(column) FROM table_name;
```

```
postgres=# SELECT VARIANCE(credits) FROM user_account;
       variance
-----------------------
 7580.1973684210526316
(1 row)

```
