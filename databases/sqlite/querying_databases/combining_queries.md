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

#### Set operations

##### `UNION`

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

##### `INTERSECT`

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

##### `EXCEPT`

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

#### Selecting from multiple tables

```sql
SELECT columns
FROM table_1, table_2, table_3
WHERE conditions
ORDER BY columns_with_orders;
```

```
sqlite> SELECT login, nick FROM user, author;
john_doe|john_doe
john_doe|pinecone
john_doe|news_hound
john_doe|pumpkin
john_doe|data_miner
john_doe|nerd
john_doe|quarky
john_doe|yola
john_doe|amelie
john_doe|penguin
john_doe|newton
john_doe|pepper
john_doe|jonny
john_doe|agate
john_doe|erwin
john_doe|mateo
science_gal|john_doe
science_gal|pinecone
science_gal|news_hound
science_gal|pumpkin
science_gal|data_miner
science_gal|nerd
science_gal|quarky
science_gal|yola
science_gal|amelie
science_gal|penguin
science_gal|newton
science_gal|pepper
science_gal|jonny
science_gal|agate
science_gal|erwin
science_gal|mateo
news_hound|john_doe
news_hound|pinecone
news_hound|news_hound
news_hound|pumpkin
news_hound|data_miner
news_hound|nerd
news_hound|quarky
news_hound|yola
news_hound|amelie
news_hound|penguin
news_hound|newton
news_hound|pepper
news_hound|jonny
news_hound|agate
news_hound|erwin
news_hound|mateo
study_buddy|john_doe
study_buddy|pinecone
study_buddy|news_hound
study_buddy|pumpkin
study_buddy|data_miner
study_buddy|nerd
study_buddy|quarky
study_buddy|yola
study_buddy|amelie
study_buddy|penguin
study_buddy|newton
study_buddy|pepper
study_buddy|jonny
study_buddy|agate
study_buddy|erwin
study_buddy|mateo
data_miner|john_doe
data_miner|pinecone
data_miner|news_hound
data_miner|pumpkin
data_miner|data_miner
data_miner|nerd
data_miner|quarky
data_miner|yola
data_miner|amelie
data_miner|penguin
data_miner|newton
data_miner|pepper
data_miner|jonny
data_miner|agate
data_miner|erwin
data_miner|mateo
craft_master|john_doe
craft_master|pinecone
craft_master|news_hound
craft_master|pumpkin
craft_master|data_miner
craft_master|nerd
craft_master|quarky
craft_master|yola
craft_master|amelie
craft_master|penguin
craft_master|newton
craft_master|pepper
craft_master|jonny
craft_master|agate
craft_master|erwin
craft_master|mateo
tech_blogger|john_doe
tech_blogger|pinecone
tech_blogger|news_hound
tech_blogger|pumpkin
tech_blogger|data_miner
tech_blogger|nerd
tech_blogger|quarky
tech_blogger|yola
tech_blogger|amelie
tech_blogger|penguin
tech_blogger|newton
tech_blogger|pepper
tech_blogger|jonny
tech_blogger|agate
tech_blogger|erwin
tech_blogger|mateo
quantum_guy|john_doe
quantum_guy|pinecone
quantum_guy|news_hound
quantum_guy|pumpkin
quantum_guy|data_miner
quantum_guy|nerd
quantum_guy|quarky
quantum_guy|yola
quantum_guy|amelie
quantum_guy|penguin
quantum_guy|newton
quantum_guy|pepper
quantum_guy|jonny
quantum_guy|agate
quantum_guy|erwin
quantum_guy|mateo
truth_seeker|john_doe
truth_seeker|pinecone
truth_seeker|news_hound
truth_seeker|pumpkin
truth_seeker|data_miner
truth_seeker|nerd
truth_seeker|quarky
truth_seeker|yola
truth_seeker|amelie
truth_seeker|penguin
truth_seeker|newton
truth_seeker|pepper
truth_seeker|jonny
truth_seeker|agate
truth_seeker|erwin
truth_seeker|mateo
college_kid|john_doe
college_kid|pinecone
college_kid|news_hound
college_kid|pumpkin
college_kid|data_miner
college_kid|nerd
college_kid|quarky
college_kid|yola
college_kid|amelie
college_kid|penguin
college_kid|newton
college_kid|pepper
college_kid|jonny
college_kid|agate
college_kid|erwin
college_kid|mateo
lab_rat|john_doe
lab_rat|pinecone
lab_rat|news_hound
lab_rat|pumpkin
lab_rat|data_miner
lab_rat|nerd
lab_rat|quarky
lab_rat|yola
lab_rat|amelie
lab_rat|penguin
lab_rat|newton
lab_rat|pepper
lab_rat|jonny
lab_rat|agate
lab_rat|erwin
lab_rat|mateo
diy_enthusiast|john_doe
diy_enthusiast|pinecone
diy_enthusiast|news_hound
diy_enthusiast|pumpkin
diy_enthusiast|data_miner
diy_enthusiast|nerd
diy_enthusiast|quarky
diy_enthusiast|yola
diy_enthusiast|amelie
diy_enthusiast|penguin
diy_enthusiast|newton
diy_enthusiast|pepper
diy_enthusiast|jonny
diy_enthusiast|agate
diy_enthusiast|erwin
diy_enthusiast|mateo
food_critic|john_doe
food_critic|pinecone
food_critic|news_hound
food_critic|pumpkin
food_critic|data_miner
food_critic|nerd
food_critic|quarky
food_critic|yola
food_critic|amelie
food_critic|penguin
food_critic|newton
food_critic|pepper
food_critic|jonny
food_critic|agate
food_critic|erwin
food_critic|mateo
rocket_woman|john_doe
rocket_woman|pinecone
rocket_woman|news_hound
rocket_woman|pumpkin
rocket_woman|data_miner
rocket_woman|nerd
rocket_woman|quarky
rocket_woman|yola
rocket_woman|amelie
rocket_woman|penguin
rocket_woman|newton
rocket_woman|pepper
rocket_woman|jonny
rocket_woman|agate
rocket_woman|erwin
rocket_woman|mateo
roving_reporter|john_doe
roving_reporter|pinecone
roving_reporter|news_hound
roving_reporter|pumpkin
roving_reporter|data_miner
roving_reporter|nerd
roving_reporter|quarky
roving_reporter|yola
roving_reporter|amelie
roving_reporter|penguin
roving_reporter|newton
roving_reporter|pepper
roving_reporter|jonny
roving_reporter|agate
roving_reporter|erwin
roving_reporter|mateo
grad_student|john_doe
grad_student|pinecone
grad_student|news_hound
grad_student|pumpkin
grad_student|data_miner
grad_student|nerd
grad_student|quarky
grad_student|yola
grad_student|amelie
grad_student|penguin
grad_student|newton
grad_student|pepper
grad_student|jonny
grad_student|agate
grad_student|erwin
grad_student|mateo
book_worm|john_doe
book_worm|pinecone
book_worm|news_hound
book_worm|pumpkin
book_worm|data_miner
book_worm|nerd
book_worm|quarky
book_worm|yola
book_worm|amelie
book_worm|penguin
book_worm|newton
book_worm|pepper
book_worm|jonny
book_worm|agate
book_worm|erwin
book_worm|mateo
stamp_collector|john_doe
stamp_collector|pinecone
stamp_collector|news_hound
stamp_collector|pumpkin
stamp_collector|data_miner
stamp_collector|nerd
stamp_collector|quarky
stamp_collector|yola
stamp_collector|amelie
stamp_collector|penguin
stamp_collector|newton
stamp_collector|pepper
stamp_collector|jonny
stamp_collector|agate
stamp_collector|erwin
stamp_collector|mateo
travel_guru|john_doe
travel_guru|pinecone
travel_guru|news_hound
travel_guru|pumpkin
travel_guru|data_miner
travel_guru|nerd
travel_guru|quarky
travel_guru|yola
travel_guru|amelie
travel_guru|penguin
travel_guru|newton
travel_guru|pepper
travel_guru|jonny
travel_guru|agate
travel_guru|erwin
travel_guru|mateo
chem_whiz|john_doe
chem_whiz|pinecone
chem_whiz|news_hound
chem_whiz|pumpkin
chem_whiz|data_miner
chem_whiz|nerd
chem_whiz|quarky
chem_whiz|yola
chem_whiz|amelie
chem_whiz|penguin
chem_whiz|newton
chem_whiz|pepper
chem_whiz|jonny
chem_whiz|agate
chem_whiz|erwin
chem_whiz|mateo
```

