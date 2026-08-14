-- Seleccionar la base de datos

USE NORTHWND;
-- Mostrar los clientes de Mexico o de alemania y demas que sean de Stuttgart
SELECT 
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country='Mexico'
	OR
	(c.Country='Germany'
	AND
	c.City='Stuttgart')
;

SELECT 
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.City,
	c.Country
FROM Customers AS c
WHERE c.Country IN ('Mexico', 'Germany')
	OR  c.City='Stuttgart'
;
--Mostrar las ventas realizadas en francia,brasil y belgica
-- de 10 de julio de 1986 a 31  de diciembre de 1998,que tengan Región de envio
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedidio de la mas 
-- cercana a la mas antigua 



SELECT 
	o.OrderID AS [numero_orden],
	o.CustomerID AS [cliente],
	o.ShipCountry AS [pais_envio],
	o.OrderDate AS [fecha_pedido],
	UPPER (FORMAT(o.OrderDate,'MMMM','es-ES')) AS [mes_pedido],
	UPPER(FORMAT(o.OrderDate,'dddd','es-ES')) AS [dia_pedido],
	DATEPART (YEAR, o.OrderDate) AS [año_pedido]
FROM  Orders AS o 
WHERE o.ShipCountry IN ('France','Brazil','Belgium')
	AND 
	o.OrderDate BETWEEN '1996-07-10'AND '1998-12-31'
		AND o.ShipRegion IS NOT NULL
		AND 
		o.CustomerID IN ('VICTE','HANAR','SUPRD')
		ORDER BY o.OrderDate DESC; 
