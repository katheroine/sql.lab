[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▲ Previous: Updating records](updating_records.md)

### Removing records

```sql
DELETE FROM table_name WHERE conditions;
```

```
sqlite> SELECT * FROM storage_conditions;
1|38|22.3|1013
2|41.5|20|1014
4|41.5|18|1012.25
sqlite> DELETE FROM storage_conditions WHERE air_pressure > 1013;
sqlite> SELECT * FROM storage_conditions;
1|38|22.3|1013
4|41.5|18|1012.25
```
