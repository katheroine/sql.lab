[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Removing](removing_tables.md)

### Inserting into tables

#### Inserting into all columns

```
quote_sql_lab=# CREATE TABLE medium_type
quote_sql_lab-# (
quote_sql_lab(#     codename CHAR(8) PRIMARY KEY,
quote_sql_lab(#     description VARCHAR(256) NOT NULL
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# INSERT INTO medium_type VALUES
quote_sql_lab-#     ('BOOK', 'A book'),
quote_sql_lab-#     ('CD', 'A CD'),
quote_sql_lab-#     ('VHS', 'A VHS tape');
INSERT 0 3
quote_sql_lab=# SELECT * FROM medium_type;
 BOOK     | A book
 CD       | A CD
 VHS      | A VHS tape

```

#### Inserting into chosen columns

```
quote_sql_lab=# CREATE TABLE user_account
quote_sql_lab-# (
quote_sql_lab(#     id INTEGER PRIMARY KEY,
quote_sql_lab(#     personal_data_id INTEGER UNIQUE,
quote_sql_lab(#     confirmed BOOLEAN,
quote_sql_lab(#     active BIT
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# INSERT INTO user_account (ID, personal_data_id) VALUES
quote_sql_lab-#     (1, 1),
quote_sql_lab-#     (2, 2),
quote_sql_lab-#     (3, 3);
INSERT 0 3
quote_sql_lab=# SELECT * FROM user;
 postgres

quote_sql_lab=# SELECT * FROM user_account;
  1 |                1 |           |
  2 |                2 |           |
  3 |                3 |           |

```
