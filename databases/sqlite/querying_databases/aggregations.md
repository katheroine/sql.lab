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
    id INTEGER PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

INSERT INTO user (login, group_name, credits) VALUES ('john_doe', 'bloggers', 100);
INSERT INTO user (login, group_name, credits) VALUES ('science_gal', 'scientists', 250);
INSERT INTO user (login, group_name, credits) VALUES ('news_hound', 'journalists', 150);
INSERT INTO user (login, group_name, credits) VALUES ('study_buddy', 'students', 50);
INSERT INTO user (login, group_name, credits) VALUES ('data_miner', 'researchers', 200);
INSERT INTO user (login, group_name, credits) VALUES ('craft_master', 'hobbyists', 75);
INSERT INTO user (login, group_name, credits) VALUES ('tech_blogger', 'bloggers', 120);
INSERT INTO user (login, group_name, credits) VALUES ('quantum_guy', 'scientists', 300);
INSERT INTO user (login, group_name, credits) VALUES ('truth_seeker', 'journalists', 180);
INSERT INTO user (login, group_name, credits) VALUES ('college_kid', 'students', 30);
INSERT INTO user (login, group_name, credits) VALUES ('lab_rat', 'researchers', 220);
INSERT INTO user (login, group_name, credits) VALUES ('diy_enthusiast', 'hobbyists', 90);
INSERT INTO user (login, group_name, credits) VALUES ('food_critic', 'bloggers', 80);
INSERT INTO user (login, group_name, credits) VALUES ('rocket_woman', 'scientists', 280);
INSERT INTO user (login, group_name, credits) VALUES ('roving_reporter', 'journalists', 160);
INSERT INTO user (login, group_name, credits) VALUES ('grad_student', 'students', 40);
INSERT INTO user (login, group_name, credits) VALUES ('book_worm', 'researchers', 240);
INSERT INTO user (login, group_name, credits) VALUES ('stamp_collector', 'hobbyists', 60);
INSERT INTO user (login, group_name, credits) VALUES ('travel_guru', 'bloggers', 110);
INSERT INTO user (login, group_name, credits) VALUES ('chem_whiz', 'scientists', 270);
```

**Results count `COUNT`**

```sql
SELECT COUNT(columns) FROM table_name;
```

```
sqlite> SELECT COUNT(*) FROM user;
20
```

```
sqlite> SELECT COUNT(*) FROM user WHERE group_name = "researchers";
3
```

**Aliases** can be used.

```
sqlite> SELECT COUNT(*) AS "users number" FROM user;
20
```

**Minimum value `MIN`**

```sql
SELECT MIN(column) FROM table_name;
```

```
sqlite> SELECT MIN(credits) FROM user;
30
```

```
sqlite> SELECT MIN(credits) FROM user WHERE group_name = "bloggers";
80
```

**Maximum value `MAX`**

```sql
SELECT MAX(column) FROM table_name;
```

```
sqlite> SELECT MAX(credits) FROM user;
300
```

```
sqlite> SELECT MAX(credits) FROM user WHERE group_name = "journalists";
180
```

**Total `SUM`**

```sql
SELECT SUM(column) FROM table_name;
```

```
sqlite> SELECT SUM(credits) FROM user;
3005
```

```
sqlite> SELECT SUM(credits) FROM user WHERE group_name = "scientists";
1100
```

**Average `AVG`**

```sql
SELECT AVG(column) FROM table_name;
```

```
sqlite> SELECT AVG(credits) FROM user;
150.25
```

```
sqlite> SELECT AVG(credits) FROM user WHERE group_name = "students";
40
```

**Standard deviation**

**Standard deviation** is not avaliable in SQLite.

**Variance**

**Variance** is not available in SQLite.

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
sqlite> SELECT group_name, COUNT(*) FROM user
   ...> GROUP BY group_name;
students|3
journalists|3
hobbyists|3
scientists|4
researchers|3
bloggers|4
```

**Using alias for aggregate column**

```
sqlite> SELECT group_name, AVG(credits) AS "average credits" FROM user
   ...> GROUP BY group_name
   ...> ORDER BY "average credits";
students|40
hobbyists|75
bloggers|102.5
journalists|163.333333333333
researchers|220
scientists|275
```

**Using many aggregete functions**

```
sqlite> SELECT
   ...>     group_name,
   ...>     MIN(credits) AS "minimal credits",
   ...>     MAX(credits) AS "maximal credits"
   ...> FROM user
   ...> GROUP BY group_name;
students|30|50
journalists|150|180
hobbyists|60|90
scientists|250|300
researchers|200|240
bloggers|80|120
```

**Selecting records with chosen aggregate values**

```
sqlite> SELECT
   ...>     group_name,
   ...>     MIN(credits) AS "minimal credits",
   ...>     MAX(credits) AS "maximal credits"
   ...> FROM user
   ...> GROUP BY group_name
   ...> HAVING AVG(credits) > 50;
journalists|150|180
hobbyists|60|90
scientists|250|300
researchers|200|240
bloggers|80|120
```
