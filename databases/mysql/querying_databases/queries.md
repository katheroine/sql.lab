[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▼ Next: Aggregete functions](aggregate_functions.md)

### Queries

**Database preparation**

```sql
CREATE TABLE quote
(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
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
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
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
mysql> SELECT * FROM quote;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```

##### Selecting chosen columns of all records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name;
```

```
mysql> SELECT author, source
    -> FROM quote;
+---------------------+----------------------------------------+
| author              | source                                 |
+---------------------+----------------------------------------+
| William Shakespeare | Hamlet                                 |
| Jane Austen         | Pride and Prejudice                    |
| Albert Einstein     | Speech to the German Physical Society  |
| Maya Angelou        | I Know Why the Caged Bird Sings        |
| Friedrich Nietzsche | Thus Spoke Zarathustra                 |
| Oscar Wilde         | The Picture of Dorian Gray             |
| Mahatma Gandhi      | The Story of My Experiments with Truth |
| Virginia Woolf      | A Room of One's Own                    |
| Mark Twain          | The Adventures of Huckleberry Finn     |
| Aristotle           | Nicomachean Ethics                     |
+---------------------+----------------------------------------+
10 rows in set (0,001 sec)

```

##### Selecting all columns of chosen records

```sql
SELECT * FROM table_name
WHERE conditions;
```

```
mysql> SELECT * FROM quote
    -> WHERE owner_id = 106;
+----+----------+-------------+----------------------------+--------+
| ID | owner_id | author      | source                     | rating |
+----+----------+-------------+----------------------------+--------+
|  6 |      106 | Oscar Wilde | The Picture of Dorian Gray |      4 |
+----+----------+-------------+----------------------------+--------+
1 row in set (0,004 sec)

```

##### Selecting chosen columns of chosen records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name
WHERE conditions;
```

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating >= 4;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Jane Austen         | Pride and Prejudice                    |      4 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
| Oscar Wilde         | The Picture of Dorian Gray             |      4 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Virginia Woolf      | A Room of One's Own                    |      4 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
8 rows in set (0,011 sec)

```

#### Column aliases

```sql
SELECT column_1_name AS column_1_alias, column_2_name AS column_2_alias, column_3_name AS column_3_alias
FROM table_name;
```

```
mysql> SELECT author AS creator, source, rating AS popularity
    -> FROM quote;
+---------------------+----------------------------------------+------------+
| creator             | source                                 | popularity |
+---------------------+----------------------------------------+------------+
| William Shakespeare | Hamlet                                 |          5 |
| Jane Austen         | Pride and Prejudice                    |          4 |
| Albert Einstein     | Speech to the German Physical Society  |          5 |
| Maya Angelou        | I Know Why the Caged Bird Sings        |          4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra                 |          3 |
| Oscar Wilde         | The Picture of Dorian Gray             |          4 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |          5 |
| Virginia Woolf      | A Room of One's Own                    |          3 |
| Mark Twain          | The Adventures of Huckleberry Finn     |          3 |
| Aristotle           | Nicomachean Ethics                     |          5 |
+---------------------+----------------------------------------+------------+
10 rows in set (0,001 sec)

```

#### Select criteria

##### Relational operators

**Equal `=`**

```sql
SELECT columns FROM table_name WHERE column_name = value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating = 5;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
4 rows in set (0,004 sec)

```

**Different `<>`, `!=`**

```sql
SELECT columns FROM table_name WHERE column_name <> value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating <> 5;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Jane Austen         | Pride and Prejudice                |      4 |
| Maya Angelou        | I Know Why the Caged Bird Sings    |      4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Oscar Wilde         | The Picture of Dorian Gray         |      4 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
6 rows in set (0,001 sec)

```

```sql
SELECT columns FROM table_name WHERE column_name != value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating != 5;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Jane Austen         | Pride and Prejudice                |      4 |
| Maya Angelou        | I Know Why the Caged Bird Sings    |      4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Oscar Wilde         | The Picture of Dorian Gray         |      4 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
6 rows in set (0,001 sec)

```

**Smaller than `<`**

```sql
SELECT columns FROM table_name WHERE column_name < value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating < 4;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
3 rows in set (0,001 sec)

```

**Smaller than or equals `<=`**

```sql
SELECT columns FROM table_name WHERE column_name <= value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating <= 4;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Jane Austen         | Pride and Prejudice                |      4 |
| Maya Angelou        | I Know Why the Caged Bird Sings    |      4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Oscar Wilde         | The Picture of Dorian Gray         |      4 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
6 rows in set (0,001 sec)

