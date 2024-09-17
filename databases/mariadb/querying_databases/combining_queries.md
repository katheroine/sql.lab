[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Aggregations](aggregations.md)

### Combining queries

**Database preparation**

```sql
CREATE TABLE user
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

INSERT INTO user (id, login, group_name, credits) VALUES
    (1, 'john_doe', 'bloggers', 100),
    (2, 'science_gal', 'scientists', 250),
    (3, 'news_hound', 'journalists', 150),
    (4, 'study_buddy', 'students', 50),
    (5, 'data_miner', 'researchers', 200),
    (6, 'craft_master', 'hobbyists', 75),
    (7, 'tech_blogger', 'bloggers', 120),
    (8, 'quantum_guy', 'scientists', 300),
    (9, 'truth_seeker', 'journalists', 180),
    (10, 'college_kid', 'students', 30),
    (11, 'lab_rat', 'researchers', 220),
    (12, 'diy_enthusiast', 'hobbyists', 90),
    (13, 'food_critic', 'bloggers', 80),
    (14, 'rocket_woman', 'scientists', 280),
    (15, 'roving_reporter', 'journalists', 160),
    (16, 'grad_student', 'students', 40),
    (17, 'book_worm', 'researchers', 240),
    (18, 'stamp_collector', 'hobbyists', 60),
    (19, 'travel_guru', 'bloggers', 110),
    (20, 'chem_whiz', 'scientists', 270);

INSERT INTO author (user_id, nick, group_name, credits) VALUES
    (1, 'john_doe', 'bloggers', 20),
    (NULL, 'pinecone', 'bloggers', 5),
    (3, 'news_hound', 'journalists', 15),
    (NULL, 'pumpkin', 'entrant', 5),
    (5, 'data_miner', 'academics', 15),
    (7, 'nerd', 'bloggers', 10),
    (NULL, 'quarky', 'academics', 30),
    (NULL, 'yola', 'entrant', 0),
    (NULL, 'amelie', 'entrant', 0),
    (11, 'penguin', 'academics', 20),
    (NULL, 'newton', 'entrant', 0),
    (NULL, 'pepper', 'journalists', 50),
    (NULL, 'jonny', 'writer', 40),
    (NULL, 'agate', 'writer', 25),
    (19, 'erwin', 'writer', 10),
    (NULL, 'mateo', 'blogger', 0);
```

#### `UNION`

```sql
query_1 UNION query_2 UNION query_3;
```

```
MariaDB [quote_sql_lab]> SELECT login AS "nick", group_name FROM user
    -> UNION
    -> SELECT nick, group_name FROM author WHERE user_id IS NULL;
+-----------------+-------------+
| nick            | group_name  |
+-----------------+-------------+
| john_doe        | bloggers    |
| science_gal     | scientists  |
| news_hound      | journalists |
| study_buddy     | students    |
| data_miner      | researchers |
| craft_master    | hobbyists   |
| tech_blogger    | bloggers    |
| quantum_guy     | scientists  |
| truth_seeker    | journalists |
| college_kid     | students    |
| lab_rat         | researchers |
| diy_enthusiast  | hobbyists   |
| food_critic     | bloggers    |
| rocket_woman    | scientists  |
| roving_reporter | journalists |
| grad_student    | students    |
| book_worm       | researchers |
| stamp_collector | hobbyists   |
| travel_guru     | bloggers    |
| chem_whiz       | scientists  |
| pinecone        | bloggers    |
| pumpkin         | entrant     |
| quarky          | academics   |
| yola            | entrant     |
| amelie          | entrant     |
| newton          | entrant     |
| pepper          | journalists |
| jonny           | writer      |
| agate           | writer      |
| mateo           | blogger     |
+-----------------+-------------+
30 rows in set (0,001 sec)

```

**Data duplicates**

* Without duplicates - `UNION`

```sql
query_1 UNION query_2 UNION query_3;
```

