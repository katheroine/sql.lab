[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)

### Queries

**Database preparation**

```sql
CREATE TABLE quote
(
    ID SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (1, 101, 1, 'William Shakespeare', 'Hamlet', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 4);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3);
INSERT INTO quote (ID, owner_id, content_id, author, source, rating) VALUES (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);
```

#### Scope

##### Selecting all columns of all records

```sql
SELECT * FROM table_name;
```

```
sqlite> SELECT * FROM quote;
1|101|1|William Shakespeare|Hamlet|5
2|102|2|Jane Austen|Pride and Prejudice|4
3|103|4|Albert Einstein|Speech to the German Physical Society|5
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
8|108|11|Virginia Woolf|A Room of One's Own|4
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
10|110|14|Aristotle|Nicomachean Ethics|5
```

##### Selecting chosen columns of all records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name;
```

```
sqlite> SELECT author, source
   ...> FROM quote;
William Shakespeare|Hamlet
Jane Austen|Pride and Prejudice
Albert Einstein|Speech to the German Physical Society
Maya Angelou|I Know Why the Caged Bird Sings
Friedrich Nietzsche|Thus Spoke Zarathustra
Oscar Wilde|The Picture of Dorian Gray
Mahatma Gandhi|The Story of My Experiments with Truth
Virginia Woolf|A Room of One's Own
Mark Twain|The Adventures of Huckleberry Finn
Aristotle|Nicomachean Ethics
```

##### Selecting all columns of chosen records

```sql
SELECT * FROM table_name
WHERE conditions;
```

```
sqlite> SELECT * FROM quote
   ...> WHERE owner_id = 106;
6|106|Oscar Wilde|The Picture of Dorian Gray|4
```

##### Selecting chosen columns of chosen records

```sql
SELECT column_1_name, column_2_name, column_3_name
FROM table_name
WHERE conditions;
```

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating >= 4;
William Shakespeare|Hamlet|5
Jane Austen|Pride and Prejudice|4
Albert Einstein|Speech to the German Physical Society|5
Maya Angelou|I Know Why the Caged Bird Sings|4
Oscar Wilde|The Picture of Dorian Gray|4
Mahatma Gandhi|The Story of My Experiments with Truth|5
Virginia Woolf|A Room of One's Own|4
Aristotle|Nicomachean Ethics|5
```
