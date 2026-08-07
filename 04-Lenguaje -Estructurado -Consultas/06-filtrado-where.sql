/*================================================================

Tema: Filtrado de Registros con WHERE
Archivo : 06-filtrado-where.sql
Descripcion: En este tema se filtraran registros mediante,condiciones ,
comparaciones, operadores logicos busqueda por patrones


==================================================================*/
USE comercial_db;
SELECT
	codigo,
	nombre,
	precio
FROM productos;

 -- Mostrar los productos con un precio mayor a 40
 SELECT
	codigo,
	nombre,
	precio
FROM productos
WHERE precio > 400;
--Mostrar el producto cuyo precio es exactamente $200
 SELECT
	p.codigo AS[Código],
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio = 200;

-- Seleccionar los datos del cliente 25

SELECT
c.id_cliente,
c.nombre,
c.apellido_paterno,
c.correo
FROM  clientes AS c
WHERE c.id_cliente=25;

-- Comparación de cadenas de texto 

-- Los valores de texto deben escribirse entre comillas 
-- simples 

-- Seleccionar todas las categorias donde el 
-- nombre sea Cómputo.

SELECT 
	c.id_categoria,
	c.nombre
FROM categorias AS c
WHERE c.nombre='Cómputo';

--Mostrar los datos de los empleados que no pertenezcan
-- al departamento 1(numero de empleado,nombre,salario y 
-- numero del departamento )

SELECT 
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
		
FROM empleados AS e
where id_departamento <> 1;
GO

-- Seleccionar los productos cuyo precio sea superior a 450,
-- codigo, nombre ,precio ,existencia ,utilizar alias de columnas 
-- y de tabla 
-- Filtrar FECHAS 

SELECT 
	p.nombre AS [Código],
	p.precio AS [Nombre Producto],
	p.existencia 
FROM productos AS p
WHERE precio > 450;

SELECT 
	p.nombre AS [Código],
	p.precio AS [Nombre Producto],
	p.existencia 
FROM productos AS p
WHERE precio >=450;

SELECT 
	p.nombre AS [Código],
	p.precio AS [Nombre Producto],
	p.existencia 
FROM productos AS p
WHERE precio <= 450;

SELECT 
	p.nombre AS [Código],
	p.precio AS [Nombre Producto],
	p.existencia 
FROM productos AS p
WHERE precio <> 450;

-- FILTRAR FECHAS
-- Las fechas deben escribirse entre comillas simpes
--Se recomienda utilizar el formato AAAA-MM-DD

-- Seleccionar todas las ventas realizadas el 24 de diciembre de 2024 ,
-- Mostrar el numero de venta,fecha de venta, el cliente al que se le vendio,
-- el empleado que lo vendio

SELECT
v.id_venta AS [Numero de venta],
v.fecha AS [Fecha Venta],
v.id_cliente AS [Cliente],
v.id_empleado AS [Empleado]
FROM ventas AS v
WHERE fecha= '2025-12-24';


SELECT
v.id_venta AS [Numero de venta],
v.fecha AS [Fecha Venta],
v.id_cliente AS [Cliente],
v.id_empleado AS [Empleado]
FROM ventas AS v
INNER JOIN 
clientes AS C
ON v.id_cliente=c.id_cliente
INNER JOIN 
empleados AS e
ON v.id_empleado=e.id_empleado
WHERE v.fecha= '2025-12-24';

-- Seleccionar todas las ventas anteriores al 1 de Febrero de 2025

Select 
	v.id_venta AS _numero_venta,
	v.fecha AS [fecha de venta],
	v.id_cliente cliente
FROM  ventas AS v
WHERE v.fecha < '2025-02-01';

-- Seleccionar todas las ventas desde el 1 de octubre de 2025 
-- en adelante 


Select 
	v.id_venta AS _numero_venta,
	v.fecha AS [fecha de venta],
	v.id_cliente cliente
FROM  ventas AS v
WHERE v.fecha >= '2025-10-01';

