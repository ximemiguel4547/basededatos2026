/* ============================================================================
   EJERCICIO 5 - VERSION 1 (Company)
   ============================================================================ */
CREATE DATABASE ejercicio5_version1;
GO
USE ejercicio5_version1;
GO

-- Tabla: Department
CREATE TABLE Department (
    Name        VARCHAR(50)     NOT NULL,
    Number      INT             NOT NULL,
    SSN         CHAR(9)         NULL,   -- FK -> Employee.Ssn (gerente del depto)
    StartDate   DATE            NULL,   -- fecha en que el empleado asumio como gerente
    CONSTRAINT PK_Department
        PRIMARY KEY (Name),
    CONSTRAINT UQ_Department_Number
        UNIQUE (Number),
    CONSTRAINT UQ_Department_Name_Number
        UNIQUE (Name, Number)   
);



-- Tabla: Project
CREATE TABLE Project (
    Name            VARCHAR(50)     NOT NULL,
    Number          INT             NOT NULL,
    Location        VARCHAR(100)    NULL,
    NameProject     VARCHAR(50)     NOT NULL,  -- FK -> Department.Name (NN)
    NumberProject   INT             NOT NULL,  -- FK -> Department.Number (NN)
    CONSTRAINT PK_Project
        PRIMARY KEY (Name, Number),
    CONSTRAINT FK_Project_Department
        FOREIGN KEY (NameProject, NumberProject)
        REFERENCES Department (Name, Number)
);
GO

-- Tabla: Employee
CREATE TABLE Employee (
    Ssn             CHAR(9)         NOT NULL,
    FirstName       VARCHAR(50)     NULL,
    LastName        VARCHAR(50)     NULL,
    Bdate           DATE            NULL,
    Address         VARCHAR(100)    NULL,
    Salary          DECIMAL(10,2)   NULL,
    Sex             CHAR(1)         NULL,
    NameProject     VARCHAR(50)     NOT NULL,  -- FK -> Project.Name (NN)
    NumberProject   INT             NOT NULL,  -- FK -> Project.Number (NN)
    Jef             CHAR(9)         NULL,       -- FK -> Employee.Ssn (autoreferencia: supervisor)
    CONSTRAINT PK_Employee
        PRIMARY KEY (Ssn),
    CONSTRAINT FK_Employee_Project
        FOREIGN KEY (NameProject, NumberProject)
        REFERENCES Project (Name, Number),
    CONSTRAINT FK_Employee_Supervisor
        FOREIGN KEY (Jef)
        REFERENCES Employee (Ssn)
);
GO


ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager
    FOREIGN KEY (SSN)
    REFERENCES Employee (Ssn);
GO

-- Tabla: Locations
CREATE TABLE Locations (
    Numlocation     INT             NOT NULL,
    Numedepartmen   INT             NOT NULL,  -- FK -> Department.Number
    Location        VARCHAR(100)    NULL,
    CONSTRAINT PK_Locations
        PRIMARY KEY (Numlocation),
    CONSTRAINT FK_Locations_Department
        FOREIGN KEY (Numedepartmen)
        REFERENCES Department (Number)
);
GO



-- Tabla: Works_on
CREATE TABLE Works_on (
    Ssn             CHAR(9)         NOT NULL,
    NumeProyect     VARCHAR(50)     NOT NULL,  -- FK -> Project.Name (NN)
    NumberProyect   INT             NOT NULL,  -- FK -> Project.Number (NN)
    Hours           DECIMAL(5,2)    NULL,
    CONSTRAINT PK_Works_on
        PRIMARY KEY (Ssn, NumeProyect, NumberProyect),
    CONSTRAINT FK_Works_on_Employee
        FOREIGN KEY (Ssn)
        REFERENCES Employee (Ssn),
    CONSTRAINT FK_Works_on_Project
        FOREIGN KEY (NumeProyect, NumberProyect)
        REFERENCES Project (Name, Number)
);
GO

-- Tabla: Dependent
CREATE TABLE Dependent (
    Name            VARCHAR(50)     NOT NULL,
    Ssn             CHAR(9)         NOT NULL,  -- FK -> Employee.Ssn
    Sex             CHAR(1)         NULL,
    Birthdate       DATE            NULL,
    RelatioShip     VARCHAR(30)     NULL,
    CONSTRAINT PK_Dependent
        PRIMARY KEY (Name, Ssn),
    CONSTRAINT FK_Dependent_Employee
        FOREIGN KEY (Ssn)
        REFERENCES Employee (Ssn)
);
GO
```
![DiagramaComercializadora](../../img/construccion/05-Employee.png)
