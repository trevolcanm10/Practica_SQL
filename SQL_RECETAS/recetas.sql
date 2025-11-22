--Tabla de recetas
CREATE TABLE IF NOT EXISTS recetas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    tiempo_preparacion INTEGER,
    porciones INTEGER CHECK(porciones > 0),
    id_categoria INTEGER,
    fecha_registro TEXT DEFAULT (date('now')),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

--Tabla de categorías
CREATE TABLE IF NOT EXISTS categorias(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);


--Tabla de ingredientes
CREATE TABLE IF NOT EXISTS ingredientes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

--Tabla intermedia receta_ingredientes
CREATE TABLE IF NOT EXISTS receta_ingredientes(
    id_receta   INTEGER,
    id_ingrediente  INTEGER,
    cantidad TEXT,
    PRIMARY KEY (id_receta , id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES recetas(id),
    FOREIGN KEY (id_ingrediente) REFERENCES  ingredientes(id)
);

--Tabla de pasos
CREATE TABLE IF NOT EXISTS pasos(

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_receta INTEGER NOT NULL,
    numero_paso INTEGER NOT NULL,
    instruccion TEXT NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES recetas(id)
);


--Insertamos las categorias
INSERT INTO  categorias(nombre)
VALUES 
('Postres'),
('Sopas'),
('Carnes'),
('Ensaladas');

--Insertamos los ingredientes
INSERT INTO ingredientes(nombre)
VALUES
('Harina'),
('Azúcar'),
('Huevos'),
('Leche'),
('Pollo'),
('Cebolla'),
('Tomate');

--Panqueques
INSERT INTO recetas (nombre,descripcion,tiempo_preparacion,porciones,id_categoria)
VALUES
('Panqueques','Receta básica de panqueques caseros',15,4,1);


--Ingredientes a la receta
INSERT INTO receta_ingredientes(id_receta,id_ingrediente,cantidad)
VALUES
(1,1,'1 taza'),
(1,2,'2 cucharadas'),
(1,3,'2 unidades'),
(1,4, '1 taza');

--Agregar pasos
INSERT INTO pasos (id_receta, numero_paso,instruccion)
VALUES
(1,1,'Mezclar la harina y el azúcar.'),
(1,2,'Agregar los huevos y la leche, y batir.'),
(1,3,'Calentar la sartén y verter la mezcla.'),
(1,4,'Cocinar por ambos lados hasta dorar.');


--Mostrar todas las recetas con su categorias
SELECT r.nombre AS receta, c.nombre AS categorias
FROM recetas r
JOIN categorias c ON c.id = r.id_categoria;

--Mostrar ingredientes de una receta
SELECT i.nombre , ri.cantidad
FROM receta_ingredientes ri
JOIN ingredientes i ON  i.id = ri.id_ingrediente
WHERE ri.id_receta = 1;

--Pasos ordenados de una receta
SELECT numero_paso, instruccion
FROM pasos 
WHERE id_receta = 1
ORDER BY numero_paso;

--Buscar recetas que usan un ingrediente
SELECT r.nombre AS receta
FROM recetas r
JOIN receta_ingredientes ri ON ri.id_receta = r.id
JOIN ingredientes i ON i.id = ri.id_ingrediente
WHERE i.nombre = 'Harina';