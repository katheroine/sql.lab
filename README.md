# SQL.lab

Laboratory of SQL & most popular SQL databases:
* MySQL
* PostgreSQL
* SQLite

## SQL databases

**When to use MySQL, wen PostrgeSQL and when SQLite?**

There are many factors to consider when choosing a database for your project, including the size of your project, the complexity of your data, and your budget. In general, MySQL is a good choice for small and medium-sized projects, while PostgreSQL is a good choice for large and complex projects. SQLite is a good choice for embedded applications or applications that need to be portable.

Here is a more detailed comparison of the three databases:

* **MySQL**: MySQL is a popular open-source relational database management system (RDBMS). It is known for its *ease of use, performance, and scalability*. MySQL is a good choice for *small and medium-sized projects*.


* **PostgreSQL**: PostgreSQL is a powerful and scalable open-source object-relational database management system (ORDBMS). It is known for its *reliability, security, and support for complex data types*. PostgreSQL is a good choice for *large and complex projects*.


* **SQLite**: SQLite is a lightweight embedded SQL database engine. It is known for its *portability, simplicity, and ease of use*. SQLite is a good choice for *embedded applications or applications that need to be portable*.

## Installation & running

### Installation

**MySQL**

```bash
$ sudo aptitude install mysql-server mysql-client
```

**PostgreSQL**

```bash
$ sudo aptitude install postgresql
```

**SQLite**

```bash
$ sudo aptitude install sqlite
```

### Running client

**MySQL**

```bash
$ sudo mysql -u root
```

**PostgreSQL**

```bash
$ sudo -u postgres psql
```

**SQLite**

```bash
$ sudo aptitude install sqlite
```
