[⌂ Home](../../../README.md)
[⬆ Up: Querying databases](README.md)
[▼ Next: Aggregete functions](aggregate_functions.md)

### Queries

**Database preparation**

```sql
CREATE TABLE quote
(
    id INTEGER PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    content_id INTEGER NOT NULL UNIQUE,
    author VARCHAR(256),
    source VARCHAR(512),
    rating INTEGER
);

INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (1, 101, 1, 'William Shakespeare', 'Hamlet', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (2, 102, 2, 'Jane Austen', 'Pride and Prejudice', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (3, 103, 4, 'Albert Einstein', 'Speech to the German Physical Society', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (4, 104, 6, 'Maya Angelou', 'I Know Why the Caged Bird Sings', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (5, 105, 7, 'Friedrich Nietzsche', 'Thus Spoke Zarathustra', 3);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (6, 106, 9, 'Oscar Wilde', 'The Picture of Dorian Gray', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (7, 107, 10, 'Mahatma Gandhi', 'The Story of My Experiments with Truth', 5);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (8, 108, 11, 'Virginia Woolf', 'A Room of One''s Own', 4);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (9, 109, 12, 'Mark Twain', 'The Adventures of Huckleberry Finn', 3);
INSERT INTO quote (id, owner_id, content_id, author, source, rating) VALUES (10, 110, 14, 'Aristotle', 'Nicomachean Ethics', 5);

CREATE TABLE owner
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    surname VARCHAR(256),
    login VARCHAR(256) NOT NULL UNIQUE
);

INSERT INTO owner (id, name, surname, login) VALUES (101, 'John', 'Doe', 'johnd');
INSERT INTO owner (id, name, surname, login) VALUES (102, 'Jane', 'Smith', 'janes');
INSERT INTO owner (id, name, surname, login) VALUES (103, NULL, 'Johnson', 'anonymous_j');
INSERT INTO owner (id, name, surname, login) VALUES (104, 'Michael', NULL, 'mike_m');
INSERT INTO owner (id, name, surname, login) VALUES (105, 'Emily', 'Brown', 'emily_b');
INSERT INTO owner (id, name, surname, login) VALUES (106, NULL, NULL, 'mystery_user');
INSERT INTO owner (id, name, surname, login) VALUES (107, 'David', 'Wilson', 'david_w');
INSERT INTO owner (id, name, surname, login) VALUES (108, 'Sarah', 'Taylor', 'sarah_t');
INSERT INTO owner (id, name, surname, login) VALUES (109, 'Robert', NULL, 'rob_123');
INSERT INTO owner (id, name, surname, login) VALUES (110, 'Lisa', 'Anderson', 'lisa_a');
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

#### Column aliases

```sql
SELECT column_1_name AS column_1_alias, column_2_name AS column_2_alias, column_3_name AS column_3_alias
FROM table_name;
```

```
sqlite> SELECT author AS creator, source, rating AS popularity
   ...> FROM quote;
