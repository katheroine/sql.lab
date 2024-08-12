[⌂ Home](../../README.md)
[⬆ Up: MariaDB](README.md)
[▲ Previous: Installation and running](installation_and_running.md)
[▼ Next: Managing tables](managing_tables.md)

## Managing databases

### Displaying databases

```bash
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0,068 sec)

```

### Creating and choosing databases

```bash
MariaDB [(none)]> CREATE DATABASE quote_sql_lab;
Query OK, 1 row affected (0,005 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| quote_sql_lab      |
| test               |
+--------------------+
5 rows in set (0,010 sec)

MariaDB [(none)]> USE quote_sql_lab;
Database changed
```
