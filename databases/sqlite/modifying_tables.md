[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Creating tables](creating_tables.md)

### Modifying tables

#### Tables

##### Renaming table

**The `ALTER TABLE` statement in SQLite does not support renaming tables.**

```
sqlite> .tables
author              points              quote
sqlite> CREATE TABLE points_granting AS SELECT * FROM points;
sqlite> DROP TABLE points;
sqlite> .tables
author              points_granting     quote
```
