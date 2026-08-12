CREATE DATABASE gestion_empresa;
GO
USE gestion_empresa;
GO

/*======================================================
   TABLA PUESTO
======================================================*/
CREATE TABLE puesto (
	clave_puesto INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_puesto
	PRIMARY KEY,
	nombre VARCHAR (30) NOT NULL
	CONSTRAINT uq_puesto_nombre
	UNIQUE,
	nivel_jerarquico VARCHAR (20) NOT NULL,
	salario_min DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_puesto_salario_min
	CHECK (salario_min > 0.0),
	salario_max DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_puesto_salario_max
	CHECK (salario_max > 0.0),
	CONSTRAINT ck_puesto_rango_salario
	CHECK (salario_max >= salario_min)
);
GO

/*======================================================
   TABLA SUCURSAL
======================================================*/
CREATE TABLE sucursal (
	clave_sucursal INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_sucursal
	PRIMARY KEY,
	nombre VARCHAR (30) NOT NULL
	CONSTRAINT uq_sucursal_nombre
	UNIQUE,
	telefono VARCHAR (15) NULL,
	ciudad VARCHAR (30) NOT NULL,
	estado VARCHAR (30) NOT NULL
);
GO

/*======================================================
   TABLA DEPARTAMENTO
 
======================================================*/
CREATE TABLE departamento (
	clave_depto INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR (30) NOT NULL,
	ubicacion VARCHAR (30) NULL,
	presupuesto DECIMAL (10,2) NOT NULL,
	jefe_id INT NOT NULL, -- Foreing Key de Empleado (relacion ADMINISTRA), se agrega despues
	CONSTRAINT pk_departamento
	PRIMARY KEY (clave_depto),
	CONSTRAINT uq_departamento_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_departamento_presupuesto
	CHECK (presupuesto > 0.0)
);
GO

/*======================================================
   TABLA EMPLEADO
   
======================================================*/
CREATE TABLE empleado (
	num_empl INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_empleado
	PRIMARY KEY,
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR (20) NOT NULL,
	apellido_materno VARCHAR (20) NULL,
	fecha_nac DATE NOT NULL,
	curp CHAR (18) NOT NULL
	CONSTRAINT uq_empleado_curp
	UNIQUE,
	sueldo DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_empleado_sueldo
	CHECK (sueldo > 0.0),
	jefe_id INT NULL, -- Foreing Key recursiva o jerarquica (relacion TIENE)
	clave_depto INT NOT NULL, -- Foreing Key de Departamento (relacion PERTENECE)
	clave_puesto INT NOT NULL, -- Foreing Key de Puesto (relacion OCUPADO)
	CONSTRAINT fk_empleado_empleado
	FOREIGN KEY (jefe_id)
	REFERENCES empleado (num_empl),
	CONSTRAINT fk_empleado_departamento
	FOREIGN KEY (clave_depto)
	REFERENCES departamento (clave_depto),
	CONSTRAINT fk_empleado_puesto
	FOREIGN KEY (clave_puesto)
	REFERENCES puesto (clave_puesto)
);
GO

/*======================================================
   CREAR LA FOREIGN KEY DE DEPARTAMENTO CON EMPLEADO
======================================================*/
ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_empleado
FOREIGN KEY (jefe_id)
REFERENCES empleado (num_empl);
GO

/*======================================================
   TABLA CAPACITACION
======================================================*/
CREATE TABLE capacitacion (
	clave_capacitacion INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_capacitacion
	PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL
	CONSTRAINT uq_capacitacion_nombre
	UNIQUE,
	duracion_horas DECIMAL (5,2) NOT NULL
	CONSTRAINT ck_capacitacion_duracion
	CHECK (duracion_horas > 0.0)
);
GO

/*======================================================
   TABLA PROYECTO
  
======================================================*/
CREATE TABLE proyecto (
	clave_proyecto INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_proyecto
	PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	presupuesto DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_proyecto_presupuesto
	CHECK (presupuesto > 0.0),
	fecha_inicio DATE NOT NULL,
	fecha_termino DATE NULL
	CONSTRAINT ck_proyecto_fechas
	CHECK (fecha_termino IS NULL OR fecha_termino > fecha_inicio),
	clave_sucursal INT NOT NULL -- Foreing Key de Sucursal (relacion ASIGNADO)
	CONSTRAINT fk_proyecto_sucursal
	FOREIGN KEY (clave_sucursal)
	REFERENCES sucursal (clave_sucursal)
);
GO

/*======================================================
   TABLA ASISTIR 
======================================================*/
CREATE TABLE asistir (
	num_empl INT NOT NULL,
	clave_capacitacion INT NOT NULL,
	fecha_asistencia DATE NOT NULL,
	calificacion DECIMAL (4,2) NULL
	CONSTRAINT ck_asistir_calificacion
	CHECK (calificacion BETWEEN 0 AND 10),
	status VARCHAR (20) NOT NULL
	CONSTRAINT ck_asistir_status
	CHECK (status IN ('Inscrito','En curso','Aprobado','Reprobado')),
	CONSTRAINT pk_asistir
	PRIMARY KEY (num_empl, clave_capacitacion),
	CONSTRAINT fk_asistir_empleado
	FOREIGN KEY (num_empl)
	REFERENCES empleado (num_empl),
	CONSTRAINT fk_asistir_capacitacion
	FOREIGN KEY (clave_capacitacion)
	REFERENCES capacitacion (clave_capacitacion)
);
GO

/*======================================================
   TABLA PARTICIPA 
======================================================*/
CREATE TABLE participa (
	num_empl INT NOT NULL,
	clave_proyecto INT NOT NULL,
	fecha_asignacion DATE NOT NULL
	CONSTRAINT df_participa_fecha_asignacion
	DEFAULT SYSDATETIME(),
	rol VARCHAR (30) NOT NULL,
	horas DECIMAL (5,2) NOT NULL
	CONSTRAINT ck_participa_horas
	CHECK (horas > 0.0),
	CONSTRAINT pk_participa
	PRIMARY KEY (num_empl, clave_proyecto),
	CONSTRAINT fk_participa_empleado
	FOREIGN KEY (num_empl)
	REFERENCES empleado (num_empl),
	CONSTRAINT fk_participa_proyecto
	FOREIGN KEY (clave_proyecto)
	REFERENCES proyecto (clave_proyecto)
);
GO