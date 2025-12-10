USE berlincrimes;

ALTER TABLE `bridge`
ADD FOREIGN KEY(`code`) REFERENCES `population`(`postal_code`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `crime`
ADD FOREIGN KEY(`district_ID`) REFERENCES `bridge`(`district_ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;


SELECT District from crimes;

SELECT DISTINCT district
FROM population;




SELECT
    postal_code,
    COUNT(*) AS count_of_duplicates
FROM
    population
GROUP BY
    postal_code
HAVING
    COUNT(*) > 1;
    
SELECT
    District,
    COUNT(*) AS count_of_duplicates
FROM
    crimes
GROUP BY
    District
HAVING
    COUNT(*) > 1;
    
SELECT
    Location,
    COUNT(*) AS count_of_duplicates
FROM
    crimes
GROUP BY
    Location
HAVING
    COUNT(*) > 1;
    
SELECT
    Code,
    COUNT(*) AS count_of_duplicates
FROM
    crimes
GROUP BY
    Code
HAVING
    COUNT(*) > 1;
    
SELECT
    location,
    COUNT(*) AS count_of_duplicates
FROM
    locations
GROUP BY
    location
HAVING
    COUNT(*) > 1;



-- CRI Analysis by District

SELECT
    -- Population table is T1, Crimes table (subquery) is T2
    T1.district,
    SUM(T2.Total_Crimes) AS Total_Crimes_Reported,
    SUM(T1.total) AS Total_Population,
    -- Calculate crime rate per 1000 residents
    (CAST(SUM(T2.Total_Crimes) AS REAL) * 1000) / SUM(T1.total) AS Crime_Rate_per_1000
FROM
    Population T1
INNER JOIN
    (
        SELECT
            District,
            Code,
            -- Sum all 16 crime columns to get the total crimes for that location/year
            Robbery + Street_robbery + Injury + Agg_assault + Threat + Theft + Car + From_car + Bike + Burglary + Fire + Arson + Damage + Graffiti + Drugs + Local AS Total_Crimes
        FROM
            Crimes
    ) T2 ON T1.district = T2.District
GROUP BY
    T1.district
ORDER BY
    Crime_Rate_per_1000 DESC;




-- Most and least common crime types

SELECT 'Robbery' AS Crime_Type, SUM(Robbery) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Street_robbery' AS Crime_Type, SUM(Street_robbery) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Injury' AS Crime_Type, SUM(Injury) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Agg_assault' AS Crime_Type, SUM(Agg_assault) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Threat' AS Crime_Type, SUM(Threat) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Theft' AS Crime_Type, SUM(Theft) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Car' AS Crime_Type, SUM(Car) AS Total_Count FROM Crimes
UNION ALL
SELECT 'From_car' AS Crime_Type, SUM(From_car) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Bike' AS Crime_Type, SUM(Bike) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Burglary' AS Crime_Type, SUM(Burglary) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Fire' AS Crime_Type, SUM(Fire) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Arson' AS Crime_Type, SUM(Arson) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Damage' AS Crime_Type, SUM(Damage) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Graffiti' AS Crime_Type, SUM(Graffiti) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Drugs' AS Crime_Type, SUM(Drugs) AS Total_Count FROM Crimes
UNION ALL
SELECT 'Local' AS Crime_Type, SUM(Local) AS Total_Count FROM Crimes
ORDER BY Total_Count DESC;




-- Demographic data
SELECT
    district,
    SUM(age_18_to_27) AS Total_Young_Adults,
    SUM(total) AS Total_Population,
    -- Calculate the percentage of the population in the 18-to-27 age group
    CAST(SUM(age_18_to_27) AS REAL) * 100 / SUM(total) AS Percent_Young_Adults
FROM
    Population
GROUP BY
    district
ORDER BY
    Percent_Young_Adults DESC;




-- crime tuypes per year
SELECT
    Year,
    SUM(Robbery) AS Total_Robbery,
    SUM(Street_robbery) AS Total_Street_Robbery,
    SUM(Agg_assault) AS Total_Agg_Assault,
    SUM(Threat) AS Total_Threat,
    SUM(Theft) AS Total_Theft,
    SUM(Car) AS Total_Car_Theft,
    SUM(From_car) AS Total_Theft_From_Car,
    SUM(Bike) AS Total_Bike_Theft,
    SUM(Burglary) AS Total_Burglary,
    SUM(Fire) AS Total_Fire,
    SUM(Arson) AS Total_Arson,
    SUM(Damage) AS Total_Damage,
    SUM(Graffiti) AS Total_Graffiti,
    SUM(Drugs) AS Total_Drugs
FROM
    crimes
GROUP BY
    Year
ORDER BY
    Year ASC;


-- CRIMES PER YEAR PER DISTRICT

SELECT
    Year,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(District, 'Ã¤', 'ae'), 
                'Ã¶', 'oe'
            ), 
            'Ã¼', 'ue'
        ),
        'ÃŸ', 'ss'
    ) AS Corrected_District,
    SUM(Robbery + Street_robbery + Injury + Agg_assault + Threat + Theft + Car + From_car + Bike + Burglary + Fire + Arson + Damage + Graffiti + Drugs + Local) AS Total_Crimes_Per_District_Year
FROM
    Crimes
GROUP BY
    Year,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(District, 'Ã¤', 'ae'), 
                'Ã¶', 'oe'
            ), 
            'Ã¼', 'ue'
        ),
        'ÃŸ', 'ss'
    )
ORDER BY
    Year ASC,
    Total_Crimes_Per_District_Year DESC;


-- The most dangerous place in Berlin
SELECT
    location,
    SUM(
        robbery + street_robbery + injury + agg_assault + threat + theft +
        car + from_car + bike + burglary + fire + arson + damage +
        graffiti + drugs + local
    ) AS total_crimes
FROM
    crimes
GROUP BY
    location
ORDER BY
    total_crimes DESC;
    
    
-- The most dangerous place in Berlin per Year
SELECT
    YearlyCrimes.location,

    SUM(CASE WHEN YearlyCrimes.year = 2012 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2012',
    SUM(CASE WHEN YearlyCrimes.year = 2013 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2013',
    SUM(CASE WHEN YearlyCrimes.year = 2014 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2014',
    SUM(CASE WHEN YearlyCrimes.year = 2015 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2015',
    SUM(CASE WHEN YearlyCrimes.year = 2016 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2016',
    SUM(CASE WHEN YearlyCrimes.year = 2017 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2017',
    SUM(CASE WHEN YearlyCrimes.year = 2018 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2018',
    SUM(CASE WHEN YearlyCrimes.year = 2019 THEN YearlyCrimes.total_crimes ELSE 0 END) AS '2019'  

FROM (
    SELECT
        year,
        location,
        SUM(
            robbery + street_robbery + injury + agg_assault + threat + theft +
            car + from_car + bike + burglary + fire + arson + damage +
            graffiti + drugs + local
        ) AS total_crimes
    FROM
        crimes
    WHERE
        year BETWEEN 2012 AND 2019
    GROUP BY
        year, location
) AS YearlyCrimes
GROUP BY
    YearlyCrimes.location
ORDER BY
SUM(CASE WHEN YearlyCrimes.year = 2019 THEN YearlyCrimes.total_crimes ELSE 0 END) DESC;