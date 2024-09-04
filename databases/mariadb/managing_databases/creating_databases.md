[⌂ Home](../../../README.md)
[⬆ Up: Managing databases](README.md)
[▲ Previous: Displaying databases](displaying_databases.md)
[▼ Next: Choosing databases](choosing_databases.md)

### Creating databases

```bash
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0,068 sec)

MariaDB [(none)]> CREATE DATABASE quote_sql_lab;
Query OK, 1 row affected (0,005 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| quote_sql_lab      |
| test               |
+--------------------+
3 rows in set (0,010 sec)

```