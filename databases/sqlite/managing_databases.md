[⌂ Home](../../README.md)
[⬆ Up: SQLite](README.md)
[▲ Previous: Installation and running](installation_and_running.md)
[▼ Next: Managing tables](managing_tables.md)

## Managing databases

### Displaying databases

```bash
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main
1    temp
```

### Creating and choosing databases

```bash
$ sqlite quote_sql_lab.db
SQLite version 2.8.17
Enter ".help" for instructions
sqlite> .databases
seq  name             file
---  ---------------  ----------------------------------------------------------
0    main             /home/katheroine/quote_sql_lab.db
1    temp             /var/tmp/sqlite_4bgECn3Em2x6p9V
```
