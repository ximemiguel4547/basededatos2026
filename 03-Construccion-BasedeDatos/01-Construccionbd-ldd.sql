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

-- Restricción Default 
CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR (30) NOT NULL UNIQUE,
	activo BIT DEFAULT 1 
);
GO
CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1) 
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR (30) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1
);
GO

GO
CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR (30) NOT NULL ,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE (nombre)

);
GO

DROP TABLE categoria;

INSERT INTO categoria
VALUES ('Carnes Frias',1);

INSERT INTO categoria
VALUES ('Carnes Frias',1);

INSERT INTO categoria
VALUES ('Carnes Calientes',DEFAULT);

INSERT INTO categoria(nombre)
VALUES ('Chochos');

-- Restricción check 
-- Opción de construcción 1 

CREATE TABLE producto (
	producto_id INT IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR (20) NOT NULL UNIQUE,
	precio DECIMAL(10,2)NOT NULL CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia <=100),
	activo BIT NOT NULL DEFAULT 1
);
GO
-- Opción de construcción 2

CREATE TABLE producto (
	producto_id INT IDENTITY (1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR (20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL(10,2)NOT NULL 
	CONSTRAINT ck_producto_precio
	CHECK (precio>0),
	existencia INT NOT NULL 
	CONSTRAINT ck_producto_existencia
	CHECK (existencia > 0 AND existencia <=100),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1
);


CREATE TABLE producto (
	producto_id INT NOT NULL,
	nombre VARCHAR (20) NOT NULL,
	descripcion VARCHAR (80),
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo 
	DEFAULT 1,
	-- Restriccion PK 
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	-- Restriccion UNIQUE
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	-- Restriccion check precio
	CONSTRAINT  ck_producto_precio
	CHECK (precio>0),
	-- Restriccion check existencia 
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100)

);

GO


DROP TABLE producto;

INSERT INTO producto 
VALUES(1,'Pitufo',NULL,200,99,0);

INSERT INTO producto 
VALUES(2, 'Quemadita',NULL,200,100,DEFAULT);


INSERT INTO producto (producto_id,nombre,existencia,precio)
VALUES(3,'pantera rosa',47,80);


SELECT *
FROM producto;

-- CREAR UNA BASE DE DATOS PARA UNA EMPRESA PATITO
-- CREAR LS BD

CREATE DATABASE  empresa_patito;
GO

-- USAR LA BD
USE empresa_patito;
GO

-- Restricción de FOREING KEY 
CREATE TABLE proveedor (
	proveedor_id INT NOT NULL IDENTITY (1,1),
	empresa VARCHAR(35) NOT NULL, 
	direccion VARCHAR (80) NULL,
	limite_credito DECIMAL (10,2) NOT NULL,
	-- PRIMARY KEY
	CONSTRAINT pk_proveedor 
	PRIMARY KEY (proveedor_id),
	-- UNIQUE
	CONSTRAINT uq_proveedor_empresa
	UNIQUE (empresa),
	-- CHECK limite_credito
	CONSTRAINT  ck_proveedor_limite_credito
	CHECK (limite_credito>0.0 AND limite_credito<=100000)
);
GO

CREATE TABLE producto (
	fabricante_id CHAR (3)NOT NULL,
	producto_id INT NOT NULL,
	nombre VARCHAR (20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	stock INT NOT NULL,
	CONSTRAINT ck_producto_stock
	CHECK (stock BETWEEN 1 AND 100),
	precio DECIMAL(10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK(precio > 0.0),
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	proveedor_id INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (fabricante_id,producto_id),
	CONSTRAINT fk_producto_proveedor 
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)

);
GO

-- INTEGRIDADES REFERENCIALES ON DELETE Y ON UPDATE 
-- NO ACTION, CASCADE ,SET NULL,SET DEFAULT

CREATE DATABASE construccion;
GO

USE construccion;
GO

-- NO ACTION 

CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente 
	PRIMARY KEY,
	empresa VARCHAR (20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR(50),
	tel VARCHAR (15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

DROP TABLE  telefono

CREATE TABLE telefono (
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE(numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	-- Like revisa si se cumple el patron 
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION

);
GO

INSERT INTO cliente
VALUES (1, 'patito de Hule', NULL, '773-def-123',1,DEFAULT,DEFAULT );

INSERT INTO cliente(cliente_id,empresa,tel, activo )
VALUES (2,'Taqueria Mr. Linux','7731234567',1);

INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-459-2347',1);


INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-345-2357',1),
	   ('455-678-1234',1),
	   ('123-768-2345',1),
	   ('773-146-2476',2);




DROP TABLE telefono

SELECT * FROM cliente;
SELECT * FROM telefono;
-- Eliminar con ON DELETE EN NO ACTION
--- ELIMINA LOS HIJOS

DELETE FROM telefono
WHERE cliente_id=1;
-- ELIMINA EL PADRE
DELETE FROM cliente
WHERE  cliente_id=1;

CHECK (Telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')

-- ACTUALIZAR ON UPDATE en NO Action
--- Acctualiza el hijo (poniendolo en uno)
UPDATE telefono
SET cliente_id=NULL
WHERE cliente_id=2;

--- Acctualiza el padre (poniendolo en uno)
UPDATE cliente
SET cliente_id=3
WHERE cliente_id=2;


-- Integridad Referencial  





CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente 
	PRIMARY KEY,
	empresa VARCHAR (20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR(50),
	tel VARCHAR (15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

DROP TABLE  telefono

CREATE TABLE telefono (
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE(numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	-- Like revisa si se cumple el patron 
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);
GO

INSERT INTO cliente
VALUES (1, 'patito de Hule', NULL, '773-def-123',1,DEFAULT,DEFAULT );

DROP TABLE telefono;

SELECT * FROM cliente;
SELECT * FROM telefono;

-- Eliminar en ON DELETE CASCADE 
-- Eliminar al padre 

DELETE FROM cliente
WHERE cliente_id=1;

-- actualizar EN ON UPDATE CASCADE
UPDATE cliente
SET cliente_id=10
WHERE cliente_id=1;

-- TOD : EXPLICAR ON DELETE Y ON UODATE SET NULL ,SET DEFAULT
USE construccion;

DROP TABLE telefono;
-- ON DELETE 

CREATE TABLE telefono (
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT df_telefono_cliente_id
	DEFAULT 0,
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE(numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	-- Like revisa si se cumple el patron 
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT

);
GO


INSERT INTO cliente(cliente_id,empresa,tel,activo)
VALUES (11,'Bimbo','56678899',1);

INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-459-2347',1);


INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-345-2357',1),
	   ('455-678-1234',1),
	   ('123-768-2345',1),
	   ('773-146-2476',2);


	   DELETE FROM cliente
	   WHERE cliente_id=1;
	   UPDATE cliente
	   SET cliente_id=7
	   WHERE cliente_id=2;

	   Select *  FROM telefono
	   Select *  FROM cliente;

	-- ON DELETE Y ON UPDATE SET NULL
	DROP TABLE telefono;
	GO





INSERT INTO cliente(cliente_id,empresa,tel,activo)
VALUES (0,'Mostrador','66678899',1);

INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-459-2347',11);


INSERT INTO telefono(numero_telefono,cliente_id) 
VALUES ('111-345-2357',11),
	   ('455-678-1234',11),
	   ('123-768-2345',11),
	   ('773-146-2476',15);

	   
SELECT * FROM cliente;
SELECT * FROM telefono;

DELETE FROM cliente
WHERE cliente_id=11

UPDATE cliente
SET cliente_id=17
WHERE cliente_id=15;