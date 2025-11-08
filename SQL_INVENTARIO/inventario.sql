CREATE TABLE IF NOT EXISTS productos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    categoria TEXT NOT NULL,
    cantidad INTEGER DEFAULT 0 CHECK(cantidad>=0),
    precio_unitario REAL CHECK(precio_unitario >=0),
    proveedor TEXT,
    fecha_ingreso TEXT DEFAULT (datetime('now')),
    estado TEXT DEFAULT 'disponible' CHECK(estado IN ('disponible','agotado','en pedido'))
);

SELECT * FROM productos;

--INSERTAMOS PRODUCTOS DE EJEMPLO
INSERT INTO productos (nombre,categoria,cantidad,precio_unitario,proveedor)
VALUES
('Laptop Lenovo', 'Electrónicos', 10, 3200.50, 'TechStore S.A.'),
('Mouse inalámbrico', 'Accesorios', 50, 45.90, 'Distribuciones Globales'),
('Silla ergonómica', 'Muebles', 15, 480.00, 'OfiMarket SAC'),
('Monitor Samsung 24"', 'Electrónicos', 8, 850.00, 'ElectroPerú'),
('Escritorio madera', 'Muebles', 5, 620.00, 'Muebles & Diseño');


--Ver productos con baja cantidad
SELECT nombre,cantidad FROM productos
WHERE cantidad < 10;

--Ver el valor total del inventario
SELECT SUM(cantidad * precio_unitario) AS valor_total_inventario
FROM productos;


--Actualizar cantidad o estado
UPDATE productos
SET cantidad = cantidad - 6
WHERE id = 1;

UPDATE productos 
SET estado = 'agotado'
WHERE cantidad = 0;

--Reporte por categoría
SELECT categoria, COUNT(*) AS total_productos, SUM(cantidad) AS unidades_totales
FROM productos
GROUP BY categoria;