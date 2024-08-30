CREATE TABLE medium_type
(
    codename CHAR(8) PRIMARY KEY,
    description VARCHAR(256) NOT NULL
);

INSERT INTO medium_type VALUES
    ('BOOK', 'A book'),
    ('CD', 'A CD'),
    ('VHS', 'A VHS tape');

SELECT * FROM medium_type;

CREATE TABLE user
(
    id INTEGER PRIMARY KEY,
    personal_data_id INTEGER UNIQUE,
    confirmed BOOLEAN,
    active BIT
);

INSERT INTO user (ID, personal_data_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

SELECT * FROM user;

INSERT INTO user SET ID = 4, personal_data_id = 4;

SELECT * FROM user;
