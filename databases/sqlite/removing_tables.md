[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Modifying tables](modifying_tables.md)

### Removing tables

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
