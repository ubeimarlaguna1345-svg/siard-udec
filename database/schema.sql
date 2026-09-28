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
    