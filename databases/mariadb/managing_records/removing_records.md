[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▲ Previous: Updating records](updating_records.md)

### Removing records

```sql
DELETE FROM table_name WHERE conditions;
```

```
MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |        22.3 |         1013 |
|         2 |     41.5 |          20 |         1014 |
|         4 |     41.5 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
3 rows in set (0,088 sec)

MariaDB [quote_sql_lab]> DELETE FROM storage_conditions WHERE air_pressure > 1013;
Query OK, 1 row affected (0,021 sec)

MariaDB [quote_sql_lab]> SELECT * FROM storage_conditions;
+-----------+----------+-------------+--------------+
| medium_id | humidity | temperature | air_pressure |
+-----------+----------+-------------+--------------+
|         1 |       38 |        22.3 |         1013 |
|         4 |     41.5 |          18 |      1012.25 |
+-----------+----------+-------------+--------------+
2 rows in set (0,001 sec)

```
