CREATE TABLE IF NOT EXISTS tareas(

    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    description TEXT,
    fecha_creacion TEXT DEFAULT (datetime('now')),
    fecha_limite TEXT,
    completada INTEGER DEFAULT 0
);

--Insertar algunas tareas de ejemplo

INSERT INTO tareas (titulo, description, fecha_limite)
VALUES
('Aprender SQL','Repasar comandos básicos de SQL','2025-11-10'),
('Practicar consultas SELECT', 'Usar WHERE, ORDER BY, GROUP BY', '2025-11-15'),
('Subir proyecto a GitHub', 'Publicar la base de datos en un repositorio', '2025-11-20');

--Consultar todas las tareas
SELECT * FROM tareas;

--Ver tareas pendientes
SELECT titulo,fecha_limite
FROM tareas
WHERE  completada = 0;

--Marcar tareas como completadas
UPDATE tareas
SET completada = 1
WHERE id = 1;

--Eliminar una tarea
DELETE FROM tareas;