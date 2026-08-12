/* ============================================================================
   EJERCICIO 1 - HOSPITAL 
   ============================================================================ */
   CREATE DATABASE Ejercicio_Hospital;
   GO
   USE Ejercicio_Hospital;
   GO

CREATE TABLE paciente (
    num_paciente      INT NOT NULL IDENTITY(1,1),
    nombre            VARCHAR(30) NOT NULL,
    apellido1         VARCHAR(30) NOT NULL,
    apellido2         VARCHAR(30) NULL,
    fecha_nacimiento  DATE NOT NULL,
    CONSTRAINT pk_paciente
        PRIMARY KEY (num_paciente)
);
GO

CREATE TABLE expediente (
    num_exp         INT NOT NULL IDENTITY(1,1),
    fecha_apertura  DATE NOT NULL,
    tipo_sangre     VARCHAR(3) NOT NULL,
    num_paciente    INT NOT NULL,
    CONSTRAINT pk_expediente
        PRIMARY KEY (num_exp),
    CONSTRAINT uq_expediente_num_paciente
        UNIQUE (num_paciente),
    CONSTRAINT fk_expediente_paciente
        FOREIGN KEY (num_paciente)
        REFERENCES paciente (num_paciente)
);
GO