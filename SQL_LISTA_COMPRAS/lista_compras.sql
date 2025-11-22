--Lista de productos
CREATE TABLE IF NOT EXISTS categorias(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

--Tabla productos
CREATE TABLE IF NOT EXISTS productos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);


CREATE TABLE IF NOT EXISTS lista_compras(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_producto INTEGER NOT NULL,
    cantidad TEXT,
    comprado INTEGER DEFAULT 0,
    fecha_agregado TEXT DEFAULT(date('now')),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

--INSERTAR CATEGORÍAS
INSERT INTO categorias(nombre)
VALUES
('Lácteos'),
('Verduras'),
('Panadería'),
('Carnes');

--INSERTAR PRODUCTOS
INSERT INTO productos(nombre,id_categoria)
VALUES
('Leche',1),
('Queso',1),
('Pan',3),
('Tomate',2),
('Pollo',4);

--LISTA DE COMPRAS
INSERT INTO lista_compras(id_producto,cantidad)
VALUES
(1,'2 litros'),
(4,'1 kilo'),
(3,'1 bolsa'),
(2,'200 gramos');


--Ver todo lo que hay comprar
SELECT lc.id, p.nombre , lc.cantidad, lc.comprado
FROM lista_compras lc
JOIN productos p ON p.id = lc.id_producto

--Ver solo lo pendiente
SELECT p.nombre , lc.cantidad
FROM lista_compras lc
JOIN productos p ON p.id = lc.id_producto
WHERE lc.comprado = 0;

--Marcar un producto como comprado
UPDATE lista_compras
SET comprado = 1
WHERE id = 2;


--Ver productos por categoría
SELECT p.nombre AS PRODUCTOS , c.nombre AS CATEGORIA
FROM productos p
JOIN categorias c ON c.id = p.id_categoria;