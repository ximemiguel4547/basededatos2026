# Diccionario de datos de la base de datos control escolar

## Diccionario de Datos 1 de la Base de Datos Clínica

### 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema Clínico |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ximena Miguel García |
| SGBD | SQL Server |

---

### 2. Descripción de la Base de Datos

La Base de Datos administra:

- Paciente
- Expediente

Permite almacenar la información de los pacientes y su expediente clínico.

---

### 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | AutoIncrement o Identity |
| CK | Check |
| DF | Default |

---

### 4. Diccionario de Datos

### Tabla: Paciente

**Descripción**

Almacena la información general de los pacientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, AI, NN | Identificador del paciente |
| Nombre | VARCHAR | 50 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |

---

### Tabla: Expediente

**Descripción**

Almacena el expediente clínico de cada paciente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumExp | INT | - | PK, AI, NN | Identificador del expediente |
| FechaApertura | DATE | - | NN | Fecha de apertura |
| TipoSangre | VARCHAR | 5 | NN | Tipo de sangre |
| NumPaciente | INT | - | FK, UQ, NN | Paciente al que pertenece |

---

### 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Paciente -> Expediente | 1:1 | Cada paciente posee un único expediente |

---

### 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | NumPaciente | Paciente(NumPaciente) |

---

### 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente para un paciente inexistente. |

---

### 8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un paciente sólo puede tener un expediente. |
| RN-02 | Cada expediente pertenece a un único paciente. |

---

### 9. Diagrama Relacional

![Relacional](../../img/Relacional/Ejercicio1_RelacionalPaciente.jpeg)

---
---

## Diccionario de Datos 2 de la Base de Datos Universidad

### 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ximena Miguel García |
| SGBD | SQL Server |

---

### 2. Descripción de la Base de Datos

La Base de Datos administra:

- Profesor
- Curso
- Especialidad

Permite administrar los cursos impartidos por los profesores y las especialidades que poseen.

---

### 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | AutoIncrement o Identity |
| CK | Check |
| DF | Default |

---

### 4. Diccionario de Datos

### Tabla: Profesor

**Descripción**

Almacena la información de los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProfesor | INT | - | PK, AI, NN | Identificador del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |

---

### Tabla: Curso

**Descripción**

Almacena los cursos impartidos por los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCurso | INT | - | PK, AI, NN | Identificador del curso |
| NombreCurso | VARCHAR | 100 | NN | Nombre del curso |
| Creditos | INT | - | NN | Número de créditos |
| Profesor | INT | - | FK, NN | Profesor que imparte el curso |

---

### Tabla: Especialidad

**Descripción**

Almacena las especialidades de cada profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| EspecialidadID | INT | - | PK, AI, NN | Identificador |
| Nombre | VARCHAR | 100 | NN | Nombre de la especialidad |
| Profesor | INT | - | FK, NN | Profesor asignado |

---

### 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Profesor -> Curso | 1:N | Un profesor puede impartir varios cursos |
| Profesor -> Especialidad | 1:N | Un profesor puede tener varias especialidades |

---

### 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Curso | Profesor | Profesor(NumProfesor) |
| Especialidad | Profesor | Profesor(NumProfesor) |

---

### 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No puede existir un curso sin profesor. |
| IR-02 | No puede existir una especialidad sin profesor. |

---

### 8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos. |
| RN-02 | Cada curso pertenece a un solo profesor. |
| RN-03 | Un profesor puede tener varias especialidades. |

---

### 9. Diagrama Relacional

![Relacional](../../img/Relacional/Ejercicio2_Relacional_Curso.jpg)

---
---

## Diccionario de base de datos 3 

1. Informacion General

| Elemento  | Valor |
| :--- | :--- |
| Proyecto | Control escolar |
| Version | 1.0|
| Fecha | Junio 2026|
| Elaboro | Ximena Miguel García | 
| SGBD | SQLSERVER |

2. Descripcion de la base de datos

La base de datos administra:
- Carrera 
- Alumno
- Profesor 
- Materia
- Grupo
- Inscripcion

Permite controlar la oferta educativa y la inscripcion de estudiantes

3. Catalogo de Restrincciones Utilizadas 