William Shakespeare|Hamlet|5
Jane Austen|Pride and Prejudice|4
Albert Einstein|Speech to the German Physical Society|5
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Mahatma Gandhi|The Story of My Experiments with Truth|5
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
Aristotle|Nicomachean Ethics|5
```

#### Select criteria

##### Relational operators

**Equal `=`**

```
sqlite> SELECT author, source, rating FROM quote WHERE rating = 5;
William Shakespeare|Hamlet|5
Albert Einstein|Speech to the German Physical Society|5
Mahatma Gandhi|The Story of My Experiments with Truth|5
Aristotle|Nicomachean Ethics|5
```

**Different `<>`, `!=`**

```sql
SELECT columns FROM table_name WHERE column_name <> column_value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating <> 5;
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
```

```sql
SELECT columns FROM table_name WHERE column_name != column_value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating != 5;
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
```

**Smaller than `<`**

```sql
SELECT columns FROM table_name WHERE column_name < value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating < 4;
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Mark Twain|The Adventures of Huckleberry Finn|3
```

**Smaller than or equals `<=`**

```sql
SELECT columns FROM table_name WHERE column_name <= value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating <= 4;
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
```

**Greater than `>`**

```sql
SELECT columns FROM table_name WHERE column_name > value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating > 4;
William Shakespeare|Hamlet|5
Albert Einstein|Speech to the German Physical Society|5
Mahatma Gandhi|The Story of My Experiments with Truth|5
Aristotle|Nicomachean Ethics|5
```

**Greater than or equals `>=`**

```sql
SELECT columns FROM table_name WHERE column_name >= value;
```

```
sqlite> SELECT author, source, rating FROM quote WHERE rating >= 4;
William Shakespeare|Hamlet|5
Jane Austen|Pride and Prejudice|4
Albert Einstein|Speech to the German Physical Society|5
Maya Angelou|I Know Why the Caged Bird Sings|4
Oscar Wilde|The Picture of Dorian Gray|4
Mahatma Gandhi|The Story of My Experiments with Truth|5
Virginia Woolf|A Room of One's Own|4
Aristotle|Nicomachean Ethics|5
```

**`IS NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NULL;
```

```
sqlite> SELECT surname, login FROM owner WHERE name IS NULL;
Johnson|anonymous_j
|mystery_user
```

It doesn't work with the equals operator `=`.

```
sqlite> SELECT surname, login FROM owner WHERE name = NULL;
```

**`IS NOT NULL`**

```sql
SELECT columns FROM table_name WHERE column_name IS NOT NULL;
```

```
sqlite> SELECT surname, login FROM owner WHERE surname IS NOT NULL;
Doe|johnd
Smith|janes
Johnson|anonymous_j
Brown|emily_b
Wilson|david_w
Taylor|sarah_t
Anderson|lisa_a
```

It doesn't work with the not equals operators `<>`, `!=`.

```
sqlite> SELECT surname, login FROM owner WHERE surname <> NULL;
sqlite> SELECT surname, login FROM owner WHERE surname != NULL;
```

**Inside the scope `BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name BETWEEN value_1 AND value_2;
```

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating BETWEEN 3 AND 4;
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
```

**Outside the scope `NOT BETWEEN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT BETWEEN value_1 AND value_2;
```

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating NOT BETWEEN 3 AND 4;
William Shakespeare|Hamlet|5
Albert Einstein|Speech to the German Physical Society|5
Mahatma Gandhi|The Story of My Experiments with Truth|5
Aristotle|Nicomachean Ethics|5
```

**Inside the set `IN`**

```sql
SELECT columns FROM table_name WHERE column_name IN (value_1, value_2, value_3);
```

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating IN (3, 5);
William Shakespeare|Hamlet|5
Albert Einstein|Speech to the German Physical Society|5
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Mahatma Gandhi|The Story of My Experiments with Truth|5
Mark Twain|The Adventures of Huckleberry Finn|3
Aristotle|Nicomachean Ethics|5
```

**Outside the set `NOT IN`**

```sql
SELECT columns FROM table_name WHERE column_name NOT IN (value_1, value_2, value_3);
```

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating NOT IN (3, 5);
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
```

##### Logical operators

**Logical product `AND`**

```sql
SELECT columns FROM table_name WHERE condition_1 AND condition_2;
```

```
sqlite> SELECT name, surname, login
   ...> FROM owner
   ...> WHERE name IS NOT NULL AND surname IS NOT NULL;
John|Doe|johnd
Jane|Smith|janes
Emily|Brown|emily_b
David|Wilson|david_w
Sarah|Taylor|sarah_t
Lisa|Anderson|lisa_a
```

`AND` operator with comparison operators can be used instead of `BETWEEN` operator:

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating > 2 AND rating < 5;
Jane Austen|Pride and Prejudice|4
Maya Angelou|I Know Why the Caged Bird Sings|4
Friedrich Nietzsche|Thus Spoke Zarathustra|3
Oscar Wilde|The Picture of Dorian Gray|4
Virginia Woolf|A Room of One's Own|4
Mark Twain|The Adventures of Huckleberry Finn|3
```

**Logical sum `OR`**

```sql
SELECT columns FROM table_name WHERE condition_1 OR condition_2;
```

```
sqlite> SELECT name, surname, login
   ...> FROM owner
   ...> WHERE name IS NOT NULL AND surname IS NOT NULL;
John|Doe|johnd
Jane|Smith|janes
Emily|Brown|emily_b
David|Wilson|david_w
Sarah|Taylor|sarah_t
Lisa|Anderson|lisa_a
```

`OR` operator with comparison operators can be used instead of `NOT BETWEEN` operator:

