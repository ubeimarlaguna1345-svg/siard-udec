-- SIARD-UdeC: esquema de la base de datos (PostgreSQL)
-- Base de datos: siard_db

CREATE TABLE roles (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO roles (nombre) VALUES
    ('Administrador'),
    ('Coordinador'),
    ('Docente'),
    ('Estudiante');
    
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL REFERENCES roles(id_rol)
);

CREATE TABLE tipos_evaluacion (
    id_tipo_evaluacion SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO tipos_evaluacion (nombre) VALUES
    ('General'),
    ('Parcial'),
    ('Examen final'),
    ('Cuestionario formativo'),
    ('Autoevaluación');

CREATE TABLE tipos_respuesta (
    id_tipo_respuesta SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO tipos_respuesta (nombre) VALUES
    ('Selección múltiple'),
    ('Texto libre'),
    ('Verdadero/Falso');
    
CREATE TABLE evaluaciones (
    id_evaluacion SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    enunciado TEXT,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    id_tipo_evaluacion INT NOT NULL DEFAULT 1 REFERENCES tipos_evaluacion(id_tipo_evaluacion),
    id_creador INT NOT NULL REFERENCES usuarios(id_usuario),
    CHECK (fecha_fin IS NULL OR fecha_inicio IS NULL OR fecha_fin > fecha_inicio)
);

CREATE TABLE preguntas (
    id_pregunta SERIAL PRIMARY KEY,
    id_evaluacion INT NOT NULL REFERENCES evaluaciones(id_evaluacion) ON DELETE CASCADE,
    texto TEXT NOT NULL,
    id_tipo_respuesta INT NOT NULL DEFAULT 2 REFERENCES tipos_respuesta(id_tipo_respuesta),
    orden INT NOT NULL DEFAULT 1
);

CREATE TABLE opciones_respuesta (
    id_opcion SERIAL PRIMARY KEY,
    id_pregunta INT NOT NULL REFERENCES preguntas(id_pregunta) ON DELETE CASCADE,
    texto VARCHAR(255) NOT NULL,
    es_correcta BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE envios (
    id_envio SERIAL PRIMARY KEY,
    id_evaluacion INT NOT NULL REFERENCES evaluaciones(id_evaluacion) ON DELETE CASCADE,
    id_estudiante INT NOT NULL REFERENCES usuarios(id_usuario),
    fecha_envio TIMESTAMP NOT NULL DEFAULT NOW(),
    observacion VARCHAR(1000),
    UNIQUE (id_evaluacion, id_estudiante)
);

CREATE TABLE respuestas (
    id_respuesta SERIAL PRIMARY KEY,
    id_envio INT NOT NULL REFERENCES envios(id_envio) ON DELETE CASCADE,
    id_pregunta INT NOT NULL REFERENCES preguntas(id_pregunta),
    id_opcion INT REFERENCES opciones_respuesta(id_opcion),
    texto_respuesta TEXT,
    UNIQUE (id_envio, id_pregunta)
);