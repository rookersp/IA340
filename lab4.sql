--4.1
/*Question 1: no, conflict due to there still being a VA in records.*/

--4.2
/*Question 2: No, because there is no fips 80 and in order to maintain consistancy there would need to be an fips 80 in the name table.*/

--4.3
/*Question 3: The code is imperfect but generally pretty strong.*/

--4.5
/*Question 3: A stromg showing from ChatGPT and a nuanced interpertation of the prompt.*/

--4.6
/*This code worked perfectly.
 SELECT 
    n.name, 
    i.income, 
    i.year
FROM 
    income i
JOIN 
    name n 
ON 
    i.fips = n.fips
WHERE 
    i.year = (SELECT MAX(year) FROM income)  -- Get the most recent year
ORDER BY 
    i.income DESC
LIMIT 1;  -- Get the state with the highest income
*/ 



--4.7
/* I attempted to ammend this code several times. During none of my changes did it seem to work very scucessfully.
-- Prompt: Produce the VA population growth rate in the past five years.
-- Yes, I modified the query to add a safeguard for cases where the population at the start year is zero.

-- Formula for population growth rate:
-- ((Population at latest year - Population at 5 years ago) / Population at 5 years ago) * 100

-- The FIPS code for Virginia is '51'.

*/

WITH PopulationData AS (
    SELECT
        year,
        population
    FROM
        population
    WHERE
        fips = '51'
    ORDER BY
        year DESC
    LIMIT 5
)
SELECT
    ((MAX(population) - MIN(population))::decimal / MIN(population)) * 100 AS growth_rate
FROM
    PopulationData;*/



--4.8
/* With a bit of prodding ChatGPT produces answers that are closer to being correct. But its immediate answers do not always seem correct.*/