```
sqlite> SELECT author, source, rating
   ...> FROM quote
   ...> WHERE rating < 3 OR rating > 4;
William Shakespeare|Hamlet|5
Albert Einstein|Speech to the German Physical Society|5
Mahatma Gandhi|The Story of My Experiments with Truth|5
Aristotle|Nicomachean Ethics|5
```

**Logical disjunction (ezclusive OR) `XOR`**

```sql
SELECT columns FROM table_name WHERE condition_1 XOR condition_2;
```

**`XOR` operator is not avaliable in SQLite.**

```
sqlite> SELECT name, surname, login
   ...> FROM owner
   ...> WHERE name IS NULL XOR surname IS NULL;
SQL error: near "XOR": syntax error
```

**Logical negation `NOT`**

```sql
SELECT columns FROM table_name WHERE NOT condition;
```

```
sqlite> SELECT * FROM quote
   ...> WHERE NOT owner_id = 106;
1|101|1|William Shakespeare|Hamlet|5
2|102|2|Jane Austen|Pride and Prejudice|4
3|103|4|Albert Einstein|Speech to the German Physical Society|5
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
8|108|11|Virginia Woolf|A Room of One's Own|4
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
10|110|14|Aristotle|Nicomachean Ethics|5
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
sqlite> SELECT * FROM quote
   ...> ORDER BY rating;
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
8|108|11|Virginia Woolf|A Room of One's Own|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
2|102|2|Jane Austen|Pride and Prejudice|4
10|110|14|Aristotle|Nicomachean Ethics|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
3|103|4|Albert Einstein|Speech to the German Physical Society|5
1|101|1|William Shakespeare|Hamlet|5
```

**Order by multiple columns**

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating, author;
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
2|102|2|Jane Austen|Pride and Prejudice|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
8|108|11|Virginia Woolf|A Room of One's Own|4
3|103|4|Albert Einstein|Speech to the German Physical Society|5
10|110|14|Aristotle|Nicomachean Ethics|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
1|101|1|William Shakespeare|Hamlet|5
```

**Ascending order `ASC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name ASC;
```

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating ASC;
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
8|108|11|Virginia Woolf|A Room of One's Own|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
2|102|2|Jane Austen|Pride and Prejudice|4
10|110|14|Aristotle|Nicomachean Ethics|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
3|103|4|Albert Einstein|Speech to the German Physical Society|5
1|101|1|William Shakespeare|Hamlet|5
```

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating ASC, author ASC;
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
2|102|2|Jane Austen|Pride and Prejudice|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
8|108|11|Virginia Woolf|A Room of One's Own|4
3|103|4|Albert Einstein|Speech to the German Physical Society|5
10|110|14|Aristotle|Nicomachean Ethics|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
1|101|1|William Shakespeare|Hamlet|5
```

**Descending order `DESC`**

```sql
SELECT columns
FROM table_name
WHERE conditions
ORDER BY column_name DESC;
```

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating DESC;
10|110|14|Aristotle|Nicomachean Ethics|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
3|103|4|Albert Einstein|Speech to the German Physical Society|5
1|101|1|William Shakespeare|Hamlet|5
8|108|11|Virginia Woolf|A Room of One's Own|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
2|102|2|Jane Austen|Pride and Prejudice|4
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
```

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating DESC, author DESC;
1|101|1|William Shakespeare|Hamlet|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
10|110|14|Aristotle|Nicomachean Ethics|5
3|103|4|Albert Einstein|Speech to the German Physical Society|5
8|108|11|Virginia Woolf|A Room of One's Own|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
2|102|2|Jane Austen|Pride and Prejudice|4
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
```

**Mixed order**

```
sqlite> SELECT * FROM quote
   ...> ORDER BY rating ASC, author DESC;
9|109|12|Mark Twain|The Adventures of Huckleberry Finn|3
5|105|7|Friedrich Nietzsche|Thus Spoke Zarathustra|3
8|108|11|Virginia Woolf|A Room of One's Own|4
6|106|9|Oscar Wilde|The Picture of Dorian Gray|4
4|104|6|Maya Angelou|I Know Why the Caged Bird Sings|4
2|102|2|Jane Austen|Pride and Prejudice|4
1|101|1|William Shakespeare|Hamlet|5
7|107|10|Mahatma Gandhi|The Story of My Experiments with Truth|5
10|110|14|Aristotle|Nicomachean Ethics|5
3|103|4|Albert Einstein|Speech to the German Physical Society|5
```