```
sqlite> SELECT login, nick FROM user, author
   ...> WHERE user.id = author.user_id;
john_doe|john_doe
news_hound|news_hound
data_miner|data_miner
tech_blogger|nerd
lab_rat|penguin
travel_guru|erwin
```

#### Joins

##### `CROSS JOIN`

```sql
SELECT columns
FROM table_1 CROSS JOIN table_2
ORDER BY columns_with_orders;
```

```
sqlite> SELECT
   ...>     user.id as user_id,
   ...>     author.id as author_id,
   ...>     author.user_id as author_user_id,
   ...>     login as user_login,
   ...>     nick as author_nick,
   ...>     user.group_name as user_group_name,
   ...>     author.group_name as author_group_name,
   ...>     user.credits as user_credits,
   ...>     author.credits as author_credits
   ...> FROM user CROSS JOIN author
   ...> ORDER BY user.id, author.id;
1|1|1|john_doe|john_doe|bloggers|bloggers|100|20
1|2||john_doe|pinecone|bloggers|bloggers|100|5
1|3|3|john_doe|news_hound|bloggers|journalists|100|15
1|4||john_doe|pumpkin|bloggers|entrant|100|5
1|5|5|john_doe|data_miner|bloggers|academics|100|15
1|6|7|john_doe|nerd|bloggers|bloggers|100|10
1|7||john_doe|quarky|bloggers|academics|100|30
1|8||john_doe|yola|bloggers|entrant|100|0
1|9||john_doe|amelie|bloggers|entrant|100|0
1|10|11|john_doe|penguin|bloggers|academics|100|20
1|11||john_doe|newton|bloggers|entrant|100|0
1|12||john_doe|pepper|bloggers|journalists|100|50
1|13||john_doe|jonny|bloggers|writer|100|40
1|14||john_doe|agate|bloggers|writer|100|25
1|15|19|john_doe|erwin|bloggers|writer|100|10
1|16||john_doe|mateo|bloggers|blogger|100|0
2|1|1|science_gal|john_doe|scientists|bloggers|250|20
2|2||science_gal|pinecone|scientists|bloggers|250|5
2|3|3|science_gal|news_hound|scientists|journalists|250|15
2|4||science_gal|pumpkin|scientists|entrant|250|5
2|5|5|science_gal|data_miner|scientists|academics|250|15
2|6|7|science_gal|nerd|scientists|bloggers|250|10
2|7||science_gal|quarky|scientists|academics|250|30
2|8||science_gal|yola|scientists|entrant|250|0
2|9||science_gal|amelie|scientists|entrant|250|0
2|10|11|science_gal|penguin|scientists|academics|250|20
2|11||science_gal|newton|scientists|entrant|250|0
2|12||science_gal|pepper|scientists|journalists|250|50
2|13||science_gal|jonny|scientists|writer|250|40
2|14||science_gal|agate|scientists|writer|250|25
2|15|19|science_gal|erwin|scientists|writer|250|10
2|16||science_gal|mateo|scientists|blogger|250|0
3|1|1|news_hound|john_doe|journalists|bloggers|150|20
3|2||news_hound|pinecone|journalists|bloggers|150|5
3|3|3|news_hound|news_hound|journalists|journalists|150|15
3|4||news_hound|pumpkin|journalists|entrant|150|5
3|5|5|news_hound|data_miner|journalists|academics|150|15
3|6|7|news_hound|nerd|journalists|bloggers|150|10
3|7||news_hound|quarky|journalists|academics|150|30
3|8||news_hound|yola|journalists|entrant|150|0
3|9||news_hound|amelie|journalists|entrant|150|0
3|10|11|news_hound|penguin|journalists|academics|150|20
3|11||news_hound|newton|journalists|entrant|150|0
3|12||news_hound|pepper|journalists|journalists|150|50
3|13||news_hound|jonny|journalists|writer|150|40
3|14||news_hound|agate|journalists|writer|150|25
3|15|19|news_hound|erwin|journalists|writer|150|10
3|16||news_hound|mateo|journalists|blogger|150|0
4|1|1|study_buddy|john_doe|students|bloggers|50|20
4|2||study_buddy|pinecone|students|bloggers|50|5
4|3|3|study_buddy|news_hound|students|journalists|50|15
4|4||study_buddy|pumpkin|students|entrant|50|5
4|5|5|study_buddy|data_miner|students|academics|50|15
4|6|7|study_buddy|nerd|students|bloggers|50|10
4|7||study_buddy|quarky|students|academics|50|30
4|8||study_buddy|yola|students|entrant|50|0
4|9||study_buddy|amelie|students|entrant|50|0
4|10|11|study_buddy|penguin|students|academics|50|20
4|11||study_buddy|newton|students|entrant|50|0
4|12||study_buddy|pepper|students|journalists|50|50
4|13||study_buddy|jonny|students|writer|50|40
4|14||study_buddy|agate|students|writer|50|25
4|15|19|study_buddy|erwin|students|writer|50|10
4|16||study_buddy|mateo|students|blogger|50|0
5|1|1|data_miner|john_doe|researchers|bloggers|200|20
5|2||data_miner|pinecone|researchers|bloggers|200|5
5|3|3|data_miner|news_hound|researchers|journalists|200|15
5|4||data_miner|pumpkin|researchers|entrant|200|5
5|5|5|data_miner|data_miner|researchers|academics|200|15
5|6|7|data_miner|nerd|researchers|bloggers|200|10
5|7||data_miner|quarky|researchers|academics|200|30
5|8||data_miner|yola|researchers|entrant|200|0
5|9||data_miner|amelie|researchers|entrant|200|0
5|10|11|data_miner|penguin|researchers|academics|200|20
5|11||data_miner|newton|researchers|entrant|200|0
5|12||data_miner|pepper|researchers|journalists|200|50
5|13||data_miner|jonny|researchers|writer|200|40
5|14||data_miner|agate|researchers|writer|200|25
5|15|19|data_miner|erwin|researchers|writer|200|10
5|16||data_miner|mateo|researchers|blogger|200|0
6|1|1|craft_master|john_doe|hobbyists|bloggers|75|20
6|2||craft_master|pinecone|hobbyists|bloggers|75|5
6|3|3|craft_master|news_hound|hobbyists|journalists|75|15
6|4||craft_master|pumpkin|hobbyists|entrant|75|5
6|5|5|craft_master|data_miner|hobbyists|academics|75|15
6|6|7|craft_master|nerd|hobbyists|bloggers|75|10
6|7||craft_master|quarky|hobbyists|academics|75|30
6|8||craft_master|yola|hobbyists|entrant|75|0
6|9||craft_master|amelie|hobbyists|entrant|75|0
6|10|11|craft_master|penguin|hobbyists|academics|75|20
6|11||craft_master|newton|hobbyists|entrant|75|0
6|12||craft_master|pepper|hobbyists|journalists|75|50
6|13||craft_master|jonny|hobbyists|writer|75|40
6|14||craft_master|agate|hobbyists|writer|75|25
6|15|19|craft_master|erwin|hobbyists|writer|75|10
6|16||craft_master|mateo|hobbyists|blogger|75|0
7|1|1|tech_blogger|john_doe|bloggers|bloggers|120|20
7|2||tech_blogger|pinecone|bloggers|bloggers|120|5
7|3|3|tech_blogger|news_hound|bloggers|journalists|120|15
7|4||tech_blogger|pumpkin|bloggers|entrant|120|5
7|5|5|tech_blogger|data_miner|bloggers|academics|120|15
7|6|7|tech_blogger|nerd|bloggers|bloggers|120|10
7|7||tech_blogger|quarky|bloggers|academics|120|30
7|8||tech_blogger|yola|bloggers|entrant|120|0
7|9||tech_blogger|amelie|bloggers|entrant|120|0
7|10|11|tech_blogger|penguin|bloggers|academics|120|20
7|11||tech_blogger|newton|bloggers|entrant|120|0
7|12||tech_blogger|pepper|bloggers|journalists|120|50
7|13||tech_blogger|jonny|bloggers|writer|120|40
7|14||tech_blogger|agate|bloggers|writer|120|25
7|15|19|tech_blogger|erwin|bloggers|writer|120|10
7|16||tech_blogger|mateo|bloggers|blogger|120|0
8|1|1|quantum_guy|john_doe|scientists|bloggers|300|20
8|2||quantum_guy|pinecone|scientists|bloggers|300|5
8|3|3|quantum_guy|news_hound|scientists|journalists|300|15
8|4||quantum_guy|pumpkin|scientists|entrant|300|5
8|5|5|quantum_guy|data_miner|scientists|academics|300|15
8|6|7|quantum_guy|nerd|scientists|bloggers|300|10
8|7||quantum_guy|quarky|scientists|academics|300|30
8|8||quantum_guy|yola|scientists|entrant|300|0
8|9||quantum_guy|amelie|scientists|entrant|300|0
8|10|11|quantum_guy|penguin|scientists|academics|300|20
8|11||quantum_guy|newton|scientists|entrant|300|0
8|12||quantum_guy|pepper|scientists|journalists|300|50
8|13||quantum_guy|jonny|scientists|writer|300|40
8|14||quantum_guy|agate|scientists|writer|300|25
8|15|19|quantum_guy|erwin|scientists|writer|300|10
8|16||quantum_guy|mateo|scientists|blogger|300|0
9|1|1|truth_seeker|john_doe|journalists|bloggers|180|20
9|2||truth_seeker|pinecone|journalists|bloggers|180|5
9|3|3|truth_seeker|news_hound|journalists|journalists|180|15
9|4||truth_seeker|pumpkin|journalists|entrant|180|5
9|5|5|truth_seeker|data_miner|journalists|academics|180|15
9|6|7|truth_seeker|nerd|journalists|bloggers|180|10
9|7||truth_seeker|quarky|journalists|academics|180|30
9|8||truth_seeker|yola|journalists|entrant|180|0
9|9||truth_seeker|amelie|journalists|entrant|180|0
9|10|11|truth_seeker|penguin|journalists|academics|180|20
9|11||truth_seeker|newton|journalists|entrant|180|0
9|12||truth_seeker|pepper|journalists|journalists|180|50
9|13||truth_seeker|jonny|journalists|writer|180|40
9|14||truth_seeker|agate|journalists|writer|180|25
9|15|19|truth_seeker|erwin|journalists|writer|180|10
9|16||truth_seeker|mateo|journalists|blogger|180|0
10|1|1|college_kid|john_doe|students|bloggers|30|20
10|2||college_kid|pinecone|students|bloggers|30|5
10|3|3|college_kid|news_hound|students|journalists|30|15
10|4||college_kid|pumpkin|students|entrant|30|5
10|5|5|college_kid|data_miner|students|academics|30|15
10|6|7|college_kid|nerd|students|bloggers|30|10
10|7||college_kid|quarky|students|academics|30|30
10|8||college_kid|yola|students|entrant|30|0
10|9||college_kid|amelie|students|entrant|30|0
10|10|11|college_kid|penguin|students|academics|30|20
10|11||college_kid|newton|students|entrant|30|0
10|12||college_kid|pepper|students|journalists|30|50
10|13||college_kid|jonny|students|writer|30|40
10|14||college_kid|agate|students|writer|30|25
10|15|19|college_kid|erwin|students|writer|30|10
10|16||college_kid|mateo|students|blogger|30|0
11|1|1|lab_rat|john_doe|researchers|bloggers|220|20
11|2||lab_rat|pinecone|researchers|bloggers|220|5
11|3|3|lab_rat|news_hound|researchers|journalists|220|15
11|4||lab_rat|pumpkin|researchers|entrant|220|5
11|5|5|lab_rat|data_miner|researchers|academics|220|15
11|6|7|lab_rat|nerd|researchers|bloggers|220|10
11|7||lab_rat|quarky|researchers|academics|220|30
11|8||lab_rat|yola|researchers|entrant|220|0
11|9||lab_rat|amelie|researchers|entrant|220|0
11|10|11|lab_rat|penguin|researchers|academics|220|20
11|11||lab_rat|newton|researchers|entrant|220|0
11|12||lab_rat|pepper|researchers|journalists|220|50
11|13||lab_rat|jonny|researchers|writer|220|40
11|14||lab_rat|agate|researchers|writer|220|25
11|15|19|lab_rat|erwin|researchers|writer|220|10
11|16||lab_rat|mateo|researchers|blogger|220|0
12|1|1|diy_enthusiast|john_doe|hobbyists|bloggers|90|20
12|2||diy_enthusiast|pinecone|hobbyists|bloggers|90|5
12|3|3|diy_enthusiast|news_hound|hobbyists|journalists|90|15
12|4||diy_enthusiast|pumpkin|hobbyists|entrant|90|5
12|5|5|diy_enthusiast|data_miner|hobbyists|academics|90|15
12|6|7|diy_enthusiast|nerd|hobbyists|bloggers|90|10
12|7||diy_enthusiast|quarky|hobbyists|academics|90|30
12|8||diy_enthusiast|yola|hobbyists|entrant|90|0
12|9||diy_enthusiast|amelie|hobbyists|entrant|90|0
12|10|11|diy_enthusiast|penguin|hobbyists|academics|90|20
12|11||diy_enthusiast|newton|hobbyists|entrant|90|0
12|12||diy_enthusiast|pepper|hobbyists|journalists|90|50
12|13||diy_enthusiast|jonny|hobbyists|writer|90|40
12|14||diy_enthusiast|agate|hobbyists|writer|90|25
12|15|19|diy_enthusiast|erwin|hobbyists|writer|90|10
12|16||diy_enthusiast|mateo|hobbyists|blogger|90|0
13|1|1|food_critic|john_doe|bloggers|bloggers|80|20
13|2||food_critic|pinecone|bloggers|bloggers|80|5
13|3|3|food_critic|news_hound|bloggers|journalists|80|15
13|4||food_critic|pumpkin|bloggers|entrant|80|5
13|5|5|food_critic|data_miner|bloggers|academics|80|15
13|6|7|food_critic|nerd|bloggers|bloggers|80|10
13|7||food_critic|quarky|bloggers|academics|80|30
13|8||food_critic|yola|bloggers|entrant|80|0
13|9||food_critic|amelie|bloggers|entrant|80|0
13|10|11|food_critic|penguin|bloggers|academics|80|20
13|11||food_critic|newton|bloggers|entrant|80|0
13|12||food_critic|pepper|bloggers|journalists|80|50
13|13||food_critic|jonny|bloggers|writer|80|40
13|14||food_critic|agate|bloggers|writer|80|25
13|15|19|food_critic|erwin|bloggers|writer|80|10
13|16||food_critic|mateo|bloggers|blogger|80|0
14|1|1|rocket_woman|john_doe|scientists|bloggers|280|20
14|2||rocket_woman|pinecone|scientists|bloggers|280|5
14|3|3|rocket_woman|news_hound|scientists|journalists|280|15
14|4||rocket_woman|pumpkin|scientists|entrant|280|5
14|5|5|rocket_woman|data_miner|scientists|academics|280|15
14|6|7|rocket_woman|nerd|scientists|bloggers|280|10
14|7||rocket_woman|quarky|scientists|academics|280|30
14|8||rocket_woman|yola|scientists|entrant|280|0
14|9||rocket_woman|amelie|scientists|entrant|280|0
14|10|11|rocket_woman|penguin|scientists|academics|280|20
14|11||rocket_woman|newton|scientists|entrant|280|0
14|12||rocket_woman|pepper|scientists|journalists|280|50
14|13||rocket_woman|jonny|scientists|writer|280|40
14|14||rocket_woman|agate|scientists|writer|280|25
14|15|19|rocket_woman|erwin|scientists|writer|280|10
14|16||rocket_woman|mateo|scientists|blogger|280|0
15|1|1|roving_reporter|john_doe|journalists|bloggers|160|20
15|2||roving_reporter|pinecone|journalists|bloggers|160|5
15|3|3|roving_reporter|news_hound|journalists|journalists|160|15
15|4||roving_reporter|pumpkin|journalists|entrant|160|5
15|5|5|roving_reporter|data_miner|journalists|academics|160|15
15|6|7|roving_reporter|nerd|journalists|bloggers|160|10
15|7||roving_reporter|quarky|journalists|academics|160|30
15|8||roving_reporter|yola|journalists|entrant|160|0
15|9||roving_reporter|amelie|journalists|entrant|160|0
15|10|11|roving_reporter|penguin|journalists|academics|160|20
15|11||roving_reporter|newton|journalists|entrant|160|0
15|12||roving_reporter|pepper|journalists|journalists|160|50
15|13||roving_reporter|jonny|journalists|writer|160|40
15|14||roving_reporter|agate|journalists|writer|160|25
15|15|19|roving_reporter|erwin|journalists|writer|160|10
15|16||roving_reporter|mateo|journalists|blogger|160|0
16|1|1|grad_student|john_doe|students|bloggers|40|20
16|2||grad_student|pinecone|students|bloggers|40|5
16|3|3|grad_student|news_hound|students|journalists|40|15
16|4||grad_student|pumpkin|students|entrant|40|5
16|5|5|grad_student|data_miner|students|academics|40|15
16|6|7|grad_student|nerd|students|bloggers|40|10
16|7||grad_student|quarky|students|academics|40|30
16|8||grad_student|yola|students|entrant|40|0
16|9||grad_student|amelie|students|entrant|40|0
16|10|11|grad_student|penguin|students|academics|40|20
16|11||grad_student|newton|students|entrant|40|0
16|12||grad_student|pepper|students|journalists|40|50
16|13||grad_student|jonny|students|writer|40|40
16|14||grad_student|agate|students|writer|40|25
16|15|19|grad_student|erwin|students|writer|40|10
16|16||grad_student|mateo|students|blogger|40|0
17|1|1|book_worm|john_doe|researchers|bloggers|240|20
17|2||book_worm|pinecone|researchers|bloggers|240|5
17|3|3|book_worm|news_hound|researchers|journalists|240|15
17|4||book_worm|pumpkin|researchers|entrant|240|5
17|5|5|book_worm|data_miner|researchers|academics|240|15
17|6|7|book_worm|nerd|researchers|bloggers|240|10
17|7||book_worm|quarky|researchers|academics|240|30
17|8||book_worm|yola|researchers|entrant|240|0
17|9||book_worm|amelie|researchers|entrant|240|0
17|10|11|book_worm|penguin|researchers|academics|240|20
17|11||book_worm|newton|researchers|entrant|240|0
17|12||book_worm|pepper|researchers|journalists|240|50
17|13||book_worm|jonny|researchers|writer|240|40
17|14||book_worm|agate|researchers|writer|240|25
17|15|19|book_worm|erwin|researchers|writer|240|10
17|16||book_worm|mateo|researchers|blogger|240|0
18|1|1|stamp_collector|john_doe|hobbyists|bloggers|60|20
18|2||stamp_collector|pinecone|hobbyists|bloggers|60|5
18|3|3|stamp_collector|news_hound|hobbyists|journalists|60|15
18|4||stamp_collector|pumpkin|hobbyists|entrant|60|5
18|5|5|stamp_collector|data_miner|hobbyists|academics|60|15
18|6|7|stamp_collector|nerd|hobbyists|bloggers|60|10
18|7||stamp_collector|quarky|hobbyists|academics|60|30
18|8||stamp_collector|yola|hobbyists|entrant|60|0
18|9||stamp_collector|amelie|hobbyists|entrant|60|0
18|10|11|stamp_collector|penguin|hobbyists|academics|60|20
18|11||stamp_collector|newton|hobbyists|entrant|60|0
18|12||stamp_collector|pepper|hobbyists|journalists|60|50
18|13||stamp_collector|jonny|hobbyists|writer|60|40
18|14||stamp_collector|agate|hobbyists|writer|60|25
18|15|19|stamp_collector|erwin|hobbyists|writer|60|10
18|16||stamp_collector|mateo|hobbyists|blogger|60|0
19|1|1|travel_guru|john_doe|bloggers|bloggers|110|20
19|2||travel_guru|pinecone|bloggers|bloggers|110|5
19|3|3|travel_guru|news_hound|bloggers|journalists|110|15
19|4||travel_guru|pumpkin|bloggers|entrant|110|5
19|5|5|travel_guru|data_miner|bloggers|academics|110|15
19|6|7|travel_guru|nerd|bloggers|bloggers|110|10
19|7||travel_guru|quarky|bloggers|academics|110|30
19|8||travel_guru|yola|bloggers|entrant|110|0
19|9||travel_guru|amelie|bloggers|entrant|110|0
19|10|11|travel_guru|penguin|bloggers|academics|110|20
19|11||travel_guru|newton|bloggers|entrant|110|0
19|12||travel_guru|pepper|bloggers|journalists|110|50
19|13||travel_guru|jonny|bloggers|writer|110|40
19|14||travel_guru|agate|bloggers|writer|110|25
19|15|19|travel_guru|erwin|bloggers|writer|110|10
19|16||travel_guru|mateo|bloggers|blogger|110|0
20|1|1|chem_whiz|john_doe|scientists|bloggers|270|20
20|2||chem_whiz|pinecone|scientists|bloggers|270|5
20|3|3|chem_whiz|news_hound|scientists|journalists|270|15
20|4||chem_whiz|pumpkin|scientists|entrant|270|5
20|5|5|chem_whiz|data_miner|scientists|academics|270|15
20|6|7|chem_whiz|nerd|scientists|bloggers|270|10
20|7||chem_whiz|quarky|scientists|academics|270|30
20|8||chem_whiz|yola|scientists|entrant|270|0
20|9||chem_whiz|amelie|scientists|entrant|270|0
20|10|11|chem_whiz|penguin|scientists|academics|270|20
20|11||chem_whiz|newton|scientists|entrant|270|0
20|12||chem_whiz|pepper|scientists|journalists|270|50
20|13||chem_whiz|jonny|scientists|writer|270|40
20|14||chem_whiz|agate|scientists|writer|270|25
20|15|19|chem_whiz|erwin|scientists|writer|270|10
20|16||chem_whiz|mateo|scientists|blogger|270|0
```

