CREATE TABLE IF NOT EXISTS autores(

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    nacionalidad TEXT,
    fecha_nacimiento TEXT
);


CREATE TABLE IF NOT EXISTS libros(

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    año INTEGER CHECK(año>0),
    genero TEXT,
    id_autor INTEGER NOT NULL,
    disponible INTEGER DEFAULT 1, 
    FOREIGN KEY (id_autor) REFERENCES autores(id)
);


CREATE TABLE IF NOT EXISTS usuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    direccion TEXT,
    telefono TEXT
);


CREATE TABLE IF NOT EXISTS prestamos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER,
    id_libro INTEGER,
    fecha_prestamo TEXT NOT NULL,
    fecha_devolucion TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_libro)  REFERENCES libros(id)

);


INSERT INTO autores (nombre , nacionalidad , fecha_nacimiento)
VALUES
('Gabriel García Márquez', 'Colombia', '1927-03-06'),
('J.K. Rowling', 'Reino Unido', '1965-07-31'),
('George Orwell', 'Reino Unido', '1903-06-25');


INSERT INTO libros (titulo,año,genero,id_autor)
VALUES
('Cien años de soledad', 1967, 'Realismo mágico', 1),
('Harry Potter y la piedra filosofal', 1997, 'Fantasía', 2),
('1984', 1949, 'Distopía', 3);


INSERT INTO usuarios (nombre,direccion,telefono)
VALUES
('Ana Torres', 'Av. Lima 123', '987654321'),
('Luis Pérez', 'Calle Sol 456', '912345678');


INSERT INTO prestamos(id_usuario, id_libro, fecha_prestamo)
VALUES 
(1, 1, date('now'));

SELECT * FROM libros
WHERE id = 1;


UPDATE libros
SET disponible = 0
WHERE id = 1; 


UPDATE prestamos
SET fecha_devolucion = date('now')
WHERE id = 1 ; 

UPDATE libros
SET disponible = 1
WHERE  id = 1 ; 

--Libros con su autor
SELECT l.titulo, l.año, a.nombre AS autor
FROM libros l
JOIN autores a ON l.id_autor = a.id;

--Ver que libros estan disponibles
SELECT titulo,genero,disponible
FROM libros
WHERE disponible = 1; 

--Ver Historial de préstamos
SELECT p.id,u.nombre AS usuario ,l.titulo AS libro,fecha_prestamo,fecha_devolucion
from prestamos p
JOIN usuarios u ON u.id = p.id_usuario
JOIN libros l ON l.id = p.id_libro;

--Ver que usuario tiene actualmente un libro prestado
SELECT u.nombre, l.titulo
FROM prestamos p
JOIN usuarios u ON u.id = p.id_usuario
JOIN libros l ON l.id = p.id_libro
WHERE p.fecha_devolucion is NULL;