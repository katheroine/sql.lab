CREATE TABLE user
(
    ID INTEGER PRIMARY KEY,
    confirmed BOOLEAN,
    active BIT
);

DESCRIBE user;

INSERT INTO user VALUES
    (1, true, true),
    (2, false, false),
    (3, 1, 1),
    (4, 0, 0),
    (5, NULL, NULL);

SELECT * FROM user;
SELECT * FROM user WHERE confirmed = true;
SELECT * FROM user WHERE confirmed = false;
SELECT * FROM user WHERE confirmed = 1;
SELECT * FROM user WHERE confirmed = 0;
SELECT * FROM user WHERE confirmed IS NULL;
SELECT * FROM user WHERE active = true;
SELECT * FROM user WHERE active = false;
SELECT * FROM user WHERE active = 1;
SELECT * FROM user WHERE active = 0;
SELECT * FROM user WHERE active IS NULL;

CREATE TABLE physical_property
(
    medium_id INTEGER PRIMARY KEY,
    weight DECIMAL,
    length NUMERIC,
    height NUMERIC(2),
    depth NUMERIC(2, 1)
);

DESCRIBE physical_property;

INSERT INTO physical_property VALUES
    (1, 2, 1, 2, 3),
    (2, 2.5, 1.2, 2.3, 3.4);

SELECT * FROM physical_property;
SELECT * FROM physical_property WHERE weight = 2;
SELECT * FROM physical_property WHERE weight = 2.5;
SELECT * FROM physical_property WHERE weight > 2;