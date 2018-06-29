-- SQL Exercises
-- --------------------
-- Use the nobel database from class to answer the following questions.

-- 1. Select the nobel database.
USE nobel;
-- 2. List the tables.
SHOW tables;

-- 3. Select the first ten records from the laureate table.
SELECT * FROM laureate LIMIT 9
-- 4. Find the birth and death dates for Albert Einstein.
SELECT birth_date,death_date
FROM laureate
WHERE(name LIKE 'Albert Einstein%');
-- 5. Find the Nobel Laureates who died in 2015 and whose name begins with 'Y'.
SELECT *
FROM laureate
WHERE(name LIKE "Y%" AND death_date LIKE "2015%")
-- 6. Find the last three Nobel Laureates born in 1900.
SELECT * 
FROM laureate 
WHERE(birth_date LIKE "19%")
ORDER BY(birth_date)

-- 7. Find the number of Nobel Prizes awarded between 1950 and 1960.
SELECT COUNT(*)
FROM prize
WHERE('year'<=1960 AND 'year'>=1950)
-- 8. Find the number of Nobel Prizes awarded in each year.
SELECT YEAR, COUNT(year) AS num_prizes
FROM prize
GROUP BY YEAR

-- 9. In which year was the greatest number of Nobel Prizes awarded?
SELECT YEAR,COUNT(year) AS num_prizes
FROM prize
GROUP BY YEAR
ORDER BY(num_prizes) DESC
LIMIT 1

-- 10. What is the average number of Nobel Prizes awarded per year? Do we know how to do this yet?


-- 11. In which years were more than fifteen Nobel Prizes awarded?
SELECT YEAR,COUNT(year) AS num_prizes
FROM prize
GROUP BY YEAR
HAVING(num_prizes>15)
-- 12. Who is the Nobel Laureate with the shortest name?
SELECT MIN(name)
FROM laureate
-- 13. Which Nobel Laureate had the longest life? You might need to use IFNULL().
SELECT MAX(ifnull(death_date- birth_date,0))
FROM laureate

-- 14. Which year has the most women Nobel Laureates?
SELECT YEAR,sex,count(*)
FROM laureate
JOIN prize
ON laureate.id= prize.laureate_id
WHERE sex='F'
GROUP BY YEAR


-- 15. Which category has the most women Nobel Laureates?
SELECT YEAR,category,COUNT(*)
FROM laureate JOIN prize
ON laureate.id=prize.laureate_id
GROUP BY category
-- 16. What is the average number of Nobel Prizes awarded per year?