```
MariaDB [quote_sql_lab]> SELECT id, login AS "nick", group_name FROM user
    -> UNION
    -> SELECT user_id AS "id", nick, group_name FROM author;
+------+-----------------+-------------+
| id   | nick            | group_name  |
+------+-----------------+-------------+
|    1 | john_doe        | bloggers    |
|    2 | science_gal     | scientists  |
|    3 | news_hound      | journalists |
|    4 | study_buddy     | students    |
|    5 | data_miner      | researchers |
|    6 | craft_master    | hobbyists   |
|    7 | tech_blogger    | bloggers    |
|    8 | quantum_guy     | scientists  |
|    9 | truth_seeker    | journalists |
|   10 | college_kid     | students    |
|   11 | lab_rat         | researchers |
|   12 | diy_enthusiast  | hobbyists   |
|   13 | food_critic     | bloggers    |
|   14 | rocket_woman    | scientists  |
|   15 | roving_reporter | journalists |
|   16 | grad_student    | students    |
|   17 | book_worm       | researchers |
|   18 | stamp_collector | hobbyists   |
|   19 | travel_guru     | bloggers    |
|   20 | chem_whiz       | scientists  |
| NULL | pinecone        | bloggers    |
| NULL | pumpkin         | entrant     |
|    5 | data_miner      | academics   |
|    7 | nerd            | bloggers    |
| NULL | quarky          | academics   |
| NULL | yola            | entrant     |
| NULL | amelie          | entrant     |
|   11 | penguin         | academics   |
| NULL | newton          | entrant     |
| NULL | pepper          | journalists |
| NULL | jonny           | writer      |
| NULL | agate           | writer      |
|   19 | erwin           | writer      |
| NULL | mateo           | blogger     |
+------+-----------------+-------------+
34 rows in set (0,000 sec)

```

* With duplicates - `UNION ALL`

```sql
query_1 UNION query_2 UNION ALL query_3;
```

```
MariaDB [quote_sql_lab]> SELECT id, login AS "nick", group_name FROM user
    -> UNION ALL
    -> SELECT user_id AS "id", nick, group_name FROM author;
+------+-----------------+-------------+
| id   | nick            | group_name  |
+------+-----------------+-------------+
|    1 | john_doe        | bloggers    |
|    2 | science_gal     | scientists  |
|    3 | news_hound      | journalists |
|    4 | study_buddy     | students    |
|    5 | data_miner      | researchers |
|    6 | craft_master    | hobbyists   |
|    7 | tech_blogger    | bloggers    |
|    8 | quantum_guy     | scientists  |
|    9 | truth_seeker    | journalists |
|   10 | college_kid     | students    |
|   11 | lab_rat         | researchers |
|   12 | diy_enthusiast  | hobbyists   |
|   13 | food_critic     | bloggers    |
|   14 | rocket_woman    | scientists  |
|   15 | roving_reporter | journalists |
|   16 | grad_student    | students    |
|   17 | book_worm       | researchers |
|   18 | stamp_collector | hobbyists   |
|   19 | travel_guru     | bloggers    |
|   20 | chem_whiz       | scientists  |
|    1 | john_doe        | bloggers    |
| NULL | pinecone        | bloggers    |
|    3 | news_hound      | journalists |
| NULL | pumpkin         | entrant     |
|    5 | data_miner      | academics   |
|    7 | nerd            | bloggers    |
| NULL | quarky          | academics   |
| NULL | yola            | entrant     |
| NULL | amelie          | entrant     |
|   11 | penguin         | academics   |
| NULL | newton          | entrant     |
| NULL | pepper          | journalists |
| NULL | jonny           | writer      |
| NULL | agate           | writer      |
|   19 | erwin           | writer      |
| NULL | mateo           | blogger     |
+------+-----------------+-------------+
36 rows in set (0,001 sec)

```

#### `INTERSECT`

```sql
query_1 INTERSECT query_2;
```

```
MariaDB [quote_sql_lab]> SELECT id, login AS "nick", group_name FROM user
    -> INTERSECT
    -> SELECT user_id AS "id", nick, group_name FROM author;
+------+------------+-------------+
| id   | nick       | group_name  |
+------+------------+-------------+
|    1 | john_doe   | bloggers    |
|    3 | news_hound | journalists |
+------+------------+-------------+
2 rows in set (0,000 sec)

```

#### `EXCEPT`

```sql
query_1 EXCEPT query_2;
```

```
MariaDB [quote_sql_lab]> SELECT id, login AS "nick", group_name FROM user
    -> EXCEPT
    -> SELECT user_id AS "id", nick, group_name FROM author;
+------+-----------------+-------------+
| id   | nick            | group_name  |
+------+-----------------+-------------+
|    2 | science_gal     | scientists  |
|    4 | study_buddy     | students    |
|    5 | data_miner      | researchers |
|    6 | craft_master    | hobbyists   |
|    7 | tech_blogger    | bloggers    |
|    8 | quantum_guy     | scientists  |
|    9 | truth_seeker    | journalists |
|   10 | college_kid     | students    |
|   11 | lab_rat         | researchers |
|   12 | diy_enthusiast  | hobbyists   |
|   13 | food_critic     | bloggers    |
|   14 | rocket_woman    | scientists  |
|   15 | roving_reporter | journalists |
|   16 | grad_student    | students    |
|   17 | book_worm       | researchers |
|   18 | stamp_collector | hobbyists   |
|   19 | travel_guru     | bloggers    |
|   20 | chem_whiz       | scientists  |
+------+-----------------+-------------+
18 rows in set (0,001 sec)

```

