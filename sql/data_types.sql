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

SELECT * FROM storage_conditions WHERE humidity = 40.532;
SELECT * FROM storage_conditions WHERE humidity > 40.4 AND humidity < 40.6;

CREATE TABLE file
(
    ID INTEGER PRIMARY KEY,
    mode BINARY(3)
);

DESCRIBE file;

INSERT INTO file VALUES
    (1, 777),
    (2, 755),
    (3, 740);

SELECT * FROM file;

CREATE TABLE medium_type
(
    codename CHAR(8) PRIMARY KEY,
    description VARCHAR(256)
);

DESCRIBE medium_type;

INSERT INTO medium_type VALUES
    ('BOOK', 'A book'),
    ('CD', 'A CD'),
    ('VHS', 'A VHS tape');

SELECT * FROM medium_type;
SELECT * FROM medium_type WHERE description LIKE '%tape';

CREATE TABLE points
(
    user_id INTEGER,
    quote_id INTEGER,
    quantity INTEGER,
    date DATE,
    time TIME,
    datetime DATETIME,
    timestamp TIMESTAMP,
    PRIMARY KEY (user_id, quote_id)
);

DESCRIBE points;

INSERT INTO points VALUES
    (1, 2, 5, '2016/12/12', '12:00', '2016/12/12 12:00', '2016/12/12 12:00'),
    (2, 3, 3, '2017-2-1', '10:20:5', '2017-2-1T10:20:5', '2017-2-1T10:20:5'),
    (3, 1, 1, "2018.5.20", "9:15:0.10", "2018.5.20 9:15:0.10", "2018.5.20 9:15:0.10");


SELECT * FROM points;
