-- SIARD-UdeC: datos de prueba (NO usar en producción)

INSERT INTO usuarios (nombre, correo, contrasena_hash, id_rol) VALUES
    ('Admin Prueba', 'admin@prueba.com', 'hash_de_prueba', 1),
    ('Coordinador Prueba', 'coordinador@prueba.com', 'hash_de_prueba', 2),
    ('Docente Prueba', 'docente@prueba.com', 'hash_de_prueba', 3),
    ('Estudiante Prueba', 'estudiante@prueba.com', 'hash_de_prueba', 4);

    
INSERT INTO evaluaciones (titulo, enunciado, fecha_inicio, fecha_fin, id_creador, id_docente) VALUES
    ('Evaluación docente de prueba', 'Responde con sinceridad sobre las clases del semestre.', '2026-10-06 08:00', '2026-10-20 23:59', 1, 3);

INSERT INTO preguntas (id_evaluacion, texto, id_tipo_respuesta, orden) VALUES
    (1, '¿Las clases son claras y bien explicadas?', 1, 1),
    (1, '¿Qué mejorarías de las clases?', 2, 2);

INSERT INTO opciones_respuesta (id_pregunta, texto) VALUES
    (1, 'Siempre'),
    (1, 'Casi siempre'),
    (1, 'A veces'),
    (1, 'Nunca');

    
INSERT INTO envios (id_evaluacion, id_usuario, observacion) VALUES
    (1, 4, 'Buena clase en general.');

INSERT INTO respuestas (id_envio, id_pregunta, id_opcion, texto_respuesta) VALUES
    (1, 1, 2, NULL),
    (1, 2, NULL, 'Más ejemplos prácticos.');