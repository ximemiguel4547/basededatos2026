/* ============================================================================
   EJERCICIO 2 - Inscribir
   ============================================================================ */
   CREATE DATABASE Ejercicio2_Inscribir;
GO
USE ejercicio2_Inscribir;
GO
   
CREATE TABLE alumno (
    num_alumno    INT          NOT NULL IDENTITY(1,1),
    matricula     VARCHAR(15)  NOT NULL,
    nombre        VARCHAR(30)  NOT NULL,
    ap1           VARCHAR(20)  NOT NULL,
    ap2           VARCHAR(20)  NULL,
    semestre      INT          NOT NULL,
    CONSTRAINT pk_alumno
        PRIMARY KEY (num_alumno),
    CONSTRAINT uq_alumno_matricula
        UNIQUE (matricula)
);
GO

CREATE TABLE materia (
    clave_materia  CHAR(5)      NOT NULL,
    nombre         VARCHAR(50)  NOT NULL,
    creditos       INT          NOT NULL,
    CONSTRAINT pk_materia
        PRIMARY KEY (clave_materia),
    CONSTRAINT uq_materia_nombre
        UNIQUE (nombre)
);
GO

CREATE TABLE inscribir (
    num_alumno           INT           NOT NULL,
    clave_materia        CHAR(5)       NOT NULL,
    fecha_inscripcion    DATE          NOT NULL,
    calificacion_final   DECIMAL(4,2)  NULL,
    CONSTRAINT pk_inscribir
        PRIMARY KEY (num_alumno, clave_materia),
    CONSTRAINT fk_inscribir_alumno
        FOREIGN KEY (num_alumno)
        REFERENCES alumno (num_alumno),
    CONSTRAINT fk_inscribir_materia
        FOREIGN KEY (clave_materia)
        REFERENCES materia (clave_materia)
);
GO
