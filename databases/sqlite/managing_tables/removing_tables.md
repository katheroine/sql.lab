[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Modifying tables](modifying_tables.md)
[▼ Next: Inserting into tables](inserting_into_tables.md)

### Removing tables

```sql
DROP TABLE table_name;
```

```
sqlite> CREATE TABLE note
   ...> (
   ...>     id INTEGER PRIMARY KEY,
   ...>     author_id INTEGER,
   ...>     content VARCHAR(1024)
   ...> );
sqlite> .tables
author              file                note
sqlite> DROP TABLE notes;
sqlite> .tables
author              file

```
