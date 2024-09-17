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

#### `INTERSECT`

```sql
query_1 INTERSECT query_2;
```

```
quote_sql_lab=# SELECT id, login AS "nick", group_name FROM user_account
quote_sql_lab-# INTERSECT
quote_sql_lab-# SELECT user_id AS "id", nick, group_name FROM author;
 id |    nick    | group_name
----+------------+-------------
  3 | news_hound | journalists
  1 | john_doe   | bloggers
(2 rows)

```

#### `EXCEPT`

```sql
query_1 EXCEPT query_2;
```

```
quote_sql_lab=# SELECT id, login AS "nick", group_name FROM user_account
quote_sql_lab-# EXCEPT
quote_sql_lab-# SELECT user_id AS "id", nick, group_name FROM author;
 id |      nick       | group_name
----+-----------------+-------------
 19 | travel_guru     | bloggers
 14 | rocket_woman    | scientists
  8 | quantum_guy     | scientists
  6 | craft_master    | hobbyists
 11 | lab_rat         | researchers
  5 | data_miner      | researchers
  9 | truth_seeker    | journalists
  4 | study_buddy     | students
 13 | food_critic     | bloggers
  7 | tech_blogger    | bloggers
 16 | grad_student    | students
 17 | book_worm       | researchers
 20 | chem_whiz       | scientists
 15 | roving_reporter | journalists
 18 | stamp_collector | hobbyists
 12 | diy_enthusiast  | hobbyists
 10 | college_kid     | students
  2 | science_gal     | scientists
(18 rows)

```

```
quote_sql_lab=# SELECT user_id AS "id", nick, group_name FROM author
quote_sql_lab-# EXCEPT
quote_sql_lab-# SELECT id, login AS "nick", group_name FROM user_account;
 id |    nick    | group_name
----+------------+-------------
    | pumpkin    | entrant
    | pepper     | journalists
    | amelie     | entrant
    | mateo      | blogger
    | quarky     | academics
    | jonny      | writer
  7 | nerd       | bloggers
 19 | erwin      | writer
    | yola       | entrant
    | newton     | entrant
    | pinecone   | bloggers
 11 | penguin    | academics
  5 | data_miner | academics
    | agate      | writer
(14 rows)

```

#### Selecting from multiple tables

```sql
SELECT columns
FROM table_1, table_2, table_3
WHERE conditions
ORDER BY columns_with_orders;
```