##### `INNER JOIN`

```sql
SELECT columns
FROM table_1 INNER JOIN table_2
ON condition
ORDER BY columns_with_orders;
```

```
sqlite> SELECT
   ...>     user.id as user_id,
   ...>     author.id as author_id,
   ...>     author.user_id as author_user_id,
   ...>     login as user_login,
   ...>     nick as author_nick,
   ...>     user.group_name as user_group_name,
   ...>     author.group_name as author_group_name,
   ...>     user.credits as user_credits,
   ...>     author.credits as author_credits
   ...> FROM user INNER JOIN author
   ...> ON user.id = author.user_id
   ...> ORDER BY user.id, author.id;
1|1|1|john_doe|john_doe|bloggers|bloggers|100|20
3|3|3|news_hound|news_hound|journalists|journalists|150|15
5|5|5|data_miner|data_miner|researchers|academics|200|15
7|6|7|tech_blogger|nerd|bloggers|bloggers|120|10
11|10|11|lab_rat|penguin|researchers|academics|220|20
19|15|19|travel_guru|erwin|bloggers|writer|110|10

```

##### `LEFT JOIN` / `LEFT OUTER JOIN`

```sql
SELECT columns
FROM table_1 LEFT JOIN table_2
ON condition
ORDER BY columns_with_orders;
```

