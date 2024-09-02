[⌂ Home](../../README.md)
[⬆ Up: Managing tables](managing_tables.md)
[▲ Previous: Inserting into tables](inserting_into_tables.md)

### Updating into table

#### Updating single record

```
quote_sql_lab=# CREATE TABLE storage_conditions
quote_sql_lab-# (
quote_sql_lab(#     medium_id INTEGER PRIMARY KEY,
quote_sql_lab(#     humidity FLOAT DEFAULT 40,
quote_sql_lab(#     temperature FLOAT(4) DEFAULT 23,
quote_sql_lab(#     air_pressure REAL DEFAULT 1013.25
quote_sql_lab(# );
CREATE TABLE
quote_sql_lab=# INSERT INTO storage_conditions VALUES
quote_sql_lab-#     (1, 38, 22, 1013.5),
quote_sql_lab-#     (2, 42, 20, 1014),
quote_sql_lab-#     (4, 41, 18, 1012.25);
INSERT 0 3
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         1 |       38 |          22 |       1013.5
         2 |       42 |          20 |         1014
         4 |       41 |          18 |      1012.25
(3 rows)

quote_sql_lab=# UPDATE storage_conditions SET
quote_sql_lab-#     temperature = 22.3,
quote_sql_lab-#     air_pressure = 1013
quote_sql_lab-# WHERE medium_id = 1;
UPDATE 1
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         2 |       42 |          20 |         1014
         4 |       41 |          18 |      1012.25
         1 |       38 |        22.3 |         1013
(3 rows)

```

#### Updating multiple records

```
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         1 |       38 |          22 |       1013.5
         2 |       42 |          20 |         1014
         4 |       41 |          18 |      1012.25
(3 rows)

quote_sql_lab=# UPDATE storage_conditions SET
quote_sql_lab-#     humidity = 41.5
quote_sql_lab-# WHERE humidity >= 40 AND humidity < 43;
UPDATE 2
quote_sql_lab=# SELECT * FROM storage_conditions;
 medium_id | humidity | temperature | air_pressure
-----------+----------+-------------+--------------
         1 |       38 |        22.3 |         1013
         2 |     41.5 |          20 |         1014
         4 |     41.5 |          18 |      1012.25
(3 rows)

```