```
MariaDB [quote_sql_lab]> SELECT user_id AS "id", nick, group_name FROM author
    -> EXCEPT
    -> SELECT id, login AS "nick", group_name FROM user;
+------+------------+-------------+
| id   | nick       | group_name  |
+------+------------+-------------+
| NULL | pinecone   | bloggers    |
| NULL | pumpkin    | entrant     |
|    5 | data_miner | academics   |
|    7 | nerd       | bloggers    |
| NULL | quarky     | academics   |
| NULL | yola       | entrant     |
| NULL | amelie     | entrant     |
|   11 | penguin    | academics   |
| NULL | newton     | entrant     |
| NULL | pepper     | journalists |
| NULL | jonny      | writer      |
| NULL | agate      | writer      |
|   19 | erwin      | writer      |
| NULL | mateo      | blogger     |
+------+------------+-------------+
14 rows in set (0,001 sec)

```

#### Selecting from multiple tables

```sql
SELECT columns
FROM table_1, table_2, table_3
WHERE conditions
ORDER BY columns_with_orders;
```

```
MariaDB [quote_sql_lab]> SELECT login, nick FROM user, author;
+-----------------+------------+
| login           | nick       |
+-----------------+------------+
| book_worm       | agate      |
| book_worm       | amelie     |
| book_worm       | data_miner |
| book_worm       | erwin      |
| book_worm       | john_doe   |
| book_worm       | jonny      |
| book_worm       | mateo      |
| book_worm       | nerd       |
| book_worm       | news_hound |
| book_worm       | newton     |
| book_worm       | penguin    |
| book_worm       | pepper     |
| book_worm       | pinecone   |
| book_worm       | pumpkin    |
| book_worm       | quarky     |
| book_worm       | yola       |
| chem_whiz       | agate      |
| chem_whiz       | amelie     |
| chem_whiz       | data_miner |
| chem_whiz       | erwin      |
| chem_whiz       | john_doe   |
| chem_whiz       | jonny      |
| chem_whiz       | mateo      |
| chem_whiz       | nerd       |
| chem_whiz       | news_hound |
| chem_whiz       | newton     |
| chem_whiz       | penguin    |
| chem_whiz       | pepper     |
| chem_whiz       | pinecone   |
| chem_whiz       | pumpkin    |
| chem_whiz       | quarky     |
| chem_whiz       | yola       |
| college_kid     | agate      |
| college_kid     | amelie     |
| college_kid     | data_miner |
| college_kid     | erwin      |
| college_kid     | john_doe   |
| college_kid     | jonny      |
| college_kid     | mateo      |
| college_kid     | nerd       |
| college_kid     | news_hound |
| college_kid     | newton     |
| college_kid     | penguin    |
| college_kid     | pepper     |
| college_kid     | pinecone   |
| college_kid     | pumpkin    |
| college_kid     | quarky     |
| college_kid     | yola       |
| craft_master    | agate      |
| craft_master    | amelie     |
| craft_master    | data_miner |
| craft_master    | erwin      |
| craft_master    | john_doe   |
| craft_master    | jonny      |
| craft_master    | mateo      |
| craft_master    | nerd       |
| craft_master    | news_hound |
| craft_master    | newton     |
| craft_master    | penguin    |
| craft_master    | pepper     |
| craft_master    | pinecone   |
| craft_master    | pumpkin    |
| craft_master    | quarky     |
| craft_master    | yola       |
| data_miner      | agate      |
| data_miner      | amelie     |
| data_miner      | data_miner |
| data_miner      | erwin      |
| data_miner      | john_doe   |
| data_miner      | jonny      |
| data_miner      | mateo      |
| data_miner      | nerd       |
| data_miner      | news_hound |
| data_miner      | newton     |
| data_miner      | penguin    |
| data_miner      | pepper     |
| data_miner      | pinecone   |
| data_miner      | pumpkin    |
| data_miner      | quarky     |
| data_miner      | yola       |
| diy_enthusiast  | agate      |
| diy_enthusiast  | amelie     |
| diy_enthusiast  | data_miner |
| diy_enthusiast  | erwin      |
| diy_enthusiast  | john_doe   |
| diy_enthusiast  | jonny      |
| diy_enthusiast  | mateo      |
| diy_enthusiast  | nerd       |
| diy_enthusiast  | news_hound |
| diy_enthusiast  | newton     |
| diy_enthusiast  | penguin    |
| diy_enthusiast  | pepper     |
| diy_enthusiast  | pinecone   |
| diy_enthusiast  | pumpkin    |
| diy_enthusiast  | quarky     |
| diy_enthusiast  | yola       |
| food_critic     | agate      |
| food_critic     | amelie     |
| food_critic     | data_miner |
| food_critic     | erwin      |
| food_critic     | john_doe   |
| food_critic     | jonny      |
| food_critic     | mateo      |
| food_critic     | nerd       |
| food_critic     | news_hound |
| food_critic     | newton     |
| food_critic     | penguin    |
| food_critic     | pepper     |
| food_critic     | pinecone   |
| food_critic     | pumpkin    |
| food_critic     | quarky     |
| food_critic     | yola       |
| grad_student    | agate      |
| grad_student    | amelie     |
| grad_student    | data_miner |
| grad_student    | erwin      |
| grad_student    | john_doe   |
| grad_student    | jonny      |
| grad_student    | mateo      |
| grad_student    | nerd       |
| grad_student    | news_hound |
| grad_student    | newton     |
| grad_student    | penguin    |
| grad_student    | pepper     |
| grad_student    | pinecone   |
| grad_student    | pumpkin    |
| grad_student    | quarky     |
| grad_student    | yola       |
| john_doe        | agate      |
| john_doe        | amelie     |
| john_doe        | data_miner |
| john_doe        | erwin      |
| john_doe        | john_doe   |
| john_doe        | jonny      |
| john_doe        | mateo      |
| john_doe        | nerd       |
| john_doe        | news_hound |
| john_doe        | newton     |
| john_doe        | penguin    |
| john_doe        | pepper     |
| john_doe        | pinecone   |
| john_doe        | pumpkin    |
| john_doe        | quarky     |
| john_doe        | yola       |
| lab_rat         | agate      |
| lab_rat         | amelie     |
| lab_rat         | data_miner |
| lab_rat         | erwin      |
| lab_rat         | john_doe   |
| lab_rat         | jonny      |
| lab_rat         | mateo      |
| lab_rat         | nerd       |
| lab_rat         | news_hound |
| lab_rat         | newton     |
| lab_rat         | penguin    |
| lab_rat         | pepper     |
| lab_rat         | pinecone   |
| lab_rat         | pumpkin    |
| lab_rat         | quarky     |
| lab_rat         | yola       |
| news_hound      | agate      |
| news_hound      | amelie     |
| news_hound      | data_miner |
| news_hound      | erwin      |
| news_hound      | john_doe   |
| news_hound      | jonny      |
| news_hound      | mateo      |
| news_hound      | nerd       |
| news_hound      | news_hound |
| news_hound      | newton     |
| news_hound      | penguin    |
| news_hound      | pepper     |
| news_hound      | pinecone   |
| news_hound      | pumpkin    |
| news_hound      | quarky     |
| news_hound      | yola       |
| quantum_guy     | agate      |
| quantum_guy     | amelie     |
| quantum_guy     | data_miner |
| quantum_guy     | erwin      |
| quantum_guy     | john_doe   |
| quantum_guy     | jonny      |
| quantum_guy     | mateo      |
| quantum_guy     | nerd       |
| quantum_guy     | news_hound |
| quantum_guy     | newton     |
| quantum_guy     | penguin    |
| quantum_guy     | pepper     |
| quantum_guy     | pinecone   |
| quantum_guy     | pumpkin    |
| quantum_guy     | quarky     |
| quantum_guy     | yola       |
| rocket_woman    | agate      |
| rocket_woman    | amelie     |
| rocket_woman    | data_miner |
| rocket_woman    | erwin      |
| rocket_woman    | john_doe   |
| rocket_woman    | jonny      |
| rocket_woman    | mateo      |
| rocket_woman    | nerd       |
| rocket_woman    | news_hound |
| rocket_woman    | newton     |
| rocket_woman    | penguin    |
| rocket_woman    | pepper     |
| rocket_woman    | pinecone   |
| rocket_woman    | pumpkin    |
| rocket_woman    | quarky     |
| rocket_woman    | yola       |
| roving_reporter | agate      |
| roving_reporter | amelie     |
| roving_reporter | data_miner |
| roving_reporter | erwin      |
| roving_reporter | john_doe   |
| roving_reporter | jonny      |
| roving_reporter | mateo      |
| roving_reporter | nerd       |
| roving_reporter | news_hound |
| roving_reporter | newton     |
| roving_reporter | penguin    |
| roving_reporter | pepper     |
| roving_reporter | pinecone   |
| roving_reporter | pumpkin    |
| roving_reporter | quarky     |
| roving_reporter | yola       |
| science_gal     | agate      |
| science_gal     | amelie     |
| science_gal     | data_miner |
| science_gal     | erwin      |
| science_gal     | john_doe   |
| science_gal     | jonny      |
| science_gal     | mateo      |
| science_gal     | nerd       |
| science_gal     | news_hound |
| science_gal     | newton     |
| science_gal     | penguin    |
| science_gal     | pepper     |
| science_gal     | pinecone   |
| science_gal     | pumpkin    |
| science_gal     | quarky     |
| science_gal     | yola       |
| stamp_collector | agate      |
| stamp_collector | amelie     |
| stamp_collector | data_miner |
| stamp_collector | erwin      |
| stamp_collector | john_doe   |
| stamp_collector | jonny      |
| stamp_collector | mateo      |
| stamp_collector | nerd       |
| stamp_collector | news_hound |
| stamp_collector | newton     |
| stamp_collector | penguin    |
| stamp_collector | pepper     |
| stamp_collector | pinecone   |
| stamp_collector | pumpkin    |
| stamp_collector | quarky     |
| stamp_collector | yola       |
| study_buddy     | agate      |
| study_buddy     | amelie     |
| study_buddy     | data_miner |
| study_buddy     | erwin      |
| study_buddy     | john_doe   |
| study_buddy     | jonny      |
| study_buddy     | mateo      |
| study_buddy     | nerd       |
| study_buddy     | news_hound |
| study_buddy     | newton     |
| study_buddy     | penguin    |
| study_buddy     | pepper     |
| study_buddy     | pinecone   |
| study_buddy     | pumpkin    |
| study_buddy     | quarky     |
| study_buddy     | yola       |
| tech_blogger    | agate      |
| tech_blogger    | amelie     |
| tech_blogger    | data_miner |
| tech_blogger    | erwin      |
| tech_blogger    | john_doe   |
| tech_blogger    | jonny      |
| tech_blogger    | mateo      |
| tech_blogger    | nerd       |
| tech_blogger    | news_hound |
| tech_blogger    | newton     |
| tech_blogger    | penguin    |
| tech_blogger    | pepper     |
| tech_blogger    | pinecone   |
| tech_blogger    | pumpkin    |
| tech_blogger    | quarky     |
| tech_blogger    | yola       |
| travel_guru     | agate      |
| travel_guru     | amelie     |
| travel_guru     | data_miner |
| travel_guru     | erwin      |
| travel_guru     | john_doe   |
| travel_guru     | jonny      |
| travel_guru     | mateo      |
| travel_guru     | nerd       |
| travel_guru     | news_hound |
| travel_guru     | newton     |
| travel_guru     | penguin    |
| travel_guru     | pepper     |
| travel_guru     | pinecone   |
| travel_guru     | pumpkin    |
| travel_guru     | quarky     |
| travel_guru     | yola       |
| truth_seeker    | agate      |
| truth_seeker    | amelie     |
| truth_seeker    | data_miner |
| truth_seeker    | erwin      |
| truth_seeker    | john_doe   |
| truth_seeker    | jonny      |
| truth_seeker    | mateo      |
| truth_seeker    | nerd       |
| truth_seeker    | news_hound |
| truth_seeker    | newton     |
| truth_seeker    | penguin    |
| truth_seeker    | pepper     |
| truth_seeker    | pinecone   |
| truth_seeker    | pumpkin    |
| truth_seeker    | quarky     |
| truth_seeker    | yola       |
+-----------------+------------+
320 rows in set (0,001 sec)

```

```
MariaDB [quote_sql_lab]> SELECT login, nick FROM user, author
    -> WHERE user.id = author.user_id;
+--------------+------------+
| login        | nick       |
+--------------+------------+
| john_doe     | john_doe   |
| news_hound   | news_hound |
| data_miner   | data_miner |
| tech_blogger | nerd       |
| lab_rat      | penguin    |
| travel_guru  | erwin      |
+--------------+------------+
6 rows in set (0,005 sec)

```
