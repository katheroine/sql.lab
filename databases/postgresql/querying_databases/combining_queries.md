[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Aggregations](aggregations.md)

### Combining queries

**Database preparation**

```sql
CREATE TABLE user_account
(
    id SERIAL PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

INSERT INTO user_account (id, login, group_name, credits) VALUES
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
quote_sql_lab-# SELECT nick, group_name FROM author WHERE user_id IS NULL;
      nick       | group_name
-----------------+-------------
 chem_whiz       | scientists
 john_doe        | bloggers
 pumpkin         | entrant
 data_miner      | researchers
 book_worm       | researchers
 quantum_guy     | scientists
 food_critic     | bloggers
 travel_guru     | bloggers
 tech_blogger    | bloggers
 pepper          | journalists
 amelie          | entrant
 mateo           | blogger
 stamp_collector | hobbyists
 grad_student    | students
 diy_enthusiast  | hobbyists
 quarky          | academics
 roving_reporter | journalists
 jonny           | writer
 yola            | entrant
 rocket_woman    | scientists
 newton          | entrant
 news_hound      | journalists
 pinecone        | bloggers
 truth_seeker    | journalists
 college_kid     | students
 science_gal     | scientists
 lab_rat         | researchers
 agate           | writer
 study_buddy     | students
 craft_master    | hobbyists
(30 rows)

```

**Data duplicates**

* Without duplicates - `UNION`

```sql
query_1 UNION query_2 UNION query_3;
```

```
quote_sql_lab=# SELECT id, login AS "nick", group_name FROM user_account
quote_sql_lab-# UNION
quote_sql_lab-# SELECT user_id AS "id", nick, group_name FROM author;
 id |      nick       | group_name
----+-----------------+-------------
  8 | quantum_guy     | scientists
  6 | craft_master    | hobbyists
  5 | data_miner      | researchers
    | mateo           | blogger
    | quarky          | academics
  7 | nerd            | bloggers
  7 | tech_blogger    | bloggers
  1 | john_doe        | bloggers
 16 | grad_student    | students
    | newton          | entrant
 11 | penguin         | academics
 15 | roving_reporter | journalists
  5 | data_miner      | academics
    | agate           | writer
 10 | college_kid     | students
  2 | science_gal     | scientists
 19 | travel_guru     | bloggers
  3 | news_hound      | journalists
 14 | rocket_woman    | scientists
    | pumpkin         | entrant
    | pepper          | journalists
 11 | lab_rat         | researchers
    | amelie          | entrant
  9 | truth_seeker    | journalists
  4 | study_buddy     | students
 13 | food_critic     | bloggers
    | jonny           | writer
 19 | erwin           | writer
    | yola            | entrant
 17 | book_worm       | researchers
 20 | chem_whiz       | scientists
    | pinecone        | bloggers
 18 | stamp_collector | hobbyists
 12 | diy_enthusiast  | hobbyists
(34 rows)

```

* With duplicates - `UNION ALL`

```sql
query_1 UNION query_2 UNION ALL query_3;
```

```
quote_sql_lab=# SELECT id, login AS "nick", group_name FROM user_account
quote_sql_lab-# UNION ALL
quote_sql_lab-# SELECT user_id AS "id", nick, group_name FROM author;
 id |      nick       | group_name
----+-----------------+-------------
  1 | john_doe        | bloggers
  2 | science_gal     | scientists
  3 | news_hound      | journalists
  4 | study_buddy     | students
  5 | data_miner      | researchers
  6 | craft_master    | hobbyists
  7 | tech_blogger    | bloggers
  8 | quantum_guy     | scientists
  9 | truth_seeker    | journalists
 10 | college_kid     | students
 11 | lab_rat         | researchers
 12 | diy_enthusiast  | hobbyists
 13 | food_critic     | bloggers
 14 | rocket_woman    | scientists
 15 | roving_reporter | journalists
 16 | grad_student    | students
 17 | book_worm       | researchers
 18 | stamp_collector | hobbyists
 19 | travel_guru     | bloggers
 20 | chem_whiz       | scientists
  1 | john_doe        | bloggers
    | pinecone        | bloggers
  3 | news_hound      | journalists
    | pumpkin         | entrant
  5 | data_miner      | academics
  7 | nerd            | bloggers
    | quarky          | academics
    | yola            | entrant
    | amelie          | entrant
 11 | penguin         | academics
    | newton          | entrant
    | pepper          | journalists
    | jonny           | writer
    | agate           | writer
 19 | erwin           | writer
    | mateo           | blogger
(36 rows)

```