| Catalogo | significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreing Key|
| NN | Not Null |
| UQ | Unique |
| AI | Autoincrement o indentity |
| CK | Check|
| DF | Default|

4. Diccionario de Datos 

**Tabla:** _Correo_

**Descripcion**
Almacena las carreras ofertadas por la universidad

| Campo | Tipo | Longitud | Restrticciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| ID_Carrera | INT | - | PK, AI, NN | Identificador Unico de la carrera |
| nombre | VARCHAR | 100 | UQ, NN | Nombre de la carrera |
| duracio_cuatrimestre | INT | 100 | CK (>0), NN | Duracion de cuatrimestre |


---

**Tabla:** _Alumno_

**Descripcion**
Almacena la informcaion de los estudiantes

| Campo | Tipo | Longitud | Restrticciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| Id_Alumno | INT | - | PK, AI, NN | Identificador del alumno|
| matricula | VARCHAR | 10 | UQ, NN | Matricula Institucional del alumno |
| nombre | VARCHAR | 50 | NN | Nombre del alumno |
| apellido_paterno | VARCHAR | 50 | NN | Apelido Paterno |
| apellido_materno | VARCHAR | 50 | UQ, NULL | Apellido Materno |
| correo | VARCHAR | 100 | UQ, NULL | Correo instituional |
| fecha_nacimiento | DATE | - | NN | Fecha nacimiento |
| id_carrera | INT | - | FK, NN | Carrera a la que pertenece |

---

TODO: Documentar las siguientes tablas

5. Relaciones en la base de datos

| Relacion | Cardinalidad | Descripcion |
| :--- | :--- | :--- | 
| Carrera --> Alumno | 1:N | Una carrera tiene muchos alumnos  |
| Carrera --> Materia | 1:N | Una carrera tiene muchas materias | 
| Profesor --> Grupo | 1:N | Un profesor puede impartir varios grupos |
| Materia --> Grupo | 1:N | Una materia puede abrirse en varios grupos |
| Alumno --> Inscripcion | 1:N | Un alumno puede tener varias inscripciones |
| Grupo --> Inscripcion | 1:N | Un grupo puede tener muchos alumnos |

6. Matriz de claves foraneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- | 
| Alumno | id_carrera | Carrera(id_carrera) | 
| Materia |id_carrera | Carrera(id_carrera) | 
| Grupo | id_profesor | Profesor(id_profesor) | 
| Grupo | id_materia | Materia(id_materia) | 
| Inscripcion | id_alumno | Alumno(id_alumno) | 
| Incripcion | id_grupo | Grupo(id_grupo) | 

7. Integridad Referencial 

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |

8. Reglas del negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una materia puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un proofesor puede tener varios grupos |

9. Diagrama Relacional


![EjercicioRelaciona](../../img/Relacional/Ejercicio3_RelacionalInscribe.jpeg)


---
---

## Diccionario de Datos 4 de la Base de Datos Ventas

### 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Ventas |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró |  Ximena Miguel García |
| SGBD | SQL Server |

---

### 2. Descripción de la Base de Datos

La Base de Datos administra:

- Cliente
- Pedido
- Producto
- DetallePedido

Permite controlar las ventas realizadas por los clientes.

---

### 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | AutoIncrement o Identity |
| CK | Check |
| DF | Default |

---

### 4. Diccionario de Datos

### Tabla: Cliente

**Descripción**

Almacena la información de los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCliente | INT | - | PK, AI, NN | Identificador del cliente |
| Nombre | VARCHAR | 50 | NN | Nombre |
| Ap1 | VARCHAR | 50 | NN | Primer apellido |
| Ap2 | VARCHAR | 50 | NULL | Segundo apellido |

---

### Tabla: Pedido

**Descripción**

Almacena los pedidos realizados por los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido | INT | - | PK, AI, NN | Identificador del pedido |
| FechaPedido | DATE | - | NN | Fecha del pedido |
| Cliente | INT | - | FK, NN | Cliente que realizó el pedido |
| Total | DECIMAL | 10,2 | NN | Total del pedido |

---

### Tabla: Producto

**Descripción**

Almacena los productos disponibles.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProd | INT | - | PK, AI, NN | Identificador del producto |
| Nombre | VARCHAR | 100 | UQ, NN | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN | Precio del producto |

