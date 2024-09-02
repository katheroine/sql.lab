CREATE TABLE storage_conditions
(
    medium_id INTEGER PRIMARY KEY,
    humidity FLOAT DEFAULT 40,
    temperature FLOAT(4) DEFAULT 23,
    air_pressure REAL DEFAULT 1013.25
);

INSERT INTO storage_conditions VALUES
    (1, 38, 22, 1013.5),
    (2, 42, 20, 1014),
    (4, 41, 18, 1012.25);

SELECT * FROM storage_conditions;

UPDATE storage_conditions SET
    temperature = 22.3,
    air_pressure = 1013
WHERE medium_id = 1;

SELECT * FROM storage_conditions;

UPDATE storage_conditions SET
    humidity = 41.5
WHERE humidity >= 40 AND humidity < 43;
