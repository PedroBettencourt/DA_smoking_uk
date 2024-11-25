-- Check for duplicated ids
SELECT COUNT(id), COUNT(DISTINCT id) FROM smoking;

-- Remove type column as it is irrelevant and most of the data is missing
SELECT COUNT(type) FROM smoking WHERE type = '';
ALTER TABLE smoking DROP COLUMN type;

-- Check for null values
SELECT * FROM smoking WHERE smoke = 'NA' or smoke is NULL;


-- ANALYSIS

-- Sample size
SELECT smoke, COUNT(*) as count
FROM smoking
GROUP BY smoke;


-- Gender - gender percentage of non-smokers and smokers
SELECT 
	gender, 
    s1.smoke, 
    COUNT(*) AS pop, 
    ROUND((COUNT(*) / smoke_pop) * 100, 2) AS percentage_gender
FROM smoking s1 
JOIN (
	SELECT smoke, COUNT(*) as smoke_pop
    FROM smoking 
    GROUP BY smoke
    ) s2 
ON s1.smoke = s2.smoke
GROUP BY gender, s1.smoke
ORDER BY s1.smoke, gender;


-- Age - percentage of smokers and non smokers in each age group
SELECT s1.age_group, s1.smoke, smoke_count as pop, ROUND((smoke_count/age_count) * 100, 2) AS percentage_smoke FROM
(SELECT CASE 
	WHEN age < 18 THEN '<18'
	WHEN age BETWEEN 18 AND 24 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
	WHEN age BETWEEN 55 AND 64 THEN '55-64'
	ELSE '65+'
END AS age_group,
smoke, COUNT(*) as smoke_count
FROM smoking
GROUP BY age_group, smoke) s1
JOIN(
SELECT CASE 
	WHEN age < 18 THEN '<18'
	WHEN age BETWEEN 18 AND 24 THEN '18-24'
	WHEN age BETWEEN 25 AND 34 THEN '25-34'
	WHEN age BETWEEN 35 AND 44 THEN '35-44'
	WHEN age BETWEEN 45 AND 54 THEN '45-54'
	WHEN age BETWEEN 55 AND 64 THEN '55-64'
	ELSE '65+'
END AS age_group, COUNT(*) AS age_count
FROM smoking
GROUP BY age_group) s2
ON s1.age_group = s2.age_group
ORDER BY age_group, smoke;


-- Marital status - percentage of smokers and non smokers in each marital status
SELECT 
	s1.marital_status, 
    smoke, 
    COUNT(*) as pop, 
    ROUND((COUNT(*)/marital_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT marital_status, COUNT(marital_status) as marital_count 
	FROM smoking 
	GROUP BY marital_status) s2
ON s1.marital_status = s2.marital_status
GROUP BY marital_status, smoke
ORDER BY marital_status, smoke;


-- Qualification
SELECT 
	s1.highest_qualification, 
	smoke,
	COUNT(*) AS pop, 
	ROUND((COUNT(*)/qual_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT highest_qualification, COUNT(*) AS qual_count 
    FROM smoking s2
    GROUP BY highest_qualification) s2
ON s1.highest_qualification = s2.highest_qualification
GROUP BY highest_qualification, smoke
ORDER BY highest_qualification, smoke;


-- Nationality
SELECT 
	s1.nationality, 
	smoke,
	COUNT(*) AS pop, 
	ROUND((COUNT(*)/nat_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT nationality, COUNT(*) AS nat_count 
    FROM smoking s2
    GROUP BY nationality) s2
ON s1.nationality = s2.nationality
GROUP BY nationality, smoke
ORDER BY nationality, smoke;

-- Ethnicity
SELECT 
	s1.ethnicity, 
	smoke,
	COUNT(*) AS pop, 
	ROUND((COUNT(*)/ethn_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT ethnicity, COUNT(*) AS ethn_count 
    FROM smoking s2
    GROUP BY ethnicity) s2
ON s1.ethnicity = s2.ethnicity
GROUP BY ethnicity, smoke
ORDER BY ethnicity, smoke;

-- Gross income
SELECT 
	s1.gross_income, 
	smoke,
	COUNT(*) AS pop, 
	ROUND((COUNT(*)/income_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT gross_income, COUNT(*) AS income_count 
    FROM smoking s2
    GROUP BY gross_income) s2
ON s1.gross_income = s2.gross_income
GROUP BY gross_income, smoke
ORDER BY gross_income, smoke;


-- Region
SELECT 
	s1.region, 
	smoke,
	COUNT(*) AS pop, 
	ROUND((COUNT(*)/region_count) * 100, 2) AS percentage_smoke 
FROM smoking s1 JOIN (
	SELECT region, COUNT(*) AS region_count 
    FROM smoking s2
    GROUP BY region) s2
ON s1.region = s2.region
GROUP BY region, smoke
ORDER BY region, smoke;


-- Weekdays vs weekends
SELECT AVG(amt_weekends), AVG(amt_weekdays)
FROM smoking 
WHERE amt_weekdays <> 'NA' and amt_weekends <> 'NA';