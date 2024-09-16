SELECT group_name, COUNT(*) FROM user
GROUP BY group_name;

SELECT group_name, COUNT(*) FROM user_account
GROUP BY group_name;

SELECT group_name, AVG(credits) AS "average credits" FROM user
GROUP BY group_name
ORDER BY "average credits";

SELECT group_name, AVG(credits) AS "average credits" FROM user
GROUP BY group_name
ORDER BY AVG(credits);

SELECT group_name, AVG(credits) AS "average credits" FROM user_account
GROUP BY group_name
ORDER BY "average credits";

SELECT
    group_name,
    MIN(credits) AS "minimal credits",
    MAX(credits) AS "maximal credits"
FROM user
GROUP BY group_name;

SELECT
    group_name,
    MIN(credits) AS "minimal credits",
    MAX(credits) AS "maximal credits"
FROM user_account
GROUP BY group_name;

SELECT
    group_name,
    MIN(credits) AS "minimal credits",
    MAX(credits) AS "maximal credits"
FROM user
GROUP BY group_name
HAVING AVG(credits) > 50;

SELECT
    group_name,
    MIN(credits) AS "minimal credits",
    MAX(credits) AS "maximal credits"
FROM user_account
GROUP BY group_name
HAVING AVG(credits) > 50;