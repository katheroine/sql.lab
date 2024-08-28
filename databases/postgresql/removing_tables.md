[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Modifying tables](modifying_tables.md)

### Removing tables

```
quote_sql_lab=# CREATE TABLE note
quote_sql_lab-# (
quote_sql_lab(#     id INTEGER PRIMARY KEY,
quote_sql_lab(#     author_id INTEGER,
quote_sql_lab(#     content VARCHAR(1024)
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# \dt
               List of relations
 Schema |        Name        | Type  |  Owner
--------+--------------------+-------+----------
 public | article            | table | postgres
 public | file               | table | postgres
 public | note               | table | postgres
(3 rows)

quote_sql_lab=# DROP TABLE note;
DROP TABLE
quote_sql_lab=# \dt
               List of relations
 Schema |        Name        | Type  |  Owner
--------+--------------------+-------+----------
 public | article            | table | postgres
 public | file               | table | postgres
(2 rows)

```
