[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)

### Queries

**Database preparation**

```sql
CREATE TABLE quote
(
    id SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES
    (1, 101, 1, 'William Shakespeare', 'Hamlet', 5),
    (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4),
    (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5),
    (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4),
    (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3),
    (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4),
    (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5),
    (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 3),
    (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3),
    (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);

CREATE TABLE owner
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    login VARCHAR(256) NOT NULL UNIQUE
);

INSERT INTO owner (id, name, surname, login) VALUES
    (101, 'John', 'Doe', 'johnd'),
    (102, 'Jane', 'Smith', 'janes'),
    (103, NULL, 'Johnson', 'anonymous_j'),
    (104, 'Michael', NULL, 'mike_m'),
    (105, 'Emily', 'Brown', 'emily_b'),
    (106, NULL, NULL, 'mystery_user'),
    (107, 'David', 'Wilson', 'david_w'),
    (108, 'Sarah', 'Taylor', 'sarah_t'),
    (109, 'Robert', NULL, 'rob_123'),
    (110, 'Lisa', 'Anderson', 'lisa_a');
```

#### Scope

##### Selecting all columns of all records

```sql
SELECT * FROM table_name;
```

```
quote_sql_lab=# SELECT * FROM quote;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
(10 rows)

```

##### Selecting chosen columns of all records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name;
```

```
quote_sql_lab=# SELECT author, source
quote_sql_lab-# FROM quote;
       author        |                 source
---------------------+----------------------------------------
 William Shakespeare | Hamlet
 Jane Austen         | Pride and Prejudice
 Albert Einstein     | Speech to the German Physical Society
 Maya Angelou        | I Know Why the Caged Bird Sings
 Friedrich Nietzsche | Thus Spoke Zarathustra
 Oscar Wilde         | The Picture of Dorian Gray
 Mahatma Gandhi      | The Story of My Experiments with Truth
 Virginia Woolf      | A Room of One's Own
 Mark Twain          | The Adventures of Huckleberry Finn
 Aristotle           | Nicomachean Ethics
(10 rows)

```

##### Selecting all columns of chosen records

```sql
SELECT * FROM table_name
WHERE conditions;
```

```
quote_sql_lab=# SELECT * FROM quote
quote_sql_lab-# WHERE owner_id = 106;
 id | owner_id |   author    |           source           | rating
----+----------+-------------+----------------------------+--------
  6 |      106 | Oscar Wilde | The Picture of Dorian Gray |      4
(1 row)

```

##### Selecting chosen columns of chosen records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name
WHERE conditions;
```

```
quote_sql_lab=# SELECT author, source, rating
quote_sql_lab-# FROM quote
quote_sql_lab-# WHERE rating >= 4;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Jane Austen         | Pride and Prejudice                    |      4
 Albert Einstein     | Speech to the German Physical Society  |      5
 Maya Angelou        | I Know Why the Caged Bird Sings        |      4
 Oscar Wilde         | The Picture of Dorian Gray             |      4
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Virginia Woolf      | A Room of One's Own                    |      4
 Aristotle           | Nicomachean Ethics                     |      5
(8 rows)

```

#### Column aliases

```sql
SELECT column_1_name AS column_1_alias, column_2_name AS column_2_alias, column_3_name AS column_3_alias
FROM table_name;
```

```
quote_sql_lab=# SELECT author AS creator, source, rating AS popularity
quote_sql_lab-# FROM quote;
       creator       |                 source                 | popularity
---------------------+----------------------------------------+------------
 William Shakespeare | Hamlet                                 |          5
 Jane Austen         | Pride and Prejudice                    |          4
 Albert Einstein     | Speech to the German Physical Society  |          5
 Maya Angelou        | I Know Why the Caged Bird Sings        |          4
 Friedrich Nietzsche | Thus Spoke Zarathustra                 |          3
 Oscar Wilde         | The Picture of Dorian Gray             |          4
 Mahatma Gandhi      | The Story of My Experiments with Truth |          5
 Virginia Woolf      | A Room of One's Own                    |          3
 Mark Twain          | The Adventures of Huckleberry Finn     |          3
 Aristotle           | Nicomachean Ethics                     |          5
(10 rows)

```

#### Select criteria

##### Relational operators

**Equal `=`**

```sql
SELECT columns FROM table_name WHERE column_name = column_value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating = 5;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Albert Einstein     | Speech to the German Physical Society  |      5
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Aristotle           | Nicomachean Ethics                     |      5
(4 rows)

```

