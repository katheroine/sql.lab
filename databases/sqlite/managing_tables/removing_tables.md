[⌂ Home](../../README.md)
[▲ Previous: Modifying tables](modifying_tables.md)
[▼ Next: Inserting records](../managing_records/inserting_records.md)

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

[▵ Up](#removing-tables)
[⌂ Home](../../README.md)
[▲ Previous: Modifying tables](modifying_tables.md)
[▼ Next: Inserting records](../managing_records/inserting_records.md)