```

**Greater than `>`**

```sql
SELECT columns FROM table_name WHERE column_name > value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating > 4;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
4 rows in set (0,001 sec)

```

**Greater than or equals `>=`**

```sql
SELECT columns FROM table_name WHERE column_name >= value;
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating >= 4;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Jane Austen         | Pride and Prejudice                    |      4 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
| Oscar Wilde         | The Picture of Dorian Gray             |      4 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
7 rows in set (0,001 sec)

```

**`IS NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NULL;
```

```
mysql> SELECT surname, login FROM owner WHERE name IS NULL;
+---------+--------------+
| surname | login        |
+---------+--------------+
| Johnson | anonymous_j  |
| NULL    | mystery_user |
+---------+--------------+
2 rows in set (0,004 sec)

```

It doesn't work with the equals operator `=`.

```
mysql> SELECT surname, login FROM owner WHERE name = NULL;
Empty set (0,003 sec)

```

**`IS NOT NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NOT NULL;
```

```
mysql> SELECT surname, login FROM owner WHERE surname IS NOT NULL;
+----------+-------------+
| surname  | login       |
+----------+-------------+
| Doe      | johnd       |
| Smith    | janes       |
| Johnson  | anonymous_j |
| Brown    | emily_b     |
| Wilson   | david_w     |
| Taylor   | sarah_t     |
| Anderson | lisa_a      |
+----------+-------------+
7 rows in set (0,001 sec)

```

It doesn't work with the not equals operators `<>`, `!=`.

```
mysql> SELECT surname, login FROM owner WHERE surname <> NULL;
Empty set (0,001 sec)

mysql> SELECT surname, login FROM owner WHERE surname != NULL;
Empty set (0,001 sec)

```

**Inside the scope `BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name BETWEEN value_1 AND value_2;
```

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating BETWEEN 3 AND 4;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Jane Austen         | Pride and Prejudice                |      4 |
| Maya Angelou        | I Know Why the Caged Bird Sings    |      4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Oscar Wilde         | The Picture of Dorian Gray         |      4 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
6 rows in set (0,004 sec)

```

**Outside the scope `NOT BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT BETWEEN value_1 AND value_2;
```

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating NOT BETWEEN 3 AND 4;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
4 rows in set (0,000 sec)

```

**Inside the set `IN`**

```sql
SELECT columns FROM table_name WHERE column_name IN (value_1, value_2, value_3);
```

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating IN (3, 5);
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Virginia Woolf      | A Room of One's Own                    |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
7 rows in set (0,001 sec)

```

**Outside the set `NOT IN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT IN (value_1, value_2, value_3);
```

```
mysql> SELECT author, source, rating FROM quote WHERE rating NOT IN (3, 5);
+--------------+---------------------------------+--------+
| author       | source                          | rating |
+--------------+---------------------------------+--------+
| Jane Austen  | Pride and Prejudice             |      4 |
| Maya Angelou | I Know Why the Caged Bird Sings |      4 |
| Oscar Wilde  | The Picture of Dorian Gray      |      4 |
+--------------+---------------------------------+--------+
3 rows in set (0,001 sec)

```

**Logical sum `OR`**

```sql
SELECT columns FROM table_name WHERE condition_1 OR condition_2;
```

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

##### Logical operators

**Logical product `AND`**

```sql
SELECT columns FROM table_name WHERE condition_1 AND condition_2;
```

```
mysql> SELECT name, surname, login
    -> FROM owner
    -> WHERE name IS NOT NULL AND surname IS NOT NULL;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    18
Current database: quote_sql_lab

+-------+----------+---------+
| name  | surname  | login   |
+-------+----------+---------+
| John  | Doe      | johnd   |
| Jane  | Smith    | janes   |
| Emily | Brown    | emily_b |
| David | Wilson   | david_w |
| Sarah | Taylor   | sarah_t |
| Lisa  | Anderson | lisa_a  |
+-------+----------+---------+
6 rows in set (0,011 sec)

```

