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
