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

## Superkey

In the relational data model a **superkey** is any set of attributes that *uniquely identifies each tuple of a relation*. Because superkey values are unique, tuples with the same superkey value must also have the same non-key attribute values. That is, non-key attributes are functionally dependent on the superkey.

*The set of all attributes is always a superkey* (the **trivial superkey**). Tuples in a relation are by definition unique, with duplicates removed after each operation, so the set of all attributes is always uniquely valued for every tuple. A **candidate key** (or **minimal superkey**) is *a superkey that can't be reduced to a simpler superkey by removing an attribute*.

For example, in an employee schema with attributes employeeID, name, job, and departmentID, if employeeID values are unique then employeeID combined with any or all of the other attributes can uniquely identify tuples in the table. Each combination, {employeeID}, {employeeID, name}, {employeeID, name, job}, and so on is a superkey. {employeeID} is a candidate key, since no subset of its attributes is also a superkey. {employeeID, name, job, departmentID} is the trivial superkey.

If attribute set K is a superkey of relation R, then at all times it is the case that the projection of R over K has the same cardinality as R itself.

-- [Wikipedia](https://en.wikipedia.org/wiki/Superkey)

## Candidate key

A **candidate key**, or simply a **key**, of a relational database is *any set of columns that have a unique combination of values in each row*, with the additional constraint that removing any column could produce duplicate combinations of values.

A candidate key is a minimal **superkey**, i.e., *a superkey that doesn't contain a smaller one*. Therefore, a relation can have multiple candidate keys, each with a different number of attributes.

Specific candidate keys are sometimes called **primary keys**, **secondary keys** or **alternate keys**. The columns in a candidate key are called *prime attributes*, and a column that does not occur in any candidate key is called a *non-prime attribute*.

Every relation without NULL values will have at least one candidate key: Since there cannot be duplicate rows, the set of all columns is a superkey, and if that isn't minimal, some subset of that will be minimal.

There is a functional dependency from the candidate key to all the attributes in the relation.

The superkeys of a relation are all the possible ways we can identify a row. The candidate keys are the minimal subsets of each superkey and as such, they are an important concept for the design of database schema.

-- [Wikipedia](https://en.wikipedia.org/wiki/Candidate_key)

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

-- [Wikipedia](https://en.wikipedia.org/wiki/Primary_key)

## Foreign key

A **foreign key** is a set of attributes in a table that refers to the **primary key** of another table, linking these two tables. In the context of relational databases, a *foreign key* is subject to an inclusion dependency constraint that the tuples consisting of the *foreign key* attributes in one relation, R, must also exist in some other (not necessarily distinct) relation, S; furthermore that those attributes must also be a *candidate key* in S.

In other words, a *foreign key* is a set of attributes that references a *candidate key*. For example, a table called `TEAM` may have an attribute, `MEMBER_NAME`, which is a foreign key referencing a candidate key, `PERSON_NAME`, in the `PERSON` table. Since `MEMBER_NAME` is a foreign key, any value existing as the name of a member in `TEAM` must also exist as a person's name in the `PERSON` table; in other words, every member of a `TEAM` is also a `PERSON`.

The reference relation should already be created.
The referenced attribute must be a part of *primary key* of the referenced relation.
Data type and size of referenced and referencing attribute must be same.

-- [Wikipedia](https://en.wikipedia.org/wiki/Foreign_key)

## Index

A **database index** is a data structure that *improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index data structure*. Indexes are used to quickly locate data without having to search every row in a database table every time said table is accessed. Indexes can be created using one or more columns of a database table, providing the basis for both rapid random lookups and efficient access of ordered records.

An index is a copy of selected columns of data, from a table, that is designed to enable very efficient search. An index normally includes a "key" or direct link to the original row of data from which it was copied, to allow the complete row to be retrieved efficiently. Some databases extend the power of indexing by letting developers create indexes on column values that have been transformed by functions or expressions. For example, an index could be created on upper(last_name), which would only store the upper-case versions of the last_name field in the index. Another option sometimes supported is the use of partial index, where index entries are created only for those records that satisfy some conditional expression. A further aspect of flexibility is to permit indexing on user-defined functions, as well as expressions formed from an assortment of built-in functions.

-- [Wikipedia](https://en.wikipedia.org/wiki/Database_index)
