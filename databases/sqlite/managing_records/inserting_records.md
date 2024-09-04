[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▼ Next: Updating records](updating_records.md)

### Inserting records

#### Inserting into all columns

**SQLite doesn't handle multipe inserts in one statement.**

```
sqlite> CREATE TABLE medium_type
   ...> (
   ...>     codename CHAR(8) PRIMARY KEY,
   ...>     description VARCHAR(256) NOT NULL
   ...> );
sqlite> INSERT INTO medium_type VALUES ('BOOK', 'A book');
sqlite> INSERT INTO medium_type VALUES ('CD', 'A CD');
sqlite> INSERT INTO medium_type VALUES ('VHS', 'A VHS tape');
sqlite> SELECT * FROM medium_type;
BOOK|A book
CD|A CD
VHS|A VHS tape
```

#### Inserting into chosen columns

```
sqlite> CREATE TABLE user
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     personal_data_id INTEGER UNIQUE,
   ...>     confirmed BOOLEAN,
   ...>     active BIT
   ...> );
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (1, 1);
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (2, 2);
sqlite> INSERT INTO user (ID, personal_data_id) VALUES (3, 3);
sqlite> SELECT * FROM user;
1|1||
2|2||
3|3||
```