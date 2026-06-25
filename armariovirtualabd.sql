CREATE DATABASE IF NOT EXISTS armariovirtual;
USE armariovirtual;

-- Tablas independientes
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

-- Tablas dependientes y sus FK
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

-- Data & mock data
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