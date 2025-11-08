--Creamos la tabla de contactos
CREATE TABLE IF NOT EXISTS contactos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT,
    telefono TEXT,
    email TEXT UNIQUE,
    empresa TEXT,
    fecha_registro TEXT DEFAULT (datetime('now'))
);

SELECT * FROM contactos;

--Insertar algunos contactos

INSERT INTO contactos (nombre,apellido,telefono,email,empresa) 
VALUES
('María', 'García', '987654321', 'maria.garcia@email.com', 'TechSolutions'),
('Carlos', 'Pérez', '912345678', 'carlos.perez@email.com', 'DataCorp'),
('Lucía', 'Fernández', '934567890', 'lucia.fernandez@email.com', 'Freelance');


--Contactos ordenados por nombre
SELECT * FROM contactos ORDER BY nombre ASC;

--Buscar contacto por nombre o empresa
SELECT * FROM contactos WHERE empresa = 'DataCorp';

--Actualizar número de teléfono
UPDATE contactos
SET telefono = '900111222'
WHERE nombre = 'María' AND apellido = 'García';

--Eliminar un contacto
DELETE FROM contactos WHERE email = 'lucia.fernandez@email.com';

--Agregamos campos a la tabla
ALTER TABLE contactos ADD COLUMN direccion TEXT;
ALTER TABLE contactos ADD COLUMN notas TEXT;
ALTER TABLE contactos ADD COLUMN favorito INTEGER DEFAULT 0;

UPDATE contactos
SET direccion = 'Av. Principal 123', notas = 'Cliente antiguo' , favorito = 1
WHERE id = 2;