---

### Tabla: DetallePedido

**Descripción**

Almacena los productos incluidos en cada pedido.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDetalle | INT | - | PK, AI, NN | Identificador del detalle |
| NumPedido | INT | - | FK, NN | Pedido al que pertenece |
| NumProd | INT | - | FK, NN | Producto vendido |
| PrecioVenta | DECIMAL | 10,2 | NN | Precio de venta |
| CantidadVendida | INT | - | NN | Cantidad vendida |

---

### 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Cliente -> Pedido | 1:N | Un cliente puede realizar varios pedidos |
| Pedido -> DetallePedido | 1:N | Un pedido puede tener varios productos |
| Producto -> DetallePedido | 1:N | Un producto puede aparecer en varios pedidos |

---

### 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | Cliente | Cliente(NumCliente) |
| DetallePedido | NumPedido | Pedido(NumPedido) |
| DetallePedido | NumProd | Producto(NumProd) |

---

### 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No puede existir un pedido sin un cliente registrado. |
| IR-02 | No puede existir un detalle de pedido sin un pedido existente. |
| IR-03 | No puede venderse un producto inexistente. |

---

### 8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar múltiples pedidos. |
| RN-02 | Todo pedido debe pertenecer a un cliente. |
| RN-03 | Un pedido debe contener al menos un producto. |
| RN-04 | Un producto puede formar parte de varios pedidos. |

---

### 9. Diagrama Relacional

![Relacional](../../img/Relacional/Ejercicio4_RelacionalPedido.jpg)

---
---

## Diccionario de Datos 5 de la Base de Datos Empresa

### 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró |  Ximena Miguel García |
| SGBD | SQL Server |

---

### 2. Descripción de la Base de Datos

La Base de Datos administra:

- Departamento
- Empleado
- Proyecto
- Trabaja_En
- Dependiente
- Ubicacion_Departamento

Permite administrar la información de los departamentos de la empresa, los empleados que pertenecen a cada uno de ellos, los proyectos desarrollados, las horas trabajadas por cada empleado, los dependientes registrados para efectos de seguros y las distintas ubicaciones de cada departamento.

---

### 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | AutoIncrement o Identity |
| CK | Check |
| DF | Default |

---

### 4. Diccionario de Datos

### Tabla: Departamento

**Descripción**

Almacena la información de los departamentos de la empresa, incluyendo el gerente responsable y la fecha en que inició su administración.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_departamento | INT | - | PK, NN | Número identificador del departamento. |
| nombre_departamento | VARCHAR | 100 | UQ, NN | Nombre único del departamento. |
| gerente_ssn | VARCHAR | 15 | FK, NN | Número de Seguro Social del gerente del departamento. |
| fecha_inicio_gerencia | DATE | - | NN | Fecha de inicio de la gerencia del departamento. |

---

### Tabla: Empleado

**Descripción**

Almacena la información personal y laboral de los empleados de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | VARCHAR | 15 | PK, NN | Número de Seguro Social del empleado. |
| nombre | VARCHAR | 100 | NN | Nombre completo del empleado. |
| direccion | VARCHAR | 200 | NN | Dirección del empleado. |
| salario | DECIMAL | 12,2 | NN, CK (>0) | Salario asignado al empleado. |
| sexo | CHAR | 1 | NN | Sexo del empleado. |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento del empleado. |
| num_departamento | INT | - | FK, NN | Departamento al que pertenece el empleado. |
| supervisor_ssn | VARCHAR | 15 | FK, NULL | Número de Seguro Social del supervisor inmediato. |

---

### Tabla: Proyecto

**Descripción**

Almacena la información de los proyectos desarrollados dentro de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_proyecto | INT | - | PK, NN | Número identificador del proyecto. |
| nombre_proyecto | VARCHAR | 100 | UQ, NN | Nombre del proyecto. |
| ubicacion | VARCHAR | 100 | NN | Ubicación donde se desarrolla el proyecto. |
| num_departamento | INT | - | FK, NN | Departamento responsable del proyecto. |

---
### Tabla: Trabaja_En

**Descripción**

