# Armario Virtual :fox_face:

La cuestión de qué ponerse parece al principio un problema inocuo; sin embargo, la presentación, la autoexpresión y el acto de arreglarse pueden facilitarnos el día más de lo que parece. Este proyecto quiere ayudarte a que prepararte no sea algo en lo que tengas que pensar mucho ni te agobie.

Podrás llevar un registro virtual de todas tus prendas de ropa para tenerlas en un lugar visualmente más ordenado que un armario o una cajonera.

Cada usuario podrá registrar muchos artículos, especificando todas las características que desee de cada uno. También podrá crear atuendos combinando las prendas que ya tenga registradas.

### Link al DER y diagrama de tablas [por acá](https://app.diagrams.net/#G1XbK7jtxVw2sakCeIeltl9iXNoDowllQw#%7B%22pageId%22:%22K-FfVuPv3FEkUfl-NZCg%22%7D)

## Diccionario de Datos - Armario Virtual

### 1. Tablas Independientes (Catálogos y Usuarios)

#### Tabla: `usuario`
*Descripción: Almacena la información personal de los usuarios registrados en el sistema.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idUsuario` | INT | 5 | PK, NOT NULL, AUTO_INCREMENT | Identificador único del usuario. |
| `nombreUsuario` | VARCHAR | 25 | NOT NULL | Nombre de pila del usuario. |
| `apellidoUsuario` | VARCHAR | 25 | NOT NULL | Apellido del usuario. |
| `emailUsuario` | VARCHAR | 255 | NOT NULL | Correo electrónico de contacto. |

#### Tabla: `color`
*Descripción: Catálogo de colores disponibles para asociar a las prendas.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idColor` | INT | 2 | PK, NOT NULL, AUTO_INCREMENT | Identificador único del color. |
| `nombreColor` | VARCHAR | 15 | NOT NULL | Nombre descriptivo del color (ej. Negro, Azul). |

#### Tabla: `marca`
*Descripción: Catálogo de marcas de indumentaria.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idMarca` | INT | 3 | PK, NOT NULL, AUTO_INCREMENT | Identificador único de la marca. |
| `nombreMarca` | VARCHAR | 25 | NOT NULL | Nombre comercial de la marca. |

#### Tabla: `material`
*Descripción: Catálogo de los tipos de tela o materiales de fabricación.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idMaterial` | INT | 3 | PK, NOT NULL, AUTO_INCREMENT | Identificador único del material. |
| `nombreMaterial` | VARCHAR | 35 | NOT NULL | Nombre de la tela o material (ej. Algodón Lycra). |

#### Tabla: `calce`
*Descripción: Catálogo del tipo de ajuste de la prenda al cuerpo.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idCalce` | INT | 1 | PK, NOT NULL, AUTO_INCREMENT | Identificador único del calce. |
| `tipocalce` | VARCHAR | 9 | NOT NULL | Descripción del ajuste (ajustado, al cuerpo, holgado). |

---

### 2. Tablas Dependientes (Transaccionales y Relacionales)

#### Tabla: `articulo`
*Descripción: Tabla central que representa una prenda física dentro del armario de un usuario. Vincula todos los catálogos.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idArticulo` | INT | 5 | PK, NOT NULL, AUTO_INCREMENT | Identificador único de la prenda. |
| `idUsuario` | INT | 5 | FK, NOT NULL | Identificador del dueño de la prenda (Ref: `usuario`). |
| `categoriaArticulo` | VARCHAR | 25 | NOT NULL | Tipo de prenda (ej. Remera, Pantalón). |
| `marcaArticulo` | INT | 3 | FK, NOT NULL | Marca de la prenda (Ref: `marca`). |
| `materialArticulo`| INT | 3 | FK, NOT NULL | Material de la prenda (Ref: `material`). |
| `colorArticulo` | INT | 2 | FK, NOT NULL | Color principal de la prenda (Ref: `color`). |
| `calceArticulo` | INT | 1 | FK, NOT NULL | Ajuste de la prenda (Ref: `calce`). |

#### Tabla: `atuendo`
*Descripción: Agrupación lógica que representa un "conjunto" o "look" creado por un usuario.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idAtuendo` | INT | 3 | PK, NOT NULL, AUTO_INCREMENT | Identificador único del conjunto. |
| `idUsuario` | INT | 5 | FK, NOT NULL | Identificador del creador del conjunto (Ref: `usuario`). |
| `nombreAtuendo` | VARCHAR | 50 | NOT NULL | Nombre dado al conjunto (ej. "Look Casual Viernes"). |
| `favorito` | TINYINT | 1 | NOT NULL | Bandera booleana (0 = No, 1 = Sí) que indica si es favorito. |

#### Tabla: `atuendodetalles`
*Descripción: Tabla intermedia para resolver la relación de "Muchos a Muchos" entre atuendos y artículos.*

| Campo | Tipo de Dato | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `idAtuendo` | INT | 3 | PK, FK, NOT NULL | Referencia al conjunto (Ref: `atuendo`). |
| `idArticulo` | INT | 5 | PK, FK, NOT NULL | Referencia a la prenda física incluida (Ref: `articulo`). |
> **Nota:** La llave primaria de esta tabla es compuesta, formada por la combinación de `idAtuendo` y `idArticulo` para evitar que una misma prenda se duplique dentro de un mismo conjunto.
