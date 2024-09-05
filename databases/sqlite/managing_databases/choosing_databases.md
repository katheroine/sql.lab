[⌂ Home](../../../README.md)
[⬆ Up: Managing databases](README.md)
[▲ Previous: Creating databases](creating_databases.md)

### Choosing databases

**In SQLite, creating or choosing database - if it already exists - happens in the moment of starting the client.**

```
$ sqlite quote_sql_lab.db
SQLite version 2.8.17
Enter ".help" for instructions
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main             /home/katheroine/quote_sql_lab.db
1    temp             /var/tmp/sqlite_4bgECn3Em2x6p9V
```
