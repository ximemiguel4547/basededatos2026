/* ============================================================================
   EJERCICIO 4- PERO ES EL 4 POR QUE ME EH EQUIVOCADO EN EL ORDEN JIJIJI
   ============================================================================ */

CREATE DATABASE ejercicio4_tienda;
GO
USE ejercicio4_tienda;
GO
-- TABLA PRODUCTO
CREATE TABLE producto (
	num_prod INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio >0.0)
);
GO

/*======= Se agrego el constraint unique para el campo nombre =====*/

ALTER TABLE producto
ADD CONSTRAINT
uq_producto_nombre
UNIQUE (nombre);

  /*======= CREAR TABLA CLIENTE =======*/
CREATE TABLE cliente (
	num_cliente INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_cliente
	PRIMARY KEY,
	nombre VARCHAR (30) NOT NULL,
	ap1 VARCHAR (20) NOT NULL,
	ap2 VARCHAR (20)
);
GO

   /*======= CREAR TABLA PEDIDO =======*/
CREATE TABLE pedido (
	num_pedido INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_pedido
	PRIMARY KEY (num_pedido),
	fecha_pedido DATETIME2 NOT NULL
	CONSTRAINT df_fecha_pedido
	DEFAULT SYSDATETIME(), /*FECHA DEL DOCKER EN DONDE ESTA EL SGBM */
	cliente INT NOT NULL
	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (cliente)
	REFERENCES cliente (num_cliente)
);
GO

    /*======= CREAR TABLA DETALLE PEDIDO =======*/

CREATE TABLE detalle_pedido (
	num_pedido INT NOT NULL,
	num_prod INT NOT NULL,
	precio_venta DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_detalle_pedido_precio_venta
	CHECK (precio_venta >0.0),
	cantidad_vendida INT NOT NULL
	CONSTRAINT ck_detalle_pedido_cantidad_vendida
	CHECK (cantidad_vendida >0),
	CONSTRAINT pk_detalle_pedido
	PRIMARY KEY (num_pedido, num_prod),
	CONSTRAINT fk_detalle_pedido_pedido
	FOREIGN KEY (num_pedido)
	REFERENCES pedido (num_pedido),
	CONSTRAINT fk_detalle_pedido_producto
	FOREIGN KEY (num_prod)
	REFERENCES producto (num_prod)
);
GO