```
sqlite> SELECT
   ...>     user.id as user_id,
   ...>     author.id as author_id,
   ...>     author.user_id as author_user_id,
   ...>     login as user_login,
   ...>     nick as author_nick,
   ...>     user.group_name as user_group_name,
   ...>     author.group_name as author_group_name,
   ...>     user.credits as user_credits,
   ...>     author.credits as author_credits
   ...> FROM user LEFT JOIN author
   ...> ON user.id = author.user_id
   ...> ORDER BY user.id, author.id;
1|1|1|john_doe|john_doe|bloggers|bloggers|100|20
2|||science_gal||scientists||250|
3|3|3|news_hound|news_hound|journalists|journalists|150|15
4|||study_buddy||students||50|
5|5|5|data_miner|data_miner|researchers|academics|200|15
6|||craft_master||hobbyists||75|
7|6|7|tech_blogger|nerd|bloggers|bloggers|120|10
8|||quantum_guy||scientists||300|
9|||truth_seeker||journalists||180|
10|||college_kid||students||30|
11|10|11|lab_rat|penguin|researchers|academics|220|20
12|||diy_enthusiast||hobbyists||90|
13|||food_critic||bloggers||80|
14|||rocket_woman||scientists||280|
15|||roving_reporter||journalists||160|
16|||grad_student||students||40|
17|||book_worm||researchers||240|
18|||stamp_collector||hobbyists||60|
19|15|19|travel_guru|erwin|bloggers|writer|110|10
20|||chem_whiz||scientists||270|
```

