USE universidad;
-- crea una base de datos 
CREATE DATABASE universidad;

-- utilizar la base de datos
USE universidad;
GO

-- Crear una tabla
CREATE TABLE alumno(
alumno_id INT,
nombre VARCHAR (100),
edad INT
);

GO

CREATE TABLE alumno_2(
alumno_id INT,
nombre VARCHAR (100),
apellido_paterno VARCHAR(50),
apellido_materno VARCHAR(50),
fecha_nacimiento DATE,
correo VARCHAR (45)
);
GO

CREATE TABLE alumno_3 (
alumno_id INT PRIMARY KEY,
nombre VARCHAR(100),
correo VARCHAR(40)
);
GO
CREATE TABLE alumno_4(
alumno_id INT NOT NULL,
nombre VARCHAR(100),
correo VARCHAR(40),
CONSTRAINT pk_alumno_4
PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno_4
VALUES (1, 'Panfilo', 'correo@correo.com');

INSERT INTO alumno_4
VALUES (1, 'Monico', 'correo2@correo.com');

-- Primary key con identity

CREATE TABLE  profesor (
	profesor_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR (50) NOT NULL,
	edad INT NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (profesor_id)

);

INSERT INTO profesor
VALUES ('GERMAN', 20),
	  ('MARICHA', 10);

SELECT *
FROM profesor; 
CREATE TABLE material(
	materia_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	correo VARCHAR (50) NOT NULL UNIQUE

);
CREATE TABLE material_2(
	materia_id INT NOT NULL IDENTITY (1,1) ,
	correo VARCHAR (50) NOT NULL,
	CONSTRAINT pk_materia_2
	PRIMARY KEY (materia_id),
	CONSTRAINT uq_materia_2_correo
	UNIQUE (correo)

);

INSERT INTO material_2
VALUES ('Correo@gmail.com');

INSERT INTO material_2
VALUES ('Correo2@gmail.com');