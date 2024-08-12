[⌂ Home](../../README.md)
[⬆ Up: PostgreSQL](README.md)
[▲ Previous: Installation and running](installation_and_running.md)
[▼ Next: Managing tables](managing_tables.md)

## Managing databases

### Displaying databases

```bash
postgres=# \db
       List of tablespaces
    Name    |  Owner   | Location
------------+----------+----------
 pg_default | postgres |
 pg_global  | postgres |
(2 rows)

postgres=# \list
                                    List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
---------------+----------+----------+-------------+-------------+-----------------------
 postgres      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 template0     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
(3 rows)

```

### Creating and choosing databases

```bash
postgres=# CREATE DATABASE quote_sql_lab;
CREATE DATABASE
postgres=# \list
                                    List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
---------------+----------+----------+-------------+-------------+-----------------------
 postgres      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 quote_sql_lab | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 template0     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
(4 rows)

postgres=# \connect quote_sql_lab
You are now connected to database "quote_sql_lab" as user "postgres".
```
