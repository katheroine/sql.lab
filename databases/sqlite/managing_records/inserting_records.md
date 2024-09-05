[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▼ Next: Updating records](updating_records.md)

### Inserting records

#### Inserting into all columns

**SQLite doesn't handle multipe inserts in one statement.**

```sql
INSERT INTO table_name VALUES
    (value_of_column_1, value_of_column_2, value_of_column_3);
```

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

```sql
INSERT INTO table_name (column_1_name, column_3_name) VALUES
    (value_of_column_1, value_of_column_3);
```

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