`AND` operator with comparison operators can be used instead of `BETWEEN` operator:

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating > 2 AND rating < 5;
+---------------------+------------------------------------+--------+
| author              | source                             | rating |
+---------------------+------------------------------------+--------+
| Jane Austen         | Pride and Prejudice                |      4 |
| Maya Angelou        | I Know Why the Caged Bird Sings    |      4 |
| Friedrich Nietzsche | Thus Spoke Zarathustra             |      3 |
| Oscar Wilde         | The Picture of Dorian Gray         |      4 |
| Virginia Woolf      | A Room of One's Own                |      3 |
| Mark Twain          | The Adventures of Huckleberry Finn |      3 |
+---------------------+------------------------------------+--------+
6 rows in set (0,004 sec)

```

**Logical sum `OR`**

```sql
SELECT columns FROM table_name WHERE condition_1 OR condition_2;
```

```
mysql> SELECT login
    -> FROM owner
    -> WHERE name IS NULL OR surname IS NULL;
+--------------+
| login        |
+--------------+
| anonymous_j  |
| mike_m       |
| mystery_user |
| rob_123      |
+--------------+
4 rows in set (0,001 sec)

```

`OR` operator with comparison operators can be used instead of `NOT BETWEEN` operator:

```
mysql> SELECT author, source, rating
    -> FROM quote
    -> WHERE rating < 3 OR rating > 4;
+---------------------+----------------------------------------+--------+
| author              | source                                 | rating |
+---------------------+----------------------------------------+--------+
| William Shakespeare | Hamlet                                 |      5 |
| Albert Einstein     | Speech to the German Physical Society  |      5 |
| Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| Aristotle           | Nicomachean Ethics                     |      5 |
+---------------------+----------------------------------------+--------+
4 rows in set (0,001 sec)

```

**Logical disjunction (ezclusive OR) `XOR`**

```sql
SELECT columns FROM table_name WHERE condition_1 XOR condition_2;
```

```
mysql> SELECT name, surname, login
    -> FROM owner
    -> WHERE name IS NULL XOR surname IS NULL;
+---------+---------+-------------+
| name    | surname | login       |
+---------+---------+-------------+
| NULL    | Johnson | anonymous_j |
| Michael | NULL    | mike_m      |
| Robert  | NULL    | rob_123     |
+---------+---------+-------------+
3 rows in set (0,001 sec)

```

**Logical negation `NOT`**

```sql
SELECT columns FROM table_name WHERE NOT condition;
```

```
mysql> SELECT * FROM quote
    -> WHERE NOT owner_id = 106;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
9 rows in set (0,004 sec)

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
mysql> SELECT * FROM quote
    -> ORDER BY rating;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,006 sec)

```

**Order by multiple columns**

```
mysql> SELECT * FROM quote
    -> ORDER BY rating, author;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```

**Ascending order `ASC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name ASC;
```

```
mysql> SELECT * FROM quote
    -> ORDER BY rating ASC;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,004 sec)

```

```
mysql> SELECT * FROM quote
    -> ORDER BY rating ASC, author ASC;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```

**Descending order `DESC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name DESC;
```

```
mysql> SELECT * FROM quote
    -> ORDER BY rating DESC;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```

```
mysql> SELECT * FROM quote
    -> ORDER BY rating DESC, author DESC;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```

**Mixed order**

```
mysql> SELECT * FROM quote
    -> ORDER BY rating ASC, author DESC;
+----+----------+------------+---------------------+----------------------------------------+--------+
| ID | owner_id | content_id | author              | source                                 | rating |
+----+----------+------------+---------------------+----------------------------------------+--------+
|  8 |      108 |         11 | Virginia Woolf      | A Room of One's Own                    |      3 |
|  9 |      109 |         12 | Mark Twain          | The Adventures of Huckleberry Finn     |      3 |
|  5 |      105 |          7 | Friedrich Nietzsche | Thus Spoke Zarathustra                 |      3 |
|  6 |      106 |          9 | Oscar Wilde         | The Picture of Dorian Gray             |      4 |
|  4 |      104 |          6 | Maya Angelou        | I Know Why the Caged Bird Sings        |      4 |
|  2 |      102 |          2 | Jane Austen         | Pride and Prejudice                    |      4 |
|  1 |      101 |          1 | William Shakespeare | Hamlet                                 |      5 |
|  7 |      107 |         10 | Mahatma Gandhi      | The Story of My Experiments with Truth |      5 |
| 10 |      110 |         14 | Aristotle           | Nicomachean Ethics                     |      5 |
|  3 |      103 |          4 | Albert Einstein     | Speech to the German Physical Society  |      5 |
+----+----------+------------+---------------------+----------------------------------------+--------+
10 rows in set (0,001 sec)

```
