[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)

### Queries

**Database preparation**

```sql
CREATE TABLE quote
(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES
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
