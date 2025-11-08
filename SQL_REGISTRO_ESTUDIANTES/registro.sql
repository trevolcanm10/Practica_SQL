CREATE TABLE IF NOT EXISTS estudiantes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    edad INTEGER CHECK(edad >= 0),
    carrera TEXT NOT NULL,
    promedio REAL DEFAULT 0.0,
    fecha_registro TEXT DEFAULT (datetime('now'))
);

--Insertar estudiantes
INSERT INTO estudiantes (nombre,apellido,edad,carrera,promedio)
VALUES
('Ana','Gómez',20,'Ingeniería de Sistemas', 15.6),
('Luis','Pérez',22,'Administración',13.8),
('María','Torres',19,'Contabilidad',17.2),
('Carlos','Ramírez',21,'Marketing',14.5);


DROP TABLE IF EXISTS estudiantes;
SELECT * FROM estudiantes;

--Estudiantes que presenten un promedio mayor a 15
SELECT nombre,apellido,carrera,promedio
FROM estudiantes
WHERE promedio>15;

--Buscar por carrera
SELECT * FROM estudiantes
WHERE carrera = 'Administración';

--Actualizar datos de un estudiante
UPDATE estudiantes
SET promedio = 15.8
WHERE id = 2;

--Eliminar un estudiante
DELETE FROM estudiantes
WHERE id = 3;


--Agregar mas campos a las tablas
ALTER TABLE estudiantes ADD COLUMN email TEXT;
ALTER TABLE estudiantes ADD COLUMN telefono TEXT;

UPDATE estudiantes
SET email = 'ana.gomez@uni.edu', telefono = '987654321'
WHERE id = 1;


--Promedio general por carrera

SELECT carrera, ROUND(AVG(promedio)) AS promedio_general
FROM estudiantes
GROUP BY carrera;