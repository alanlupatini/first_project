use hufflepuff;

#Total crimes per district

SELECT district, SUM(robbery + street_robbery + injury + agg_assault + threat + theft +
                     car + from_car + bike + burglary + fire + arson + damage + graffiti +
                     drugs + local) AS total_crime
FROM crime_data
GROUP BY district
ORDER BY total_crime DESC;

#Total crimes per district per year

SELECT year, district,
       SUM(robbery + street_robbery + injury + agg_assault + threat + theft +
           car + from_car + bike + burglary + fire + arson + damage +
           graffiti + drugs + local) AS total_crime
FROM crime_data
GROUP BY year, district
ORDER BY year, total_crime DESC;

# Most dangerous locations

SELECT location,
       SUM(robbery + street_robbery + injury + agg_assault + threat + theft +
           car + from_car + bike + burglary + fire + arson + damage +
           graffiti + drugs + local) AS total_crime
FROM crime_data
GROUP BY location
ORDER BY total_crime DESC
LIMIT 20;

# Crimes per 1,000 residents

SELECT c.code,
       c.location,
       SUM(robbery + street_robbery + injury + agg_assault + threat + theft +
           car + from_car + bike + burglary + fire + arson + damage +
           graffiti + drugs + local) AS crimes,
       p.total AS population,
       ROUND(
         SUM(robbery + street_robbery + injury + agg_assault + threat +
             theft + car + from_car + bike + burglary + fire + arson +
             damage + graffiti + drugs + local) / p.total * 1000, 2
       ) AS crimes_per_1000
FROM crime_data c
JOIN population_data p ON c.code = p.postal_code
GROUP BY c.code, c.location, p.total
ORDER BY crimes_per_1000 DESC;



