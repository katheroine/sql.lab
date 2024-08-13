[⌂ Home](../README.md)

# Constraints

**SQL constraints** are used to specify rules for the data in a table.

*Constraints are used to limit the type of data that can go into a table.* This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

*Constraints can be column level or table level.* Column level constraints apply to a column, and table level constraints apply to the whole table.

The following constraints are commonly used in SQL:

* `NOT NULL` - Ensures that a column cannot have a NULL value
* `UNIQUE` - Ensures that all values in a column are different
* `DEFAULT` - Sets a default value for a column if no value is specified
* `CHECK` - Ensures that the values in a column satisfies a specific condition
* `PRIMARY KEY` - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
* `FOREIGN KEY` - Prevents actions that would destroy links between tables
* `CREATE INDEX` - Used to create and retrieve data from the database very quickly

-- [W3C SQL Tutorial](https://www.w3schools.com/sql/sql_constraints.asp)

## Primary key

In the relational model of databases, a **primary key** is a designated attribute (column) that can reliably identify and distinguish between each individual record in a table. The database creator can choose an existing unique attribute or combination of attributes from the table (a **natural key**) to act as its primary key, or create a new attribute containing a unique ID that exists solely for this purpose (a **surrogate key**).

Examples of natural keys that could be suitable primary keys include data that is already by definition unique to all items in the table such as a national identification number attribute for person records, or the combination of a very precise timestamp attribute with a very precise location attribute for event records.

More formally, a **primary key** is *a specific choice of a minimal set of attributes that uniquely specify a tuple (row) in a relation (table)*. A primary key is a choice of a candidate key (a minimal superkey); any other candidate key is an alternate key.

In relational database terms, *a primary key does not differ in form or function from a key that isn't primary*. In practice, various motivations may determine the choice of any one key as primary over another. The designation of a primary key may indicate the "preferred" identifier for data in the table, or that the primary key is to be used for foreign key references from other tables or it may indicate some other technical rather than semantic feature of the table. Some languages and software have special syntax features that can be used to identify a primary key as such (e.g. the PRIMARY KEY constraint in SQL).

The relational model, as expressed through relational calculus and relational algebra, does not distinguish between primary keys and other kinds of keys. Primary keys were added to the SQL standard mainly as a convenience to the application programmer.

Primary keys can be an `integer` that is incremented, a *universally unique identifier (UUID)* or can be generated using Hi/Lo algorithm.

Primary keys are defined in the ISO SQL Standard, through the *`PRIMARY KEY` constraint*. The syntax to add such a constraint to an existing table is defined in SQL:2003 like this:

```sql
ALTER TABLE <table identifier>
    ADD [ CONSTRAINT <constraint identifier> ]
    PRIMARY KEY ( <column name> [ {, <column name> }... ] )
```

The primary key can also be specified directly during table creation. In the SQL Standard, **primary keys may consist of one or multiple columns**. *Each column participating in the primary key is implicitly defined as `NOT NULL`*. Note that *some RDBMS require explicitly marking primary key columns as `NOT NULL`*.

```sql
CREATE TABLE table_name (

   ...
)
```

If the primary key consists only of a single column, the column can be marked as such using the following syntax:

```sql
CREATE TABLE table_name (
   id_col  INT  PRIMARY KEY,
   col2    CHARACTER VARYING(20),
   ...
)
```
