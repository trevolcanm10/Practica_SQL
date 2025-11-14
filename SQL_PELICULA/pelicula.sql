CREATE TABLE IF NOT EXISTS directores(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    nacionalidad TEXT,
    fecha_nacimiento TEXT
);


CREATE TABLE IF NOT EXISTS peliculas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    año INTEGER CHECK(año > 1800),
    genero TEXT,
    id_director INTEGER,
    duracion INTEGER CHECK(duracion > 0),
    FOREIGN KEY (id_director) REFERENCES directores(id)
);

CREATE TABLE IF NOT EXISTS actores(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    nacionalidad TEXT,
    fecha_nacimiento TEXT
);

/* Tabla intermedia de actores - peliculas*/
CREATE TABLE IF NOT EXISTS reparto(

    id_pelicula INTEGER,
    id_actor INTEGER,
    personaje TEXT,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id),
    FOREIGN KEY (id_actor) REFERENCES actores(id),
    PRIMARY KEY (id_pelicula, id_actor)

);

INSERT INTO directores (nombre ,nacionalidad,fecha_nacimiento) VALUES
('Christopher Nolan', 'Reino Unido', '1970-07-30'),
('Steven Spielberg', 'EE.UU.', '1946-12-18'),
('Pedro Almodóvar', 'España', '1949-09-25');


INSERT INTO peliculas (titulo,año,genero, id_director, duracion)
VALUES
('Inception', 2010, 'Ciencia Ficción', 1, 148),
('Jurassic Park', 1993, 'Aventura', 2, 127),
('Dolor y Gloria', 2019, 'Drama', 3, 113);


INSERT INTO actores (nombre , nacionalidad, fecha_nacimiento)
VALUES
('Leonardo DiCaprio', 'EE.UU.', '1974-11-11'),
('Sam Neill', 'Nueva Zelanda', '1947-09-14'),
('Antonio Banderas', 'España', '1960-08-10');


INSERT INTO reparto (id_pelicula, id_actor,personaje)
VALUES
(1, 1, 'Dom Cobb'),
(2, 2, 'Dr. Alan Grant'),
(3, 3, 'Salvador Mallo');


SELECT * FROM reparto;


/*Ver peliculas con su director */

SELECT p.titulo, p.año, d.nombre  AS director
FROM peliculas p
JOIN directores d ON p.id_director = d.id;


/*Reparto de cada película */
SELECT p.titulo , a.nombre AS actor , r.personaje
FROM reparto r
JOIN peliculas p ON r.id_pelicula = p.id
JOIN actores a ON r.id_actor = a.id;