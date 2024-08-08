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

CREATE TABLE rating
(
    quote_id INTEGER PRIMARY KEY,
    rate INTEGER,
    class SMALLINT,
    points BIGINT
);

INSERT INTO rating VALUES
    (1, 1, 3, 1356),
    (2, 3, 2, 2741),
    (3, 5, 1, 6420);

SELECT * FROM rating;
SELECT * FROM rating WHERE class >= 2;
SELECT * FROM rating WHERE points > (10000 / 3);

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

CREATE TABLE storage_conditions
(
    medium_id INTEGER PRIMARY KEY,
    humidity FLOAT,
    temperature FLOAT(4),
    air_pressure REAL
);

DESCRIBE storage_conditions;

INSERT INTO storage_conditions VALUES
    (1, 40.532, 19.75, 1054.5),
    (2, 30.95, 15.6, 1020),
    (3, 35, 16, 1036.455);
