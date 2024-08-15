CREATE TABLE medium_type
(
    codename CHAR(8) PRIMARY KEY,
    description VARCHAR(256) NOT NULL
);

DESCRIBE medium_type;

INSERT INTO medium_type VALUES
    ('BOOK', 'A book'),
    ('CD', 'A CD'),
    ('VHS', 'A VHS tape');

SELECT * FROM medium_type;

INSERT INTO medium_type VALUES
    ('DVD', '');
INSERT INTO medium_type VALUES
    ('AUDIOCST', NULL);
INSERT INTO medium_type (codename) VALUES
    ('AUDIOCST');

SELECT * FROM medium_type;

CREATE TABLE user
(
    ID INTEGER PRIMARY KEY,
    personal_data_id INTEGER UNIQUE,
    confirmed BOOLEAN,
    active BIT
);

DESCRIBE user;

INSERT INTO user (ID, personal_data_id) VALUES (1, 1);
INSERT INTO user (ID, personal_data_id) VALUES (2, 1);
INSERT INTO user (ID, personal_data_id) VALUES (2, 2);

SELECT * FROM user;

CREATE TABLE storage_conditions
(
    medium_id INTEGER PRIMARY KEY,
    humidity FLOAT DEFAULT 40,
    temperature FLOAT(4) DEFAULT 23,
    air_pressure REAL DEFAULT 1013.25
);

DESCRIBE storage_conditions;

INSERT INTO storage_conditions (medium_id) VALUES (1);

SELECT * FROM storage_conditions;

CREATE TABLE physical_property
(
    medium_id INTEGER PRIMARY KEY,
    weight DECIMAL CHECK (weight >= 0),
    length NUMERIC,
    height NUMERIC(2) CHECK (height <= length),
    depth NUMERIC(2, 1) CHECK (depth <= height)
);

DESCRIBE physical_property;

INSERT INTO physical_property VALUES (1, 0.5, 3, 2, 1);
INSERT INTO physical_property VALUES (2, -0.5, 3, 2, 1);
INSERT INTO physical_property VALUES (3, 0.5, 3, 3.5, 1);
INSERT INTO physical_property VALUES (4, 0.5, 3, 2, 3);

SELECT * FROM physical_property;
