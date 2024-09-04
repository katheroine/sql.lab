[⌂ Home](../../../README.md)
[⬆ Up: Managing records](README.md)
[▲ Previous: Inserting records](inserting_records.md)

### Updating records

#### Updating multiple columns in single record

```
sqlite> CREATE TABLE storage_conditions
   ...> (
   ...>     medium_id INTEGER PRIMARY KEY,
   ...>     humidity FLOAT DEFAULT 40,
   ...>     temperature FLOAT(4) DEFAULT 23,
   ...>     air_pressure REAL DEFAULT 1013.25
   ...> );
sqlite> INSERT INTO storage_conditions VALUES (1, 38, 22, 1013.5);
sqlite> INSERT INTO storage_conditions VALUES (2, 42, 20, 1014);
sqlite> INSERT INTO storage_conditions VALUES (4, 41, 18, 1012.25);
sqlite> SELECT * FROM storage_conditions;
1|38|22|1013.5
2|42|20|1014
4|41|18|1012.25
sqlite> UPDATE storage_conditions SET
   ...>     temperature = 22.3,
   ...>     air_pressure = 1013
   ...> WHERE medium_id = 1;
sqlite> SELECT * FROM storage_conditions;
1|38|22.3|1013
2|42|20|1014
4|41|18|1012.25
```

#### Updating single column in multiple records

```
sqlite> SELECT * FROM storage_conditions;
1|38|22.3|1013
2|42|20|1014
4|41|18|1012.25
sqlite> UPDATE storage_conditions SET
   ...>     humidity = 41.5
   ...> WHERE humidity >= 40 AND humidity < 43;
sqlite> SELECT * FROM storage_conditions;
1|38|22.3|1013
2|41.5|20|1014
4|41.5|18|1012.25
```
