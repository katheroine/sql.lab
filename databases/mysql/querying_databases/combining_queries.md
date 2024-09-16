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
mysql> SELECT login AS "nick", group_name FROM user
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
mysql> SELECT id, login AS "nick", group_name FROM user
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
mysql> SELECT id, login AS "nick", group_name FROM user
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
