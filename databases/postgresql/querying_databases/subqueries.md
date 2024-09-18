[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▲ Previous: Combining queries](combining_queries.md)

### Subqueries

**Database preparation**

```sql
CREATE TABLE author
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    group_id INTEGER,
    nick VARCHAR(128) UNIQUE,
    credits INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE author_group
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128)
);

INSERT INTO author_group VALUES
    (1, 'bloggers'),
    (2, 'journalists'),
    (3, 'writers'),
    (4, 'academics'),
    (5, 'entrants');

INSERT INTO author (user_id, group_id, nick, credits) VALUES
    (1, 1, 'john_doe', 20),
    (NULL, 1, 'pinecone', 5),
    (3, 2, 'news_hound', 15),
    (NULL, 5, 'pumpkin', 5),
    (5, 4, 'data_miner', 15),
    (7, 1, 'nerd', 10),
    (NULL, 4, 'quarky', 30),
    (NULL, 5, 'yola', 0),
    (NULL, 5, 'amelie', 0),
    (11, 4, 'penguin', 20),
    (NULL, 5, 'newton', 0),
    (NULL, 2, 'pepper', 50),
    (NULL, 3, 'jonny', 40),
    (NULL, 3, 'agate', 25),
    (19, 3, 'erwin', 10),
    (NULL, 1, 'mateo', 0);
```

#### Subqueries in `FROM` clause

```sql
SELECT outer_columns FROM (
    SELECT inner_columns FROM TABLE inner_table_name
    WHERE inner_conditions
) AS name
WHERE outer_conditions;
```

```
quote_sql_lab=# SELECT * FROM (
quote_sql_lab(#     SELECT nick, name as group_name, credits
quote_sql_lab(#     FROM author LEFT JOIN author_group
quote_sql_lab(#     ON author.group_id = author_group.id
quote_sql_lab(# ) AS author_with_group
quote_sql_lab-# WHERE group_name = 'bloggers';
   nick   | group_name | credits
----------+------------+---------
 john_doe | bloggers   |      20
 pinecone | bloggers   |       5
 nerd     | bloggers   |      10
 mateo    | bloggers   |       0
(4 rows)

```

#### Subqueries in `WHERE` clause

```sql
SELECT outer_columns FROM outer_table_name
WHERE outer_column operator (
    SELECT inner_column FROM inner_table_name
    WHERE inner_conditions
);
```

```
quote_sql_lab=# SELECT * FROM author
quote_sql_lab-# WHERE group_id = (
quote_sql_lab(#     SELECT id FROM author_group
quote_sql_lab(#     WHERE name = 'writers'
quote_sql_lab(# );
 id | user_id | group_id | nick  | credits
----+---------+----------+-------+---------
 13 |         |        3 | jonny |      40
 14 |         |        3 | agate |      25
 15 |      19 |        3 | erwin |      10
(3 rows)

```
