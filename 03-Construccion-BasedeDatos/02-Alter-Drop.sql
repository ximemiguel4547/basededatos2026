-- ALTER

CREATE DATABASE escuelita;
GO

USE escuelita;
GO

CREATE TABLE alumno(
	alumno_id INT IDENTITY (1,1),
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO 

-- Agregar una columna a una tabla existente
ALTER TABLE alumno
ADD telefono VARCHAR(20);
GO

-- Ahregar varias columnas o varias columnas
ALTER TABLE alumno 
ADD 
curp CHAR(18),
rfc CHAR(13);

-- Modificar el tipo de dato 
ALTER TABLE alumno 
ALTER COLUMN 
telefono VARCHAR (30) NOT NULL;
GO

CREATE TABLE alumno2(
	alumno_id INT IDENTITY (1,1),
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
);
GO 


-- Agregar una Primary Key
ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (alumno_id);

CREATE TABLE carrera(
carrera_id INT IDENTITY(1,1)
CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id),
nombre VARCHAR (10) NOT NULL

);

-- AGREGAR UN CAMPO PARA FOREING KEY an alumno
ALTER TABLE alumno
ADD 
carrera_id INT;

-- Agregar restriccion FOREING KEY
ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES  carrera (carrera_id)
ON  DELETE CASCADE 
ON UPDATE NO ACTION;

--- Agegar campo edad a la tabla alumno
ALTER TABLE alumno
ADD
edad INT;
-- Agregar una restriccion check 
ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad
CHECK (edad>=18);
GO

-- DEFAULT
ALTER TABLE alumno 
ADD activo BIT NOT NULL;
GO

SELECT 

ALTER TABLE alumno 
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;
GO

--- Eliminar Restricciones

-- EXEC sp_help alumno;
-- Consulta para conocer 
SELECT 
	o.name AS nombre_restriccion,
	o.type_desc AS tipo_restriccion
FROM sys.objects AS o 
WHERE o.parent_object_id=OBJECT_ID('alumno')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;

SELECT* FROM Alumno;

-- Eliminar PK 
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;

-- Eliminar un check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

-- Eliminar un UNIQUE

ALTER TABLE alumno 
ADD matricula VARCHAR (12) NOT NULL;

ALTER TABLE alumno
ADD CONSTRAINT uq_alumno_matricula 
UNIQUE (matricula);


ALTER TABLE alumno
DROP CONSTRAINT uq_alumno_matricula;

--Eliminar DEFAULT
ALTER TABLE alumno
DROP CONSTRAINT df_alumno_activo;

-- Eliminar lafk
ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- DROP (ELIMINA OBJETOS COMPLETOS)

--- Esta consulta muestra las  tablas de la base de Datos
SELECT name 
FROM sys.tables;


-- ESTAMOS eliminando restricciones
 
-- LA 
DROP TABLE alumno;
GO
DROP TABLE alumno2;
GO
DROP TABLE carrera;
USE master;
GO

DROP DATABASE escuelita;
GO
SELECT *
FROM alumno;

-- COLUMNA no es un obejto de base de dataos,froma parte de la tablas