Almacena la información de la participación de los empleados en los proyectos de la empresa, indicando el número de horas trabajadas semanalmente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ssn | VARCHAR | 15 | PK, FK, NN | Número de Seguro Social del empleado. |
| num_proyecto | INT | - | PK, FK, NN | Proyecto en el que trabaja el empleado. |
| horas_semana | DECIMAL | 5,2 | NN, CK (>=0) | Número de horas trabajadas por semana en el proyecto. |

---

### Tabla: Dependiente

**Descripción**

Almacena la información de los dependientes registrados por cada empleado para efectos administrativos y de seguros.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_dependiente | INT | - | PK, AI, NN | Identificador único del dependiente. |
| nombre | VARCHAR | 100 | NN | Nombre completo del dependiente. |
| sexo | CHAR | 1 | NN | Sexo del dependiente. |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento del dependiente. |
| parentesco | VARCHAR | 50 | NN | Relación del dependiente con el empleado. |
| ssn | VARCHAR | 15 | FK, NN | Número de Seguro Social del empleado al que pertenece el dependiente. |

---

### Tabla: Ubicacion_Departamento

**Descripción**

Almacena las diferentes ubicaciones físicas donde opera cada departamento de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_ubicacion | INT | - | PK, AI, NN | Identificador único de la ubicación. |
| num_departamento | INT | - | FK, NN | Departamento al que pertenece la ubicación. |
| ubicacion | VARCHAR | 100 | NN | Dirección o ubicación física del departamento. |

---
### 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Departamento -> Empleado | 1:N | Un departamento puede tener varios empleados, pero cada empleado pertenece a un solo departamento. |
| Departamento -> Proyecto | 1:N | Un departamento administra uno o varios proyectos. |
| Empleado -> Trabaja_En | 1:N | Un empleado puede participar en varios proyectos. |
| Proyecto -> Trabaja_En | 1:N | Un proyecto puede tener asignados varios empleados. |
| Empleado -> Dependiente | 1:N | Un empleado puede registrar uno o varios dependientes. |
| Empleado -> Empleado | 1:N | Un empleado puede supervisar a otros empleados. |
| Departamento -> Ubicacion_Departamento | 1:N | Un departamento puede tener varias ubicaciones físicas. |

---

### 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Departamento | gerente_ssn | Empleado(ssn) |
| Empleado | num_departamento | Departamento(num_departamento) |
| Empleado | supervisor_ssn | Empleado(ssn) |
| Proyecto | num_departamento | Departamento(num_departamento) |
| Trabaja_En | ssn | Empleado(ssn) |
| Trabaja_En | num_proyecto | Proyecto(num_proyecto) |
| Dependiente | ssn | Empleado(ssn) |
| Ubicacion_Departamento | num_departamento | Departamento(num_departamento) |

---

### 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado en un departamento inexistente. |
| IR-02 | Todo gerente debe ser un empleado registrado en la empresa. |
| IR-03 | No se puede asignar un proyecto a un departamento inexistente. |
| IR-04 | No se puede registrar la participación de un empleado en un proyecto inexistente. |
| IR-05 | No se puede registrar un dependiente para un empleado inexistente. |
| IR-06 | Todo supervisor debe existir previamente como empleado. |
| IR-07 | No se puede registrar una ubicación para un departamento inexistente. |
| IR-08 | No se puede eliminar un departamento mientras existan empleados o proyectos asociados. |
| IR-09 | No se puede eliminar un empleado si administra un departamento sin reasignar previamente un nuevo gerente. |
| IR-10 | No se puede eliminar un proyecto mientras existan empleados asignados en la tabla Trabaja_En. |

---

### 8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Cada empleado pertenece a un único departamento. |
| RN-02 | Un departamento puede tener varios empleados. |
| RN-03 | Cada departamento debe contar con un gerente responsable. |
| RN-04 | Un gerente debe ser un empleado registrado en la empresa. |
| RN-05 | Un departamento puede administrar varios proyectos. |
| RN-06 | Cada proyecto pertenece únicamente a un departamento. |
| RN-07 | Un empleado puede trabajar en varios proyectos simultáneamente. |
| RN-08 | Un proyecto puede tener asignados varios empleados. |
| RN-09 | Debe registrarse el número de horas trabajadas por cada empleado en cada proyecto. |
| RN-10 | Un empleado puede supervisar a uno o varios empleados. |
| RN-11 | Un empleado puede tener varios dependientes registrados. |
| RN-12 | Un departamento puede contar con una o varias ubicaciones físicas. |
| RN-13 | El salario de un empleado debe ser mayor a cero. |
| RN-14 | Las horas trabajadas por semana deben ser mayores o iguales a cero. |
| RN-15 | La fecha de inicio de gerencia debe ser igual o posterior a la fecha de contratación del gerente (si ésta existe en el sistema). |


