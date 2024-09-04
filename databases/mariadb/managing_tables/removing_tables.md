[⌂ Home](../../../README.md)
[⬆ Up: Managing tables](README.md)
[▲ Previous: Modifying tables](modifying_tables.md)
[▼ Next: Inserting into tables](inserting_into_tables.md)

### Removing tables

```
MariaDB [quote_sql_lab]> CREATE TABLE note
    -> (
    ->     id INTEGER PRIMARY KEY,
    ->     author_id INTEGER,
    ->     content VARCHAR(1024)
    -> );
Query OK, 0 rows affected (0,095 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| author                  |
| file                    |
| note                    |
+-------------------------+
3 rows in set (0,008 sec)

MariaDB [quote_sql_lab]> DROP TABLE note;
Query OK, 0 rows affected (0,021 sec)

MariaDB [quote_sql_lab]> SHOW TABLES;
+-------------------------+
| Tables_in_quote_sql_lab |
+-------------------------+
| author                  |
| file                    |
+-------------------------+
2 rows in set (0,001 sec)

```
