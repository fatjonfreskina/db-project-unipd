-- Main queries

-- find the most rented models
SELECT Model.name, COUNT(*) AS num_rent
FROM Model
JOIN Car ON Model.name = Car.name
JOIN Rental ON Car.lp = Rental.lp
GROUP BY Model.name
HAVING COUNT(*) > (SELECT AVG(num_rent)
    FROM (SELECT COUNT(*) AS num_rent
    FROM Model
    JOIN Car ON Model.name = Car.name
    JOIN Rental ON Car.lp = Rental.lp
    GROUP BY Model.name) AS foo);

-- Find best sellers (FROM Sale) and Join with Employee to find
-- best performing Branch
SELECT branchid, SUM(total_sales) AS total_sales_branch FROM
    (SELECT employee, SUM(price) AS total_sales
    FROM Sale
    GROUP BY employee
    ORDER BY total_sales DESC) AS T FULL JOIN Employee AS E
    ON T.employee = E.tc
GROUP BY branchid
ORDER BY total_sales_branch DESC;

-- best-selling car model
SELECT model, num
FROM (	SELECT c.name AS model, count(*) AS num
	FROM car AS c INNER JOIN sale AS s ON c.lp = s.lp
	GROUP BY c.name ) AS counter1
WHERE num = (
	SELECT max(num)
	FROM (	SELECT c.name AS model, count(*) AS num
		FROM car AS c INNER JOIN sale AS s ON c.lp = s.lp
		GROUP BY c.name ) AS counter2 );

--best price for each category of each supplier
SELECT s.supplier, p.category, MIN(s.catalog_price)
FROM supplies AS s INNER JOIN partkind AS p ON p.name = s.partkind
GROUP BY s.supplier, p.category
ORDER BY s.supplier ASC;