**Different `<>`, `!=`**

```sql
SELECT columns FROM table_name WHERE column_name <> column_value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating <> 5;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Jane Austen         | Pride and Prejudice                |      4
 Maya Angelou        | I Know Why the Caged Bird Sings    |      4
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Oscar Wilde         | The Picture of Dorian Gray         |      4
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(6 rows)

```

```sql
SELECT columns FROM table_name WHERE column_name != column_value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating != 5;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Jane Austen         | Pride and Prejudice                |      4
 Maya Angelou        | I Know Why the Caged Bird Sings    |      4
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Oscar Wilde         | The Picture of Dorian Gray         |      4
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(6 rows)

```

**Smaller than `<`**

```sql
SELECT columns FROM table_name WHERE column_name < value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating < 4;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(3 rows)

```

**Smaller than or equals `<=`**

```sql
SELECT columns FROM table_name WHERE column_name <= value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating <= 4;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Jane Austen         | Pride and Prejudice                |      4
 Maya Angelou        | I Know Why the Caged Bird Sings    |      4
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Oscar Wilde         | The Picture of Dorian Gray         |      4
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(6 rows)

```

**Greater than `>`**

```sql
SELECT columns FROM table_name WHERE column_name > value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating > 4;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Albert Einstein     | Speech to the German Physical Society  |      5
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Aristotle           | Nicomachean Ethics                     |      5
(4 rows)

```

**Greater than or equals `>=`**

```sql
SELECT columns FROM table_name WHERE column_name >= value;
```

```
quote_sql_lab=# SELECT author, source, rating FROM quote WHERE rating >= 4;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Jane Austen         | Pride and Prejudice                    |      4
 Albert Einstein     | Speech to the German Physical Society  |      5
 Maya Angelou        | I Know Why the Caged Bird Sings        |      4
 Oscar Wilde         | The Picture of Dorian Gray             |      4
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Aristotle           | Nicomachean Ethics                     |      5
(7 rows)

```

**`IS NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NULL;
```

```
quote_sql_lab=# SELECT surname, login FROM owner WHERE name IS NULL;
 surname |    login
---------+--------------
 Johnson | anonymous_j
         | mystery_user
(2 rows)

```

It doesn't work with the equals operator `=`.

```
postgres=# SELECT surname, login FROM owner WHERE name = NULL;
 surname | login
---------+-------
(0 rows)

```

**`IS NOT NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NOT NULL;
```

```
postgres=# SELECT surname, login FROM owner WHERE surname IS NOT NULL;
 surname  |    login
----------+-------------
 Doe      | johnd
 Smith    | janes
 Johnson  | anonymous_j
 Brown    | emily_b
 Wilson   | david_w
 Taylor   | sarah_t
 Anderson | lisa_a
(7 rows)

```

It doesn't work with the not equals operators `<>`, `!=`.

```
postgres=# SELECT surname, login FROM owner WHERE surname <> NULL;
 surname | login
---------+-------
(0 rows)

postgres=# SELECT surname, login FROM owner WHERE surname != NULL;
 surname | login
---------+-------
(0 rows)

```

**Inside the scope `BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name BETWEEN value_1 AND value_2;
```

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating BETWEEN 3 AND 4;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Jane Austen         | Pride and Prejudice                |      4
 Maya Angelou        | I Know Why the Caged Bird Sings    |      4
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Oscar Wilde         | The Picture of Dorian Gray         |      4
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(6 rows)

```

**Outside the scope `NOT BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT BETWEEN value_1 AND value_2;
```

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating NOT BETWEEN 3 AND 4;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Albert Einstein     | Speech to the German Physical Society  |      5
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Aristotle           | Nicomachean Ethics                     |      5
(4 rows)

```

**Inside the set `IN`**

```sql
SELECT columns FROM table_name WHERE column_name IN (value_1, value_2, value_3);
```

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating IN (3, 5);
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Albert Einstein     | Speech to the German Physical Society  |      5
 Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Virginia Woolf      | A Room of One's Own                    |      3
 Mark Twain          | The Adventures of Huckleberry Finn     |      3
 Aristotle           | Nicomachean Ethics                     |      5
(7 rows)