-- COMPARACIONES CON EXPRESIONES CALCULADAS

-- Seleccionar los productos cuyo valor del inventario sea mayor
-- a $5000 
-- en adelante

-- valor_inventario = precio * existencia

-- Nota:  SQL Server no reconoce el valor del alias dentro del 
-- WHERE en el mismo nivel de consulta, , esto ocurre por el orden 
-- lógico en que SQL procesa las partes de una consulta 

-- Orden de ejecución 

/*========================================================
	FROM /JOIN 
	WHERE
	GROUP BY
	HAVING 
	SELECT
	DISTINCT
	ORDER BY
	TOP
=============================================*/

-- Orden de Escritura 
/*========================================================
		
	
	
	SELECT/TOP
	FROM /JOIN 
	WHERE
	GROUP BY
	HAVING 
	ORDER BY
	
=============================================*/

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY valor_inventario DESC;
GO

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS valor_inventarioo
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;
GO


/* Consultas con Operadores Lógicos (NOT,AND,OR)*/

--Operador Lógico AND

/*
	condición 1 | condición 2 | Resultado
	TRUE			TRUE			TRUE
	TRUE           FALSE	     	FALSE 
	FALSE			TRUE			FALSE 
	FALSE			FALSE			FALSE

*/

-- Mostrar productos con precio entr $200 y $300 que ademas 
-- tengas menos de 50 unidades 

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE precio>=200.0
	AND precio <300.0
	AND existencia <50.0;
GO

 -- Seleccionar los empleados del departamento 1 cuyo salario sea
 -- superior a $25.0

 SELECT 
	e.nombre,
	e.id_departamento,
	e.salario

 FROM empleados AS e
 WHERE  e.salario>25.0 AND e.id_departamento =1;

 SELECT 
	e.id_empleado,
	CONCAT(e.nombre,
	e.apellido_paterno,
	e.apellido_materno) AS [nombre_completo],
	e.id_departamento AS departamento ,
	e.salario
 FROM empleados AS e
 WHERE e.id_departamento=1
 AND e.salario > 25.0;

 -- Operador lógico OR

 /*===============================
	OR requiere que al menos una condición sea verdadera 


	condición 1 | condición 2 | Resultado
	TRUE			TRUE			TRUE
	TRUE           FALSE	     	TRUE
	FALSE			TRUE			TRUE 
	FALSE			FALSE			FALSE
 
 ===============================*/

 -- Seleccionar los productos con existencia inferior a 10 o superior 
 -- a 190

SELECT TOP 15 
    p.codigo,
	p.nombre,
	p.precio,
	p.existencia

FROM productos AS p
	WHERE p.existencia < 10  
	OR p.precio < 190
	ORDER BY nombre DESC;
	 /*===============================
	NOT Niega una condición 


	condición 1 | condición 2 | Resultado
	TRUE	   FALSE
	FALSE      TRUE 

 
 ===============================*/

 -- Seleccionar los productos que no sea mayor a 400
  SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE  NOT p.precio >400;
-- contrario del mayor 
   SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE p.precio <= 400
  ORDER BY p.precio DESC;


  -- Mostrar los productos utulizando una NOT que no se encuentran dentro del
  -- Rango  de $100 a $400
  SELECT 
	p.codigo,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE p.existencia;

  SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
  FROM productos AS p
  WHERE 
  NOT (precio <= 100 AND precio <=400);
 


  -- Mostrar loes empleados de los departamentos 1 o 2 que tengan 
  -- salario mayor a $25,000SELECT 
	SELECT
	e.id_empleado,
	CONCAT(e.nombre,
	e.apellido_paterno,
	e.apellido_materno) AS [nombre_completo],
	e.id_departamento AS departamento ,
	e.salario
 FROM empleados AS e
 WHERE 
 (e.id_departamento=1
 OR e.id_departamento=2)
 AND e.salario>25000;

  -- TODO : Instrucción BETWEEN E IN,LIKE,COMPARACIONES CON NULL


