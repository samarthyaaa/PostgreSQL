SELECT name, area FROM cities WHERE area > 4000;
SELECT
	name,area 
FROM 
	cities
WHERE 
	area=8223;
SELECT
	name,area 
FROM 
	cities
WHERE 
	area!=8223;
SELECT
	name,area 
FROM 
	cities
WHERE 
	area BETWEEN 2000 AND 4000;
SELECT
	name,area 
FROM 
	cities
WHERE 
	name IN ('Delhi','Shanghai')
SELECT
	name,area 
FROM 
	cities
WHERE 
	name NOT IN ('Delhi','Shanghai')
SELECT
	name,area 
FROM 
	cities
WHERE 
	area NOT IN (3034,8223) AND name='Delhi';
SELECT
	name,area 
FROM 
	cities
WHERE 
	area NOT IN (3034,8223) OR name='Delhi';
SELECT
	name,area 
FROM 
	cities
WHERE 
	area NOT IN (3034,8223) 
	OR name='Delhi'
	OR name='Tokyo';
SELECT name, manufacturer from phones
WHERE manufacturer = 'Apple' OR manufacturer = 'Samsung';
SELECT 
	name,population / area AS population_density
FROM
	cities
WHERE
	population / area > 6000;
SELECT name, price * units_sold AS total_revenue FROM phones
WHERE price * units_sold > 1000000;
UPDATE cities 
SET population = 39505000
WHERE name ='Tokyo';
DELETE FROM cities
WHERE name= 'Tokyo';
INSERT iNTO cities (name, country, population, area)
VALUES ('Tokyo','Japan', 38505000, 8223)

UPDATE phones
SET units_sold = 8543
WHERE name = 'N8';

DELETE FROM phones
WHERE manufacturer = 'Samsung';