```

**Outside the set `NOT IN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT IN (value_1, value_2, value_3);
```

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating NOT IN (3, 5);
    author    |             source              | rating
--------------+---------------------------------+--------
 Jane Austen  | Pride and Prejudice             |      4
 Maya Angelou | I Know Why the Caged Bird Sings |      4
 Oscar Wilde  | The Picture of Dorian Gray      |      4
(3 rows)

```

##### Logical operators

**Logical product `AND`**

```sql
SELECT columns FROM table_name WHERE condition_1 AND condition_2;
```

```
postgres=# SELECT name, surname, login
postgres-# FROM owner
postgres-# WHERE name IS NOT NULL AND surname IS NOT NULL;
 name  | surname  |  login
-------+----------+---------
 John  | Doe      | johnd
 Jane  | Smith    | janes
 Emily | Brown    | emily_b
 David | Wilson   | david_w
 Sarah | Taylor   | sarah_t
 Lisa  | Anderson | lisa_a
(6 rows)

```

`AND` operator with comparison operators can be used instead of `BETWEEN` operator:

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating > 2 AND rating < 5;
       author        |               source               | rating
---------------------+------------------------------------+--------
 Jane Austen         | Pride and Prejudice                |      4
 Maya Angelou        | I Know Why the Caged Bird Sings    |      4
 Friedrich Nietzsche | Thus Spoke Zarathustra             |      3
 Oscar Wilde         | The Picture of Dorian Gray         |      4
 Virginia Woolf      | A Room of One's Own                |      3
 Mark Twain          | The Adventures of Huckleberry Finn |      3
(6 rows)

```

**Logical sum `OR`**

```sql
SELECT columns FROM table_name WHERE condition_1 OR condition_2;
```

```
postgres=# SELECT login
postgres-# FROM owner
postgres-# WHERE name IS NULL OR surname IS NULL;
    login
--------------
 anonymous_j
 mike_m
 mystery_user
 rob_123
(4 rows)

```

`OR` operator with comparison operators can be used instead of `NOT BETWEEN` operator:

```
postgres=# SELECT author, source, rating
postgres-# FROM quote
postgres-# WHERE rating < 3 OR rating > 4;
       author        |                 source                 | rating
---------------------+----------------------------------------+--------
 William Shakespeare | Hamlet                                 |      5
 Albert Einstein     | Speech to the German Physical Society  |      5
 Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 Aristotle           | Nicomachean Ethics                     |      5
(4 rows)

```

**Logical disjunction (ezclusive OR) `XOR`**

```sql
SELECT columns FROM table_name WHERE condition_1 XOR condition_2;
```

**`XOR` operator is not avaliable in PostgreSQL.**

```
postgres=# SELECT name, surname, login
postgres-# FROM owner
postgres-# WHERE name IS NULL XOR surname IS NULL;
ERROR:  syntax error at or near "XOR"
LINE 3: WHERE name IS NULL XOR surname IS NULL;
                           ^
```

**Logical negation `NOT`**

```sql
SELECT columns FROM table_name WHERE NOT condition;
```

```
postgres=# SELECT * FROM quote
postgres-# WHERE NOT owner_id = 106;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
(9 rows)

```

#### Select results order

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_1_name column_1_order, column_2_name column_2_order, column_3_name column_3_order;
```

Where **order** can be
* `ASC` - ascending
* `DESC` - descending

If not defined - it is ascending by default.

**Order by single column**

```
postgres=# SELECT * FROM quote
postgres-# ORDER BY rating;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
(10 rows)

```

**Order by multiple columns**

```
postgres=# SELECT * FROM quote
postgres-# ORDER BY rating, author;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
(10 rows)

```

**Ascending order `ASC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name ASC;
```


```
postgres=# SELECT * FROM quote
ORDER BY rating ASC;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
(10 rows)

```

```
postgres=# SELECT * FROM quote
ORDER BY rating ASC, author ASC;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
(10 rows)

```

**Descending order `DESC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name DESC;
```

```
postgres=# SELECT * FROM quote
ORDER BY rating DESC;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
(10 rows)

```

```
postgres=# SELECT * FROM quote
ORDER BY rating DESC, author DESC;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
(10 rows)

```

**Mixed order**

```
postgres=# SELECT * FROM quote
postgres-# ORDER BY rating ASC, author DESC;
 id | owner_id | content_id |       author        |                 source                 | rating
----+----------+------------+---------------------+----------------------------------------+--------
  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3
  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3
  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3
  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4
  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4
  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4
  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5
  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5
 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5
  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5
(10 rows)

```