```sql
SELECT columns
FROM table_1 LEFT OUTER JOIN table_2
ON condition
ORDER BY columns_with_orders;
```

```
sqlite> SELECT
   ...>     user.id as user_id,
   ...>     author.id as author_id,
   ...>     author.user_id as author_user_id,
   ...>     login as user_login,
   ...>     nick as author_nick,
   ...>     user.group_name as user_group_name,
   ...>     author.group_name as author_group_name,
   ...>     user.credits as user_credits,
   ...>     author.credits as author_credits
   ...> FROM user LEFT OUTER JOIN author
   ...> ON user.id = author.user_id
   ...> ORDER BY user.id, author.id;
1|1|1|john_doe|john_doe|bloggers|bloggers|100|20
2|||science_gal||scientists||250|
3|3|3|news_hound|news_hound|journalists|journalists|150|15
4|||study_buddy||students||50|
5|5|5|data_miner|data_miner|researchers|academics|200|15
6|||craft_master||hobbyists||75|
7|6|7|tech_blogger|nerd|bloggers|bloggers|120|10
8|||quantum_guy||scientists||300|
9|||truth_seeker||journalists||180|
10|||college_kid||students||30|
11|10|11|lab_rat|penguin|researchers|academics|220|20
12|||diy_enthusiast||hobbyists||90|
13|||food_critic||bloggers||80|
14|||rocket_woman||scientists||280|
15|||roving_reporter||journalists||160|
16|||grad_student||students||40|
17|||book_worm||researchers||240|
18|||stamp_collector||hobbyists||60|
19|15|19|travel_guru|erwin|bloggers|writer|110|10
20|||chem_whiz||scientists||270|
```

##### `RIGHT JOIN` / `RIGHT OUTER JOIN`

**RIGHT (OUTER) JOIN** is not supported by SQLite.

##### `FULL JOIN` / `FULL OUTER JOIN`

**FULL (OUTER) JOIN** is not supported by SQLite.
