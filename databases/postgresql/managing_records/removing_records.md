[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▲ Previous: Updating records](updating_records.md)

### Removing records

```sql
DELETE FROM table_name WHERE conditions;
```

```
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         2 |     41.5 |          20 |         1014
         4 |     41.5 |          18 |      1012.25
         1 |       38 |        22.3 |         1013
(3 rows)

quote_sql_lab=# DELETE FROM storage_conditions WHERE air_pressure > 1013;
DELETE 1
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         4 |     41.5 |          18 |      1012.25
         1 |       38 |        22.3 |         1013
(2 rows)

```