### 9. Diagrama Relacional

![EjercicioRelacional](../../img/Relacional/Ejercicio5_RelacionalEmployeeV1.jpg)

# Diccionario de Datos 6 de la Base de Datos Control Escolar

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró |  Ximena Miguel García |
| SGBD | SQL Server |

---

### 2. Descripción de la Base de Datos

La Base de Datos administra la información relacionada con:

- Alumno
- Credencial
- Materia
- Profesor
- Departamento
- Dependiente
- Proyecto
- Cursa
- Participa

Permite controlar la información académica de los alumnos, la asignación de profesores a materias, la administración de departamentos, el registro de proyectos institucionales, así como el historial académico de cada estudiante.

---

### 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | AutoIncrement o Identity |
| CK | Check |
| DF | Default |

---

### 4. Diccionario de Datos

### Tabla: Alumno

**Descripción**

Almacena la información personal y académica de los alumnos inscritos en la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, NN | Matrícula única del alumno. |
| Nombre | VARCHAR | 50 | NN | Nombre(s) del alumno. |
| ApellidoP | VARCHAR | 50 | NN | Apellido paterno. |
| ApellidoM | VARCHAR | 50 | NN | Apellido materno. |
| Correo | VARCHAR | 100 | UQ, NN | Correo electrónico institucional. |
| Telefono | VARCHAR | 15 | NULL | Número telefónico del alumno. |

---

### Tabla: Credencial

**Descripción**

Almacena la información de las credenciales emitidas para cada alumno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCredencial | INT | - | PK, AI, NN | Número identificador de la credencial. |
| Vigencia | DATE | - | NN | Fecha de vencimiento de la credencial. |
| FechaExpedicion | DATE | - | NN | Fecha de emisión de la credencial. |
| Matricula | VARCHAR | 10 | FK, UQ, NN | Alumno propietario de la credencial. |

---

### Tabla: Materia

**Descripción**

Almacena las materias ofertadas por la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveMateria | VARCHAR | 10 | PK, NN | Clave única de la materia. |
| NombreMateria | VARCHAR | 80 | NN | Nombre de la materia. |
| Creditos | INT | - | NN, CK (>0) | Número de créditos asignados. |
| TotalMaterias | INT | - | DF(0) | Cantidad total de materias registradas (atributo derivado). |
| NumProf | INT | - | FK, NN | Profesor responsable de impartir la materia. |

---

### Tabla: Profesor

**Descripción**

Almacena la información del personal docente de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, AI, NN | Identificador único del profesor. |
| Nombre | VARCHAR | 50 | NN | Nombre(s) del profesor. |
| ApellidoP | VARCHAR | 50 | NN | Apellido paterno. |
| ApellidoM | VARCHAR | 50 | NN | Apellido materno. |
| Correo | VARCHAR | 100 | UQ, NN | Correo institucional del profesor. |
| Telefono | VARCHAR | 15 | NULL | Número telefónico. |
| CodDepartamento | INT | - | FK, NN | Departamento al que pertenece. |
### Tabla: Departamento

**Descripción**

Almacena la información de los departamentos académicos de la institución, así como el responsable de cada uno de ellos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| CodDepartamento | INT | - | PK, AI, NN | Identificador único del departamento. |
| Nombre | VARCHAR | 80 | UQ, NN | Nombre del departamento. |
| NombreJefe | VARCHAR | 100 | NN | Nombre del jefe del departamento. |

---

### Tabla: Dependiente

**Descripción**

Almacena la información de los dependientes registrados por cada profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDependiente | INT | - | PK, AI, NN | Identificador único del dependiente. |
| Nombre | VARCHAR | 100 | NN | Nombre completo del dependiente. |
| Parentesco | VARCHAR | 30 | NN | Relación familiar con el profesor. |
| NumProf | INT | - | FK, NN | Profesor al que pertenece el dependiente. |

