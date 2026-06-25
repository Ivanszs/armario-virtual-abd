USE armariovirtual;

-- -------------------------------------------------------------------------
-- REPORTE 1: Filtro Básico (Uso de WHERE y JOIN simple)
-- Propósito: Listar los conjuntos marcados como favoritos y sus dueños.
-- -------------------------------------------------------------------------
SELECT 
    usuario.nombreUsuario, 
    usuario.apellidoUsuario, 
    atuendo.nombreAtuendo
FROM atuendo
JOIN usuario ON atuendo.idUsuario = usuario.idUsuario
WHERE atuendo.favorito = 1;


-- -------------------------------------------------------------------------
-- REPORTE 2: Funciones de Agrupación (Uso de COUNT y GROUP BY)
-- Propósito: Contar cuántas prendas de ropa totales tiene cada usuario.
-- -------------------------------------------------------------------------
SELECT 
    usuario.nombreUsuario, 
    usuario.apellidoUsuario, 
    COUNT(articulo.idArticulo) AS total_prendas
FROM usuario
JOIN articulo ON usuario.idUsuario = articulo.idUsuario
GROUP BY usuario.idUsuario, usuario.nombreUsuario, usuario.apellidoUsuario
ORDER BY total_prendas DESC;


-- -------------------------------------------------------------------------
-- REPORTE 3: Traducción de Catálogos (Uso de múltiples JOIN)
-- Propósito: Mostrar el inventario completo de un usuario específico ('Lucia')
-- traduciendo las llaves foráneas numéricas a texto legible.
-- -------------------------------------------------------------------------
SELECT 
    articulo.categoriaArticulo, 
    marca.nombreMarca, 
    color.nombreColor, 
    material.nombreMaterial, 
    calce.tipocalce
FROM articulo
JOIN marca ON articulo.marcaArticulo = marca.idMarca
JOIN color ON articulo.colorArticulo = color.idColor
JOIN material ON articulo.materialArticulo = material.idMaterial
JOIN calce ON articulo.calceArticulo = calce.idCalce
JOIN usuario ON articulo.idUsuario = usuario.idUsuario
WHERE usuario.nombreUsuario = 'Lucia';


-- -------------------------------------------------------------------------
-- REPORTE 4: Relación de Muchos a Muchos (Navegación de tabla intermedia)
-- Propósito: Detallar exactamente qué prendas físicas componen un atuendo 
-- virtual específico ('Cena Elegante').
-- -------------------------------------------------------------------------
SELECT 
    atuendo.nombreAtuendo, 
    articulo.categoriaArticulo, 
    marca.nombreMarca, 
    color.nombreColor
FROM atuendodetalles
JOIN atuendo ON atuendodetalles.idAtuendo = atuendo.idAtuendo
JOIN articulo ON atuendodetalles.idArticulo = articulo.idArticulo
JOIN marca ON articulo.marcaArticulo = marca.idMarca
JOIN color ON articulo.colorArticulo = color.idColor
WHERE atuendo.nombreAtuendo = 'Cena Elegante';


-- -------------------------------------------------------------------------
-- REPORTE 5: Inteligencia de Negocio (Uso de ORDER BY y LIMIT)
-- Propósito: Obtener un "Top 3" estadístico de las marcas de ropa más 
-- populares dentro de toda la base de datos.
-- -------------------------------------------------------------------------
SELECT 
    marca.nombreMarca, 
    COUNT(articulo.idArticulo) AS cantidad_usos
FROM articulo
JOIN marca ON articulo.marcaArticulo = marca.idMarca
GROUP BY marca.idMarca, marca.nombreMarca
ORDER BY cantidad_usos DESC
LIMIT 3;


-- -------------------------------------------------------------------------
-- REPORTE 6: Buscador Complejo (Múltiples condiciones lógicas con AND)
-- Propósito: Buscar qué usuarios poseen prendas que cumplan simultáneamente
-- con el calce 'holgado' y el color 'Negro'.
-- -------------------------------------------------------------------------
SELECT 
    usuario.nombreUsuario, 
    articulo.categoriaArticulo, 
    marca.nombreMarca
FROM articulo
JOIN usuario ON articulo.idUsuario = usuario.idUsuario
JOIN calce ON articulo.calceArticulo = calce.idCalce
JOIN color ON articulo.colorArticulo = color.idColor
JOIN marca ON articulo.marcaArticulo = marca.idMarca
WHERE calce.tipocalce = 'holgado' AND color.nombreColor = 'Negro';

-- -------------------------------------------------------------------------
-- REPORTE 7: Filtro sobre Agrupaciones (Uso de GROUP BY y HAVING)
-- Propósito: Obtener los colores más populares del armario global, 
-- mostrando únicamente aquellos que tengan 5 o más prendas registradas.
-- -------------------------------------------------------------------------

-- TODO