```
quote_sql_lab=# SELECT login, nick FROM user_account, author;
      login      |    nick
-----------------+------------
 john_doe        | john_doe
 john_doe        | pinecone
 john_doe        | news_hound
 john_doe        | pumpkin
 john_doe        | data_miner
 john_doe        | nerd
 john_doe        | quarky
 john_doe        | yola
 john_doe        | amelie
 john_doe        | penguin
 john_doe        | newton
 john_doe        | pepper
 john_doe        | jonny
 john_doe        | agate
 john_doe        | erwin
 john_doe        | mateo
 science_gal     | john_doe
 science_gal     | pinecone
 science_gal     | news_hound
 science_gal     | pumpkin
 science_gal     | data_miner
 science_gal     | nerd
 science_gal     | quarky
 science_gal     | yola
 science_gal     | amelie
 science_gal     | penguin
 science_gal     | newton
 science_gal     | pepper
 science_gal     | jonny
 science_gal     | agate
 science_gal     | erwin
 science_gal     | mateo
 news_hound      | john_doe
 news_hound      | pinecone
 news_hound      | news_hound
 news_hound      | pumpkin
 news_hound      | data_miner
 news_hound      | nerd
 news_hound      | quarky
 news_hound      | yola
 news_hound      | amelie
 news_hound      | penguin
 news_hound      | newton
 news_hound      | pepper
 news_hound      | jonny
 news_hound      | agate
 news_hound      | erwin
 news_hound      | mateo
 study_buddy     | john_doe
 study_buddy     | pinecone
 study_buddy     | news_hound
 study_buddy     | pumpkin
 study_buddy     | data_miner
 study_buddy     | nerd
 study_buddy     | quarky
 study_buddy     | yola
 study_buddy     | amelie
 study_buddy     | penguin
 study_buddy     | newton
 study_buddy     | pepper
 study_buddy     | pepper
 study_buddy     | jonny
 study_buddy     | agate
 study_buddy     | erwin
 study_buddy     | mateo
 data_miner      | john_doe
 data_miner      | pinecone
 data_miner      | news_hound
 data_miner      | pumpkin
 data_miner      | data_miner
 data_miner      | nerd
 data_miner      | quarky
 data_miner      | yola
 data_miner      | amelie
 data_miner      | penguin
 data_miner      | newton
 data_miner      | pepper
 data_miner      | jonny
 data_miner      | agate
 data_miner      | erwin
 data_miner      | mateo
 craft_master    | john_doe
 craft_master    | pinecone
 craft_master    | news_hound
 craft_master    | pumpkin
 craft_master    | data_miner
 craft_master    | nerd
 craft_master    | quarky
 craft_master    | yola
 craft_master    | amelie
 craft_master    | penguin
 craft_master    | newton
 craft_master    | pepper
 craft_master    | jonny
 craft_master    | agate
 craft_master    | erwin
 craft_master    | mateo
 tech_blogger    | john_doe
 tech_blogger    | pinecone
 tech_blogger    | news_hound
 tech_blogger    | pumpkin
 tech_blogger    | data_miner
 tech_blogger    | nerd
 tech_blogger    | quarky
 tech_blogger    | yola
 tech_blogger    | amelie
 tech_blogger    | penguin
 tech_blogger    | newton
 tech_blogger    | pepper
 tech_blogger    | jonny
 tech_blogger    | agate
 tech_blogger    | erwin
 tech_blogger    | mateo
 quantum_guy     | john_doe
 quantum_guy     | pinecone
 quantum_guy     | news_hound
 quantum_guy     | pumpkin
 quantum_guy     | data_miner
 quantum_guy     | nerd
 quantum_guy     | quarky
 quantum_guy     | yola
 quantum_guy     | amelie
 quantum_guy     | penguin
 quantum_guy     | newton
 quantum_guy     | pepper
 quantum_guy     | jonny
 quantum_guy     | agate
 quantum_guy     | erwin
 quantum_guy     | mateo
 truth_seeker    | john_doe
 truth_seeker    | pinecone
 truth_seeker    | news_hound
 truth_seeker    | pumpkin
 truth_seeker    | data_miner
 truth_seeker    | nerd
 truth_seeker    | quarky
 truth_seeker    | yola
 truth_seeker    | amelie
 truth_seeker    | penguin
 truth_seeker    | newton
 truth_seeker    | pepper
 truth_seeker    | jonny
 truth_seeker    | agate
 truth_seeker    | erwin
 truth_seeker    | mateo
 college_kid     | john_doe
 college_kid     | pinecone
 college_kid     | news_hound
 college_kid     | pumpkin
 college_kid     | data_miner
 college_kid     | nerd
 college_kid     | quarky
 college_kid     | yola
 college_kid     | amelie
 college_kid     | penguin
 college_kid     | newton
 college_kid     | pepper
 college_kid     | jonny
 college_kid     | agate
 college_kid     | erwin
 college_kid     | mateo
 lab_rat         | john_doe
 lab_rat         | pinecone
 lab_rat         | news_hound
 lab_rat         | pumpkin
 lab_rat         | data_miner
 lab_rat         | nerd
 lab_rat         | quarky
 lab_rat         | yola
 lab_rat         | amelie
 lab_rat         | penguin
 lab_rat         | newton
 lab_rat         | pepper
 lab_rat         | jonny
 lab_rat         | agate
 lab_rat         | erwin
 lab_rat         | mateo
 diy_enthusiast  | john_doe
 diy_enthusiast  | pinecone
 diy_enthusiast  | news_hound
 diy_enthusiast  | pumpkin
 diy_enthusiast  | data_miner
 diy_enthusiast  | nerd
 diy_enthusiast  | quarky
 diy_enthusiast  | yola
 diy_enthusiast  | amelie
 diy_enthusiast  | penguin
 diy_enthusiast  | newton
 diy_enthusiast  | pepper
 diy_enthusiast  | jonny
 diy_enthusiast  | agate
 diy_enthusiast  | erwin
 diy_enthusiast  | mateo
 food_critic     | john_doe
 food_critic     | pinecone
 food_critic     | news_hound
 food_critic     | pumpkin
 food_critic     | data_miner
 food_critic     | nerd
 food_critic     | quarky
 food_critic     | yola
 food_critic     | amelie
 food_critic     | penguin
 food_critic     | newton
 food_critic     | pepper
 food_critic     | jonny
 food_critic     | agate
 food_critic     | erwin
 food_critic     | mateo
 rocket_woman    | john_doe
 rocket_woman    | pinecone
 rocket_woman    | news_hound
 rocket_woman    | pumpkin
 rocket_woman    | data_miner
 rocket_woman    | nerd
 rocket_woman    | quarky
 rocket_woman    | yola
 rocket_woman    | amelie
 rocket_woman    | penguin
 rocket_woman    | newton
 rocket_woman    | pepper
 rocket_woman    | jonny
 rocket_woman    | agate
 rocket_woman    | erwin
 rocket_woman    | mateo
 roving_reporter | john_doe
 roving_reporter | pinecone
 roving_reporter | news_hound
 roving_reporter | pumpkin
 roving_reporter | data_miner
 roving_reporter | nerd
 roving_reporter | quarky
 roving_reporter | yola
 roving_reporter | amelie
 roving_reporter | penguin
 roving_reporter | newton
 roving_reporter | pepper
 roving_reporter | jonny
 roving_reporter | agate
 roving_reporter | erwin
 roving_reporter | mateo
 grad_student    | john_doe
 grad_student    | pinecone
 grad_student    | news_hound
 grad_student    | pumpkin
 grad_student    | data_miner
 grad_student    | nerd
 grad_student    | quarky
 grad_student    | yola
 grad_student    | amelie
 grad_student    | penguin
 grad_student    | newton
 grad_student    | pepper
 grad_student    | jonny
 grad_student    | agate
 grad_student    | erwin
 grad_student    | mateo
 book_worm       | john_doe
 book_worm       | pinecone
 book_worm       | news_hound
 book_worm       | pumpkin
 book_worm       | data_miner
 book_worm       | nerd
 book_worm       | quarky
 book_worm       | yola
 book_worm       | amelie
 book_worm       | penguin
 book_worm       | newton
 book_worm       | pepper
 book_worm       | jonny
 book_worm       | agate
 book_worm       | erwin
 book_worm       | mateo
 stamp_collector | john_doe
 stamp_collector | pinecone
 stamp_collector | news_hound
 stamp_collector | pumpkin
 stamp_collector | data_miner
 stamp_collector | nerd
 stamp_collector | quarky
 stamp_collector | yola
 stamp_collector | amelie
 stamp_collector | penguin
 stamp_collector | newton
 stamp_collector | pepper
 stamp_collector | jonny
 stamp_collector | agate
 stamp_collector | erwin
 stamp_collector | mateo
 travel_guru     | john_doe
 travel_guru     | pinecone
 travel_guru     | news_hound
 travel_guru     | pumpkin
 travel_guru     | data_miner
 travel_guru     | nerd
 travel_guru     | quarky
 travel_guru     | yola
 travel_guru     | amelie
 travel_guru     | penguin
 travel_guru     | newton
 travel_guru     | pepper
 travel_guru     | jonny
 travel_guru     | agate
 travel_guru     | erwin
 travel_guru     | mateo
 chem_whiz       | john_doe
 chem_whiz       | pinecone
 chem_whiz       | news_hound
 chem_whiz       | pumpkin
 chem_whiz       | data_miner
 chem_whiz       | nerd
 chem_whiz       | quarky
 chem_whiz       | yola
 chem_whiz       | amelie
 chem_whiz       | penguin
 chem_whiz       | newton
 chem_whiz       | pepper
 chem_whiz       | jonny
 chem_whiz       | agate
 chem_whiz       | erwin
 chem_whiz       | mateo
(320 rows)

```

```
quote_sql_lab=# SELECT login, nick FROM user_account, author
quote_sql_lab-# WHERE user_account.id = author.user_id;
    login     |    nick
--------------+------------
 john_doe     | john_doe
 news_hound   | news_hound
 data_miner   | data_miner
 tech_blogger | nerd
 lab_rat      | penguin
 travel_guru  | erwin
(6 rows)

```