---

### Tabla: Proyecto

**Descripción**

Almacena la información de los proyectos desarrollados dentro de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| CodProyecto | INT | - | PK, AI, NN | Identificador único del proyecto. |
| NombreProyecto | VARCHAR | 100 | UQ, NN | Nombre del proyecto. |
| Presupuesto | DECIMAL | 12,2 | NN, CK (>0) | Presupuesto asignado al proyecto. |

---

### Tabla: Cursa

**Descripción**

Registra las materias inscritas por cada alumno, así como la fecha de inscripción y la calificación obtenida.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, FK, NN | Alumno inscrito. |
| ClaveMateria | VARCHAR | 10 | PK, FK, NN | Materia cursada. |
| FechaInscripcion | DATE | - | NN | Fecha en que el alumno se inscribió a la materia. |
| CalificacionFinal | DECIMAL | 4,2 | CK (>=0 y <=10) | Calificación final obtenida por el alumno. |

---

### Tabla: Participa

**Descripción**

Registra la participación de los profesores en los diferentes proyectos institucionales.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, FK, NN | Profesor participante. |
| CodProyecto | INT | - | PK, FK, NN | Proyecto en el que participa el profesor. |
---

### 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Credencial | 1:1 | Cada alumno posee una única credencial institucional y cada credencial pertenece a un solo alumno. |
| Profesor -> Materia | 1:N | Un profesor puede impartir varias materias, pero cada materia es impartida por un solo profesor. |
| Departamento -> Profesor | 1:N | Un departamento puede tener varios profesores adscritos. |
| Profesor -> Dependiente | 1:N | Un profesor puede registrar uno o varios dependientes. |
| Alumno -> Cursa | 1:N | Un alumno puede cursar varias materias durante su trayectoria académica. |
| Materia -> Cursa | 1:N | Una materia puede ser cursada por varios alumnos. |
| Profesor -> Participa | 1:N | Un profesor puede participar en varios proyectos institucionales. |
| Proyecto -> Participa | 1:N | Un proyecto puede contar con la participación de varios profesores. |

---

### 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Credencial | Matricula | Alumno(Matricula) |
| Profesor | CodDepartamento | Departamento(CodDepartamento) |
| Materia | NumProf | Profesor(NumProf) |
| Dependiente | NumProf | Profesor(NumProf) |
| Cursa | Matricula | Alumno(Matricula) |
| Cursa | ClaveMateria | Materia(ClaveMateria) |
| Participa | NumProf | Profesor(NumProf) |
| Participa | CodProyecto | Proyecto(CodProyecto) |

---

### 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar una credencial para un alumno inexistente. |
| IR-02 | No se puede registrar una materia sin un profesor asignado. |
| IR-03 | Todo profesor debe pertenecer a un departamento existente. |
| IR-04 | No se puede registrar un dependiente para un profesor inexistente. |
| IR-05 | No se puede inscribir un alumno en una materia inexistente. |
| IR-06 | No se puede registrar una inscripción para un alumno inexistente. |
| IR-07 | No se puede registrar la participación de un profesor inexistente en un proyecto. |
| IR-08 | No se puede registrar la participación en un proyecto inexistente. |
| IR-09 | No se puede eliminar un profesor si existen materias asignadas a él sin antes reasignarlas. |
| IR-10 | No se puede eliminar un alumno mientras tenga materias inscritas o una credencial activa. |

---

### 8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 | Cada alumno debe contar con una matrícula única. |
| RN-02 | Cada alumno puede tener únicamente una credencial vigente. |
| RN-03 | Cada credencial pertenece exclusivamente a un alumno. |
| RN-04 | Un profesor puede impartir una o varias materias. |
| RN-05 | Cada materia debe ser impartida por un único profesor. |
| RN-06 | Todo profesor pertenece a un solo departamento. |
| RN-07 | Un departamento puede tener varios profesores adscritos. |
| RN-08 | Un profesor puede registrar varios dependientes. |
| RN-09 | Un alumno puede cursar varias materias durante un periodo escolar. |
| RN-10 | Una materia puede ser cursada por múltiples alumnos. |
| RN-11 | Un profesor puede participar en varios proyectos institucionales. |
| RN-12 | Un proyecto puede tener varios profesores participantes. |
| RN-13 | La calificación final debe encontrarse en un rango de 0 a 10. |
| RN-14 | El presupuesto de un proyecto debe ser mayor que cero. |
| RN-15 | Los créditos de una materia deben ser mayores que cero. |

