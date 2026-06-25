CREATE DATABASE IF NOT EXISTS armariovirtual;
USE armariovirtual;

-- --------------------------------------------------------
-- Tablas independientes
-- --------------------------------------------------------

CREATE TABLE calce (
  idCalce int(1) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tipocalce varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE color (
  idColor int(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombreColor varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE marca (
  idMarca int(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombreMarca VARCHAR(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE material (
  idMaterial int(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombreMaterial varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE usuario (
  idUsuario int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombreUsuario varchar(25) NOT NULL,
  apellidoUsuario varchar(25) NOT NULL,
  emailUsuario varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Tablas dependientes y sus FK
-- --------------------------------------------------------

CREATE TABLE articulo (
  idArticulo int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idUsuario int(5) NOT NULL,
  categoriaArticulo varchar(25) NOT NULL,
  marcaArticulo int(3) NOT NULL,
  materialArticulo int(3) NOT NULL,
  colorArticulo int(2) NOT NULL,
  calceArticulo int(1) NOT NULL,
  CONSTRAINT fk_usuario FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario),
  CONSTRAINT fk_marca FOREIGN KEY (marcaArticulo) REFERENCES marca (idMarca),
  CONSTRAINT fk_material FOREIGN KEY (materialArticulo) REFERENCES material (idMaterial),
  CONSTRAINT fk_color FOREIGN KEY (colorArticulo) REFERENCES color (idColor),
  CONSTRAINT fk_calce FOREIGN KEY (calceArticulo) REFERENCES calce (idCalce)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE atuendo (
  idAtuendo int(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idUsuario int(5) NOT NULL,
  nombreAtuendo varchar(50) NOT NULL,
  favorito tinyint(1) NOT NULL,
  CONSTRAINT fk_usuarioAtuendo FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE atuendodetalles (
  idAtuendo int(3) NOT NULL,
  idArticulo int(5) NOT NULL,
  PRIMARY KEY (idAtuendo, idArticulo),
  CONSTRAINT fk_atuendo FOREIGN KEY (idAtuendo) REFERENCES atuendo (idAtuendo),
  CONSTRAINT fk_articulo FOREIGN KEY (idArticulo) REFERENCES articulo (idArticulo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Data & mock data
-- --------------------------------------------------------

INSERT INTO color (nombreColor) VALUES 
('Negro'), 
('Blanco'), 
('Azul'), 
('Rojo'), 
('Gris'), 
('Beige'), 
('Verde'), 
('Amarillo'), 
('Rosa'), 
('Marrón'), 
('Celeste'), 
('Naranja'), 
('Violeta'), 
('Lila'), 
('Fucsia'), 
('Turquesa'), 
('Coral'), 
('Mostaza'), 
('Bordó'), 
('Salmón'), 
('Ocre'), 
('Esmeralda'), 
('Magenta'), 
('Oliva'), 
('Caqui'), 
('Plata'), 
('Dorado'), 
('Vino'), 
('Azul Marino'), 
('Verde Militar');

INSERT INTO marca (nombreMarca) VALUES 
('Nike'), 
('Adidas'), 
('Zara'), 
('Levi''s'), 
('H&M'), 
('Puma'), 
('Under Armour'), 
('Gucci'), 
('Prada'), 
('Calvin Klein'), 
('Tommy Hilfiger'), 
('Ralph Lauren'), 
('Lacoste'), 
('Vans'), 
('Converse'), 
('Balenciaga'), 
('Versace'), 
('Chanel'), 
('Dior'), 
('Fila'), 
('Reebok'), 
('New Balance'), 
('Columbia'), 
('The North Face'), 
('Patagonia'), 
('Guess'), 
('Diesel'), 
('Victoria''s Secret'), 
('Supreme'), 
('Champion');

INSERT INTO calce (idCalce, tipocalce) VALUES (1, 'ajustado'), (2, 'al cuerpo'), (3, 'holgado');

INSERT INTO material (idMaterial, nombreMaterial) VALUES
(1, 'Algodon Lycra'), (2, 'Algodon Poliester'), (3, 'Bengalina'), (4, 'Blackout'), (5, 'Broderie'), 
(6, 'Cadena'), (7, 'Cire'), (8, 'Corderito Bifaz'), (9, 'Corderoy'), (10, 'Cordura'), 
(11, 'Cristal'), (12, 'Crochet'), (13, 'Cuadrille'), (14, 'Cuerina'), (15, 'Cuero'), 
(16, 'Cupro'), (17, 'Encaje'), (18, 'Fibrana'), (19, 'Fly Morley'), (20, 'Frisa'), 
(21, 'Friselina'), (22, 'Gabardina'), (23, 'Gasa'), (24, 'Holograma'), (25, 'Interlock'), 
(26, 'Jean'), (27, 'Jersey'), (28, 'Lanilla'), (29, 'Lentejuelas'), (30, 'Lienzo'), 
(31, 'Lino'), (32, 'Lona'), (33, 'Microfibra'), (34, 'Microtul'), (35, 'Metal'), 
(36, 'Modal'), (37, 'Nido de Abeja'), (38, 'Otoman'), (39, 'Pana'), (40, 'Piel'), 
(41, 'Pique'), (42, 'Plastico'), (43, 'Plush'), (44, 'Polar'), (45, 'Raso'), 
(46, 'Rayon Twill'), (47, 'Red Lurex'), (48, 'Rustico'), (49, 'Seda'), (50, 'Silver'), 
(51, 'Simil'), (52, 'Tafeta'), (53, 'Terciopelo'), (54, 'Transfer'), (55, 'Tul'), 
(56, 'Venecia'), (57, 'Viscosa'), (58, 'Viyela'), (59, 'Waffle'), (60, 'Yute Arpillera');

INSERT INTO usuario (idUsuario, nombreUsuario, apellidoUsuario, emailUsuario) VALUES
(1, 'Lucia', 'Gomez', 'lgomez@mail.com'), (2, 'Mateo', 'Silva', 'msilva@mail.com'),
(3, 'Sofia', 'Rios', 'srios@mail.com'), (4, 'Tomas', 'Perez', 'tperez@mail.com'),
(5, 'Clara', 'Sosa', 'csosa@mail.com'), (6, 'Diego', 'Luna', 'dluna@mail.com'),
(7, 'Paula', 'Ruiz', 'pruiz@mail.com'), (8, 'Jorge', 'Vega', 'jvega@mail.com'),
(9, 'Marta', 'Diaz', 'mdiaz@mail.com'), (10, 'Pablo', 'Mora', 'pmora@mail.com');

-- --------------------------------------------------------
-- Mock data: articulos y armarios de usuarios
-- --------------------------------------------------------

INSERT INTO articulo (idUsuario, categoriaArticulo, marcaArticulo, materialArticulo, colorArticulo, calceArticulo) VALUES
-- Armario del Usuario 1 (Lucia)
(1, 'Remera Manga Corta', 1, 1, 2, 2),
(1, 'Pantalón Jean', 4, 26, 3, 2),
(1, 'Buzo con Capucha', 2, 20, 5, 3),
(1, 'Campera de Jean', 4, 26, 3, 3),
(1, 'Calza Larga', 1, 1, 1, 1),
(1, 'Camisa Cuadros', 5, 18, 4, 2),
(1, 'Zapatillas de Lona', 14, 32, 1, 1),
(1, 'Gorro de Lana', 24, 28, 5, 1),
(1, 'Top de Fiesta', 3, 29, 26, 1),

-- Armario del Usuario 2 (Mateo)
(2, 'Camisa de Vestir', 3, 31, 2, 2),
(2, 'Zapatillas Running', 1, 33, 1, 1),
(2, 'Short Deportivo', 6, 33, 4, 3),
(2, 'Pantalón Jogging', 2, 20, 5, 3),
(2, 'Remera Termica', 7, 25, 1, 1),
(2, 'Campera Puffer', 23, 50, 3, 3),
(2, 'Botas de Cuero', 27, 15, 10, 1),
(2, 'Cinturon Clasico', 8, 15, 1, 1),
(2, 'Chomba Pique', 13, 41, 2, 2),

-- Armario del Usuario 3 (Sofia)
(3, 'Vestido de Noche', 3, 49, 1, 2),
(3, 'Campera de Cuero', 26, 15, 1, 2),
(3, 'Falda Plisada', 5, 23, 9, 3),
(3, 'Blazer Elegante', 9, 22, 1, 2),
(3, 'Pantalón Sastrero', 3, 31, 1, 3),
(3, 'Camisa de Seda', 18, 49, 2, 3),
(3, 'Zapatos de Taco', 19, 14, 4, 1),
(3, 'Bufanda', 12, 28, 6, 3),
(3, 'Bolso de Mano', 16, 15, 1, 1),

-- Armario del Usuario 4 (Tomas)
(4, 'Pantalón Chino', 11, 22, 6, 2),
(4, 'Sweater Cuello V', 12, 28, 10, 3),
(4, 'Musculosa Deportiva', 7, 27, 2, 1),
(4, 'Bermuda Cargo', 24, 22, 25, 3),
(4, 'Remera Deportiva', 21, 33, 11, 2),
(4, 'Zapatillas de Trail', 22, 10, 7, 1),
(4, 'Campera Rompeviento', 25, 33, 12, 3),
(4, 'Medias Termicas', 23, 44, 5, 1),
(4, 'Gorro de Polar', 25, 44, 1, 1),

-- Armario del Usuario 5 (Clara)
(5, 'Calza Deportiva', 2, 1, 1, 1),
(5, 'Top Deportivo', 1, 1, 15, 1),
(5, 'Cardigan', 5, 28, 5, 3),
(5, 'Pollera de Jean', 4, 26, 3, 2),
(5, 'Musculosa Hilo', 5, 12, 6, 2),
(5, 'Sandalias de Cuero', 3, 15, 10, 1),
(5, 'Vestido Floral', 26, 18, 8, 3),
(5, 'Sombrero de Yute', 5, 60, 6, 1),
(5, 'Bikini', 28, 1, 17, 1),

-- Armario del Usuario 6 (Diego)
(6, 'Remera Oversize', 14, 27, 2, 3),
(6, 'Pantalón Cargo', 23, 22, 24, 3),
(6, 'Gorra con Visera', 1, 10, 1, 1),
(6, 'Buzo Oversize', 29, 20, 1, 3),
(6, 'Remera Estampada', 14, 2, 2, 3),
(6, 'Pantalón Jogger', 30, 22, 24, 3),
(6, 'Zapatillas de Skate', 14, 32, 1, 1),
(6, 'Riñonera', 6, 10, 4, 1),
(6, 'Camisa de Corderoy', 4, 9, 10, 3),

-- Armario del Usuario 7 (Paula)
(7, 'Blusa de Verano', 3, 18, 8, 3),
(7, 'Jeans Mom', 4, 26, 11, 3),
(7, 'Campera Puffer', 24, 50, 1, 3),
(7, 'Tapado de Paño', 3, 28, 6, 3),
(7, 'Sweater Cuello Alto', 11, 28, 2, 2),
(7, 'Pantalón Engomado', 26, 14, 1, 1),
(7, 'Botas Texanas', 3, 15, 1, 1),
(7, 'Blusa con Encaje', 28, 17, 1, 2),
(7, 'Short de Cuero', 27, 15, 19, 2),

-- Armario del Usuario 8 (Jorge)
(8, 'Chomba', 13, 41, 29, 2),
(8, 'Bermuda de Jean', 4, 26, 3, 2),
(8, 'Zapatillas de Lona', 15, 32, 2, 1),
(8, 'Jeans Rectos', 4, 26, 3, 3),
(8, 'Remera Tipo Polo', 12, 41, 4, 2),
(8, 'Buzo Cuello Redondo', 30, 20, 5, 3),
(8, 'Zapatillas Urbanas', 22, 14, 2, 1),
(8, 'Camisa de Lino', 11, 31, 11, 3),
(8, 'Mocasines', 8, 15, 10, 1),

-- Armario del Usuario 9 (Marta)
(9, 'Campera Rompevientos', 25, 33, 7, 3),
(9, 'Calza Corta', 6, 1, 1, 1),
(9, 'Remera Básica', 5, 2, 5, 2),
(9, 'Calza Deportiva Larga', 7, 1, 5, 1),
(9, 'Top Termico', 23, 25, 1, 1),
(9, 'Campera de Polar', 24, 44, 15, 2),
(9, 'Zapatillas Trekking', 25, 10, 10, 1),
(9, 'Pantalón Desmontable', 23, 33, 25, 3),
(9, 'Guantes de Nieve', 24, 44, 1, 1),

-- Armario del Usuario 10 (Pablo)
(10, 'Saco de Vestir', 10, 31, 29, 2),
(10, 'Pantalón de Vestir', 10, 31, 29, 2),
(10, 'Camisa Manga Larga', 12, 22, 11, 2),
(10, 'Corbata de Seda', 17, 49, 29, 1),
(10, 'Zapatos de Vestir', 9, 15, 1, 1),
(10, 'Cinturon de Vestir', 10, 15, 1, 1),
(10, 'Chaleco Sastrero', 12, 31, 29, 2),
(10, 'Trench Coat', 11, 22, 6, 3),
(10, 'Camisa Lisa', 12, 22, 2, 2);

-- --------------------------------------------------------
-- Mock Data: Creación de Atuendos (2 por usuario)
-- --------------------------------------------------------

INSERT INTO atuendo (idAtuendo, idUsuario, nombreAtuendo, favorito) VALUES
-- Usuario 1 (Lucia)
(1, 1, 'Look Urbano', 1),
(2, 1, 'Invierno Casual', 0),
-- Usuario 2 (Mateo)
(3, 2, 'Día de Oficina', 1),
(4, 2, 'Entrenamiento Extremo', 0),
-- Usuario 3 (Sofia)
(5, 3, 'Cena Elegante', 1),
(6, 3, 'Oficina Chic', 1),
-- Usuario 4 (Tomas)
(7, 4, 'Casual Viernes', 0),
(8, 4, 'Trekking Montaña', 1),
-- Usuario 5 (Clara)
(9, 5, 'Tarde de Playa', 1),
(10, 5, 'Paseo Relax', 0),
-- Usuario 6 (Diego)
(11, 6, 'Skate Park', 1),
(12, 6, 'Tarde Fría', 0),
-- Usuario 7 (Paula)
(13, 7, 'Salida con Amigas', 1),
(14, 7, 'Invierno Elegante', 1),
-- Usuario 8 (Jorge)
(15, 8, 'Almuerzo Domingo', 0),
(16, 8, 'Casual Trabajo', 1),
-- Usuario 9 (Marta)
(17, 9, 'Running Mañana', 1),
(18, 9, 'Expedición Nieve', 1),
-- Usuario 10 (Pablo)
(19, 10, 'Reunión Directorio', 1),
(20, 10, 'Clima Lluvioso', 0);

-- --------------------------------------------------------
-- Mock Data: Detalle de los Atuendos (Relación Ropa-Conjunto)
-- --------------------------------------------------------

INSERT INTO atuendodetalles (idAtuendo, idArticulo) VALUES
-- Atuendos de Lucia (Artículos del 1 al 9)
(1, 1), (1, 2), (1, 7),              -- Look Urbano: Remera MC, Pantalón Jean, Zapatillas Lona
(2, 3), (2, 2), (2, 8), (2, 4),      -- Invierno Casual: Buzo, Pantalón Jean (repetido), Gorro Lana, Campera Jean

-- Atuendos de Mateo (Artículos del 10 al 18)
(3, 18), (3, 16), (3, 17),           -- Día de Oficina: Chomba Pique, Botas Cuero, Cinturón
(4, 11), (4, 12), (4, 14),           -- Entrenamiento: Zapatillas Running, Short Dep, Remera Térmica

-- Atuendos de Sofia (Artículos del 19 al 27)
(5, 19), (5, 25), (5, 27),           -- Cena Elegante: Vestido Noche, Zapatos Taco, Bolso
(6, 24), (6, 23), (6, 22), (6, 25),  -- Oficina Chic: Camisa Seda, Pantalón Sastrero, Blazer, Zapatos Taco (repetido)

-- Atuendos de Tomas (Artículos del 28 al 36)
(7, 28), (7, 29), (7, 33),           -- Casual Viernes: Pantalón Chino, Sweater, Zapatillas Trail
(8, 31), (8, 32), (8, 33), (8, 34), (8, 35), -- Trekking: Bermuda, Remera Dep, Zapatillas Trail (repetido), Rompeviento, Medias

-- Atuendos de Clara (Artículos del 37 al 45)
(9, 45), (9, 43), (9, 44), (9, 42),  -- Tarde de Playa: Bikini, Vestido Floral, Sombrero Yute, Sandalias
(10, 40), (10, 41), (10, 39), (10, 42), -- Paseo Relax: Pollera Jean, Musculosa Hilo, Cardigan, Sandalias (repetido)

-- Atuendos de Diego (Artículos del 46 al 54)
(11, 46), (11, 47), (11, 52), (11, 48), -- Skate Park: Remera Over, Cargo, Skate, Gorra
(12, 49), (12, 51), (12, 52), (12, 53), -- Tarde Fría: Buzo Over, Jogger, Skate (repetido), Riñonera

-- Atuendos de Paula (Artículos del 55 al 63)
(13, 62), (13, 60), (13, 61),        -- Salida Amigas: Blusa Encaje, Pantalón Engomado, Botas Texanas
(14, 59), (14, 56), (14, 58), (14, 61), -- Invierno Elegante: Sweater, Jeans Mom, Tapado, Botas Texanas (repetido)

-- Atuendos de Jorge (Artículos del 64 al 72)
(15, 71), (15, 65), (15, 66),        -- Almuerzo Domingo: Camisa Lino, Bermuda Jean, Zapatillas Lona
(16, 68), (16, 67), (16, 72),        -- Casual Trabajo: Remera Polo, Jeans Rectos, Mocasines

-- Atuendos de Marta (Artículos del 73 al 81)
(17, 75), (17, 74), (17, 79),        -- Running Mañana: Remera Básica, Calza Corta, Zapatillas Trekking
(18, 77), (18, 76), (18, 80), (18, 78), (18, 81), -- Expedición Nieve: Top Térmico, Calza Larga, Pantalón Desmontable, Polar, Guantes

-- Atuendos de Pablo (Artículos del 82 al 90)
(19, 84), (19, 83), (19, 82), (19, 85), (19, 86), (19, 87), -- Reunión: Camisa, Pantalón, Saco, Corbata, Zapatos, Cinturón
(20, 90), (20, 83), (20, 89), (20, 86); -- Clima Lluvioso: Camisa Lisa, Pantalón Vestir (repetido), Trench, Zapatos (repetido)
