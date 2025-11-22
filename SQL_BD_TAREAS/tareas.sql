CREATE TABLE usuarios(
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    rol VARCHAR(50)
);


CREATE TABLE proyectos(
    id_proyecto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    fecha_inicio TEXT DEFAULT (date('now')),
    fecha_fin TEXT
);


CREATE TABLE tareas(
    id_tarea INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    estado TEXT DEFAULT 'pendiente',
    fecha_creacion TEXT DEFAULT (datetime('now')),
    id_proyecto INTEGER NOT NULL,
    id_usuario INTEGER,

    FOREIGN KEY (id_proyecto) REFERENCES proyectos (id_proyecto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);