/*=======================================================================================

INNER JOIN
¿Qué es un INNER JOIN?
 Permite combinar información de dos o más tablas utilizando una relación
 
 entre ellas 




==========================================================================================*/


USE NORTHWND

SELECT
	ProductID  AS [numero_producto],
	ProductName AS [nombre_producto],
	UnitPrice AS [precio],
	UnitsInStock AS [existencia],
	(p.UnitPrice * p.UnitsInStock) AS [valor_inventario],
	c.CategoryID AS [numero_categoria],
	CategoryName AS [Nombre_categoria],
	s.CompanyName AS [nombre_proveedor]
FROM Products AS p
INNER JOIN 
Categories AS c 
ON c.CategoryID =p.CategoryID
INNER JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID
WHERE p.UnitsInStock <> 0
AND
c.CategoryName IN ('Seafood' ,'Confections','Beverages')
AND 
p.ProductName LIKE 'C%'
Order BY [valor_inventario]ASC
 ;


 -- Seleccionar los datos de los clientes que han hecho pedidos (orders),
 -- Mostrando el numero de cliente ,el nombre del cliente (companyName),
 -- numero de orden y la fecha de orden

 SELECT 
	 o.OrderID AS [numero_orden],
	 o.OrderDate AS [fecha_orden],
	 UPPER (FORMAT(o.OrderDate,'MMMM', 'es-ES')) as [mes_orden],
	 UPPER(FORMAT(o.OrderDate,'dddd', 'es-ES')) as [dia_orden],
	 DATEPART (YEAR, o.OrderDate) AS [año_orden],
	 o.CustomerID AS [numero_cliente],
	 UPPER (c.CompanyName) AS [nombre_cliente]
 FROM Orders AS o
INNER JOIN
Customers AS c
 ON c.CustomerID =c.CustomerID;

 -- Seleccionar ademas de el cliente al que se le vendieron los productos 
 -- queremos saber el nombre del empleado en formato  fullnam que atendio
 -- el pedido


 SELECT 
	 o.OrderID AS [numero_orden],
	 o.OrderDate AS [fecha_orden],
	 UPPER (FORMAT(o.OrderDate,'MMMM', 'es-ES')) as [mes_orden],
	 UPPER(FORMAT(o.OrderDate,'dddd', 'es-ES')) as [dia_orden],
	 DATEPART (YEAR, o.OrderDate) AS [año_orden],
	 o.CustomerID AS [numero_cliente],
	 UPPER (c.CompanyName) AS [nombre_cliente],
	 CONCAT(e.FirstName,'',e.LastName) AS [nombre_completo]
 FROM Orders AS o
INNER JOIN
Customers AS c
 ON c.CustomerID =c.CustomerID
INNER JOIN  Employees AS e
ON o.EmployeeID=e.EmployeeID;