[⌂ Home](../../README.md)
[⬆ Up: MySQL](README.md)
[▲ Previous: Installation and running](installation_and_running.md)
[▼ Next: Managing tables](managing_tables.md)

## Managing databases

### Displaying databases

```bash
mysql> SHOW DATABASES;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| sys                     |
+-------------------------+
4 rows in set (0,00 sec)

```

### Creating and choosing databases

```bash
mysql> CREATE DATABASE quote_sql_lab;
Query OK, 1 row affected (0,03 sec)

mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| quote_sql_lab           |
| sys                     |
+-------------------------+
5 rows in set (0,01 sec)

mysql> USE quote_sql_lab;
Database changed
```