---

### 9. Diagrama Relacional

![EjercicioRelacional](../../img/Relacional/Ejercicio6_RelacionalEmployeeV2.jpeg)

## Diccionario de datos de la base de datos Control Escolar 

## EJERCICIO 3


| Elemento | Valor |
| :--- | :--- |
| Proyecto |  Control Escolar |
| version | 1.0  |
| Fecha | Junio 2026  |
| Elaboro | Ximena Miguel García  |
| SGBD | SQLSERVER |

2. Descripcion de la Base de Datos

La Base de Datos Administra:

- Carreras
- Alumno
- Profesor
- Materia
- Grupo 
- Inscripcion
Permite controlar la oferta academica y ls inscripcion de estudiantes

3. Catalogo de Restricciones utulizadas
| Catalogo | Significado |
| :--- | :--- |
| PK |  Primary Key |
| FK | Foreinfg Key  |
|NW | Not Null |
| UQ | Unique  |
| AI| Autoincrement o Identify |
| CK |  Chek  |
| DF | Default |


4. Diccionario de Datos

**Tabla** _Carrera_

**Descripcion**
Almacena las carreras Ofertadas por la universidad

| Campo| Tipo | Longitud | Restricciones| Descripcion|
| :--- | :--- | :--- | :--- | :--- |
| id_carrera | INT | - | PK,AI,NN | Identificador unico de la carrera |
| nombre| VARCHAR | 100 | UQ,NN | Nombre de la carrera|
| duracion_cuatrimestre | INT | - | NN,PK(>0) | Duracion en cuatrimestres|

---

**Tabla** _Alumno_

**Descripcion**
Almacena la informacion de los estudiantes

| Campo| Tipo | Longitud | Restricciones| Descripcion|
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK,AI,NN | Identificador del alumno |
| matricula| VARCHAR | 10 | UQ,NN | Matricula Institucional|
|apellido_paterno| VARCHAR| 50 | NN | Apellido Paterno |
|apellido_materno| VARCHAR| 50 | NN | Apellido Materno |
|correo  | VARCHAR| 100 | UQ,NULL| Correo Institucional|
|fecha_nacimiento | INT| - | NN| Fecha Nacimiento |
|id_carrera | INT| - | FK,NN| Carrera a la que pertenece |

---
TODO: Documentar las siguientes tablas

5. Relaciones en la base de Datos

| Relacion | Cardinalidad| Descripcion |
| :--- | :--- | :--- |
| Carrera-> Alumno | 1:N | Una carrera tiene muchos Alumnos | 
| Carrera-> Materia | 1:N | Una carrera tiene muchas Materias |
| Profesor-> Grupo| 1:N | Un profesor puede impartir en varios grupos |
|Materia-> Grupo| 1:N |  Una Materia puede abrirse en varios grupos |
| Alumno-> Inscripcion | 1:N | Un grupo puede tener varias inscripciones|
| Grupo-> Inscripcion 1:N | Un grupo puede Tener muchos alumnos |

6. Matriz de claves Foraneas

| Tabla | Campo FK | Referencias |
| :--- | :--- | :--- |
| Alumno | id_carrera | carrera (id_carrera)| 
| Materia | id_carrera | carrera (id_carrera) |
|Grupo | id_profesor | Profesor (id_profesor)|
|Grupo | id_materia | Materia (id_materia)|
|Inscripcion | id_alumno | Alumno (id_alumno)|
|Inscripcion | id_grupo | Grupo(id_grupo)|

8. Reglas del Negocio

| Clave | Regla |
| :--- | :--- |
| RN-01 |Un alumno pertenece a una sola carrera |
| RN-02 |Una carrera puede tener muchos alumnos |
| IR-03 | Una carrera puede tener muchas Materias |
| IR-04 | Un profesor  puede impartir varios grupos |

9. Diagrama Relacional

![Ejercicio](../img/Ejercicio1_Hospital_.jpg)





