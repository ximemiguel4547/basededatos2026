## Construccion de BD en SQL Server,Mysql o MariaDB y Postgres

Para la construccion de objetos de la base de datos se utiliza el lenguaje SQL (Structured Languaje) se divide en **cinco grandes categorias**

## SQL
- DDL (Data Definition Languaje)
- DML (Data Manipulation Languaje)
- DQL (Data Query Languaje)
- DCL (Data Control Languaje)
- TCL (Transaction Control Languaje)

### DDL
Lenguaje de Definicion de Datos 
Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sobre los objetos de la base de datos:
- Base de Datos 
- Tablas
- Vistas 
- Restricciones 
- Esquemas
- Procedimientos Almacenados 
- Funciones
- Disaparadores
## Comandos Principales 
| Comando  |  Función|
| :--- | :--- |
|Create | Crear Objetos |
| Alter | Modificar Objetos
| Drop | Eliminar Objetos |
| Truncate | Vacia una tabla|
| Rename | Renombra objetos (Segun el SGBD) |

### SQL - DML
Sirve para **trabajar con la infromacion almacenada**

Nota: Aquí no cambia la estructura sino los registros


**Comandos Principales**

| Comando  |  Función|
| :--- | :--- |
|INSERT| Inserta Registros |
| UPDATE | Actualiza Registros|
| DELETE| Elimina REgistros |

### SQL - DQL

**Lenguaje de consulta  de datos **
Su Funcion es **Consultar Información**


| Comando  |  Función|
| :--- | :--- |
|SELECT| IConsultar Información |

Generalmente se combina con :

- WHERE
- ORDER SY
- GROUP BY
- HAVING 
- JOIN (LEFT, RIGHT,INNER,CROSS,FULL)
- DISTINCT
- TOP / LIMIT
- FUNCIONES DE AGREGADO 
- FUNCIONES DE VENTANA

## Nomenclatura  de Construcción 

Utilizaremos la convención **snake_case**

| Objeto | Convencion |  Ejemplo |
| :--- | :--- |:--- |
| Base de datos | snake_case | control_escolar |
| Esquema | snake_case | ventas,rh,seguridad |
| Tabla| Singular en snake_case | cliente,pedido,detalle_pedido|
| Columna | snake_case | cliente_id,fecha_registro,correo_electronico |
| PK | <tabla>_id | cliente_id,producto_id |
| FK | igual que la PK referenciada | cliente_id,producto_id |
| Tabla puente | <tabla>_<tabla> | alumno_curso,producto_proveedor |

**Restricciones**

pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_pruducto_precio
df_cliente_activo

### DDL en SQL Server CREATE, ALTER Y DROP para la creacion y modificacion de tablas 

**Sintaxis de creación de tablas**

```sql
CREATE TABLE nombre_tabla
(
columna tipo_dato restricciones,
columna tipo_dato restricciones,
)
```

## SQL SERVER 

```sql
    CREATE
    ALTER 
    DROP
    
```
### Alter Table 

Permite modificar una tabla existente 

Puede:

- Agregar columnas
- Eliminar columnas
- Modificar columnas
- Agregar Restricciones
- Eliminar Restricciones

