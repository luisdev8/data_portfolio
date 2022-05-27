-- Looking a total population vs vaccinations

-- SELECT death.continent, death.location, death.date, death.population, vaccinations.new_vaccinations, SUM(vaccinations.new_vaccinations) OVER (Partition by death.location order by death.location, death.date) as rolling_people_vaccinated
-- --, (rolling_people_vaccinated/population)*100
-- FROM covid_deaths death
-- JOIN covid_vaccinations vaccinations
--     ON death.location = vaccinations.location
--     AND death.date = vaccinations.date
-- WHERE death.continent is not null
-- order by 2,3

--use cte (Analize this code!!!)

-- WITH population_vs_vaccinations (Continent, Location, Date, population, new_vaccinations, rolling_people_vaccinated)
-- AS 
-- (SELECT death.continent, death.location, death.date, death.population, vaccinations.new_vaccinations, SUM(vaccinations.new_vaccinations) OVER (Partition by death.location order by death.location, death.date) as rolling_people_vaccinated
-- --, (rolling_people_vaccinated/population)*100
-- FROM covid_deaths death
-- JOIN covid_vaccinations vaccinations
--     ON death.location = vaccinations.location
--     AND death.date = vaccinations.date
-- WHERE death.continent is not null
-- -- order by 2,3
-- )
-- SELECT *, (rolling_people_vaccinated/population)*100
-- FROM population_vs_vaccinations

-- TEMP TABLE code does not work analyze!
-- DROP TABLE IF EXISTS percent_population_vaccinated
-- CREATE TABLE percent_population_vaccinated
-- (
--     continent nvarchar(300) NULL,
--     location nvarchar(300) NULL,
--     date datetime,
--     population numeric,
--     new_vaccinations numeric,
--     rolling_people_vaccinated numeric
-- )

-- INSERT INTO percent_population_vaccinated
-- SELECT death.continent, death.location, death.date, death.population, vaccinations.new_vaccinations, SUM(vaccinations.new_vaccinations) OVER (Partition by death.location order by death.location, death.date) as rolling_people_vaccinated
-- --, (rolling_people_vaccinated/population)*100
-- FROM covid_deaths death
-- JOIN covid_vaccinations vaccinations
--     ON death.location = vaccinations.location
--     AND death.date = vaccinations.date
-- --WHERE death.continent is not null
-- -- order by 2,3
-- SELECT *, (rolling_people_vaccinated/population)*100
-- FROM percent_population_vaccinated

-- Creating view to store data for later visualizations
CREATE VIEW percent_population_vaccinated AS
SELECT death.continent, death.location, death.date, death.population, vaccinations.new_vaccinations, SUM(vaccinations.new_vaccinations) OVER (Partition by death.location order by death.location, death.date) as rolling_people_vaccinated
--, (rolling_people_vaccinated/population)*100
FROM covid_deaths death
JOIN covid_vaccinations vaccinations
    ON death.location = vaccinations.location
    AND death.date = vaccinations.date
WHERE death.continent is not null
--order by 2,3

SELECT *
FROM percent_population_vaccinated
