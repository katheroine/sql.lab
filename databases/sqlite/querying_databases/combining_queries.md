[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Aggregations](aggregations.md)

### Combining queries

### `UNION`

```sql
CREATE TABLE user
(
    id INTEGER PRIMARY KEY,
    login VARCHAR(128) NOT NULL UNIQUE,
    group_name VARCHAR(128),
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author
(
    id INTEGER PRIMARY KEY,
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

INSERT INTO author (user_id, nick, group_name, credits) VALUES (1, 'john_doe', 'bloggers', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (1, 'john_doe', 'bloggers', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pinecone', 'bloggers', 5);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (3, 'news_hound', 'journalists', 15);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pumpkin', 'entrant', 5);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (5, 'data_miner', 'academics', 15);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (7, 'nerd', 'bloggers', 10);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'quarky', 'academics', 30);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'yola', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'amelie', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (11, 'penguin', 'academics', 20);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'newton', 'entrant', 0);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'pepper', 'journalists', 50);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'jonny', 'writer', 40);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'agate', 'writer', 25);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (19, 'erwin', 'writer', 10);
INSERT INTO author (user_id, nick, group_name, credits) VALUES (NULL, 'mateo', 'blogger', 0);
```

#### `UNION`

```sql
query_1 UNION query_2 UNION query_3;
```

```
sqlite> SELECT login AS "nick", group_name FROM user
   ...> UNION
   ...> SELECT nick, group_name FROM author WHERE user_id IS NULL;
yola|entrant
agate|writer
jonny|writer
mateo|blogger
amelie|entrant
newton|entrant
quarky|academics
pepper|journalists
pumpkin|entrant
lab_rat|researchers
john_doe|bloggers
pinecone|bloggers
chem_whiz|scientists
book_worm|researchers
data_miner|researchers
news_hound|journalists
college_kid|students
food_critic|bloggers
study_buddy|students
travel_guru|bloggers
quantum_guy|scientists
science_gal|scientists
grad_student|students
tech_blogger|bloggers
craft_master|hobbyists
rocket_woman|scientists
truth_seeker|journalists
diy_enthusiast|hobbyists
stamp_collector|hobbyists
roving_reporter|journalists
```

**Data duplicates**

* Without duplicates - `UNION`

```sql
query_1 UNION query_2 UNION query_3;
```

```
sqlite> SELECT id, login AS "nick", group_name FROM user
   ...> UNION
   ...> SELECT user_id AS "id", nick, group_name FROM author;
|yola|entrant
|agate|writer
|jonny|writer
|mateo|blogger
|amelie|entrant
|newton|entrant
|quarky|academics
|pepper|journalists
|pumpkin|entrant
|pinecone|bloggers
7|nerd|bloggers
1|john_doe|bloggers
5|data_miner|academics
3|news_hound|journalists
5|data_miner|researchers
4|study_buddy|students
2|science_gal|scientists
8|quantum_guy|scientists
7|tech_blogger|bloggers
6|craft_master|hobbyists
9|truth_seeker|journalists
19|erwin|writer
11|penguin|academics
11|lab_rat|researchers
20|chem_whiz|scientists
17|book_worm|researchers
10|college_kid|students
13|food_critic|bloggers
19|travel_guru|bloggers
16|grad_student|students
14|rocket_woman|scientists
12|diy_enthusiast|hobbyists
18|stamp_collector|hobbyists
15|roving_reporter|journalists
```

* With duplicates - `UNION ALL`

```sql
query_1 UNION query_2 UNION ALL query_3;
```

```
sqlite> SELECT id, login AS "nick", group_name FROM user
   ...> UNION ALL
   ...> SELECT user_id AS "id", nick, group_name FROM author;
1|john_doe|bloggers
2|science_gal|scientists
3|news_hound|journalists
4|study_buddy|students
5|data_miner|researchers
6|craft_master|hobbyists
7|tech_blogger|bloggers
8|quantum_guy|scientists
9|truth_seeker|journalists
10|college_kid|students
11|lab_rat|researchers
12|diy_enthusiast|hobbyists
13|food_critic|bloggers
14|rocket_woman|scientists
15|roving_reporter|journalists
16|grad_student|students
17|book_worm|researchers
18|stamp_collector|hobbyists
19|travel_guru|bloggers
20|chem_whiz|scientists
1|john_doe|bloggers
|pinecone|bloggers
3|news_hound|journalists
|pumpkin|entrant
5|data_miner|academics
7|nerd|bloggers
|quarky|academics
|yola|entrant
|amelie|entrant
11|penguin|academics
|newton|entrant
|pepper|journalists
|jonny|writer
|agate|writer
19|erwin|writer
|mateo|blogger
```

#### `INTERSECT`

```sql
query_1 INTERSECT query_2;
```

```
sqlite> SELECT id, login AS "nick", group_name FROM user
   ...> INTERSECT
   ...> SELECT user_id AS "id", nick, group_name FROM author;
1|john_doe|bloggers
3|news_hound|journalists
```

#### `EXCEPT`

```sql
query_1 EXCEPT query_2;
```

```
sqlite> SELECT id, login AS "nick", group_name FROM user
   ...> EXCEPT
   ...> SELECT user_id AS "id", nick, group_name FROM author;
5|data_miner|researchers
4|study_buddy|students
2|science_gal|scientists
8|quantum_guy|scientists
7|tech_blogger|bloggers
6|craft_master|hobbyists
9|truth_seeker|journalists
11|lab_rat|researchers
20|chem_whiz|scientists
17|book_worm|researchers
10|college_kid|students
13|food_critic|bloggers
19|travel_guru|bloggers
16|grad_student|students
14|rocket_woman|scientists
12|diy_enthusiast|hobbyists
18|stamp_collector|hobbyists
15|roving_reporter|journalists
```

```
sqlite> SELECT user_id AS "id", nick, group_name FROM author
   ...> EXCEPT
   ...> SELECT id, login AS "nick", group_name FROM user;
|yola|entrant
|agate|writer
|jonny|writer
|mateo|blogger
|amelie|entrant
|newton|entrant
|quarky|academics
|pepper|journalists
|pumpkin|entrant
|pinecone|bloggers
7|nerd|bloggers
5|data_miner|academics
19|erwin|writer
11|penguin|academics
```
