# SQL.lab

Laboratory of SQL & most popular SQL databases:
* MySQL
* PostgreSQL
* MariaDB
* SQLite

## SQL databases

**When to use MySQL, when PostrgeSQL, when MariaDB and when SQLite?**

* **SQLite** is a *lightweight, embedded* database that's often used for *smaller applications* or when you need a database that *doesn't require a separate server*. It's a good choice for *mobile apps, desktop applications*, and other scenarios where you need a *simple and efficient database*.

* **MySQL** is a widely used, open-source relational database management system (RDBMS) known for its *speed and reliability*. It's a good choice for applications that require *robust transaction support and complex querying capabilities* with relational data.

* **MariaDB** is a fork of MySQL, designed to be a *fully compatible and enhanced* version. It's a good choice for applications that require *high availability, security, interoperability, and performance capabilities*.

* **PostgreSQL** is another popular open-source RDBMS that excels in *complex data models and high-traffic scenarios*. It's often preferred for applications that demand *high data integrity and advanced features like foreign key constraints and triggers*.

Ultimately, the best choice for you will depend on your specific needs and requirements. Consider factors like the size and complexity of your data, the performance requirements of your application, and the level of support you need.

-- Aria

Choosing the right database for your application can significantly impact performance, scalability, and development efficiency. Let's break down when to use each of these popular options:  

**SQLite**

Best for: Embedded systems, small desktop applications, mobile apps, and prototyping.  

Why:

* Lightweight and self-contained: No separate server process required.
* ACID compliance: Ensures data integrity.
* Fast: Very efficient for small datasets.

Limitations:

* Not suitable for high concurrency or large datasets.  
* No built-in replication or clustering.

**MySQL**

Best for: Web applications, e-commerce platforms, content management systems, and high-traffic websites.  

Why:

* Fast and efficient for read-heavy workloads.  
* Easy to use and manage.  
* Strong community support and extensive ecosystem.
* Good performance for medium-sized datasets.  

Limitations:

* Less advanced features compared to PostgreSQL.  
* Can struggle with complex queries and large datasets.  

**MariaDB**

Best for: High-performance applications, cloud-based deployments, and migrating from MySQL.

Why:

* Fork of MySQL with performance improvements and additional features.
* Compatible with MySQL, making migration easier.  
* Strong focus on scalability and performance.  
* Offers columnar storage for analytical workloads.  

Limitations:

* Smaller community compared to MySQL.
* Some features might be less mature than PostgreSQL.

**PostgreSQL**

Best for: Complex applications, data warehousing, geospatial data, and real-time analytics.  

Why:

* Advanced features like JSONB, full-text search, and advanced querying.  
* Strong ACID compliance and data integrity.  
* Scalable and supports large datasets.  
* Active development and strong community.  

Limitations:

* Can be more resource-intensive than MySQL or MariaDB.
* Steeper learning curve for complex features.

**Key Considerations**

* **Data volume and complexity**: Small datasets are ideal for SQLite, while large and complex datasets favor PostgreSQL.  

* **Performance**: MySQL and MariaDB excel in read-heavy workloads, while PostgreSQL offers better performance for complex queries.  

* **Features**: PostgreSQL provides a rich feature set, including advanced data types and functions.  

* **Scalability**: MariaDB and PostgreSQL are better suited for scaling than MySQL and SQLite.

* **Cost**: SQLite is free and self-contained, while others require server infrastructure.  

* **Community and support**: MySQL and PostgreSQL have larger communities and more resources available.

Remember: There's no one-size-fits-all answer. The best database depends on your specific application requirements. It's often helpful to prototype with different options to make an informed decision.

-- [Gemini](https://g.co/gemini/share/6412becd3dd9)

## Index

1. [Installation and running](#installation-and-running)
    1. Installation
    2. Running client
2. [Working with databases](#working-with-databases)
    1. Displaying databases
    2. Creating and choosing databases
3. [Working with tables](#working-with-tables)
    1. Displaying tables
    2. Creating tables
        1. Datatypes
        2. Columns and datatypes
        3. Primary key

### Installation and running

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Installation**|[✤](databases/sqlite/README.md#installation)|[✤](databases/mysql/README.md#installation)|[✤](databases/mariadb/README.md#installation)|[✤](databases/postgresql/README.md#installation)|

### Working with databases

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying databases**|[✤](databases/sqlite/README.md#displaying-databases)|[✤](databases/mysql/README.md#displaying-databases)|[✤](databases/mariadb/README.md#displaying-databases)|[✤](databases/postgresql/README.md#displaying-databases)|
|**Creating and choosing databases**|[✤](databases/sqlite/README.md#creating-and-choosing-databases)|[✤](databases/mysql/README.md#creating-and-choosing-databases)|[✤](databases/mariadb/README.md#creating-and-choosing-databases)|[✤](databases/postgresql/README.md#creating-and-choosing-databases)|

### Working with tables

|-----------------------------------------------|SQLite -------|MySQL -------|MariaDB ------|PostgreSQL ---|
|--|--|--|--|--|
|**Displaying tables**|[✤](databases/sqlite/README.md#displaying-tables)|[✤](databases/mysql/README.md#displaying-tables)|[✤](databases/mariadb/README.md#displaying-tables)|[✤](databases/postgresql/README.md#displaying-tables)|
|**Creating tables**|
|Datatypes|[✤](databases/sqlite/README.md#datatypes)|[✤](databases/mysql/README.md#datatypes)|[✤](databases/mariadb/README.md#datatypes)|[✤](databases/postgresql/README.md#datatypes)|
|Columns and datatypes|[✤](databases/sqlite/README.md#columns-and-datatypes)|[✤](databases/mysql/README.md#columns-and-datatypes)|[✤](databases/mariadb/README.md#columns-and-datatypes)|[✤](databases/postgresql/README.md#columns-and-datatypes)|
|Primary key|[✤](databases/sqlite/README.md#primary-key)|[✤](databases/mysql/README.md#primary-key)|[✤](databases/mariadb/README.md#primary-key)|[✤](databases/postgresql/README.md#primary-key)|

## Basic commands

Prompts:
* `$` - system console
* `>` - SQLite/MySQL/MariaDB console
* `=#` - PostgreSQL console

**Remember to omit the prompt when copying the command.**

|-----------------------------------------------|SQLite -------------------|MySQL -------------------|MariaDB -------------------|PostgreSQL -------------------|
|--|--|--|--|--|
|**Choosing database**|`$ sqlite quote_sql_lab.db`|`> USE quote_sql_lab;`|`> USE quote_sql_lab;`|`=# \connect quote_sql_lab`|
|**Displaying databases**|`> .databases`|`> SHOW DATABASES;`|`> SHOW DATABASES;`|`=# \list`|
|**Displaying tablespaces**||||`=# \db`|
|**Displaying tables**|`> .tables`|`> SHOW TABLES;`|`> SHOW TABLES;`|`=# \dt`|
|**Describing table**|`> .schema quote`|`> DESCRIBE quote;`|`> DESCRIBE quote;`|`=# \d+ quote`|
