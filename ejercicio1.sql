DROP DATABASE IF EXISTS world; 

CREATE DATABASE world;

USE world;

CREATE TABLE countries(
	name_country VARCHAR(50) NOT NULL,
    continent VARCHAR(50) NOT NULL,
    area_country INT NOT NULL,
    population INT NOT NULL,
    gdp BIGINT NOT NULL
);

INSERT INTO countries(name_country,continent,area_country,population,gdp)
VALUES
('Afghanistan','Asia','652230','25500100','20343000000'),
('Albania','Europe','28748','2831741','12960000000'),
('Algeria','Africa','2381741','37100000','188681000000'),
('Andorra','Europe','468','78115','3712000000');

SELECT name_country, population, area_country 
FROM countries
WHERE area_country >= 3000000 OR
population >= 25000000;