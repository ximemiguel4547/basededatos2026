/*==============================================================================================

tema :Consultas basicas de select 
Archivo: 05-basic-query.sql

Descripcion: Desarrollar  la capcidad para construir consultas basicas mediante SELECT






USO DEL SELECT


==============================================================================================*/


USE comercial_db;
GO

/*
uso de select  *

Sintaxis:

SELECT * 
FROM  nombre_tabla;

NOTA: el asterisco significa todas las columnas de una tabla 
(no es tan recomendado su uso)

Por que no se recomienda utilizarlo siempre 
1. Recupera la informacion innecesaria

2.Reduce la claridad de la consulta
3.Puede aumentar el consumo de recursos

=================================================================*/

SELECT *
FROM productos;

--- Proyeccion

SELECT 
	codigo,
	nombre,
	precio
FROM productos;

-- Alias de columna 
-- Un alias de columna es un nombre temporal asignado a  una columna
-- dentro del resultado de una columna 

SELECT 
	codigo AS codigo_producto ,
	nombre,
	precio
FROM productos;



SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_producto 
FROM productos;
GO

SELECT 
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio producto] 
FROM productos;
GO


SELECT 
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio producto'
FROM productos;
GO


SELECT 
	codigo AS[ codigo producto],
    nombre AS 'nombre producto',
	precio AS precio_producto 
FROM productos;
GO

-- ALIAS DE TABLA
-- Tambien se puede asignar un alias temporal a una tabla 

-- Sintxias

/*
	SELECT aliass_tabla_columna
	FROM nombre_tabla_ AS alias_tabla;
*/
	SELECT 
		productos.codigo,
		productos.nombre,
		productos.precio
	FROM productos;



 SELECT 
		p.codigo,
		p.nombre,
		p.precio
	FROM productos AS p;

	SELECT categorias.nombre, productos.nombre 
	FROM  categorias
	INNER JOIN productos
	ON categorias.id_categoria =productos.id_categoria;
	GO 

	SELECT 
	c.id_categoria,
	c.nombre, 
	p.id_producto,
	p.precio,
	p.existencia
	FROM  categorias AS c
	INNER JOIN productos AS p
	ON c.id_categoria =p.id_categoria;
	GO 

	SELECT 
	c.id_categoria AS [#Categoria],
	c.nombre AS [Nombre Categoria], 
	p.id_producto AS [#Producto],
	p.precio,
	p.existencia
	FROM  categorias AS c
	INNER JOIN productos AS p
	ON c.id_categoria =p.id_categoria;
	GO 

	-- Campos calculados --Columnas Calculadas
-- Una columna calculada es el resultado de una expresion incluida en la
-- lista de seleccion
-- No existe fisicamente en  la tabla

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.existencia*p.precio AS valor_inventario
FROM productos AS p;

-- Seleccionar el nombre, apellido Paterno,salario y simular 
-- Como quedaria el salario de cada empleado si recibiera un 
-- aumento fijo de $1000, el campo se debe de llamr salrio_simulado
-- Tambien calcular el importe bruto 

SELECT 
	e.nombre,
	e.apellido_paterno,
	CONCAT (e.nombre,'',e.apellido_paterno,'',apellido_materno) 
	AS nombre_completo,
	YEAR(e.fecha_ingreso) AS año_ingreso,
	MONTH (e.fecha_ingreso) AS mes_ingreso,
	DAY (e.fecha_ingreso) AS dia_ingreso,
	e.fecha_ingreso,
	e.salario,
	(e.salario + 1000) AS salario_simulado

FROM empleados	AS e;
GO

--Mostrar de una venta cual es su numero, cantidad vendida,precio,
-- descuento, importe_bruto(cantidad por el precio) y ademas el 
-- importe con descuento (importe_bruto por el descuento divididdo entre 1000

SELECT 
	dv.id_detalle_venta,
	dv.cantidad,
	dv.precio,
	dv.descuento,
	dv.cantidad * dv.precio AS	importe_bruto,
	(dv.cantidad * dv.precio  * dv.descuento / 100.0) AS importe_descuento


FROM detalle_ventas AS dv



/* =================================================

OPERADORES ARITMETICOS EN SQL SERVER 

+ SUMA 
- RESTA
* MULTIPLICACION
/ DIVISION 
% MODULO- RESIDUO DE LA DIVISION

=====================================================*/

-- Uso de la clausula DISTINCT
-- Elimina del resultado las filas que tengan valores repetidos en todas
-- las columnas  seleccionadas

SELECT c.sexo
FROM clientes AS c;


SELECT COUNT (c.sexo)AS cantidad_sexo
FROM clientes AS c; 

SELECT DISTINCT sexo
FROM clientes AS c;


SELECT COUNT (DISTINCT c.sexo)AS numeros_sexos
FROM clientes AS c; 


SELECT COUNT (sexo) AS [mujeres]
FROM clientes
WHERE sexo ='M' ;

-- Selecionar los distintos descuentos que se realizan a las ventas 

SELECT descuento
FROM detalle_ventas 
ORDER BY descuento DESC;

SELECT DISTINCT	descuento
FROM detalle_ventas 
ORDER BY descuento DESC;

--DISTINCT CON MAS DE UN CAMPO

-- Cuando el DISTINCT se utiliza con varias columnas, se evalua la
-- combinacion 

SELECT
	id_categoria,
	id_producto
FROM productos
ORDER BY id_categoria DESC,id_producto	DESC;
GO

SELECT
	id_cliente,
	id_empleado
FROM ventas
ORDER BY 1 DESC,2	DESC;
GO

SELECT DISTINCT
	id_categoria,
	id_producto
FROM productos
ORDER BY id_categoria DESC,id_producto	DESC;
GO



-- Uso de TOP 

---limita la cantidad de fila devueltas por una consulta 

Select TOP (56)
	id_producto,
	codigo,
	nombre,
	precio
FROM productos;

Select TOP (5)
	id_producto,
	codigo,
	nombre,
	precio
FROM productos
ORDER BY precio DESC;

SELECT TOP(10)
	nombre
FROM clientes;

-- TOP con expresiones calculadas 

SELECT 
	codigo, 
	nombre,
	precio,
	existencia,
	(precio * existencia ) AS  valor_inventario
FROM productos;


-- TOP CON PORCENTAJE 

-- SQL Server permite limitar el resultado mediante un porcentaje 

SELECT TOP (10) PERCENT
	codigo, 
	nombre,
	precio,
	existencia,
	(precio * existencia ) AS  valor_inventario
FROM productos;

-- Combinar DISTINCT CON EL TOP
SELECT DISTINCT TOP (3)
	descuento
FROM detalle_ventas;

-- CUNADO USE EL PERCENT Y DA EN DECIMALES SE REDONDEA siempre sube a el siguiente 