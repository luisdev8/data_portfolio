--Looking at Total Cases vs Total Deahts
-- Shows likelihood of dying if you contract covid in your country

/*SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE location like 'Venezuela'
ORDER BY 1,2*/

--Looking at Total Cases vs Population
--Shows what percentage of population got covid

/*SELECT location, date, population, total_cases, (total_cases/population)*100 AS death_percentage
FROM covid_deaths
WHERE location like 'Venezuela'
ORDER BY 1,2*/

-- Looking at countries with highest infection rate compared to population

-- SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
-- FROM covid_deaths
-- -- WHERE location like 'Venezuela'
-- GROUP BY location, population
-- ORDER BY percent_population_infected DESC

-- Showing countries with highest death count per population

-- SELECT location, MAX(total_deaths) AS total_deaths_count
-- FROM covid_deaths
-- WHERE continent is not NULL
-- GROUP BY location
-- ORDER BY total_deaths_count DESC

-- LET'S BREAK THINGS DOWN BY CONTINENT

-- SELECT location, MAX(total_deaths) AS total_deaths_count
-- FROM covid_deaths
-- WHERE continent is NULL
-- GROUP BY location
-- ORDER BY total_deaths_count DESC

-- Showing the continent with the highest death count per population

-- SELECT location, MAX(cast(total_deaths AS int)) AS total_deaths_count
-- FROM covid_deaths
-- WHERE continent is NULL
-- GROUP BY location
-- ORDER BY total_deaths_count DESC

-- global numbers

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM covid_deaths
-- WHERE location like 'Venezuela'
WHERE continent is NOT NULL
-- group by date
ORDER BY 1,2